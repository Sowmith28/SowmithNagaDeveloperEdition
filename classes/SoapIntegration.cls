public class SoapIntegration {

    public static void getDetails(){
        AsyncAllyPrismSoaCmxDatapushwsdl.AsyncCMX_DataPushWSDLSOAPQSPort asyncsoap = new  AsyncAllyPrismSoaCmxDatapushwsdl.AsyncCMX_DataPushWSDLSOAPQSPort();
		asyncsoap.inputHttpHeaders_x = new Map<String, String>();
        //Setting a cookie header
        //asyncsoap.inputHttpHeaders_x.put('Cookie', 'name=value');
        
        //Setting a custom HTTP header
        asyncsoap.inputHttpHeaders_x.put('myHeader', 'myValue');
        
        Continuation con = new Continuation(60);
        AsyncAllyPrismSoaCmx.CMXResponseTypeFuture aysncRes=asyncsoap.beginCaseFile(con,'Test File','application/xml','1','UTF-8','Test Content');
   
    	System.debug('aysncRes'+aysncRes);
    }
}