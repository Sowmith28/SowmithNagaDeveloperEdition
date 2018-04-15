trigger AccountAddressTrigger on Account (before insert,before update) {

    list<Account> listofaccounts=new list<Account>();
    listofaccounts=[select id,Match_Billing_Address__c from Account ];
    for(Account a:Trigger.New)
    {
        if(a.Match_Billing_Address__c==true)
        {
            a.ShippingPostalCode=a.BillingPostalCode;
        }
    }
    update listofaccounts;
    
}