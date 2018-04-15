/*
Created for sharmistha's Work
*/
public class metadatautility2{
    
    final static Integer FULLNAME =  Integer.valueof(system.label.Field_Name);
    final static Integer STATUS = Integer.valueof(system.label.Action);
    final static Integer LABEL = Integer.valueof(system.label.Label);
    final static Integer DESCR = Integer.valueof(system.label.Field_Description);
    final static Integer TYPE_X = Integer.valueof(system.label.Field_Type);
    final static Integer LENGTH = Integer.valueof(system.label.Field_Length);
    final static Integer PRECSCALE = Integer.valueof(system.label.Decimal_Places);
    final static Integer VISIBLELINES = Integer.valueof(system.label.Visible_Lines);
    final static Integer EXTID = Integer.valueof(system.label.External_ID);
    final static Integer REFNAME = Integer.valueof(system.label.Child_Relationship_Name);
    final static Integer REFTO = Integer.valueof(system.label.Related_To);
    final static Integer HELPTEXT = Integer.valueof(system.label.Help_Text);
    final static Integer DISPFORMAT = Integer.valueof(system.label.Display_Format);
    final static Integer STARTINGNUM = Integer.valueof(system.label.Starting_Number);
    final static Integer PICKLISTVALS = Integer.valueof(system.label.Picklist_Definition);
    final static Integer DEF = Integer.valueof(system.label.Default_Value);
    final static Integer FORMULA = Integer.valueof(system.label.Formula);
    final static Integer FORMULARETTYPE = Integer.valueof(system.label.Formula_Return_Type);
    final static Integer MASKCHAR = Integer.valueof(system.label.Mask_Character);
    final static Integer MASKTYPE = Integer.valueof(system.label.Mask_Type);
    final static Integer ALLOWPARENT = Integer.valueof(system.label.Allow_Reparenting);
    final static Integer LOCINDECIMAL = Integer.valueof(system.label.Action);
    final static Integer SORTED = Integer.valueof(system.label.Sort_Option);    
    final static Integer UNIQUE = Integer.valueof(system.label.Unique);
    final static Integer REQUIRED = Integer.valueof(system.label.Required);
    final static Integer TREATBLANK = Integer.valueof(system.label.Blank_Field_Handling);
    final static Integer ROLLUPTYPE = Integer.valueof(system.label.Roll_Up_Type);
    
    final static Integer SUMOBJ = Integer.valueof(system.label.Summarized_Object);
    final static Integer FIELDTOAGG = Integer.valueof(system.label.Field_to_Aggregate);
    
    final static Integer VisibileOnProfile = Integer.valueOf(System.label.Editable );
    final static Integer ReadOnlyProfile = Integer.valueOf(System.label.Read_only);
    public static List<String> exceptionMessage = new List<String>();
    
