public class TriggerTestHelper {

    public static void methodupdate(list<Lead> listOfLeads){
        Double Total_Amount =0;
        for(Lead l: [Select Total_Amount_Acquired__c from Lead where LeadSource ='Web' and createdById =: UserInfo.getUserId()]){
            Total_Amount = Total_Amount+l.Total_Amount_Acquired__c;
        }
        for(Lead l: listOfLeads){
            if(Total_Amount > 100000000){
                l.addError('Your Daily limit has been acheived, please try tommorrow');
            }
        }
    }
    
    public static void methodDelete(list<Lead> listOfLeads){
         for(Lead l: listOfLeads){
            if(L.LeadSource == 'Web'){
                l.addError('You cannot delete the Web generated Lead');
            }
        }
    }
    
    public static void methodinsertAfter(list<Lead> listOfLeads){
		list<Task> lNewTasks = new list<Task>();
		for(Lead l: listOfLeads){
            if(L.LeadSource == 'Web'){
                
                for(integer i=0; i<trigger.new.size(); i++)
                {
                    lNewTasks.add(new Task(
                        Subject = 'My new task',
                        WhoID = l.id
                        )
                    );
            }
                 

            }
    }
        insert lNewTasks;
    }
    
        public static void methodUpdateAfter(list<Lead> listOfLeadsOld,list<Lead> listOfLeadsNew){
		list<Task> lNewTasks = new list<Task>();
		for(Lead l: listOfLeadsOld){
            for(Lead ll: listOfLeadsNew){
            if(L.LeadSource == 'Web' && ll.LeadSource== 'Other'){
                
                for(integer i=0; i<trigger.new.size(); i++)
                {
                    lNewTasks.add(new Task(
                        Subject = 'Check what is the status of Lead source with manager',
                        WhoID = l.id
                        )
                    );
            }
                 

            }
    }
        }
        insert lNewTasks;
    }
    
     public static void methodDeleteAfter(list<Lead> listOfLeads){
         for(Lead l: listOfLeads){
            if(L.LeadSource == 'Other'){
                l.addError('You cannot delete the Lead with Lead source as other');
            }
        }
    }
}