@istest
public class AccountProcessorTest {
    @istest
    public static void testMethod1(){
        list<id> listOfAccountIds = new list<id>();
        Account acc =new Account();
        acc.Name='test1';
        insert acc;
        
        list<contact> listOfContacts= new list<Contact>();
        Contact c ;
        for(integer i=0;i<2;i++){
        c=new Contact();
        c.LastName ='Test'+1;
        c.AccountId =acc.id;
        listOfContacts.add(c);
        }
        insert listOfContacts;
        
        listOfAccountIds.add(acc.id);
        Test.startTest();
        AccountProcessor.countContacts(listOfAccountIds);
        Test.stopTest();
    }
}