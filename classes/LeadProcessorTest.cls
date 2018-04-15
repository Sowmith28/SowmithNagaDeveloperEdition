@istest
public class LeadProcessorTest {
 @testsetup
    public static void leadCreation() {
        list<Lead> listOfLeads = new list<Lead>();
        for(integer i=0;i<200;i++){
           listOfLeads.add(new Lead( LastName='Test'+i,Company ='Cognizant',Status ='Open - Not Contacted'));
        }
        if(listOfLeads != null && listOfLeads.size() >0){
            insert listOfLeads;
        }
    }
   
    @istest
    public static void LeadProcessormethod(){
        Test.startTest();
        LeadProcessor l = new LeadProcessor();
        id batchid = Database.executeBatch(l);
        Test.stopTest();
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}