    public class FLS{
        public string pname;
        set<string> editfiledlist;
        set<string> readonlylist;    
    }
    public static map<string , FLS> flsmap;
    public static boolean managefls(){
        list<MetaData_CBA.Profile> prlist = new list<MetaData_CBA.Profile>();
        for(string key : flsmap.keyset()){
            if(key != 'None'){
                MetaData_CBA.Profile prof = new MetaData_CBA.Profile();        
                prof.fullName = key;
                //prof.custom = true;
                list<MetaData_CBA.ProfileFieldLevelSecurity> flslist = new list<MetaData_CBA.ProfileFieldLevelSecurity>();
                if(flsmap.get(key) != null && flsmap.get(key).editfiledlist != null){
                    for(string str : flsmap.get(key).editfiledlist){
                        MetaData_CBA.ProfileFieldLevelSecurity fieldSec = new MetaData_CBA.ProfileFieldLevelSecurity();
                        fieldSec.field=str;
                        fieldSec.editable=true;
                        if(flsmap.get(key).readonlylist != null && flsmap.get(key).readonlylist.contains(str)){
                            fieldSec.readable=true;
                        }
                        flslist.add(fieldSec);
                    }
                }
                if(flsmap.get(key) != null && flsmap.get(key).readonlylist != null){
                    if(flsmap.get(key) != null && flsmap.get(key).readonlylist != null){
                        set<string> rdl = flsmap.get(key).readonlylist;
                        if(flsmap.get(key).editfiledlist != null)
                            rdl.removeall(flsmap.get(key).editfiledlist);
                        for(string str : rdl){
                            MetaData_CBA.ProfileFieldLevelSecurity fieldSec = new MetaData_CBA.ProfileFieldLevelSecurity();
                            fieldSec.field=str;
                            fieldSec.readable=true;
                            fieldSec.editable=false;
                            flslist.add(fieldSec);
                        }
                    }
                }
                if(!flslist.isempty()){
                    prof.fieldPermissions = flslist ;
                    prlist.add(prof);
                }
            }
        }
        system.debug('Profile====>'+prlist[0].fieldPermissions); 
        return upsertMetadata(prlist);
    }
    /*
     * This method will create all the fields for provided object.
     */ 
   public static List<MetaData_CBA.CustomField> summaryFieldList = new List<MetaData_CBA.CustomField>();
   public static string createfield(String objName, List<String>  fieldList){
       // System.debug('FieldData:'+input);
        //Variables
        // = input.split('\n');
        flsmap = new map<string , FLS>();
        List<String>  fieldDataList;
        List<MetaData_CBA.CustomField> listOfFields = new List<MetaData_CBA.CustomField>();
        List<MetaData_CBA.CustomField> formulaFieldList = new List<MetaData_CBA.CustomField>();
          // @8aug changed
        List<String> deleteFieldList= new List<String>();        
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        System.debug('fieldList Length:'+fieldList.size());
       // fieldList.remove(0);
        Map<String,Integer> fieldExcelMap = new Map<String,Integer>();
        Integer i=2;
        //Field Creation/Update
        for(String fieldData:fieldList){
                
            fieldData = formatString(fieldData);
            fieldDataList = fieldData.split(',');
            fieldExcelMap.put(fieldDataList[FULLNAME], i++);
            if(system.label.Upsert.equalsignorecase(fieldDataList[STATUS])){      
                System.debug('list size-'+fieldDataList.size());
                MetaData_CBA.CustomField customField = new MetaData_CBA.CustomField();
                customField.fullName = objName+'.'+fieldDataList[FULLNAME];
                customField.label = fieldDataList[LABEL];
                customField.description = fieldDataList[DESCR];
                customField.inlineHelpText = fieldDataList[HELPTEXT];
                customField = addfield(fieldDataList,customField);
               
                if(('Formula').equalsignorecase(fieldDataList[TYPE_X]))
                {
                    formulaFieldList.add(customField);      
                }
                else if (('Summary').equalsignorecase(fieldDataList[TYPE_X]))   // @8aug changed
                {
                    summaryFieldList.add(customField);
                } // @8aug changed
                else
                {
                    listOfFields.add(customField);
                }
                fieldDataList[VisibileOnProfile] = fieldDataList[VisibileOnProfile] != '' && fieldDataList[VisibileOnProfile] != null ? fieldDataList[VisibileOnProfile] : 'None';
                for(string s : fieldDataList[VisibileOnProfile].split(';')){
                    s = s.equalsignorecase('System Administrator') ? 'Admin' : s;
                    if(!s.equalsignorecase('None') ){
                        if(!flsmap.containskey(s)){
                            flsmap.put(s, new fls());
                            flsmap.get(s).pname = s;
                            flsmap.get(s).editfiledlist = new set<string>();
                            //flsmap.get(s).readonlylist = new list<string>() ;
                        }
                        flsmap.get(s).editfiledlist.add(customField.fullName);
                    }
                    
                }
                fieldDataList[ReadOnlyProfile] = fieldDataList[ReadOnlyProfile] != '' && fieldDataList[ReadOnlyProfile] != null ? fieldDataList[ReadOnlyProfile] : 'None';
                for(string s : fieldDataList[ReadOnlyProfile].split(';')){
                    s = s.equalsignorecase('System Administrator') ? 'Admin' : s;
                    if(!s.equalsignorecase('None') ){
                        if(!flsmap.containskey(s) ){
                            flsmap.put(s, new fls());
                            flsmap.get(s).pname = s;
                            //flsmap.get(s).editfiledlist = new list<string>();
                            flsmap.get(s).readonlylist = new set<string>() ;
                        }
                        else if (flsmap.get(s).readonlylist == null){
                            flsmap.get(s).readonlylist = new set<string>() ;
                        }
                        flsmap.get(s).readonlylist.add(customField.fullName);
                    }
                    
                }
            }else{
            
                if(('Delete').equalsignorecase(fieldDataList[STATUS])){
                    
                    deleteFieldList.add(objName+'.'+fieldDataList[FULLNAME]);
                }
            }
            
            
        }
        Boolean isSuccess=true;
        if(listOfFields.size()>0){
            isSuccess = upsertMetadata(listOfFields);
        }
        if(isSuccess && formulaFieldList.size()>0)
        {
             isSuccess= upsertMetadata(formulaFieldList);
        }
       //if(isSuccess && summaryFieldList.size()>0)    // @8aug changed
        //{
           //  isSuccess= upsertMetadata(summaryFieldList);
       // } // @8aug changed
        if(!flsmap.isempty()){
                managefls();
        }
        
        if(deleteFieldList.size()>0){
             isSuccess = deleteMetadata('CustomField',deleteFieldList);
        }  
        List<String> excepList = exceptionFormat(fieldExcelMap);
        System.debug('Exception List');
        if(excepList!=null && excepList.size()>0){
            for(String s:excepList){
                System.debug(s);
            }
        }
        System.debug('Success Status:'+isSuccess);
        if(isSuccess){
            return 'success';
        }else{
            return 'fail';
        }
        
       
    }
     /*
     * Method for formatting String.
     */
    public static String formatString(String str){
        
        String st='';
        Boolean start=false;
        for(String s:str.split(''))
        {
            if(s == '"')
            {
                start = !start;
            }
            else 
            {
                if(start && s == ',')
                    st += ';';
                else
                    st += s;
            }
        }
        return st;
    }


