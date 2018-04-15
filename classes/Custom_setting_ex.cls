public class Custom_setting_ex {
    public void Custom_Setting(){
       
        Company_Names__c mc = Company_Names__c.getvalues('Cognizant');
System.debug('Company Code '+mc.Company_Code__c);
        INDIAN_STATE__c mc1 = INDIAN_STATE__c.getInstance('a0G2800000JjAbGEAV');
        System.debug('State_Code'+mc1.State_Code__c);
    }
}