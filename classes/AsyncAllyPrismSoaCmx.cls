//Generated by wsdl2apex

public class AsyncAllyPrismSoaCmx {
    public class CMXResponseTypeFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            allyPrismSoaCmx.CMXResponseType response = (allyPrismSoaCmx.CMXResponseType)System.WebServiceCallout.endInvoke(this);
            return response.StatusCode;
        }
    }
}