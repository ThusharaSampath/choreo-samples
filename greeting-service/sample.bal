import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

// Database configuration type
type DatabaseConfig record {|
    string host;
    int port;
    string password;
    string[] allowedHosts;
|};

// API configuration type
type ApiConfig record {|
    string endpoint;
    int timeout?;
    string[] allowedOrigins;
|};

configurable string requiredConfig = ?;
configurable string OptionalConfig = "Welcome to Choreo!";
configurable string requiredSecret = ?;
configurable string OptionalSecret = "This is a default secret message.";
configurable int globalRequiredConfig = ?;
configurable int globalOptionalConfig = 8080;

// required object configuration
configurable DatabaseConfig database = ?;

// optional object configuration
configurable ApiConfig externalApi = {
    endpoint: "https://api.example.com",
    timeout: 30,
    allowedOrigins: ["https://example.com", "https://localhost:3000"]
};

service / on new http:Listener(8090) {
    
    function init() {
        log:printInfo("Server starting with configurations:");
        log:printInfo("Required Config: " + requiredConfig);
        log:printInfo("Optional Config: " + OptionalConfig);
        log:printInfo("Optional Secret: " + OptionalSecret);
        log:printInfo("Required Secret: " + requiredSecret);
        log:printInfo("Global Required Config: " + globalRequiredConfig.toString());
        log:printInfo("Global Optional Config: " + globalOptionalConfig.toString());
        log:printInfo("Database Config - Host: " + database.host + ", Port: " + database.port.toString());
        log:printInfo("Database Config - Password: " + database.password);
        log:printInfo("Database Config - Allowed Hosts: " + database.allowedHosts.toString());
        log:printInfo("External API Config - Endpoint: " + externalApi.endpoint);
        log:printInfo("External API Config - Timeout: " + (externalApi.timeout ?: 0).toString());
        log:printInfo("External API Config - Allowed Origins: " + externalApi.allowedOrigins.toString());
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
