@isTest
public class VFController_Test {
    
    @isTest
    public static void VFtestMethodOne(){
        Account acc = new Account(Name = 'TestAccountName',SG_AccountId__c = 'Test');
        insert acc;
        System.assertNotEquals(acc.id, null);
        
        Test.setCurrentPageReference(new PageReference('Page.myPage')); 
        System.currentPageReference().getParameters().put('SG_AccountId__c', 'Test');
        
        ApexPages.StandardController sc = new ApexPages.standardController(acc);
        
        VFController controller = new VFController(sc);
        controller.autoRun();
    }
    
    @isTest
    public static void VFtestMethodTwo(){
        Account acc = new Account(Name = 'TestAccountName',SG_AccountId__c = 'Test');
        insert acc;
         System.assertNotEquals(acc.id, null);
        
        ApexPages.StandardController sc = new ApexPages.standardController(acc);
        VFController controller = new VFController(sc);
        controller.autoRun();
    }
    
    @isTest
    public static void VFtestMethodThree(){
        Account acc = new Account(Name = 'TestAccountName',SG_AccountId__c = 'Test1');
        insert acc;
        System.assertNotEquals(acc.id, null);
        
        Test.setCurrentPageReference(new PageReference('Page.myPage')); 
        System.currentPageReference().getParameters().put('SG_AccountId__c', 'Test');

        ApexPages.StandardController sc = new ApexPages.standardController(acc);
        VFController controller = new VFController(sc);
        controller.autoRun();
    }
}