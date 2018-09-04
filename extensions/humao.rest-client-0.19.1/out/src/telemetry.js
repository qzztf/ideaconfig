'use strict';
Object.defineProperty(exports, "__esModule", { value: true });
const configurationSettings_1 = require("./models/configurationSettings");
const Constants = require("./constants");
const appInsights = require("applicationinsights");
appInsights.setup(Constants.AiKey)
    .setAutoCollectConsole(false)
    .setAutoCollectDependencies(false)
    .setAutoCollectExceptions(false)
    .setAutoCollectPerformance(false)
    .setAutoCollectRequests(false)
    .setAutoDependencyCorrelation(false)
    .setUseDiskRetryCaching(true)
    .start();
class Telemetry {
    static sendEvent(eventName, properties) {
        try {
            if (Telemetry.restClientSettings.enableTelemetry) {
                appInsights.defaultClient.trackEvent({ name: eventName, properties });
            }
        }
        catch (_a) {
        }
    }
}
Telemetry.restClientSettings = new configurationSettings_1.RestClientSettings();
exports.Telemetry = Telemetry;
//# sourceMappingURL=telemetry.js.map