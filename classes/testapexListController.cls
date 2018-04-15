public class testapexListController {

    @auraEnabled
    public static list<Contact> getAccount(){
        return[select id, name,Title,Department from Contact];
    }
     @auraEnabled
    public static void saveAccount(Account acc){
        try{
        insert acc;
        }
        catch(Exception ex){
           AuraHandledException auraException = new AuraHandledException('Enter Account Name');
            throw auraException;
        }
    }
}