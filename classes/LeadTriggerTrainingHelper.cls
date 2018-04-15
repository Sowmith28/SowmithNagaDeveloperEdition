public class LeadTriggerTrainingHelper {

   public static void callBeforeInsert(list<Lead> listOfLeads){
           for(Lead ll: listOfLeads){
               System.debug(ll);
        if(ll.email == null){
            ll.addError('Email field cannot be null');
        }
        if(ll.AnnualRevenue ==null){
            ll.AnnualRevenue = 10;
        }
    }
   }
 
}