    /*
     * Method for creating TextArea, TextArea(Long),TextArea(Rich)    
     */
    public static MetaData_CBA.CustomField createTextAreaField(List<String> fieldDataList, MetaData_CBA.CustomField customField)
    {   
        if(fieldDataList[LENGTH] != null){
            customField.length = Integer.valueOf(fieldDataList[LENGTH]);    
        }
        if(fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area (Long)'.trim()))
        {
            customField.visibleLines = Integer.valueOf(fieldDataList[VISIBLELINES]);
            customField.type_x = 'LongTextArea';
            customField.defaultValue = '"'+fieldDataList[DEF]+'"';
        }else if(fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area (Rich)'.trim()))
        {
            customField.visibleLines = Integer.valueOf(fieldDataList[VISIBLELINES]);
            customField.type_x = 'Html';
            if(fieldDataList[LENGTH] != null){
                customField.length = Integer.valueOf(fieldDataList[LENGTH]);    
            }
            
         }else if(fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area'.trim())){
            customField.type_x = 'TextArea';
             if(fieldDataList[REQUIRED] != null){
                customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);     
             } 
        }else if(fieldDataList[TYPE_X].trim().equalsignoreCase('Text(Encrypted)'.trim())){
            customField.type_x = 'EncryptedText';
            customField.maskType = MetaDataAPIUtility_CBA.getmasktype(fieldDataList[MASKTYPE]);
            customField.maskChar = fieldDataList[MASKCHAR];
             if(fieldDataList[REQUIRED] != null){
                customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);     
             } 
             customField.length = Integer.valueOf(fieldDataList[LENGTH]);    
             
        }
        return customField;        
    }
    /*
     * Method for creating TextField
     */
    public static MetaData_CBA.CustomField createTextField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {
        customField.length = Integer.valueOf(fieldDataList[LENGTH]);
        customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
        customField.externalId = Boolean.valueOf(fieldDataList[EXTID]);
        customField.unique = Boolean.valueOf(fieldDataList[UNIQUE]);
        if(Boolean.valueOf(fieldDataList[UNIQUE])){
            customField.caseSensitive=Boolean.valueOf(fieldDataList[UNIQUE+1]);
        }
        customField.defaultValue = '"'+fieldDataList[DEF]+'"';
        
        return customField;
    }
    /*
     * Method for creating Number, Percent and Currency fields
     */
    public static MetaData_CBA.CustomField createNumberField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {
        List<String> precAndScaleStr = fieldDataList[PRECSCALE].split(';'); 
        customField.precision = Integer.valueOf(precAndScaleStr.get(0));
        customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
        customField.scale = Integer.valueOf(precAndScaleStr.get(1));
        customField.defaultValue = fieldDataList[DEF];
        if(('Number').equalsignorecase(fieldDataList[TYPE_X]))
        {
            customField.externalId = Boolean.valueOf(fieldDataList[EXTID]);
            customField.unique = Boolean.valueOf(fieldDataList[UNIQUE]);
        }
        return customField;
    }
     /*
     * Method for creating AutoNumber field
     */
    public static MetaData_CBA.CustomField createAutoNumberField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {
        customField.type_x='AutoNumber';
        customField.displayFormat=fieldDataList[DISPFORMAT];
        customField.startingnumber=Integer.valueOf(fieldDataList[STARTINGNUM]);
        customField.externalId = Boolean.valueOf(fieldDataList[EXTID]);
        // customField.unique = ;
        return customField;
    }
     /*
     * Method for creating Picklist and Multi-Select picklist
     */
     public static MetaData_CBA.CustomField createPicklist(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {
        MetaData_CBA.Picklist pt = new MetaData_CBA.Picklist();
        if(fieldDataList[SORTED] != null && ('Sort values alphabetically').equalsignorecase(fieldDataList[SORTED])){
            pt.sorted= true;    
        }else{
            pt.sorted= false;
        }
        
        String valuesStr = fieldDataList[PICKLISTVALS];
        List<String> valList = valuesStr.split(';');
        List<MetaData_CBA.PicklistValue> picklistValList= new List<MetaData_CBA.PicklistValue>();
        System.debug('Picklist values:');
        
        for(String s:valList){
            
            MetaData_CBA.PicklistValue data = new MetaData_CBA.PicklistValue();
            if(s.equalsIgnoreCase(fieldDataList[DEF])){
                data.default_x=TRUE;
            }else{
                data.default_x=FALSE;
            }
            data.fullName=s;
            
            picklistValList.add(data);
        }
        pt.picklistValues = picklistValList;
        customField.picklist = pt;
        
        if(fieldDataList[TYPE_X].equalsignoreCase('Picklist')){
            customField.type_x = 'Picklist';
        }else if( fieldDataList[TYPE_X].equalsignoreCase('Picklist (Multi-Select)'.trim())){
            customField.type_x = 'MultiselectPicklist';
            customField.visibleLines = Integer.valueOf(fieldDataList[VISIBLELINES]);
        }
        // customField.unique = ;
        return customField;
    }
    /*
     * Method for creating Email
     */
    public static MetaData_CBA.CustomField createEmailField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {
        customField.type_x = 'Email';
        customField.unique = Boolean.valueOf(fieldDataList[UNIQUE]);
        customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
        customField.externalId = Boolean.valueOf(fieldDataList[EXTID]);
        customField.defaultValue = '"'+fieldDataList[DEF]+'"';
        return customField;
    }
     /*
     * Method for creating checkbox field
     */
    public static MetaData_CBA.CustomField createCheckboxField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   customField.type_x = 'Checkbox';
        customField.defaultValue = fieldDataList[DEF];
        return customField;
    }
    /*
     * Method for creating Lookup Relationships
     */
    public static MetaData_CBA.CustomField createLookupField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   
        customField.type_x = 'Lookup';
        
