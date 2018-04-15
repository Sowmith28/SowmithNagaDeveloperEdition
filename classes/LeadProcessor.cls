global class LeadProcessor implements Database.Batchable<Sobject>, Database.stateful{

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID,LeadSource FROM LEAD');
    }
    global void execute(Database.BatchableContext bc, list<Lead> listOfLeads){
        list<Lead> listOfUpdatedLeads = new list<Lead>();
        for(Lead l : listOfLeads){
            l.LeadSource = 'Dreamforce';
            listOfUpdatedLeads.add(l);
        }
        if(listOfUpdatedLeads !=null && listOfUpdatedLeads.size() > 0){
            update listOfUpdatedLeads;
        }
    }
    global void finish(Database.BatchableContext bc){
       
    }
}