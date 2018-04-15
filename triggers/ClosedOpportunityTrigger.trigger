trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
list<Task> listoftasks=new list<Task>();
    Task t;
    list<Opportunity> listofopportunities=new list<Opportunity>();
    listofopportunities=[select id,StageName from opportunity where id in:Trigger.new];
    for(Opportunity o:listofopportunities)
    {
        if(o.StageName=='Closed Won')
        {
            t=new Task(whatID = o.ID, Subject='Follow Up Test Task');
            listoftasks.add(t);
            System.debug(t);
        }
       
    }
    if(!listoftasks.isEmpty())
        insert listoftasks;
    System.debug(listoftasks);
}