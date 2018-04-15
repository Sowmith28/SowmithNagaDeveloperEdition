global class ReportExportControllerScheduler implements Schedulable {
   global void execute(SchedulableContext SC) {
      send();
   }
    public static void send() {
	list<Export_Report__c> listOfExports = [SELECT id,Bcc_address__c,cc_address__c,Report_File_Name__c,Report_Id__c,Report_Name__c,To_address__c,When_to_Run__c from Export_Report__c ];
	list<Messaging.SingleEmailMessage> listOfSingleEmails = new list<Messaging.SingleEmailMessage>();	
    if(listOfExports!= null && listOfExports.size()>0){
               for(Export_Report__c eP:listOfExports){
                   if(eP.When_to_Run__c == System.now()){
                       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
						list<string> toAddresses = new list<string>();
    					list<string> ccAddresses = new list<string>();
    					list<string> BccAddresses = new list<string>();
                       toAddresses.add(eP.To_address__c);
                       if(eP.cc_Address__c!= null){
                           ccAddresses.add(eP.cc_Address__c);
                       }
                       if(eP.Bcc_Address__c !=null){
                           BccAddresses.add(eP.Bcc_Address__c);
                       }
                       email.setSubject('test email for report export');
                       email.setToAddresses(toAddresses);
                       if(ccAddresses.size()>0){
                           email.setccAddresses(ccAddresses);
                       }
                       if(BccAddresses.size()>0){
                           email.setBccAddresses(BccAddresses);
                       }
                       email.setPlainTextBody('Attached is the export of test report');
                       PageReference pdf = new PageReference('/apex/ReportExportPage');
                       ApexPages.currentPage().getparameters().put('id',ep.Report_Id__c);
                      pdf.setRedirect(true);
                       
                       // Take the PDF content
                       Blob b = pdf.getContent();
                       Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                       efa.setFileName(eP.Report_File_Name__c);
                       efa.setBody(b);
                       email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
						listOfSingleEmails.add(email);
                   }
               }
           }
	//Sending Email
	Messaging.SendEmailResult [] r = Messaging.sendEmail(listOfSingleEmails);
  }
}