import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

// required configuration for Choreo
configurable string choreo_token = ?;

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        Greeting greetingMessage = {"from" : "Choreo", "to" : name, "message" : "Welcome to Choreo!"};
        log:printInfo("Choreo Token: " + choreo_token);
        return greetingMessage;
    }
}
