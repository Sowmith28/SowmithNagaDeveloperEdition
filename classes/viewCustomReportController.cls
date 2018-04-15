public class viewCustomReportController{
  public Export_Report__c exprep{set;get;}
  public String reportid;
  public List<Export_Report__c> exportReportList {get;set;}  
 public viewCustomReportController( ApexPages.StandardController std ){
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
    
     public PageReference RedirecttoEdit(){
           if(reportid!=null){
        //PageReference pf = new PageReference('/apex/editCustomReportPage1?id='+exportid);
         PageReference pf = new PageReference('/apex/editCustomReportPage1?id='+reportid);
       return pf;   
           }
           return null;
    }
    public PageReference deleteRecord(){
        Export_Report__c exp;
        if(reportid!=null){
         exp= [select id from Export_Report__c where id=:reportid];
        }
        if(exp !=null){
        delete exp;
            }
         //resultsOne = [select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c ];
        PageReference pf =new PageReference('/apex/ExportReportintermediate');
        return pf;
    }
}