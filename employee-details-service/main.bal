import ballerina/http;
import employee_details_service.hr;

type Request record {|
    int[] employeeIds;
|};

type Employees record {|
    json[] employeeDetails;
|};

service / on new http:Listener(9090) {
    // Define your resource functions here
    resource function post employees(@http:Payload Request payload) returns Employees|error? {
        http:Client locationEP = check new (hr:hrEndpoint);
        int[] idList = payload.employeeIds;
        json[] employeInfoList = [];
        foreach int id in idList {
            json empResponseJson = check locationEP->get(string `/employee/${id}`);
            employeInfoList.push(empResponseJson);
        }
        Employees aggregatedResponse = {employeeDetails: employeInfoList};
        return aggregatedResponse;
    }
}
