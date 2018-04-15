global class AccountPlan {

    webservice String area;
    webservice String region;
    
    //Define an object in apex that is exposed in apex web service
    global class Plan{
        WebService String name;
        WebService Integer planNumber;
        WebService Date planningPeriod;
        WebService id planId;     
    }
    
    WebService static plan CreateAccountPlan(Plan vPlan){
        //A plan maps to the Account object in salesforce.com
        //So need to map the Plan class Object to Account Standard Object
        Account acc = new Account();
        acc.Name = vPlan.name;
        acc.AccountNumber = String.valueOf(vPlan.planNumber);
        insert acc;
        
        vPlan.planId =acc.id;
        return vPlan;
    }
}