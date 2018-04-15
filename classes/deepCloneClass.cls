public class deepCloneClass {
    public String cloningObject{get;set;}
    public list<SelectOption> objectsList{get;set;}
    public Map<String, Schema.SObjectType> gd;
    public deepCloneClass(){
        objectsList=new list<SelectOption>();
        gd=Schema.getGlobalDescribe();
        for(Schema.SObjectType token:gd.values())
        {
            DescribeSObjectResult d=token.getDescribe();
             if(!d.isCustomSetting() && d.isCreateable() && d.isQueryable()){
                SelectOption sP = new SelectOption(d.getName(),d.getLabel());
                 objectsList.add(sP);
             }
        }
    }
    public void newlyObtainedObject()
    {
            System.debug('Selected Parent Name ::'+cloningObject);
             sObject sObj = Schema.getGlobalDescribe().get(cloningObject).newSObject() ;
              System.debug(sObj);
       SObject newObject= sObj.clone();
        insert newObject;
    }
}