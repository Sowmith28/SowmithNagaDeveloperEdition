trigger LeadTriggerTraining on Lead (before insert,before update,after insert, after update,before delete, after delete,after undelete) {
	
    if(Trigger.isinsert && Trigger.isbefore){
		LeadTriggerTrainingHelper.callBeforeInsert(Trigger.new);
    }
    if(Trigger.isupdate && Trigger.isbefore){
   for(Lead ll: Trigger.new){
        if(ll.Title == null){
            ll.addError('Title field cannot be null');
        }
    }
    }
    if( Trigger.isupdate && Trigger.isafter){
        list<Task> listOfTasks = new list<Task>();
   for(Lead ll: Trigger.new){
       for(Lead l: Trigger.old){
           if(ll.name == l.name){
        if(!(ll.Title.equals(l.Title))){
            Task t = new Task();
            t.subject = 'Title is changed to '+ll.Title +' from ' +l.Title;
            t.WhoId =ll.id;
			
            listOfTasks.add(t);
        }
       }
       }
    }
        insert listOfTasks;
    }
    
        if( Trigger.isinsert && Trigger.isafter){
        list<Task> listOfTasks = new list<Task>();
   for(Lead ll: Trigger.new){
       
        if(ll.Title =='Mr'){
            Task t = new Task();
            t.subject = 'Title is' +ll.Title ;
            t.WhoId =ll.id;
			
            listOfTasks.add(t);

       }
    }
        insert listOfTasks;
    }
    
    if(Trigger.isdelete && Trigger.isbefore){
        for(Lead ll: Trigger.old){
            if(ll.Title.equals('Mr')){
                ll.addError(' You cannnot delete the record having Mr in title field');
            }
            
        }
        
    }
    
    if(Trigger.isdelete && Trigger.isafter){
       list<Doctor__c> listOfDoctors = new list<Doctor__c>();
        for(Lead ll: Trigger.old){
            if(ll.Title.equals('Mrs')){
                Doctor__c d = new Doctor__c();
                d.name = ll.title;
                listOfDoctors.add(d);
            }
        }
        insert listOfDoctors;
    }
    
    if(Trigger.isundelete && Trigger.isafter){
        for(Lead ll: Trigger.old){
            if(ll.Title.equals('Mrs')){
                ll.addError(' You cannnot undelete the record having Mr in title field');
            }
            
        }
    }
}