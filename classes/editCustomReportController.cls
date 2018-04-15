public class editCustomReportController {
 public string ReportName{set;get;}
    public String ReportDeliveryType{set;get;}
    public String ReportOutputFilename{set;get;}
    public String pageUrl ;
    public string ToAddress{set;get;}
    public string ccAddress{set;get;}
    public string BccAddress{set;get;}
    public String EmailDeliveryType{set;get;}
    public time WhentoRun{set;get;}
    public String [] pageParameters;
    public String inputdate{set;get;}
    public Export_Report__c exprep{set;get;}
    public string searchString{get;set;}
    public List<Report> results{get;set;}
    public String ReportNameone{get;set;}
    public Date StartDate{set;get;}
    public Date EndDate{set;get;}
    public Report reportObj {get;set;}
    public List<Export_Report__c> exportReportList {get;set;}  
    public String reportid;
    public editCustomReportController( ApexPages.StandardController std ){
        //if(exprep !=null){
        exprep = (Export_Report__c )std.getRecord();
        //}
        reportid = (id)ApexPages.currentPage().getParameters().get('id');
        System.debug('reportid'+reportid);
        if(reportid !=null ){
        exportReportList = [select id,Bcc_address__c,Report_Name__c,isActive__c,Report_File_Name__c,cc_address__c,To_address__c,Report_Delivery_Type__c,Report_Id__c,When_to_Run__c from Export_Report__c where id=: reportid];
         System.debug('exportReportList'+exportReportList);
            System.debug('exportReportList[0].Report_Name__c'+exportReportList[0].Report_Name__c);
            exprep.Report_Name__c = exportReportList[0].Report_Name__c;
            exprep.isActive__c = exportReportList[0].isActive__c;
            exprep.Report_File_Name__c = exportReportList[0].Report_File_Name__c;
            exprep.Report_Delivery_Type__c = exportReportList[0].Report_Delivery_Type__c;
            exprep.Bcc_address__c = exportReportList[0].Bcc_address__c;
            exprep.cc_address__c = exportReportList[0].cc_address__c;
            exprep.To_address__c = exportReportList[0].To_address__c;
            exprep.When_to_Run__c = exportReportList[0].When_to_Run__c;
            exprep.Report_Id__c = exportReportList[0].Report_Id__c;
        // ReportName = exportReportList[0].Report_Name__c;
        }
    }
    public PageReference nextButtonOne(){
        PageReference pf = new PageReference('/apex/editCustomReportPage2');
          return pf;
    }
     public PageReference CancelButton(){
        PageReference pf = new PageReference('/apex/ExportReportintermediate');
          return pf;
    }
    public PageReference saveButtonOne(){
        Export_Report__c ExportReportObj= new Export_Report__c();
        ExportReportObj.id = exprep.id;
        ExportReportObj.Report_Name__c = exprep.Report_Name__c;
        ExportReportObj.isActive__c = exprep.isActive__c;
        update ExportReportObj;
        PageReference pf = new PageReference('/apex/ExportReportintermediate');
          return pf;
    }
 
     public PageReference NextButtonTwo(){
        if(exprep.Report_Delivery_Type__c=='Share Point'){
        system.debug('error');
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Share Point Page Not Developed'));
            return null;
        }
        if(exprep.Report_Delivery_Type__c=='FTP'){
        system.debug('error');
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'FTP Page Not Developed'));
            return null;
        }
       pageReference pf = new PageReference('/apex/editCustomReportPage3');
        return pf;
    }
        public PageReference PrevButtonOne(){
        PageReference pf = new PageReference('/apex/editCustomReportPage1');
        return pf;
    }
        public PageReference saveButtonTwo(){
         if(exprep.Report_Delivery_Type__c=='Share Point'){
        system.debug('error');
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Share Point Page Not Developed'));
            return null;
        }
        if(exprep.Report_Delivery_Type__c=='FTP'){
        system.debug('error');
         ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'FTP Page Not Developed'));
            return null;
        }
        Export_Report__c ExportReportObj= new Export_Report__c();
        ExportReportObj.id = exprep.id;
        ExportReportObj.Report_Name__c = exprep.Report_Name__c;
        ExportReportObj.isActive__c = exprep.isActive__c;
        ExportReportObj.Report_File_Name__c = exprep.Report_File_Name__c;
        ExportReportObj.Report_Delivery_Type__c = exprep.Report_Delivery_Type__c;
        update ExportReportObj;
        PageReference pf = new PageReference('/apex/ExportReportintermediate');
          return pf;
    }
     public PageReference PrevButtonTwo(){
        PageReference pf = new PageReference('/apex/editCustomReportPage2');
        return pf;
    }
    
      public PageReference NextButtonThree(){
        ToAddress = exprep.To_address__c;
        ccAddress = exprep.cc_address__c;
        BccAddress = exprep.Bcc_address__c;
        list<string> toAddresses = new list<string>();
        list<string> ccAddresses = new list<string>();
        list<string> BccAddresses = new list<string>();
        Set<String> setOfStrings = new Set<String>{'gmail.com'};
        toAddresses =ToAddress.split(';');
        if(ccAddress!= null){
            ccAddresses = ccAddress.split(';');
        }
        if(BccAddress !=null){
            BccAddresses = BccAddress.split(';');
        }
        for(String str: toAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1]) ){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct TO ADDRESS'));
                return null;
            }
        }
                for(String str: CCAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1])){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct CC ADDRESS'));
                return null;
            }
        }
                for(String str: bccAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1]) ){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct  BCC ADDRESS'));
                return null;
            }
        }
        PageReference pf = new PageReference('/apex/editCustomReportPage4');
        return pf;
    }
        public PageReference saveButtonThree(){
        ToAddress = exprep.To_address__c;
        ccAddress = exprep.cc_address__c;
        BccAddress = exprep.Bcc_address__c;
        list<string> toAddresses = new list<string>();
        list<string> ccAddresses = new list<string>();
        list<string> BccAddresses = new list<string>();
        Set<String> setOfStrings = new Set<String>{'gmail.com'};
        toAddresses =ToAddress.split(';');
        if(ccAddress!= null){
            ccAddresses = ccAddress.split(';');
        }
        if(BccAddress !=null){
            BccAddresses = BccAddress.split(';');
        }
        for(String str: toAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1]) ){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct TO ADDRESS'));
                return null;
            }
        }
                for(String str: CCAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1])){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct CC ADDRESS'));
                return null;
            }
        }
                for(String str: bccAddresses){
            if(!str.contains('@') || !setOfStrings.contains(str.split('@')[1]) ){
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please enter correct  BCC ADDRESS'));
                return null;
            }
        }
        Export_Report__c ExportReportObj= new Export_Report__c();
        ExportReportObj.id = exprep.id;
        ExportReportObj.Report_Name__c = exprep.Report_Name__c;
        ExportReportObj.isActive__c = exprep.isActive__c;
        ExportReportObj.Report_File_Name__c = exprep.Report_File_Name__c;
        ExportReportObj.Report_Delivery_Type__c = exprep.Report_Delivery_Type__c;
        ExportReportObj.Bcc_address__c = exprep.Bcc_address__c;
        ExportReportObj.To_address__c = exprep.To_address__c;
        ExportReportObj.cc_address__c = exprep.cc_address__c;
        update ExportReportObj;
        PageReference pf = new PageReference('/apex/ExportReportintermediate');
          return pf;
    }
         public PageReference PrevButtonThree(){
        PageReference pf = new PageReference('/apex/editCustomReportPage3');
        return pf;
    }
        public PageReference saveButtonFour(){
        Export_Report__c ExportReportObj= new Export_Report__c();
        ExportReportObj.id = exprep.id;
        ExportReportObj.Report_Name__c = exprep.Report_Name__c;
        ExportReportObj.isActive__c = exprep.isActive__c;
        ExportReportObj.Report_File_Name__c = exprep.Report_File_Name__c;
        ExportReportObj.Report_Delivery_Type__c = exprep.Report_Delivery_Type__c;
        ExportReportObj.Bcc_address__c = exprep.Bcc_address__c;
        ExportReportObj.To_address__c = exprep.To_address__c;
        ExportReportObj.cc_address__c = exprep.cc_address__c;
        ExportReportObj.When_to_Run__c = exprep.When_to_Run__c;
        update ExportReportObj;
        PageReference pf = new PageReference('/apex/ExportReportintermediate');
          return pf;
    }
}