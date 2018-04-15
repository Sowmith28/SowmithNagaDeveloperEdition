public class StorageUsageClass {
    public static void storageUsageMethod(){
        String requestUrl = '/001/o';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + requestUrl);
        req.setMethod('GET');
        req.setHeader('Cookie','sid='+UserInfo.getSessionId()); 
        
        HTTPResponse res = http.send(req);
        String output = res.getBody();
        System.debug(output);
    }
}