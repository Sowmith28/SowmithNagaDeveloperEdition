trigger tass1 on candidate__c (before insert) {
if(trigger.isbefore)
{
    list<candidate__c> c=new list<candidate__c>();
    c=trigger.new;
    for(candidate__c c1:c)
    if(c1.Expected_salary__c==50000)
        c1.Expected_salary__c=1;
}
}