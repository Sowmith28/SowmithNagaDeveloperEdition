public class clonemethod {
    public static void methodone(){
Account a = new Account(Name='Acme', BillingCity='New York');
Account b = new Account(Name='ajith');
Account[] q1 = new Account[]{a,b};
Account[] q2 = q1.deepClone();
q1[0].BillingCity = 'San Francisco';
System.assertEquals(
'San Francisco',
q1[0].BillingCity);
//System.assertEquals(
//'San Francisco',
//q2[0].BillingCity);
        //insert q1;
        for(Account acc:q2){
       b=new Account(Name=acc.Name,BillingCity=acc.BillingCity);
             insert b;
        }
       
    }
}