@isTest
public class BatchableClass1_Test {

    @isTest
    public static void testBatch(){
        List<Account> accts = new List<Account>();
        for(Integer i=0;i< 5;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts; 
        System.assertEquals(accts.size(), 5);
        BatchableClass1 bC = new BatchableClass1();
        Database.executeBatch(bC);
    }
}