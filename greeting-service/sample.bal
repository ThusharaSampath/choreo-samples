import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

configurable string requiredConfig = ?;
configurable string OptionalConfig = "Welcome to Choreo!";
configurable string requiredSecret = ?;
configurable string OptionalSecret = "This is a default secret message.";
configurable int globalRequiredConfig = ?;
configurable int globalOptionalConfig = 8080;

service / on new http:Listener(8090) {
    
    function init() {
        log:printInfo("Server starting with configurations:");
        log:printInfo("Required Config: " + requiredConfig);
        log:printInfo("Optional Config: " + OptionalConfig);
        log:printInfo("Optional Secret: " + OptionalSecret);
        log:printInfo("Required Secret: " + requiredSecret);
        log:printInfo("Global Required Config: " + globalRequiredConfig.toString());
        log:printInfo("Global Optional Config: " + globalOptionalConfig.toString());
        log:printInfo("Service listening on port 8090");
    }
    
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {
            "from": "Choreo", 
            "to": name, 
            "message": string `${OptionalConfig} | Required Config: ${requiredConfig} | Optional Secret: ${OptionalSecret} | Required Secret: ${requiredSecret}`
        };
        log:printInfo("Choreo Token: " + requiredConfig);
        return greetingMessage;
    }
}
