public class Bank {
    //variables
    integer balance=20000;
    
    //methods
    public void withdraw(integer amount){
        try{
            if(balance < amount){
                throw new OwnException();
            }
            balance = balance - amount;
            system.debug('the remaining balance in your account '+ balance);
        }
        Catch(Exception e){
            system.debug(e.getMessage());
            
        }
    }

}