        customField.relationshipName = fieldDataList[REFNAME];
        customField.referenceTo = fieldDataList[REFTO];
        customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
       /* MetaData_CBA.LookupFilter look = new MetaData_CBA.LookupFilter();
        List<MetaData_CBA.FilterItem> filterItemList = new List<MetaData_CBA.FilterItem>();
        MetaData_CBA.FilterItem fl2 = new MetaData_CBA.FilterItem();
        fl2.field = 'User__c.Name__c';
        fl2.operation = 'equals';
        fl2.value = 'Tom';
        //filterItemList.add(fl1);
        filterItemList.add(fl2);
        look.filterItems = filterItemList;
        //look.booleanFilter = '1 OR 2';
        look.active=true;
        look.isOptional=false;
        customField.lookupFilter = look;*/
        return customField;
    }
    /*
     * Method for creating Master-Detail Relationships
     */
    public static MetaData_CBA.CustomField createMasterDetailField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   
        
        //customField.externalId = false;
        customField.referenceTo =  fieldDataList[REFTO];
        //customField.relationshipLabel = 'Test Children';
        customField.relationshipName = fieldDataList[REFNAME];
        customField.relationshipOrder = 0;
        customField.type_x = 'MasterDetail';
        customField.writeRequiresMasterRead = Boolean.valueOf(fieldDataList[ALLOWPARENT]);
        return customField;
    }
    /*
     * Method for creating Geolocation field
     */
    public static MetaData_CBA.CustomField createGeolocationField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   
        
        customField.type_x =  'Location';
        customField.scale = Integer.valueOf(fieldDataList[PRECSCALE]);
        customField.displayLocationInDecimal = true;
        customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
        return customField;
    }
    /*
     * Method for creating Formula field
     */
    public static MetaData_CBA.CustomField createFormulaField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   
        customField.type_x = fieldDataList[FORMULARETTYPE];
        customField.formula = fieldDataList[FORMULA];
        if(('Currency').equalsignoreCase(fieldDataList[FORMULARETTYPE]) || ('Number').equalsignoreCase(fieldDataList[FORMULARETTYPE])||
          ('Percent').equalsignoreCase(fieldDataList[FORMULARETTYPE])){
            List<String>precAndScaleStr = fieldDataList[PRECSCALE].split(';'); 
            customField.precision = Integer.valueOf(precAndScaleStr.get(0));
            customField.scale = Integer.valueOf(precAndScaleStr.get(1));
              
        }
        
     
       if(('Treat blank fields as zeroes').equalsIgnoreCase(fieldDataList[TREATBLANK])){
           customField.formulaTreatBlanksAs = 'BlankAsZero';
       }else{
           customField.formulaTreatBlanksAs = 'BlankAsBlank';
       }
       return customField;
    }
    
    // @8aug changed
     /*
     * Method for creating Summary field
     */
    public static MetaData_CBA.CustomField createSummaryField(List<String>fieldDataList, MetaData_CBA.CustomField customField)
    {   
        customField.type_x =  'Summary';
        customField.summaryOperation = fieldDataList[ROLLUPTYPE].trim();
        if( !customField.summaryOperation.equalsignorecase('Count')){
            customField.summarizedField =  fieldDataList[SUMOBJ].trim() + '.' + fieldDataList[FIELDTOAGG].trim() ;
        }
       /* customField.summaryFilterItems = new list<MetaData_CBA.FilterItem>();
        MetaData_CBA.FilterItem fI1 = new MetaData_CBA.FilterItem();
        fI1.field = 'ChildObject__c.cost__c';
        fI1.operation = 'lessOrEqual';
        fI1.value = '10';
        customField.summaryFilterItems.add(fI1);
        */
        customField.summaryForeignKey =  fieldDataList[SUMOBJ].trim() + '.' + fieldDataList[REFNAME].trim();  
        
       return customField;
    }
    // @8aug changed
    
    /*
    * Method to insert or update Fields in a Object.
    */
  /*  public static Boolean insertUpdateFields(List<MetaData_CBA.CustomField> listOfFields, Boolean isInsert){
        Integer count=0;
        Integer numOfUpdates=1;
        List<MetaData_CBA.CustomField> listofFieldsBrk = new List<MetaData_CBA.CustomField>();
        List<List<MetaData_CBA.CustomField>> finalList = new List<List<MetaData_CBA.CustomField>>();
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        
        try{       
            //System.debug('number of fields:'+listOfFields.size());
            for(MetaData_CBA.CustomField c:listOfFields){
                System.debug('*******************************Count***************'+count);
                listofFieldsBrk.add(c);
                System.debug('FieldName-'+c.fullName);
                count++; 
                
                if(count == 10){
                    finalList.add(listofFieldsBrk);
                    count=0;
                    listofFieldsBrk = new List<MetaData_CBA.CustomField>();
                }
            }
            if(count<10 && count>0){
                finalList.add(listofFieldsBrk);
            }
            for(List<MetaData_CBA.CustomField> ls:finalList){
                if(isInsert){
                    //System.debug('Inserting');
                    if(!Test.isRunningTest()){
                        List<MetaData_CBA.SaveResult> results = service.createMetadata(ls);
                        MetaDataAPIUtility_CBA.handleSaveResults(results[0]); 
                    }
                }
                else{
                    //System.debug('Updating');
                    if(! Test.isRunningTest()){
                        List<MetaData_CBA.UpsertResult> results = service.upsertMetadata(ls);
                        MetaDataAPIUtility_CBA.handleUpsertResults(results[0]);
                    }
                }
            }
        }catch(Exception ex){
            System.debug('Exception Occurred while Creating fields:'+ex.getMessage());
            return false;
        }
        
        return true;
    }*/
    /*
    * Method for creating fields based on their respective Data Types.
    */   
    public static MetaData_CBA.CustomField addField(List<String> fieldDataList, MetaData_CBA.CustomField customField){
        if(fieldDataList[TYPE_X].equalsignoreCase('Picklist') || fieldDataList[TYPE_X].equalsignoreCase('Picklist (Multi-Select)'))
        {
            
            customField = createPicklist(fieldDataList,customField);
            //System.debug('Inside picklist');
        }
        else if(fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area'.trim()) || fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area (Long)'.trim()) || 
                fieldDataList[TYPE_X].trim().equalsignoreCase('Text Area (Rich)'.trim())||fieldDataList[TYPE_X].trim().equalsignoreCase('Text(Encrypted)'.trim()))
        {  
            
            customField = createTextAreaField(fieldDataList,customField );
            //System.debug('Inside Text Area');
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Text'))
        {  
            
            customField = createTextField(fieldDataList,customField);
            customField.type_x='Text';
            //System.debug('Inside Text');
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Number') || fieldDataList[TYPE_X].equalsignoreCase('Percent')
                || fieldDataList[TYPE_X].equalsignoreCase('Currency'))
        {
            customField.type_x = fieldDataList[TYPE_X];
            customField = createNumberField(fieldDataList,customField );
            //System.debug('Inside Number Area');
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Auto Number'))
        {  
            
            customField = createAutoNumberField(fieldDataList,customField );
            //System.debug('Inside Auto Number Area');
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Date/Time') || fieldDataList[TYPE_X].equalsignoreCase('Date'))
        {  
            if(fieldDataList[TYPE_X].equalsignoreCase('Date/Time')){
                customField.type_x = 'DateTime';
            }else{
                customField.type_x = 'Date';
            }
            customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
            customField.defaultValue = fieldDataList[DEF];
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('URL') || fieldDataList[TYPE_X].equalsignoreCase('Phone'))
        {
            customField.type_x = fieldDataList[TYPE_X];
            if(fieldDataList[TYPE_X].equalsignoreCase('URL'))
                customField.type_x = 'Url';
            customField.required = Boolean.valueOf(fieldDataList[REQUIRED]);
            customField.defaultValue = '"'+fieldDataList[DEF]+'"';
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Checkbox'))
        {
            customField = createCheckboxField(fieldDataList,customField);
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Email') )
        {
            customField = createEmailField(fieldDataList,customField);
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Lookup Relationship') )
        {
            customField = createLookupField(fieldDataList,customField);
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Master-Detail Relationship') )
        {
            customField = createMasterDetailField(fieldDataList,customField);
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Geolocation') )
        {
            customField = createGeolocationField(fieldDataList,customField);
        }
        else if(fieldDataList[TYPE_X].equalsignoreCase('Formula') )
        {
            customField = createFormulaField(fieldDataList,customField);
        }
        
        else if(fieldDataList[TYPE_X].equalsignoreCase('Summary') ) // @8aug changed
        {
            customField = createSummaryField(fieldDataList,customField);
        } // @8aug changed
        return customField;
    }
    /*
    * Method to insert or update metadata.
    */
    public static Boolean upsertMetadata(List<MetaData_CBA.MetaData> listOfFields){
        Integer count=0;
        Integer numOfUpdates=1;
        List<MetaData_CBA.MetaData> listofFieldsBrk = new List<MetaData_CBA.MetaData>();
        List<List<MetaData_CBA.MetaData>> finalList = new List<List<MetaData_CBA.MetaData>>();
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        
        try{       
            //System.debug('number of fields:'+listOfFields.size());
            for(MetaData_CBA.MetaData c:listOfFields){
                System.debug('******************Count***************'+count);
                listofFieldsBrk.add(c);
                System.debug('FieldName-'+c.fullName);
                count++; 
                if(count == 10){
                    finalList.add(listofFieldsBrk);
                    count=0;
                    listofFieldsBrk = new List<MetaData_CBA.MetaData>();
                }
            }
            if(count<10 && count>0){
                finalList.add(listofFieldsBrk);
            }
            for(List<MetaData_CBA.MetaData> ls:finalList){
               // if(! Test.isRunningTest()){
                    try{
                        List<MetaData_CBA.UpsertResult> results = service.upsertMetadata(ls);
                        MetaDataAPIUtility_CBA.handleUpsertResults(results[0]); 
                    }
                    catch(Exception e){
                        System.debug('Exception Occurred while Creating fields:'+e.getMessage());
                        exceptionMessage.add(e.getMessage());
                    }
                        
                //}
            }
        }catch(Exception ex){
            System.debug('Exception Occurred in upsertMetadata method:'+ex.getMessage());
            exceptionMessage.add(ex.getMessage());
            return false;
        }
        if(exceptionMessage != null && exceptionMessage.size()>0){
            return false;
        }
        return true;
    }
    /*
    * Method to delete Metadata.
    */
    public static Boolean deleteMetadata(String type,List<String> fullNames){
        Integer count=0;
        Integer numOfUpdates=1;
        List<String> listofFieldsBrk = new List<String>();
        List<List<String>> finalList = new List<List<String>>();
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        
        try{       
            //System.debug('number of fields:'+listOfFields.size());
            for(String c: fullNames){
                System.debug('*****************Count***************'+count);
                listofFieldsBrk.add(c);
                count++; 
                
                if(count == 10){
                    finalList.add(listofFieldsBrk);
                    count=0;
                    listofFieldsBrk = new List<String>();
                }
            }
            if(count<10 && count>0){
                finalList.add(listofFieldsBrk);
            }
            for(List<String> ls:finalList){
               // if(! Test.isRunningTest()){
                    try{
                        List<MetaData_CBA.DeleteResult> results = service.deleteMetadata(type,ls);
                        MetaDataAPIUtility_CBA.handleDeleteResults(results[0]);    
                    }catch(Exception e){
                        System.debug('Exception Occurred while deleting fields:'+e.getMessage());
                        exceptionMessage.add(e.getMessage());
                        return false;
                    }
                    
                    
                //}
            }
        }catch(Exception ex){
            System.debug('Exception Occurred in deleteMetadata:'+ex.getMessage());
            exceptionMessage.add(ex.getMessage());
            return false;
        }
        if(exceptionMessage != null && exceptionMessage.size()>0){
            return false;
        }
        return true;
    }
    
    public static List<String> exceptionFormat(Map<String,Integer> fieldExcelMap){
        List<String> exceptionMessageFrmtd = new List<String>();
        for (String fieldName : fieldExcelMap.keySet()){
            System.debug('field name is ' + fieldName);
            for(String msg:exceptionMessage){
                if(msg.indexOf(fieldName) >-1){
                    exceptionMessageFrmtd.add(msg+' in Line#'+fieldExcelMap.get(fieldName));
                }
                
            }
        
        }
        return exceptionMessageFrmtd;
            
    }
    /*public static void addToLayout(String objName, String objLabel, String buttonName)
    {
        String layoutName = objName.remove('__c');
        String name = objName+'-'+layoutName;
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        List<MetaData_CBA.MetaData> metaList = new List<MetaData_CBA.MetaData>();
        // Read the Layout
        MetaData_CBA.Layout layout =
            (MetaData_CBA.Layout) service.readMetadata('Layout',
                new String[] { name }).getRecords()[0];

        // Add the Custom Button to the Layout
        if(layout.customButtons==null)
            layout.customButtons = new List<String>();
        layout.customButtons.add(buttonName);
        system.debug(layout);
        metaList.add(layout);
        // Update the Layout
        upsertMetadata(metaList);
            
    }*/
     
    
}