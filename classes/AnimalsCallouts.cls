public class AnimalsCallouts {
    
    Public static HttpResponse HttpCalloutGet(){
        Http http =new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response= new HttpResponse();
        response = http.send(request);
        if(response.getStatusCode() == 200){
            Map<String, Object> mapOfObjects = (Map<String, Object>) Json.deserializeUntyped(response.getBody());
            list<Object> listOfObjects =new list<Object>();
            listOfObjects = (list<Object>)mapOfObjects.get('animals');
            System.debug(listOfObjects);
        }
        else{
            list<String> testList = new List<String>();
            System.debug(response.getStatusCode()+'==='+response.getStatus());
        }
        return response;
    }
    
    public static HttpResponse HttpCalloutPost(){
        Http http =new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/Json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"');
        HttpResponse response = new HttpResponse();
        response =http.send(request);
        if(response.getStatusCode() == 201){
            Map<String, Object> mapOfResponse = (Map<String, Object>) Json.deserializeUntyped(response.getBody());
            list<Object> listOfResponse = (list<Object>) mapOfResponse.get('animals');
            System.debug(listOfResponse);
        }
        else{
            System.debug(response.getStatusCode()+'==='+response.getStatus());
        }
        return response;
    }
}