public class NOFOGroupClonePlusCont {

  public List<relatedObjects> objectChildren  { get; set; }
  public String               objectTypeName  { get; set; }
  public String               objectName      { get; set; }
  public List<relatedObjects> objectGrandChildren  { get; set; }
   
  @TestVisible private SObject headSObject, headClone;
  
  // Initialisation method called when the clone plus page is first loaded.
  // Use the id page parameter to find out what kind of object we are trying to clone.
  // Then load the object from the database.
  // Finally call the populateObjectChildren method to      
  public void initialiseObjectsForCloning()
  {
   
    // Here we generate a keyprefixmap using the global describe 
    // Then compare that to our object to determine type.  
    Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
       
    Map<String,String> keyPrefixMap = new Map<String,String>{};
          
    for(String sObj : gd.keySet()){
      Schema.DescribeSObjectResult r =  gd.get(sObj).getDescribe();
      keyPrefixMap.put(r.getKeyPrefix(), r.getName());
    }
      
    String objectID                 = ApexPages.currentPage().getParameters().get('id');
    String objectTypeKey            = objectId.subString(0,3);
      
    objectTypeName                  = keyPrefixMap.get(objectTypeKey);
      
    String primaryObjectQueryString = 'SELECT Id, Name FROM '
                                    + objectTypeName
                                    + ' WHERE Id = \''
                                    + objectId
                                    + '\'';
    
    headSObject = Database.query(primaryObjectQueryString);
    objectName          = '' + headSObject.get('Name');
    populateObjectChildren();    
    populateObjectGrandChildren();
  }

  // Get all of the children of the current object that have a object type
  // contained in the child object types page parameter.
  // Not restricting the child objects to particular types results in many
  // unclonable system objects being added to the possibiilites, which we need to avoid.
  // Making these object type choices also allows us 
  // pick and chose the specific kinds of objects we want to allow users to clone.  
  public void populateObjectChildren()
  {
       
    objectChildren = new List<relatedObjects>{};
        
    Set<String> childObjectTypes = new Set<String>{};
    
    // read the object types from the page parameter.    
    childObjectTypes.addAll(
         ApexPages.currentPage().getParameters().get('childobjecttypes').split(',')
    );
      for(String s:childObjectTypes)
     System.debug('s'+s);
    // Use the sobjecttype describe method to retrieve all 
    // child relationships for the object to be cloned.    
    Schema.DescribeSObjectResult headDescribe = 
           headsObject.getSObjectType().getDescribe();
    System.debug('headDescribe'+headDescribe);
    List<Schema.ChildRelationship> childRelationships = 
           headDescribe.getChildRelationships(); 
    System.debug('childRelationships'+childRelationships);
    // Iterate through each relationship, and retrieve the related objects.       
    for (Schema.ChildRelationship childRelationship : childRelationships)
    {
      Schema.SObjectType childObjectType = childRelationship.getChildSObject();
      
        System.debug('childObjectType.getDescribe().getName()'+childObjectType.getDescribe().getName());
      // Only retrieve the objects if their type is one of those we are interested in.          
      if (childObjectTypes.contains(childObjectType.getDescribe().getName()))
      {
        List<relatedObjectRow> relatedObjects = new List<relatedObjectRow>{};
                
        Schema.SObjectField childObjectField = childRelationship.getField();
                
        String relatedChildSObjectsquery;
        
        if(childObjectType.getDescribe().getName() == 'Action_Reports__c'){
            relatedChildSObjectsquery = 'SELECT ID,Name,Due_Date__c,Reporting_Period_End_Date__c,Reporting_Period_Start_Date__c,Report_Activity__c,Sequence_Number__c FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\''; 
        }
        else if(childObjectType.getDescribe().getName() == 'Funding_Source__c'){
            relatedChildSObjectsquery = 'SELECT ID,Name,Account_Purpose__c,Fiscal_Yr_Basis__c,Grant_location_number__c,Object_code__c,Funds_Remaining__c FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\'';
        }
        else{
            relatedChildSObjectsquery = 'SELECT ID,Name FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\'';
        }
                 //System.debug('Database.query(relatedChildSObjectsquery)'+Database.query(relatedChildSObjectsquery));                                       
        for (SObject childObject : Database.query(relatedChildSObjectsquery))
        {
          relatedObjects.add(new relatedObjectRow(childObject));
        }
            System.debug('relatedObjects'+relatedObjects);
        if (!relatedObjects.isEmpty())
        {
          objectChildren.add(new relatedObjects(relatedObjects, 
                             childObjectType.getDescribe().getLabelPlural(), 
                             childObjectField.getDescribe().getName()));
        }  
      }
    }
  }
   
