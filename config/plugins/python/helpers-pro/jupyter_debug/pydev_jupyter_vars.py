from _pydevd_bundle.pydevd_constants import dict_keys, NEXT_VALUE_SEPARATOR
from _pydevd_bundle.pydevd_vars import resolve_compound_var_object_fields, table_like_struct_to_xml, eval_in_context, resolve_var_object
from _pydevd_bundle.pydevd_xml import frame_vars_to_xml, should_evaluate_full_value, var_to_xml


def evaluate(expression):
    ipython_shell = get_ipython()
    namespace = ipython_shell.user_ns
    result = eval_in_context(expression, namespace, namespace)
    xml = "<xml>"
    xml += var_to_xml(result, expression)
    xml += "</xml>"
    print(xml)


def get_frame():
    ipython_shell = get_ipython()
    user_ns = ipython_shell.user_ns
    hidden_ns = ipython_shell.user_ns_hidden
    xml = "<xml>"
    xml += frame_vars_to_xml(user_ns, hidden_ns)
    xml += "</xml>"
    print(xml)


def get_variable(pydev_text):
    ipython_shell = get_ipython()
    val_dict = resolve_compound_var_object_fields(ipython_shell.user_ns, pydev_text)
    if val_dict is None:
        val_dict = {}

    xml_list = ["<xml>"]
    for k in dict_keys(val_dict):
        val = val_dict[k]
        evaluate_full_value = should_evaluate_full_value(val)
        xml_list.append(var_to_xml(val, k, evaluate_full_value=evaluate_full_value))
    xml_list.append("</xml>")
    print(''.join(xml_list))


def get_array(text):
    ipython_shell = get_ipython()
    namespace = ipython_shell.user_ns
    roffset, coffset, rows, cols, format, attrs = text.split('\t', 5)
    name = attrs.split("\t")[-1]
    var = eval_in_context(name, namespace, namespace)
    xml = table_like_struct_to_xml(var, name, int(roffset), int(coffset), int(rows), int(cols), format)
    print(xml)


def load_full_value(scope_attrs):
    ipython_shell = get_ipython()
    namespace = ipython_shell.user_ns
    vars = scope_attrs.split(NEXT_VALUE_SEPARATOR)
    xml_list =  ["<xml>"]
    for var_attrs in vars:
        var_attrs = var_attrs.strip()
        if len(var_attrs) == 0:
            continue
        if '\t' in var_attrs:
            name, attrs = var_attrs.split('\t', 1)
        else:
            name = var_attrs
            attrs = None
        if name in namespace.keys():
            var_object = resolve_var_object(namespace[name], attrs)
            xml_list.append(var_to_xml(var_object, name, evaluate_full_value=True))
        else:
            var_object = eval_in_context(name, namespace, namespace)
            xml_list.append(var_to_xml(var_object, name, evaluate_full_value=True))
    xml_list.append("</xml>")
    print(''.join(xml_list))

