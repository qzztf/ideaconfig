
import sys
import traceback

PYDEV_COMMAND_PREFIX = "# pydev_util_command"


def update_cell_name(cell_info, new_name):
    latest_cell_id = cell_info.latest_cell_id
    if latest_cell_id != 0:
        cell_info.jupyter_cell_id_to_name[latest_cell_id] = new_name
        cell_info.jupyter_cell_name_to_id[new_name] = latest_cell_id


def is_util_command(args, kwargs):
    """
    Check if command is a util command for Jupyter debugger, i.e. cell code starts with PYDEV_COMMAND_PREFIX
    This method relies on the signature IPython.core.compilerop.CachingCompiler.cache(code, number=0) in IPython 7
    """
    code = ""
    if len(args) > 0:
        code = args[0]
    else:
        if "code" in kwargs:
            code = kwargs["code"]
    if code.startswith(PYDEV_COMMAND_PREFIX):
        return True
    return False


def compile_cache_wrapper(orig, ipython_shell):
    def compile_cache(*args, **kwargs):
        cache_name = orig(*args, **kwargs)
        if is_util_command(args, kwargs):
            ipython_shell.pydev_cell_info.util_cell_names[cache_name] = True
            return orig(*args, **kwargs)
        update_cell_name(ipython_shell.pydev_cell_info, cache_name)
        return cache_name
    return compile_cache


def patch_compile_cache(ipython_shell):
    ipython_shell.compile.cache = compile_cache_wrapper(ipython_shell.compile.cache, ipython_shell)


class DebugCellInfo(object):
    latest_cell_id = 0
    jupyter_cell_id_to_name = {}
    jupyter_cell_name_to_id = {}
    util_cell_names = {}


def attach_to_debugger(debugger_port):
    ipython_shell = get_ipython()

    if sys.platform not in ('darwin', 'win32'):
        # temporarily disable Cython warnings on Linux
        import os
        os.environ['PYDEVD_USE_CYTHON'] = 'NO'
        os.environ['PYDEVD_USE_FRAME_EVAL'] = 'NO'

    import pydevd
    from _pydev_bundle import pydev_localhost

    debugger = pydevd.PyDB()
    ipython_shell.debugger = debugger
    try:
        debugger.connect(pydev_localhost.get_localhost(), debugger_port)
        debugger.prepare_to_run(enable_tracing_from_start=False)
    except:
        traceback.print_exc()
        sys.stderr.write('Failed to connect to target debugger.\n')

    # should be executed only once for kernel
    if not hasattr(ipython_shell, "pydev_cell_info"):
        ipython_shell.pydev_cell_info = DebugCellInfo()
        patch_compile_cache(ipython_shell)
    # save link in debugger for quick access
    debugger.cell_info = ipython_shell.pydev_cell_info
    debugger.cell_info.util_cell_names = {}
    debugger.warn_once_map = {}


def set_latest_cell_id(latest_cell_id):
    ipython_shell = get_ipython()
    ipython_shell.pydev_cell_info.latest_cell_id = latest_cell_id


def enable_tracing():
    from _pydevd_bundle.pydevd_tracing import SetTrace
    debugger = get_ipython().debugger
    # SetTrace should be enough, because Jupyter creates new frame every time
    SetTrace(debugger.trace_dispatch)
    # debugger.enable_tracing_in_frames_while_running()


def remove_invalid_ids(valid_ids):
    cell_info = get_ipython().pydev_cell_info
    available_ids = cell_info.jupyter_cell_id_to_name.keys()
    for id in available_ids:
        if id not in valid_ids:
            cell_name = cell_info.jupyter_cell_id_to_name.pop(id)
            cell_info.jupyter_cell_name_to_id.pop(cell_name)


def disable_tracing():
    from _pydevd_bundle.pydevd_tracing import SetTrace
    SetTrace(None)
    # debugger.disable_tracing_while_running()
    ipython_shell = get_ipython()
    ipython_shell.pydev_cell_info.latest_cell_id = 0
    if hasattr(ipython_shell, "debugger"):
        kill_pydev_threads(ipython_shell.debugger)


def kill_pydev_threads(py_db):
    from _pydevd_bundle.pydevd_kill_all_pydevd_threads import kill_all_pydev_threads
    py_db.finish_debugging_session()
    kill_all_pydev_threads()