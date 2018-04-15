//Generated by wsdl2apex

public class allyPrismSoaCmx {
    public class CMXFaultType {
        public String CMXErrorCode;
        public String CMXErrorMessage;
        private String[] CMXErrorCode_type_info = new String[]{'CMXErrorCode','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] CMXErrorMessage_type_info = new String[]{'CMXErrorMessage','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ally.prism.soa.cmx','true','false'};
        private String[] field_order_type_info = new String[]{'CMXErrorCode','CMXErrorMessage'};
    }
    public class CMXResponseType {
        public String StatusCode;
        private String[] StatusCode_type_info = new String[]{'StatusCode','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ally.prism.soa.cmx','true','false'};
        private String[] field_order_type_info = new String[]{'StatusCode'};
    }
    public class caseFileType {
        public String fileName;
        public String contentType;
        public String CorrelationID;
        public String encodingType;
        public String content;
        private String[] fileName_type_info = new String[]{'fileName','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] contentType_type_info = new String[]{'contentType','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] CorrelationID_type_info = new String[]{'CorrelationID','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] encodingType_type_info = new String[]{'encodingType','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] content_type_info = new String[]{'content','http://ally.prism.soa.cmx',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://ally.prism.soa.cmx','true','false'};
        private String[] field_order_type_info = new String[]{'fileName','contentType','CorrelationID','encodingType','content'};
    }
}