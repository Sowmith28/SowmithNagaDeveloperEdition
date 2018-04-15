public class attributecomponentvfcontroller {
    public static String countryvariable{get;set;}   
 public static void getUserCountryfromIPAddress(){       
        
        string ReturnValue = '';  
        string country;
        ReturnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
      System.debug('ReturnValue'+ReturnValue);
        if (ReturnValue == '' || ReturnValue == null) {
            ReturnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
             System.debug('ReturnValue'+ReturnValue);
        } 
        if (ReturnValue == '' || ReturnValue == null) {
            ReturnValue = ApexPages.currentPage().getHeaders().get('X-Forwarded-For');
             System.debug('ReturnValue'+ReturnValue);
        } 
        Http httpObj = new Http();
        HttpRequest req = new HttpRequest();
        if(!String.isBlank('http://geoip.nekudo.com/api/') && !String.isBlank(ReturnValue)){//PD-7939
            req.setEndpoint('http://geoip.nekudo.com/api/'+ReturnValue);
        }
        req.setMethod('GET');
        req.setTimeout(120000);
        HttpResponse res;
            res = httpObj.send(req); 

        if(res !=null && res.getStatusCode() == 200){
            Map<String, Object> mapOfResponseObj= (Map<String, Object>)JSON.deserializeUntyped(res.getbody());           
            Map <String, Object> detailsObject = (Map <String, Object>)mapOfResponseObj.get('country');                    
            country =(String)detailsObject.get('name');
             System.debug('mapOfResponseObj'+mapOfResponseObj);
             System.debug('detailsObject'+detailsObject);
            System.debug('country'+country);
            countryvariable =country ;
            System.debug('countryvariable'+countryvariable);
        } 

    }
}