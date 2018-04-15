public class AccountProcessor {

    @future
    public static void countContacts (list<id> listOfAccountIds){
        list<Contact> listOfContacts = [select id,AccountId from Contact where accountid in: listOfAccountIds];
        Map<id, Integer> mapOFaccIdsAndCountOFCon = new Map<id, Integer>();
        list<Account> listOfUpdatesAccounts =new list<Account>();
        set<id> setOfAccountids = new set<id>();
        if(listOfContacts!=null && listOfContacts.size() >0){
            for(Contact c:listOfContacts){
                if(mapOFaccIdsAndCountOFCon.containsKey(c.AccountId)){
                    integer count= mapOFaccIdsAndCountOFCon.get(c.AccountId);
                    mapOFaccIdsAndCountOFCon.put(c.AccountId,count+1);
                    setOfAccountids.add(c.AccountId);
                }
                else{
                    integer count = 1;
                    mapOFaccIdsAndCountOFCon.put(c.AccountId, count);
                    setOfAccountids.add(c.AccountId);
                }
            }
        }
        System.debug('mapOFaccIdsAndCountOFCon' +mapOFaccIdsAndCountOFCon);
        listOfUpdatesAccounts =[select id from Account where id in :setOfAccountids];
        System.debug('listOfUpdatesAccounts' +listOfUpdatesAccounts);
        list<Account> listOfAccounts =new list<Account>();
        if(listOfUpdatesAccounts !=null && listOfUpdatesAccounts.size() >0){
            for(Account acc :listOfUpdatesAccounts){
                acc.Number_Of_Contacts__c = mapOFaccIdsAndCountOFCon.get(acc.id);
                listOfAccounts.add(acc);
            }
        }
        System.debug('listOfAccounts' +listOfAccounts);
        if(listOfAccounts !=null && listOfAccounts.size() >0){
            update listOfAccounts;
        }
         }
    
    
    
}