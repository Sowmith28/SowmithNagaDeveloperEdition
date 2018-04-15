public class ReportExportControllerHelper {
public static void send() {
	list<Export_Report__c> listOfExports = [SELECT id,Bcc_address__c,cc_address__c,Report_File_Name__c,Report_Id__c,Report_Name__c,To_address__c,When_to_Run__c from Export_Report__c ];
	list<Messaging.SingleEmailMessage> listOfSingleEmails = new list<Messaging.SingleEmailMessage>();	
    if(listOfExports!= null && listOfExports.size()>0){
               for(Export_Report__c eP:listOfExports){
                   System.debug('eP.When_to_Run__c'+eP.When_to_Run__c);
                   System.debug('System.now()'+System.now());
                   DateTime Cdatetime = DateTime.now();  
                   system.debug('current date time is '+cdateTime);
                   Integer min = cdateTime.minute();
                   system.debug('current minute value is '+min);
                   Integer twominuteBefore = min+2;
                   system.debug('two minute befor minute was'+twominuteBefore);
                   DateTime Cdatetime1 = DateTime.now()+twominuteBefore;  
                   if(eP.When_to_Run__c <= System.now() && System.now()<= Cdatetime1){
                       
                       Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
						list<string> toAddresses = new list<string>();
    					list<string> ccAddresses = new list<string>();
    					list<string> BccAddresses = new list<string>();
                       String ccAdd = eP.cc_Address__c;
                       toAddresses.add(eP.To_address__c);
                       if(eP.cc_Address__c!= null){
                           ccAddresses = ccAdd.split(';');
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
                       PageReference pdf = new PageReference('/apex/ReportExportPage?id='+ep.Report_Id__c);
                       System.debug('ep.Report_Id__c'+ep.Report_Id__c);
                      // ApexPages.currentPage().getparameters().put('id',ep.Report_Id__c);
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