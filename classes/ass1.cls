public class ass1 {
 
     // public list<candidate__c> arr{get;set;}
    //public ass1(){
     // updating();
        //arr=new list<candidate__c> ();
       //arr=[select Name,Email_id__c,Expected_salary__c,Prospect_Rating__c from candidate__c];
               
        
   // }
    public void updating()
    {
       list<candidate__c> arr=new list<candidate__c> ();
       arr=[select Name,Email_id__c,Expected_salary__c,Prospect_Rating__c from candidate__c];
        for(candidate__c c:arr)
        {
            if(c.Expected_salary__c==50000)
                c.Expected_salary__c=100000;
            //update arr;
        }
        update arr;
    }
   
    
}