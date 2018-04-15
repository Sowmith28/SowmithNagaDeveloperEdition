/**
 *  Meta data API utility class to Implement all meta data api
    @Developed by Brajmohan,Sharmistha, Debajyoti
    @Company Cognizant Technical Solution
 *      
 **/
global class MetaDataAPIUtility_CBA {
    final static Integer API_Name = Integer.valueof(system.label.objectAPI);
    final static Integer stats = Integer.valueof(system.label.Action);
    final static Integer label = Integer.valueof(system.label.Object_Label);
    final static Integer pluralLabel = Integer.valueof(system.label.Object_Label_Plural);
    final static Integer description = Integer.valueof(system.label.Object_Description);
    final static Integer fieldLabel = Integer.valueof(system.label.Record_Name);
    
    final static Integer vowel_sound = Integer.valueof(system.label.vowel_sound);
    final static Integer NameFieldType = Integer.valueof(system.label.Record_Name) + 1;
    final static Integer displayformat = Integer.valueof(system.label.Record_Name) + 2;
    final static Integer startingnumber = Integer.valueof(system.label.Record_Name) + 3;
    final static Integer deploymentStatus = Integer.valueof(system.label.Deployment_Status);
   // final static Integer sharingModel = Integer.valueof(system.label.objectAPI);
    final static Integer enableReports = Integer.valueof(system.label.Allow_Reports);
    final static Integer enableActivities = Integer.valueof(system.label.Allow_Activities);
    final static Integer enableHistory = Integer.valueof(system.label.Track_Field_History);
    final static Integer allowInChatterGroups = Integer.valueof(system.label.Allow_in_Chatter_Groups);
    final static Integer enableSharing = Integer.valueof(system.label.Allow_Sharing);
    final static Integer enableBulkApi = Integer.valueof(system.label.Allow_Bulk_API_Access);
    final static Integer enableStreamingApi = Integer.valueof(system.label.Allow_Streaming_API_Access);
    final static Integer enableSearch = Integer.valueof(system.label.Allow_Search);
    final static Integer Default_Tab = Integer.valueof(system.label.Default_Tab);
    
    public List<Sobject> acclist{get;set;}
    public static Integer lnumber = 0;
    public Static integer default_field = 0;
    
    static List<String> exceptionMessage = new List<String>();
    
    public static string managepagelayoutAssignment(string objectName,list<string> inputlist){
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        map<integer,string> rtmap = new map<integer,string>();
        boolean fl = true;
        for(string line : inputlist){
            list<string> rtlist = new list<string>();
            rtlist = line.split(',');
            if(fl){
                if(rtlist.size() > 2){
                    for(integer num = 2; num < rtlist.size() ; num++ ){
                        rtmap.put(num-1,apiformat(rtlist[num]));    
                    }
                }
                fl = false;
            }
            else{
                if(rtlist[0].equalsignorecase(system.label.Upsert)){
                    MetaData_CBA.Profile prf = new MetaData_CBA.Profile();
                    prf.fullName = rtlist[1] != 'System Administrator' ? rtlist[1] : 'Admin' ;
                    prf.layoutAssignments = new list<MetaData_CBA.ProfileLayoutAssignment>();
                    for(integer num = 2; num < rtlist.size() ; num++){
                        if(rtlist[num] == '' || rtlist[num] == null)
                            break;
                        MetaData_CBA.ProfileLayoutAssignment pla = new MetaData_CBA.ProfileLayoutAssignment();
                        pla.layout = objectName+'-'+rtlist[num];
                        pla.recordType = objectName+'.'+rtmap.get(num-1);
                        prf.layoutAssignments.add(pla);
                    }
                    metadatalist.add(prf);  
                }
            }
            
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put( 'success',new list<string>{ system.label.final } ); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    }
    
    public static string createprofiles(string prof){
        
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        MetaData_CBA.Profile profile = metadatautility_profile.createProfile(prof) ;
        if( profile != null){
            metadatalist.add(profile );
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put('success',new list<string>{system.label.final}); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    }
    
    public static string createListviews(string objectName,list<string> inputlist){
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        
        for(string listv : inputlist){
            MetaData_CBA.ListView lv = createListView(objectName,listv); 
            if(lv != null)
                metadatalist.add(lv);
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put('success',new list<string>{system.label.final}); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    }
    
    public static MetaData_CBA.ListView createListView(string objname,string lvl){
        list<string> inputlist = metadatautility2.formatString(lvl).split(',');
        
        If(inputlist[0].equalsignorecase(system.label.Upsert) ){
            MetaData_CBA.ListView listView = new MetaData_CBA.ListView();
            listView.fullName = objname+'.'+apiformat(inputlist[Integer.valueof(system.label.ObjectAPI)]);
            listView.label = inputlist[Integer.valueof(system.label.label)];
            listView.filterScope = inputlist[Integer.valueof(system.label.Filter_Scope)];
            listView.columns = inputlist[Integer.valueof(system.label.Column_Names_API)].split(';');
            if(inputlist.size() > Integer.valueof(system.label.Filter) && inputlist[Integer.valueof(system.label.Filter)] != null){
                listView.booleanFilter = inputlist[Integer.valueof(system.label.Filter)]; 
                listView.filters = new list<MetaData_CBA.ListViewFilter>();
                integer cell = Integer.valueof(system.label.Filter) +1;
                for(integer cl = cell ; cl<inputlist.size() ; cl++){
                    if(inputlist[cl] == '' || inputlist[cl] == NULL ){
                        break;
                    }
                    string fl = inputlist[cl]; 
                    MetaData_CBA.ListViewFilter lvf = new MetaData_CBA.ListViewFilter();
                    lvf.field = fl.split(' ')[0];
                    lvf.operation = fl.split(' ')[1];
                    lvf.value = fl.split(' ')[2];
                    listView.filters.add(lvf);
                }
            }
            return listView;
        }
        else
            return null;
    }
    public static string createValidationrules(string objectName,list<string> inputlist){
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        for(string vdr : inputlist){
            MetaData_CBA.ValidationRule vd = ValidationRule(objectName,vdr); 
            if(vd != null)
                metadatalist.add(vd);
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put('success',new list<string>{system.label.final}); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    }
    public static MetaData_CBA.ValidationRule ValidationRule(string objname,string vdrline){
    
        list<string> inputlist = vdrline.split(',');
        If(inputlist[0].equalsignorecase(system.label.Upsert) ){
            MetaData_CBA.ValidationRule validation = new MetaData_CBA.ValidationRule();
            validation.active = boolean.valueof(inputlist[Integer.valueof(system.label.VDRActive)]);
            validation.description = inputlist[Integer.valueof(system.label.VDRDescription)];
            validation.errorConditionFormula = inputlist[Integer.valueof(system.label.VDR_Error_formula)];
            if(!inputlist[Integer.valueof(system.label.VDR_Error_Location)].equalsignorecase('top'))
                validation.errorDisplayField = objname+'.'+inputlist[Integer.valueof(system.label.VDR_Error_Location)];
            validation.errorMessage = inputlist[Integer.valueof(system.label.VDR_Error_Message)];
            validation.fullName = objname+'.'+apiFormat(inputlist[Integer.valueof(system.label.Label)]);
           
            return validation;
        }
        else 
            return null;
    }
    public static string createrecordtypes(string objectName,list<string> inputlist){
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        for(string rtype : inputlist){
            MetaData_CBA.RecordType rt = createRecordType(objectName,rtype); 
            if(rt != null)
                metadatalist.add(rt);
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put('success',new list<string>{system.label.final}); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    }
    public static MetaData_CBA.RecordType createRecordType(String objName,String input){
        list<string> inputlist = input.split(',');
        
        If(inputlist[0].equalsignorecase(system.label.Upsert) ){
            string name = apiFormat(inputlist[Integer.valueof(system.label.ObjectAPI)]);
            MetaData_CBA.RecordType recordType = new MetaData_CBA.RecordType();
            recordType.active = boolean.valueof(inputlist[Integer.valueof(system.label.RActive)]);
            recordType.fullName = objName+'.'+name;
            recordType.label = inputlist[Integer.valueof(system.label.Label)];
            recordType.businessProcess = null;
            recordType.description = inputlist[Integer.valueof(system.label.RDescription)];
            if(!inputlist[Integer.valueof(system.label.Compact_Layout_Assignment)].equalsignorecase('none'))
                recordType.compactLayoutAssignment = inputlist[Integer.valueof(system.label.Compact_Layout_Assignment)];
            return recordType;
        }
        return null;
        
    }
    
    
        
    public static string getmasktype(string tname){
        return [select value__c from MaskType__mdt where label =: tname limit 1 ].Value__c;
    }
    public static MetaData_CBA.WebLink createbutton(string objname,string buttoninfo)
    {
        //MetaDataAPIUtility_CBA.MetadataPort service = createService();

        // Create Button
        list<string> buttoninfos = buttoninfo.split(',');
        MetaData_CBA.WebLink webLink = new MetaData_CBA.WebLink();
        webLink.fullName = objname+'.'+buttoninfos[Integer.valueof(system.label.Field_Name)];
        if(webLink.fullName.equals('New')|| webLink.fullName.equals('View') || webLink.fullName.equals('List') || 
           webLink.fullName.equals('Edit') || webLink.fullName.equals('Delete') || webLink.fullName.equals('Clone') || webLink.fullName.equals('Accept')){
            // code will be here
        webLink.availability = 'online';
        webLink.displayType = 'button';
        webLink.encodingKey = 'UTF-8';
        webLink.hasMenubar = false;
        webLink.hasScrollbars = true;
        webLink.hasToolbar = false;
        webLink.height = 600;
        webLink.isResizable = true;
        webLink.linkType = 'page';
        webLink.masterLabel = buttoninfos[Integer.valueof(system.label.label)];
        webLink.openType = 'newWindow';
        webLink.page_x = buttoninfos[Integer.valueof(system.label.URL)];//'page5';
        webLink.position = 'none';
        webLink.protected_x = false;
        webLink.showsLocation = false;
        webLink.showsStatus = false;
        webLink.url = buttoninfos[Integer.valueof(system.label.URL)];
        webLink.width = 600;   
        }//if standarad button override
        else{
        webLink.availability = 'online';
        webLink.displayType = buttoninfos[Integer.valueof(system.label.Display_Type)];
        webLink.encodingKey = 'UTF-8';
        if((buttoninfos[Integer.valueof(system.label.Content_Source)]).equals('URL')){
        webLink.hasMenubar = false;
        webLink.hasScrollbars = true;
        webLink.hasToolbar = false;
        webLink.height = 600;
        webLink.isResizable = true;
        webLink.linkType = 'url';
        webLink.masterLabel = buttoninfos[Integer.valueof(system.label.label)];
        webLink.openType = 'newWindow';
        webLink.position = 'none';
        webLink.protected_x = false;
        webLink.showsLocation = false;
        webLink.showsStatus = false;
        webLink.url = buttoninfos[Integer.valueof(system.label.URL)];
        webLink.width = 600;
        }//if closed
        if((buttoninfos[Integer.valueof(system.label.Content_Source)]).equals('VisualforcePage')){
        webLink.hasMenubar = false;
        webLink.hasScrollbars = true;
        webLink.hasToolbar = false;
        webLink.height = 600;
        webLink.isResizable = true;
        webLink.linkType = 'page';
        webLink.masterLabel = buttoninfos[Integer.valueof(system.label.label)];
        webLink.openType = 'newWindow';
        webLink.page_x = buttoninfos[Integer.valueof(system.label.URL)];//'page5';
        webLink.position = 'none';
        webLink.protected_x = false;
        webLink.showsLocation = false;
        webLink.showsStatus = false;
        webLink.url = buttoninfos[Integer.valueof(system.label.URL)];
        webLink.width = 600;   
        }//if closed
        if((buttoninfos[Integer.valueof(system.label.Content_Source)]).equals('OnClickJavaScript')){
         //webLink.hasMenubar = false;
        //webLink.hasScrollbars = true;
        //webLink.hasToolbar = false;
        //webLink.height = 600;
        //webLink.isResizable = true;
        webLink.linkType = 'javascript';
        webLink.masterLabel = buttoninfos[Integer.valueof(system.label.label)];
        webLink.openType = 'onClickJavaScript';
        //webLink.page_x = buttoninfos[Integer.valueof(system.label.URL)];//'page5';
        //webLink.position = 'none';
        webLink.protected_x = false;
        //webLink.showsLocation = false;
        //webLink.showsStatus = false;
        webLink.url = buttoninfos[Integer.valueof(system.label.URL)];
        //webLink.width = 600;   
        }//if closed
        /*handleSaveResults(
            service.createMetadata(
                new List<MetadataService.Metadata> { webLink })[0]);
        */
        // Read the Layout
       /* MetadataService.Layout layout =
            (MetadataService.Layout) service.readMetadata('Layout',
                new String[] { 'Test__c-Test Layout' }).getRecords()[0];

        // Add the Custom Button to the Layout
        if(layout.customButtons==null)
            layout.customButtons = new List<String>();
        layout.customButtons.add('googleButton');
        system.debug(layout);
        // Update the Layout
        handleSaveResults(
            service.updateMetadata(
                new MetadataService.Metadata[] { layout })[0]);
        */
        }//else(custom button main)
        return webLink;
    }
    public static string createButtonLink(String objectName, list<String> buttonlist){
        list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();
        map<string,list<string>> retmap = new map<string,list<string>>();
        metadatautility2.exceptionMessage = new list<string>();
        for(string button : buttonlist){
            MetaData_CBA.WebLink webLink = createbutton(objectName,button); 
            if(webLink != null)
                metadatalist.add(webLink);
        }
        if(!metadatalist.isempty()){
            if(metadatautility2.upsertMetadata(metadatalist)){
                retmap.put('success',new list<string>{system.label.final}); 
            } 
            else{
                retmap.put('exception',metadatautility2.exceptionMessage);  
            }
               
        }
        return json.serialize(retmap);
    
    }
    public static MetaData_CBA.CustomTab createCustomTab(string objectname){
       
        MetaData_CBA.CustomTab customtab = new  MetaData_CBA.CustomTab();
        customtab.customObject = true;
        customtab.hasSidebar = true;
        customtab.mobileReady = true;
        customtab.motif = 'Custom24:Building';
        customtab.fullName = objectname;
        return customtab;
    }
    
    public static string createObject(list<String> Sobjectlist){
        map<string,list<string>> retmap = new map<string,list<string>>();
        string objname ='';
        try{
            list<MetaData_CBA.Metadata> metadatalist =  new list<MetaData_CBA.Metadata>();     
            for(Integer i=0;i<Sobjectlist.size();i++){  
                system.debug('Row Number'+i+'=>'+Sobjectlist[i]);
                MetaData_CBA.CustomObject customObject = new MetaData_CBA.CustomObject();
                list<String> csvRecordData = metadatautility2.formatString(Sobjectlist[i]).split(',');
                system.debug('Final Object==>'+Sobjectlist.size());
                system.debug('Final Object==>'+csvRecordData);
                if(csvRecordData.size() > 1 && !csvRecordData[0].equalsignoreCase(system.label.Do_Nothing)){
                    customObject.fullName = csvRecordData[API_Name];
                    //customObject.fullName = apiFormat(customObject.fullName);    //api_name converting in proper format
                    objname = customObject.fullName;
                   // initialpagecontroller4.objectname = customObject.fullName;
                    customObject.label = csvRecordData[label];
                    customObject.pluralLabel = csvRecordData[pluralLabel];
                    customObject.description = csvRecordData[description];
                    customObject.nameField = new MetaData_CBA.CustomField();
                    customObject.nameField.label = csvRecordData[fieldLabel];
                    customObject.nameField.type_x = csvRecordData[NameFieldType].deleteWhitespace();
                    if(csvRecordData[NameFieldType].deleteWhitespace() !='Text' && csvRecordData[NameFieldType].deleteWhitespace() == 'AutoNumber'){
                        customObject.nameField.displayFormat = csvRecordData[displayformat];
                        customObject.nameField.startingNumber = integer.valueOf(csvRecordData[startingnumber]);
                    }//field type check it allow only given type
                    customObject.startsWith = Boolean.valueOf(csvRecordData[vowel_sound]) ? 'Vowel':'';
                    customObject.deploymentStatus = csvRecordData[deploymentStatus];
                    customObject.sharingModel = 'ReadWrite';//csvRecordData[sharingModel];
                    customObject.enableReports = Boolean.valueOf(csvRecordData[enableReports]);    
                    customObject.enableActivities = Boolean.valueOf(csvRecordData[enableActivities]);
                    customObject.enableHistory = Boolean.valueOf(csvRecordData[enableHistory]);
                    customObject.allowInChatterGroups = Boolean.valueOf(csvRecordData[allowInChatterGroups]); 
                    customObject.enableSharing = Boolean.valueOf(csvRecordData[enableSharing]); 
                    customObject.enableBulkApi= Boolean.valueOf(csvRecordData[enableBulkApi]);
                    customObject.enableStreamingApi = Boolean.valueOf(csvRecordData[enableStreamingApi]);
                    customObject.enableSearch = Boolean.valueOf(csvRecordData[enableSearch]);
                    system.debug('Final Object==>'+customObject);
                    metadatalist.add(customObject);
                    if(Boolean.valueOf(csvRecordData[Default_Tab])){
                        MetaData_CBA.CustomTab ct = createCustomTab(customObject.fullName);
                        metadatalist.add(ct);   
                    }
                    
                }
            }
            if(!metadatalist.isempty()){
                if(metadatautility2.upsertMetadata(metadatalist)){
                    retmap.put('success',new list<string>{system.label.final}); 
                } 
                else{
                    retmap.put('exception',metadatautility2.exceptionMessage);  
                }
                   
            }
        }
        catch(exception e){
            retmap.put('exception',new list<string>{objname,e.getmessage()});   
        }
        if(retmap.isempty()){
            retmap.put('success',new list<string>{objname,system.label.final});
            //retmap.put('ObjectName',new list<string>{objname});
        }
        return json.serialize(retmap);
    }
    //api_name conversion in proper format
    public static string apiFormat(String fullName){
              system.debug('return from api validate check method first');
              string apiname=fullName.replaceAll('[^a-zA-Z0-9_]','_');
              apiname=replace_us(apiname);
             // apiname=apiname.replaceAll('(_)*c+', '__c');
              apiname = apiname.removeEnd('_');
              apiname = apiname.removeStart('_');
              system.debug(apiname+'return from api validate check method');
              return apiname;
           } //api_name conversion in proper format
        
    //Replace more than one underscore with single underscore
    public static string replace_us(string s){
        if(s.contains('__')){
          s = s.replaceall('__','_');
        }
        if(s.contains('__')){
           s = replace_us(s);
        }
        return s;
    }
    public static MetaData_CBA.MetadataPort createService()
    {
        MetaData_CBA.MetadataPort service = new MetaData_CBA.MetadataPort();
        service.SessionHeader = new MetaData_CBA.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
    } 
    //upsert result handler
    public static void handleUpsertResults(MetaData_CBA.UpsertResult upsertResult)
    {
        // Nothing to see?
        if(upsertResult==null || upsertResult.success)
            return;
        // Construct error message and throw an exception
        if(upsertResult.errors!=null)
        {
            List<String> messages = new List<String>();
            messages.add(
                (upsertResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                    'occured processing component ' + upsertResult.fullName + '.');
            for(MetaData_CBA.Error error : upsertResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' +
                    ( error.fields!=null && error.fields.size()>0 ?
                        ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetaDataServiceUtilityException(String.join(messages, ' '));
        }
        if(!upsertResult.success)
            throw new MetaDataServiceUtilityException('Request failed with no specified error.');
    }
    public class MetaDataServiceUtilityException extends Exception { }
    public static void handleDeleteResults(MetaData_CBA.DeleteResult deleteResult){
        // Nothing to see?
        if(deleteResult==null || deleteResult.success)
            return;
        // Construct error message and throw an exception
        if(deleteResult.errors!=null)
        {
            List<String> messages = new List<String>();
            messages.add(
                (deleteResult.errors.size()==1 ? 'Error ' : 'Errors ') +
                    'occured processing component ' + deleteResult.fullName + '.');
            for(MetaData_CBA.Error error : deleteResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' +
                    ( error.fields!=null && error.fields.size()>0 ?
                        ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetaDataServiceUtilityException(String.join(messages, ' '));
        }
        if(!deleteResult.success)
            throw new MetaDataServiceUtilityException('Request failed with no specified error.');
    }
}