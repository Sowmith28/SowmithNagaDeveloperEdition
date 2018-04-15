public class DMLExecution {

    Public void insertMethod(){
        Account acc= new Account(); // Imtialization of an object
        acc.name ='sunil training';// assigning value to the field
        insert acc; //DML statment
    }
        Public void updateMethod(){
        Account acc= new Account(); // Imtialization of an object
        acc.id ='0010K00001fUNJi';// assigning value to the field
        acc.Industry = 'Agriculture';
        update acc; //DML statment
    }
    
    public void UpsertMethod(){
        list<Account> listofAccounts =[select id, name, industry from Account where name =:'Sunil Training'];
        if(listofAccounts !=null && listofAccounts.size()>0){
        Account acc = new Account();
        
        acc.name ='sunil training one';
        acc.industry ='Banking';
        upsert acc;
        }
        
    }
    public void deleteMethod(){
        list<Account> listofAccounts =[select id, name, industry from Account where name =:'Sunil Training'];
        if(listofAccounts !=null && listofAccounts.size()>0){
        delete listofAccounts;
        }
        
    }
    
}