    public void populateObjectGrandChildren()
  {
       
    objectGrandChildren = new List<relatedObjects>{};
        
    Set<String> childObjectTypes = new Set<String>{};
    
    // read the object types from the page parameter.    
    childObjectTypes.addAll(
         ApexPages.currentPage().getParameters().get('gchildobjecttypes').split(',')
    );
      for(String s:childObjectTypes)
     System.debug('s'+s);
    // Use the sobjecttype describe method to retrieve all 
    // child relationships for the object to be cloned.    
    Schema.DescribeSObjectResult headDescribe = 
           headsObject.getSObjectType().getDescribe();
    System.debug('headDescribe'+headDescribe);
    List<Schema.ChildRelationship> childRelationships = 
           headDescribe.getChildRelationships(); 
    System.debug('childRelationships'+childRelationships);
    // Iterate through each relationship, and retrieve the related objects.       
    for (Schema.ChildRelationship childRelationship : childRelationships)
    {
      Schema.SObjectType childObjectType = childRelationship.getChildSObject();
      
        System.debug('childObjectType.getDescribe().getName()'+childObjectType.getDescribe().getName());
      // Only retrieve the objects if their type is one of those we are interested in.          
      if (childObjectTypes.contains(childObjectType.getDescribe().getName()))
      {
        List<relatedObjectRow> relatedObjects = new List<relatedObjectRow>{};
                
        Schema.SObjectField childObjectField = childRelationship.getField();
                
        String relatedChildSObjectsquery;
        
        if(childObjectType.getDescribe().getName() == 'Action_Reports__c'){
            relatedChildSObjectsquery = 'SELECT ID,Name,Due_Date__c,Reporting_Period_End_Date__c,Reporting_Period_Start_Date__c,Report_Activity__c,Sequence_Number__c FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\''; 
        }
        else if(childObjectType.getDescribe().getName() == 'Funding_Source__c'){
            relatedChildSObjectsquery = 'SELECT ID,Name,Account_Purpose__c,Fiscal_Yr_Basis__c,Grant_location_number__c,Object_code__c,Funds_Remaining__c FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\'';
        }
        else{
            relatedChildSObjectsquery = 'SELECT ID,Name FROM ' 
                                         + childObjectType.getDescribe().getName()
                                         + ' WHERE '
                                         + childObjectField.getDescribe().getName()
                                         + ' = \'' 
                                         + headsObject.Id
                                         + '\'';
        }
                 //System.debug('Database.query(relatedChildSObjectsquery)'+Database.query(relatedChildSObjectsquery));                                       
        for (SObject childObject : Database.query(relatedChildSObjectsquery))
        {
          relatedObjects.add(new relatedObjectRow(childObject));
        }
            System.debug('relatedObjects'+relatedObjects);
        if (!relatedObjects.isEmpty())
        {
          objectGrandChildren.add(new relatedObjects(relatedObjects, 
                             childObjectType.getDescribe().getLabelPlural(), 
                             childObjectField.getDescribe().getName()));
        }  
      }
    }
  }
  
  // Perform the cloning process.
  // First clone the parent, then all of the child objects. 
  // Then redirect the user to the new object page.
  public PageReference doClone()
  {
   try
   {
      headClone = cloneObjects(new List<sObject>{headSObject})[0];      
      system.debug('cloned main object = '+headClone);
      insert headClone;
    
      cloneSelectedObjects();
       cloneSelectedObjects1();
    
      return new PageReference('/' + headClone.Id);
    }
    // If there is any kind of exception, then put a page message on the screen to inform the user.
    catch (exception e)
    {
      ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
      return null;
    }
  }
  
  // Clone the selected child objects.
  // Associate the cloned objects with the new cloned parent object.
  public void cloneSelectedObjects()
  {
      System.debug('line no 154');
    List<sObject> clonedObjects = new List<sObject>{};
    List<sObject> selectedRelatedObjects;
     System.debug('line no 157'+objectChildren);
    for (relatedObjects relatedObject : objectChildren)
    {
      selectedRelatedObjects = new List<sObject>{};  
      clonedObjects = new List<sObject>{};  
      
      for (relatedObjectRow row : relatedObject.objectRows) 
      {
        if (row.selected)
        {
          selectedRelatedObjects.add(row.obj);
        }
      }
      
      if (!selectedRelatedObjects.isEmpty())
      {
        clonedObjects = cloneObjects(selectedRelatedObjects);
        
        for (sObject clone : clonedObjects)
        {
          clone.put(relatedObject.relatedFieldName, headClone.Id);  
        }
        system.debug('clone child Objects = '+clonedObjects);
        insert clonedObjects;
      }
    }
  }
    
     public void cloneSelectedObjects1()
  {
      System.debug('line no 154');
    List<sObject> clonedObjects = new List<sObject>{};
    List<sObject> selectedRelatedObjects;
     System.debug('line no 157'+objectChildren);
    for (relatedObjects relatedObject : objectGrandChildren)
    {
      selectedRelatedObjects = new List<sObject>{};  
      clonedObjects = new List<sObject>{};  
      
      for (relatedObjectRow row : relatedObject.objectRows) 
      {
        if (row.selected)
        {
          selectedRelatedObjects.add(row.obj);
        }
      }
      
      if (!selectedRelatedObjects.isEmpty())
      {
        clonedObjects = cloneObjects(selectedRelatedObjects);
        
        for (sObject clone : clonedObjects)
        {
          clone.put(relatedObject.relatedFieldName, headClone.Id);  
        }
        system.debug('clone child Objects = '+clonedObjects);
        insert clonedObjects;
      }
    }
  }

