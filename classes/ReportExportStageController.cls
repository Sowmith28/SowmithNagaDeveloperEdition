public class ReportExportStageController {
    public string ReportName{set;get;}
    public String ReportDeliveryType{set;get;}
    public String ReportOutputFilename{set;get;}
    public String pageUrl ;
    public string ToAddress{set;get;}
    public string ccAddress{set;get;}
    public string BccAddress{set;get;}
    public String EmailDeliveryType{set;get;}
    public Datetime WhentoRun{set;get;}
    public String [] pageParameters;
    public String inputdate{set;get;}
    public Export_Report__c exprep{set;get;}
    public string searchString{get;set;}
     public List<Report> results{get;set;}
    public list<Export_Report__c> resultsOne{get;set;}
    public String ReportNameone{get;set;}
    public list<Export_Report__c> exportReportList;
    public string existingSearchString{get;set;}
    public String exportid{get;set;}
    public boolean flag;
	public String temp; 
    //exprep.Report_File_Name__c
    
   private integer counter=0;  //keeps track of the offset
   private integer list_size=2; //sets the page size or number of rows
    public integer total_size{set;get;} //used to show user the total size of the list
     public integer total_size1;
    public ReportExportStageController( ApexPages.StandardController std){
       exprep = (Export_Report__c )std.getRecord();
         total_size = [select count() from Export_Report__c]; //set the total size in the constructor
        total_size1 = total_size;
        //resultsOne = [select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c limit :list_size offset :counter]; 
        //ReportExportResult = [ select id,Report_Name__c, Report_Delivery_Type__c from Export_Report__c];
    }
       public Export_Report__c[] getexportReports() {
      try {
          if(exprep.Report_Name__c==null || exprep.Report_Name__c==''){
        resultsOne = [select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c limit :list_size offset :counter]; 
         System.debug('resultsOne inside if'+resultsOne);
              System.debug('exprep.Report_Name__c inside if'+exprep.Report_Name__c);
              total_size = total_size1;
          }
          else{
              
              if(temp!=null && temp!=exprep.Report_Name__c){
                  counter =0;
              }
              String soql = 'select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c';
              if(exprep.Report_Name__c != '' && exprep.Report_Name__c != null)
                  soql = soql +  ' where Report_Name__c LIKE \'%' + exprep.Report_Name__c +'%\'';
              soql = soql + ' limit '+list_size +' offset '+counter;
              System.debug(soql);
              resultsOne = database.query(soql); 
              System.debug('resultsOne inside else'+resultsOne);
              System.debug('exprep.Report_Name__c inside else'+exprep.Report_Name__c);
              String soql1 = 'select id from Export_Report__c';
              if(exprep.Report_Name__c != '' && exprep.Report_Name__c != null)
                  soql1 = soql1 +  ' where Report_Name__c LIKE \'%' + exprep.Report_Name__c +'%\'';
               list<Export_Report__c> listOfExp= database.query(soql1); 
              if(listOfExp!=null && listOfExp.size()>0){
              total_size = listOfExp.size();
                  }
              temp = exprep.Report_Name__c;
               System.debug('total_size inside else'+total_size);
          }
         return resultsOne;
      } catch (QueryException e) {
         ApexPages.addMessages(e);   
         return null;
      }
   }
       public PageReference RedirecttoEdit(){
           if(exportid!=null){
        //PageReference pf = new PageReference('/apex/editCustomReportPage1?id='+exportid);
         PageReference pf = new PageReference('/apex/editCustomReportPage1?id='+exportid);
       return pf;   
           }
           return null;
    }
    public PageReference deleteRecord(){
        Export_Report__c exp;
        if(exportid!=null){
         exp= [select id from Export_Report__c where id=:exportid];
        }
        if(exp !=null){
        delete exp;
            }
         //resultsOne = [select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c ];
        PageReference pf =new PageReference('/apex/ExportReportintermediate');
        return pf;
    }
        public PageReference viewRecord(){
            if(exportid!=null){
        PageReference pf =new PageReference('/apex/viewCustomReportPage1?id='+exportid);
        return pf;
            }
            return null;
    }
       public list<Export_Report__c> getReportExportResult(){
      exportReportList =[select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c ]; 
      return exportReportList;  
    }
    public PageReference CreateNewRecord(){
        PageReference pf = new PageReference('/apex/ReportExportStep1');
        exprep.Report_Name__c = '';
        return pf;
    }
    public void EditReport(){
        
    }
     public PageReference searchOne() {
         flag=true;
    runSearchOne();
    return null;
  }
    
 
  // prepare the query and issue the search command
  private void runSearchOne() {
    // TODO prepare query string for complex serarches & prevent injections
    resultsOne = performSearchOne(exprep.Report_Name__c);               
  } 
      public List<Export_Report__c> performSearchOne(String SearchString) {
 
    String soql = 'select id,Report_Name__c,Report_Delivery_Type__c from Export_Report__c';
    if(SearchString != '' && SearchString != null)
      soql = soql +  ' where name LIKE \'%' + SearchString +'%\'';
    soql = soql + ' limit '+list_size +' offset '+counter;
    System.debug(soql);
    return database.query(soql); 
 
  }
    public PageReference NextButton(){
        pageUrl = ApexPages.currentPage().geturl();
        pageParameters = pageUrl.split('/');
        PageReference pf ;
        System.debug('pageParameters[2]'+pageParameters[2]);
        if(pageParameters[2].startswith('ReportExportStep1?')){
            ReportName = exprep.Report_Name__c;
            if(ReportName!=null){
            Report rp = [select id, name from report where name =: ReportName];
             if(rp!=null){
            
         pf = new PageReference('/apex/ReportExportStep2?RptName='+ReportName);
             System.debug('inside first if');
             return pf;
             }
             else{
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.error,'Enter valid Report Name'));
             return null;
             }
             }
             if(Reportname==null){
              ApexPages.addmessage(new ApexPages.message(ApexPages.severity.error,'Please enter value'));
                return null;
                }
        //pf.setRedirect(true);
        //return pf;
        }

        return null;
    }
    public PageReference NextButtonOne(){
         pageUrl = ApexPages.currentPage().geturl();
        pageParameters = pageUrl.split('/');
                if(pageParameters[2].startswith('ReportExportStep2?')){
                    ReportOutputFilename = exprep.Report_File_Name__c;
                    reportdeliverytype = exprep.Report_Delivery_Type__c;
        PageReference pf = new PageReference('/apex/ReportExportStep3?RptName='+ReportName+'&rptDeliveryType'+ReportDeliveryType+'&rptOutputfile'+ReportOutputFilename);
        System.debug('inside Second if');
            //pf.setRedirect(true);
           /* Account cc= new Account();
                    cc.name= ReportName+ReportOutputFilename;
                    insert cc;*/
        return pf;
        }
        return null;
    }
        public PageReference NextButtonTwo(){
         pageUrl = ApexPages.currentPage().geturl();
            ToAddress = exprep.To_address__c;
            ccAddress = exprep.cc_address__c;
            BccAddress = exprep.Bcc_address__c;
        pageParameters = pageUrl.split('/');
                if(pageParameters[2].startswith('ReportExportStep3?')){
        PageReference pf = new PageReference('/apex/ReportExportStep4?RptName='+ReportName+'&rptDeliveryType'+ReportDeliveryType+'&rptOutputfile'+ReportOutputFilename);
        System.debug('inside third if');
            //pf.setRedirect(true);
        return pf;
        }
        return null;
    }
    
     public PageReference SaveButton(){
         pageUrl = ApexPages.currentPage().geturl();
        pageParameters = pageUrl.split('/');
         Report reportobj = [select id,name from Report where name=: reportname];
         WhentoRun = exprep.When_to_Run__c;
         Export_Report__c exportreport = new Export_Report__c();
         exportreport.Bcc_address__c = bccaddress;
         exportreport.Report_Name__c = reportname;
         exportreport.Report_File_Name__c = ReportOutputFilename;
         exportreport.cc_address__c = ccaddress;
         exportreport.To_address__c = toaddress;
         exportreport.Report_Delivery_Type__c = reportdeliverytype;
         exportreport.Report_Id__c = reportobj.id;
         exportreport.When_to_Run__c = whentorun;
         insert exportreport;
                //if(pageParameters[2].startswith('ReportExportStep3?')){
        PageReference pf = new PageReference('/'+exportreport.id);
        System.debug('inside third if');
            //pf.setRedirect(true);
        return pf;
        //}
        return null;
    }
    public PageReference PrevButtonOne(){
        //ReportOutputFilename ='Dummy';
        //EmailDeliveryType ='Email';
        PageReference pf = new PageReference('/apex/ReportExportStep1');
        return pf;
    }
        public PageReference PrevButtonTwo(){
        PageReference pf = new PageReference('/apex/ReportExportStep2');
        return pf;
    }
            public PageReference PrevButtonThree(){
        PageReference pf = new PageReference('/apex/ReportExportStep3');
        return pf;
    }
        public PageReference CancelButton(){
        return null;
    }

    
      // performs the keyword search
  public PageReference search() {
    searchString = exprep.Report_Name__c;
    runSearch();
    return null;
  }
 
  // prepare the query and issue the search command
  private void runSearch() {
    // TODO prepare query string for complex serarches & prevent injections
    results = performSearch(searchString);               
  } 
 
  // run the search and return the records found. 
  private List<Report> performSearch(string searchString) {
 
    String soql = 'select id, name from Report';
    if(searchString != '' && searchString != null)
      soql = soql +  ' where name LIKE \'%' + searchString +'%\'';
    soql = soql + ' limit 25';
    System.debug(soql);
    return database.query(soql); 
 
  }
    
      // used by the visualforce page to send the link to the right dom element
  public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');
  }
 
  // used by the visualforce page to send the link to the right dom element for the text box
  public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }
  
  public void Reportnamefromblock(){
  if(ReportNameone!=null){
  System.debug('ReportNameone'+ReportNameone);
  exprep.Report_Name__c = ReportNameone;
  
  }
  }
 
    
    public PageReference Beginning() { //user clicked beginning
      counter = 0;
      return null;
   }

   public PageReference Previous() { //user clicked previous button
      counter -= list_size;
      return null;
   }

   public PageReference Next() { //user clicked next button
      counter += list_size;
      return null;
   }

   public PageReference End() { //user clicked end
      counter = total_size - math.mod(total_size, list_size);
      return null;
   }

   public Boolean getDisablePrevious() { 
      //this will disable the previous and beginning buttons
      if (counter>0) return false; else return true;
   }

   public Boolean getDisableNext() { //this will disable the next and end buttons
      if (counter + list_size < total_size) return false; else return true;
   }

   public Integer getTotal_size() {
      return total_size;
   }

   public Integer getPageNumber() {
      return counter/list_size + 1;
   }

   public Integer getTotalPages() {
      if (math.mod(total_size, list_size) > 0) {
         return total_size/list_size + 1;
      } else {
         return (total_size/list_size);
      }
   }
}