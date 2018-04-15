public  class TeamPlayers {
     
    public static void fetching(Set<team__c> parentids){
        list<team__c> updatedcompanies=new list<team__c>();
        list<team__c> listofCompanies=new list<team__c>();
    listofCompanies=[select id,(select id from players__r) from team__c where id in:parentids];
       for( team__c t:listofCompanies)
       {
           
           t.numberofplayers__c=t.players__r.size();
           System.debug(t);
             
       }
        if(updatedcompanies.size()>0)
      update updatedcompanies;
    
        //Map<ID, Account> m = new Map<ID, Account>([SELECT Id, Name FROM Account LIMIT 14]);
// After populating the map, iterate through the map entries
//for (ID idKey : m.keyset()) {
  //  Account a = m.get(idKey);
   // System.debug(a);
//}

        
       }
}