  // Clone a list of objects to a particular object type
  // Parameters 
  // - List<sObject> sObjects - the list of objects to be cloned 
  // The sObjects you pass in must include the ID field, 
  // and the object must exist already in the database, 
  // otherwise the method will not work.
  public static List<sObject> cloneObjects(List<sObject> sObjects){
                                                
    Schema.SObjectType objectType = sObjects.get(0).getSObjectType();
    system.debug('objectType = '+objectType);
    
    // A list of IDs representing the objects to clone
    List<Id> sObjectIds = new List<Id>{};
    // A list of fields for the sObject being cloned
    List<String> sObjectFields = new List<String>{};
    // A list of new cloned sObjects
    List<sObject> clonedSObjects = new List<sObject>{};
    
    // Get all the fields from the selected object type using 
    // the get describe method on the object type.    
    if(objectType != null)
    {
      for (Schema.SObjectField objField : 
           objectType.getDescribe().fields.getMap().values())
      { 
        Schema.DescribeFieldResult fieldDesc = objField.getDescribe();
        // If the field type is location, then do not include it,
        // otherwise it will cause a soql exception.
        // Note that excluding the field does not stop the location from
        // being copied to the new cloned object.
        if(fieldDesc.getType() != DisplayType.LOCATION)
        {
          sObjectFields.add(fieldDesc.Name);
        }
      }
    }
    
    // If there are no objects sent into the method, 
    // then return an empty list
    if (sObjects != null || 
        sObjects.isEmpty() || 
        sObjectFields.isEmpty()){
    
      // Strip down the objects to just a list of Ids.
      for (sObject objectInstance: sObjects){
        sObjectIds.add(objectInstance.Id);
      }

      /* Using the list of sObject IDs and the object type, 
         we can construct a string based SOQL query 
         to retrieve the field values of all the objects.*/
    
      String allSObjectFieldsQuery = 'SELECT ' + String.join(sObjectFields,','); 
    
      allSObjectFieldsQuery += ' FROM ' + 
                               objectType.getDescribe().getName() + 
                               ' WHERE ID IN (\'' + sObjectIds.get(0) + 
                               '\'';

      for (Integer i=1 ; i < sObjectIds.size() ; i++){
        allSObjectFieldsQuery += ', \'' + sObjectIds.get(i) + '\'';
      }
    
      allSObjectFieldsQuery += ')';
    
      // Execute the query. For every result returned, 
      // use the clone method on the generic sObject 
      // and add to the collection of cloned objects
      for (SObject sObjectFromDatabase:
           Database.query(allSObjectFieldsQuery))
      {
        sObject s = sObjectFromDatabase.clone(false,true);        
        if(string.valueOf(objectType) == 'NOFA__c'){
            s.put('NOFA_name__c', null);
            s.put('RFP_Name__c', null);
            s.put('Legacy_NOFA_ID__c',null);  
            s.put('Status__c','Setup in Progress'); 
            s.put('NOFA_Active_Inactive__c',false);    
            s.put('OwnerId',UserInfo.getUserId()); 
        }  
        if(string.valueOf(objectType) == 'Application3__c'){
          s.Put('NOFA_RFP__c',ApexPages.currentPage().getParameters().get('NofaId'));
        }
        if(string.valueOf(objectType) == 'Prime_Application__c'){
          s.Put('NOFO_RFP__c',ApexPages.currentPage().getParameters().get('NofaId'));
          s.Put('Sub_Application_Due_Date__c',null);
        }        
        
        clonedSObjects.add(s);
      }

    }
   
    return clonedSObjects;
    
  }
  
  // Related objects data construct - used to store a collection of child objects
  // connected to the head object through the same relationship field.
  public class relatedObjects
  {
    public List<relatedObjectRow> objectRows       { get; set; }
    public String                 pluralLabel      { get; set; }
    public String                 relatedFieldName { get; set; }
    
    public relatedObjects(List<relatedObjectRow> objectRows, 
                          String pluralLabel, 
                          String relatedFieldName) 
    {
      this.objectRows       = objectRows;
      this.pluralLabel      = pluralLabel;
      this.relatedFieldName = relatedFieldName;
    }   
  }     

  // An indidual child object row. It simple contains the object definition, 
  // and a checkbox to select the row for cloning on the clone plus page.
  public class relatedObjectRow
  {
    public sObject obj      { get; set; }
    public Boolean selected { get; set; }
    
    public relatedObjectRow(Sobject obj)
    {
      this.obj      = obj;
      system.debug('obj = '+obj);
      // All object rows are selected by default.
      //this.selected     = true;
    }
    
    public String getId(){
      try{
        return '' + obj.get('Id');
      } catch (Exception e){
        return '';
      }    
    }
    
    public String getName(){
      try{
        system.debug('Name = '+string.valueOf(obj.get('Name')));
        return string.valueOf(obj.get('Name'));
      } catch (Exception e){
        return '';
      }    
    }
  }
}