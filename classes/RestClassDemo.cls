public class RestClassDemo {

	
	public static String parse(String json) {
		return (String) System.JSON.deserialize(json, String.class);
	}

    
    public  String getCountryName(String IsoCode2){
        try{
        Http h = new Http();
        HttpRequest hReq = new HttpRequest();
        hReq.setEndpoint('http://services.groupkt.com/country/get/iso2code/'+IsoCode2);
        hReq.setTimeout(20000);
        hReq.setMethod('GET');
        
        HttpResponse hRes= h.send(hReq);
		 System.debug('hRes.getBody()'+hRes.getBody());        
        /*JSON2Apex jsout = (JSON2Apex)Json.deserialize(hRes.getBody(), Message.class);
        JSONOutput mapOfOutput = Json.deserializeUntyped(hRes.getBody());
          Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(hRes.getBody());  
        System.debug('m'+m);
         System.debug('m'+m.keySet());
             System.debug('m'+m.Values());
              System.debug('m'+m.get('RestResponse'));
        System.debug('jsout'+jsout);*/
        String parseString = parse(hRes.getBody());
       return null;
        }
        catch(Exception ex){
           System.debug('Exception Message'+ex.getMessage());
             System.debug('Exception Message'+ex.getLineNumber());
               System.debug('Exception Message'+ex.getCause());            
            return null;
        }
    }
}