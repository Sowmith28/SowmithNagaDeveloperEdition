public class MyContactListController {

    @AuraEnabled
    public static list<Contact> getContacts(id recordId){
        return[SELECT id,FirstName, LastName,Email, Phone From Contact Where AccountId = :recordId];
    }
}