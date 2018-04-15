public class Contoller1 {
	String ex ='Hi How are you?';
    public String ex1{set;get;}
    public string Nameofaccount{set;get;}
    public list<Account> listOfAccounts{set;get;}
    list<Account> a;
    Account aa = new Account();
    public String getfirstMethod(){         
    return ex;
    }
    public void getsecondMethod(){  
        ex1='hello';

    }
        public void getthirdMethod(){  
        ex1='world';

    }
    public list<Account> geta(){
        listOfAccounts=[select id,name,industry from account limit 1];
        return a;
    }
    public void saveaccount(){
        if(Nameofaccount !=null){
            aa.name = Nameofaccount;
           insert aa;
        }
        
    }
}