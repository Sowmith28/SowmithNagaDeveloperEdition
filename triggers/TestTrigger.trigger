trigger TestTrigger on Lead (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    list<Lead> l = new list<lead>();
    if(Trigger.isbefore &&  Trigger.isinsert){
        TriggerTestHelper.methodupdate(Trigger.new);
        
    }
    if(Trigger.isbefore &&  Trigger.isupdate){
        for(Lead ll :Trigger.new){
        if(ll.Email ==null){
            ll.addError('Please enter the email');
        }
        }
       /* for(Lead llnew :Trigger.new){
            for(Lead llold :Trigger.old){
                if(llnew.Email.equals(llold.Email)){
                    llnew.addError('When update the email should be modified and saved');
                }
            }
        }*/
    }
    
    if(Trigger.isbefore && Trigger.isDelete ){
        TriggerTestHelper.methodDelete(Trigger.old);
    }
    if(Trigger.isafter &&  Trigger.isinsert){
        TriggerTestHelper.methodinsertAfter(Trigger.new);
        
    }
        if(Trigger.isafter &&  Trigger.isupdate){
        TriggerTestHelper.methodUpdateAfter(Trigger.old,Trigger.new);
    }
        if(Trigger.isbefore && Trigger.isDelete ){
        TriggerTestHelper.methodDeleteAfter(Trigger.old);
    }
    
}