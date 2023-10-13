public class CalloutClass {
    
    public static void getCalloutResponseContents() {
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        req.setMethod('GET');
        
        HttpResponse response = h.send(req);
        if(response.getStatusCode() == 200 && response.getBody() != null && response.getBody() != ''){
            Map<String,Object> mapOfStringVsObject = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            system.debug('mapOfStringVsObject>>' + JSON.serializePretty(mapOfStringVsObject));
        }
    }
}