public class SchemaDescripton {
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public String selectObject{get;set;}
	public static String  ObjectName = 'Account';
    public list<SelectOption> listofParents{set;get;}
    public list<String> listOfChilds{get;set;}
    public SchemaDescripton(){
        listofParents = intializeParentObjects();
        
    }
    
    public list<SelectOption> intializeParentObjects(){
        list<SelectOption> listOfParentObjects = new list<SelectOption>();
        list<String> listOfParentStrings = new list<String>(schemaMap.keySet());
        listOfParentStrings.sort();
        for(String name:listOfParentStrings){
            listOfParentObjects.add(new SelectOption(name,name));
        }
        return listOfParentObjects;
    }
    public static void schemaGetGlobalDescribe(){
       
        Map<String, schema.SObjectType> MapOfSchemaObjects = Schema.getGlobalDescribe();
        list<String> listOfObjectNames = new list<String>();
        list<Schema.DescribeDataCategoryGroupResult> listOfCategories = new list<Schema.DescribeDataCategoryGroupResult>();
        for(String temp :MapOfSchemaObjects.keyset()){
            System.debug('Key--->'+temp +'    '+ 'Value --->'+MapOfSchemaObjects.get(temp));
     		System.debug(MapOfSchemaObjects.get(temp).getDescribe());
            System.debug(MapOfSchemaObjects.get(temp).getDescribe().Fields.getMap());
        }
        Map<String, Schema.SObjectField> mapOfFields = MapOfSchemaObjects.get(ObjectName).getDescribe().Fields.getMap();
         System.debug(mapOfFields);
        for (Schema.ChildRelationship cr: MapOfSchemaObjects.get(ObjectName).getDescribe().getChildRelationships()) 
        {
            system.debug('====child object==='+cr.getChildSObject().getDescribe().Fields.getMap());
        }
        
        listOfObjectNames.add('KnowledgeArticleVersion');
        listOfCategories= schema.describeDataCategoryGroups(listOfObjectNames);
        system.debug('listOfCategories[0].getname() '+listOfCategories[0].getname() +'  '+ listOfCategories[0].getLabel()+'  '+listOfCategories[0].getcategorycount());
        system.debug('listOfCategories '+listOfCategories);
        system.debug('listOfCategories size'+listOfCategories.size());
    }
    
    public void showChilds(){
        listOfChilds = new list<String>();
        for (Schema.ChildRelationship cr: schemaMap.get(selectObject).getDescribe().getChildRelationships()) 
        {
            listOfChilds.add(cr.getChildSObject().getDescribe().getLabel());
           // system.debug('====child object==='+cr.getChildSObject().getDescribe().Fields.getMap());
        }
    }
}