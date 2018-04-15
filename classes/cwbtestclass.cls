/*
Object Details, Action,Label,Name ,Plural Label ,Starts with vowel sound,Description,Record Name,Data Type,Display Format,Starting Number,Allow Reports,Allow Activities,Available for Customer Portal,Track Field History,Allow in Chatter Groups,Allow Sharing,Allow Bulk API Access,Allow Streaming API Access,Deployment Status,Allow Search,DefaultTab, 
Upsert,Object Demo,Object1__c,Object Demos,TRUE,Test Des,Name,Text,,,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,Deployed,FALSE,TRUE,
Field Details,
Action,Field Label,Field Name,Field Type,Field Length,Decimal Places,Picklist Definition,Sort Option,# Visible Lines,Display Format,Starting Number,Formula Return Type,Formula,Mask Type,Mask Character,Description,Help Text,Required,Unique,Case Insensitive,External ID,Default Value,Blank Field Handling,Related To,Child Relationship Name,Allow Reparenting,Master Object,Summarized Object ,Roll-Up Type,Field to Aggregate,Filter Options,Filter Criteria,Editable,Read only,Visible in Layout,
Upsert,Active,Active__c,Picklist,255,0,"No, Yes",Use first value as default value,3,,,,,None,None,Active,Active,FALSE,FALSE,FALSE,,No,,,,,,,,,,,"System Administrator,SFDCTrainer100",Sales Profile,TRUE,
Upsert,Deleted,IsDeleted__c,Checkbox,0,0,,Sort values alphabetically,3,,,,,None,None,Deleted,Deleted,FALSE,TRUE,FALSE,,TRUE,,,,,,,,,,,"System Administrator,SFDCTrainer101",Sales Profile,TRUE,
Upsert,Employees,NumberOfEmployees__c,Number,0,"5,2",,Sort values alphabetically,3,,,,,None,None,Employees,Employees,FALSE,TRUE,FALSE,,100,,,,,,,,,,,"System Administrator,SFDCTrainer102",,TRUE,
Upsert,Formula 1,formula_1__c,Formula,,,,Sort values alphabetically,,,,Checkbox,TODAY()>SLAExpirationDate__c,None,None,formula_1__c,formula_1__c,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer103",Sales Profile,TRUE,
Upsert,Formula 2,formula_2__c,Formula,,"7,2",,Sort values alphabetically,,,,Currency,Shipping_Price__c*Shipping_Profit__c,None,None,formula_2__c,formula_2__c,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer104",Sales Profile,TRUE,
Upsert,Formula 3,formula_3__c,Formula,,,,Sort values alphabetically,,,,Date,SLAExpirationDate__c-7,None,None,formula_3__c,formula_3__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer105",Sales Profile,TRUE,
Upsert,Formula 4,formula_4__c,Formula,,"6,2",,Sort values alphabetically,,,,Number,NumberofLocations__c*10,None,None,formula_4__c,formula_4__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer106",Sales Profile,TRUE,
Upsert,Formula 5,formula_5__c,Formula,,"2,2",,Sort values alphabetically,,,,Percent,Shipping_Profit__c*1,None,None,formula_5__c,formula_5__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,,Sales Profile,TRUE,
Upsert,Formula 6,formula_6__c,Formula,,,,Sort values alphabetically,,,,Text,ShippingState__c+' '+SLASerialNumber__c,None,None,formula_6__c,formula_6__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer108",Sales Profile,TRUE,
Upsert,Generated Shipping Number,GenShippingNum__c,Auto Number,10,,,Sort values alphabetically,3,S-{0000},1,,,None,None,Generated Shipping Number,Generated Shipping Number,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer109",Sales Profile,TRUE,
Upsert,Industry,Industry__c,Picklist (Multi-Select),40,0,"Agriculture, Apparel, Banking, Biotechnology, Chemicals, Communications, Construction, Consulting, Education, Electronics, Energy, Engineering, Entertainment, Environmental, Finance, Food & Beverage, Government, Healthcare, Hospitality, Insurance, Machinery, Manufacturing, Media, Not For Profit, Recreation, Retail, Shipping, Technology, Telecommunications, Transportation, Utilities, Other",Sort values alphabetically,3,,,,,None,None,Industry,Industry,FALSE,TRUE,FALSE,,Agriculture,,,,,,,,,,,"System Administrator,SFDCTrainer110",Sales Profile,TRUE,
Upsert,Number of Locations,NumberofLocations__c,Number,0,"4,2",,Sort values alphabetically,3,,,,,None,None,Number of Locations,Number of Locations,FALSE,TRUE,FALSE,,23,,,,,,,,,,,"System Administrator,SFDCTrainer111",Sales Profile,TRUE,
Upsert,Phone Number,PhoneNum__c,Phone,,,,Sort values alphabetically,3,,,,,None,None,Phone Number,Phone Number,FALSE,TRUE,FALSE,,"""12232354456""",,,,,,,,,,,"System Administrator,SFDCTrainer112",Sales Profile,TRUE,
Upsert,Shipping City,ShippingCity__c,Text,40,0,,Use first value as default value,3,,,,,None,None,Shipping City,Shipping City,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer113",Sales Profile,TRUE,
Upsert,Shipping Country,ShippingCountry__c,Text,80,0,,Use first value as default value,3,,,,,None,None,Shipping Country,Shipping Country,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer114",Sales Profile,TRUE,
Upsert,Shipping Email,Shipping_Email__c,Email,,,,Sort values alphabetically,3,,,,,None,None,Shipping Email,Shipping Email,FALSE,TRUE,FALSE,,sdsd@df.com,,,,,,,,,,,,,TRUE,
Upsert,Shipping Location,Shipping_location__c,Geolocation,5,5,,Sort values alphabetically,3,,,,,None,None,Shipping Location,dfdfdf,FALSE,TRUE,FALSE,,,,,,,,,,FALSE,,,"System Administrator,SFDCTrainer116",Sales Profile,TRUE,
Upsert,Shipping Password,Shipping_password__c,Text(Encrypted),10,,,Sort values alphabetically,3,,,,,Credit Card Number,asterisk,Shipping Password,,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer117",Sales Profile,TRUE,
Upsert,Shipping Price ,Shipping_Price__c,Currency,,"12,2",,Sort values alphabetically,3,,,,,None,None,Shipping Price ,Shipping Price ,FALSE,FALSE,FALSE,,56,,,,,,,,,,,"System Administrator,SFDCTrainer118",Sales Profile,TRUE,
Upsert,Shipping Profit,Shipping_Profit__c,Percent,,"12,2",,Sort values alphabetically,3,,,,,None,None,Shipping Profit,Shipping Profit,FALSE,FALSE,FALSE,,1,,,,,,,,,,,"System Administrator,SFDCTrainer119",,TRUE,
Upsert,Shipping Registration Date,Shipping_Reg_Date__c,Formula,,,,Sort values alphabetically,3,,,DateTime,now(),None,None,Shipping Registration Date,sdfdfdf,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer120",Sales Profile,TRUE,
Upsert,Shipping Rich Text,Shipping_richtext__c,Text Area (Rich),35000,,,Sort values alphabetically,11,,,,,None,None,Shipping Rich Text,,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer121",Sales Profile,TRUE,
Upsert,Shipping State/Province,ShippingState__c,Text,80,0,,Sort values alphabetically,3,,,,,None,None,Shipping State/Province,Shipping State/Province,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer122",Sales Profile,TRUE,
Upsert,Shipping Street,ShippingStreet__c,Text Area (Long),700,0,,Sort values alphabetically,3,,,,,None,None,Shipping Street,Shipping Street,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer123",Sales Profile,TRUE,
Upsert,Shipping Test,Shipping_Test__c,Master-Detail Relationship,,,,Sort values alphabetically,3,,,,,None,None,Shipping Test,Shipping Test,FALSE,TRUE,FALSE,,,,ParentTest__c,ParentTest,TRUE,,,,,,,"System Administrator,SFDCTrainer124",Sales Profile,TRUE,
Upsert,Shipping URL,Shipping_URL__c,Url,,,,Sort values alphabetically,3,,,,,None,None,Shipping URL,Shipping URL,FALSE,TRUE,FALSE,,"""yahoo.com""",,,,,,,,,,,"System Administrator,SFDCTrainer125",Sales Profile,TRUE,
Upsert,Shipping user,Shipping_User__c,Lookup Relationship,,,,Sort values alphabetically,3,,,,,None,None,Shipping user,Shipping user,FALSE,TRUE,FALSE,,,,DemoUser__c,ShippingUser,,,,,,,,"System Administrator,SFDCTrainer126",Sales Profile,TRUE,
Upsert,Shipping Zip/Postal Code,ShippingPostalCode__c,Text,20,0,,Sort values alphabetically,3,,,,,None,None,Shipping Zip/Postal Code,Shipping Zip/Postal Code,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer127",Sales Profile,TRUE,
Upsert,Skype name ,Skype4SF_skype_name__c,Text,128,0,,Sort values alphabetically,3,,,,,None,None,Skype name ,Skype name ,FALSE,FALSE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer128",Sales Profile,TRUE,,,,,,,,,,,,, Upsert,SLA,SLA__c,Picklist,255,0,"A, B, C",Sort values alphabetically,3,,,,,None,None,SLA,SLA,FALSE,FALSE,FALSE,,Gold,,,,,,,,,,,"System Administrator,SFDCTrainer129",Sales Profile,TRUE,
Upsert,SLA Expiration Date,SLAExpirationDate__c,Date,0,0,,Sort values alphabetically,3,,,,,None,None,SLA Expiration Date,SLA Expiration Date,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer130",Sales Profile,TRUE,,,,,,,,,,,,, Upsert,SLA Serial Number,SLASerialNumber__c,Text,10,0,,Use first value as default value,3,,,,,None,None,SLA Serial Number,SLA Serial Number,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer131",Sales Profile,TRUE,
Upsert,Upsell Opportunity ,UpsellOpportunity__c,Picklist,255,0,"Maybe, No, Yes",Sort values alphabetically,3,,,,,None,None,Upsell Opportunity ,Upsell Opportunity ,FALSE,FALSE,FALSE,,maybe,,,,,,,,,,,"System Administrator,SFDCTrainer132",Sales Profile,TRUE,
Custom Button and Web Link,,
Action,Label,Name,Display Type,URL,Add To default Layout,
Upsert,Google,Google,button,http://www.google.com,TRUE,
Managed Record Type,
Action,Label,Name,Active,Description,Compact Layout Assignment,
Upsert,Record Type 1,RecordType1,TRUE,Test,None,
Upsert,Record Type 2,RecordType2,TRUE,Test 2,None,
Managed Validation Rule,
Action,Rule Name,Active,Description,Error Condition Formula,Error Message,Error Location,
Upsert,Validation rule 1,TRUE,Test,CreatedDate = NULL,Error Message,Top,
Managed List View,
Action,Label,Name,Filter Scope,Column Names(API),Filter,1,2,
Upsert,All Records,All,Everything,"Active__c,Skype4SF_skype_name__c",(1 or 2),Active__c equals Yes,Active__c equals No,
Page Layout Assignment,
Action,,Record Type 1,Reord Type 2,
Upsert,Profile 1,Page layout 1,Page Layout 2,
Upsert,Profile 2,Page layout 2,Page Layout 1,


Profile Details,
Action,Profile Name (API Name),Description,Custom,User License,
Upsert,SFDCTrainer100,SFDCTrainer,TRUE,Salesforce,
App Settings - Details,
Action,Application Name(Custom),Default,Visible,
Upsert,Configuration_Work_Book,TRUE,TRUE,
Tab Settings - Details,
Action,Tab Name(Custom),Visibility,
Upsert,Initial_Page_2,DefaultOn,
Field Level Security - Details,
Action,Field Name,Read Access,Edit Access,
Upsert,Do_Not_Delete__c.Do_Not_Delete__c,TRUE,TRUE,




Actions,FieldTypes,Visibility,truefalse,Filter Scope,MaskChars,DisplayType,FormulaReturnType Upsert,Auto Number,DefaultOn,TRUE,Everything,None,button,Checkbox Upsert,Formula,DefaultOff,FALSE,Mine,asterisk,,Currency Delete,Lookup Relationship,Hidden,,Team,X,,Date ,Master-Detail Relationship,,,,,,Date/Time ,Checkbox,,,,,,Number ,Currency,,,,,,Percent ,Date,,,,,,Text ,Date/Time,,,,,, ,Email,,,,,, ,Geolocation,,,,,, ,Number,,,,,, ,Percent,,,,,, ,Phone,,,,,, ,Picklist,,,,,, ,
Picklist(Multi-Select),,,,,, ,Text,,,,,, ,Text Area,,,,,, ,Text Area (Long),,,,,, ,Text Area (Rich),,,,,, ,Text(Encrypted),,,,,, ,URL,,,,,, Action,Field Type,Deployment Status Create,Auto Number,In Development Update,Formula,Deployed ,Lookup Relationship,Mask Type ,Master-Detail Relationship,None ,External Lookup Relationship,Mask All Characters ,Checkbox,Last Four Characters Clear ,Currency,Credit Card Number ,Date,National Insurance Number ,Date/Time,Social Security Number ,
Email,Social Insurance Number ,Geolocation, ,Number, ,Percent, ,Phone, ,Picklist, ,Picklist (Multi-Select), ,Text, ,Text Area, ,Text Area (Long), ,Text Area (Rich), ,Text (Encrypted), ,URL,
*/
@isTest
public class cwbtestclass{
    static testMethod void testmetnod1(){
        list<string> sheets = new list<string>();
        string str = 'Object Details, Action,Label,Name ,Plural Label ,Starts with vowel sound,Description,Record Name,Data Type,Display Format,Starting Number,Allow Reports,Allow Activities,Available for Customer Portal,Track Field History,Allow in Chatter Groups,Allow Sharing,Allow Bulk API Access,Allow Streaming API Access,Deployment Status,Allow Search,DefaultTab,';
        str += '\n'+ 'Upsert,Object Demo,Object1__c,Object Demos,TRUE,Test Des,Name,Text,,,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,Deployed,FALSE,TRUE,';
        str += '\n'+ 'Field Details,';
        str += '\n'+ 'Action,Field Label,Field Name,Field Type,Field Length,Decimal Places,Picklist Definition,Sort Option,# Visible Lines,Display Format,Starting Number,Formula Return Type,Formula,Mask Type,Mask Character,Description,Help Text,Required,Unique,Case Insensitive,External ID,Default Value,Blank Field Handling,Related To,Child Relationship Name,Allow Reparenting,Master Object,Summarized Object ,Roll-Up Type,Field to Aggregate,Filter Options,Filter Criteria,Editable,Read only,Visible in Layout,';
        str += '\n'+ 'Upsert,Active,Active__c,Picklist,255,0,"No, Yes",Use first value as default value,3,,,,,None,None,Active,Active,FALSE,FALSE,FALSE,,No,,,,,,,,,,,"System Administrator,SFDCTrainer100",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Deleted,IsDeleted__c,Checkbox,0,0,,Sort values alphabetically,3,,,,,None,None,Deleted,Deleted,FALSE,TRUE,FALSE,,TRUE,,,,,,,,,,,"System Administrator,SFDCTrainer101",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Employees,NumberOfEmployees__c,Number,0,"5,2",,Sort values alphabetically,3,,,,,None,None,Employees,Employees,FALSE,TRUE,FALSE,,100,,,,,,,,,,,"System Administrator,SFDCTrainer102",,TRUE,';
        str += '\n'+ 'Upsert,Formula 1,formula_1__c,Formula,,,,Sort values alphabetically,,,,Checkbox,TODAY()>SLAExpirationDate__c,None,None,formula_1__c,formula_1__c,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer103",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Formula 2,formula_2__c,Formula,,"7,2",,Sort values alphabetically,,,,Currency,Shipping_Price__c*Shipping_Profit__c,None,None,formula_2__c,formula_2__c,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer104",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Formula 3,formula_3__c,Formula,,,,Sort values alphabetically,,,,Date,SLAExpirationDate__c-7,None,None,formula_3__c,formula_3__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer105",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Formula 4,formula_4__c,Formula,,"6,2",,Sort values alphabetically,,,,Number,NumberofLocations__c*10,None,None,formula_4__c,formula_4__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer106",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Formula 5,formula_5__c,Formula,,"2,2",,Sort values alphabetically,,,,Percent,Shipping_Profit__c*1,None,None,formula_5__c,formula_5__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,,Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Formula 6,formula_6__c,Formula,,,,Sort values alphabetically,,,,Text,ShippingState__c+\' \'+SLASerialNumber__c,None,None,formula_6__c,formula_6__c,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer108",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Generated Shipping Number,GenShippingNum__c,Auto Number,10,,,Sort values alphabetically,3,S-{0000},1,,,None,None,Generated Shipping Number,Generated Shipping Number,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer109",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Industry,Industry__c,Picklist (Multi-Select),40,0,"Agriculture, Apparel, Banking, Biotechnology, Chemicals, Communications, Construction, Consulting, Education, Electronics, Energy, Engineering, Entertainment, Environmental, Finance, Food & Beverage, Government, Healthcare, Hospitality, Insurance, Machinery, Manufacturing, Media, Not For Profit, Recreation, Retail, Shipping, Technology, Telecommunications, Transportation, Utilities, Other",Sort values alphabetically,3,,,,,None,None,Industry,Industry,FALSE,TRUE,FALSE,,Agriculture,,,,,,,,,,,"System Administrator,SFDCTrainer110",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Number of Locations,NumberofLocations__c,Number,0,"4,2",,Sort values alphabetically,3,,,,,None,None,Number of Locations,Number of Locations,FALSE,TRUE,FALSE,,23,,,,,,,,,,,"System Administrator,SFDCTrainer111",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Phone Number,PhoneNum__c,Phone,,,,Sort values alphabetically,3,,,,,None,None,Phone Number,Phone Number,FALSE,TRUE,FALSE,,"""12232354456""",,,,,,,,,,,"System Administrator,SFDCTrainer112",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping City,ShippingCity__c,Text,40,0,,Use first value as default value,3,,,,,None,None,Shipping City,Shipping City,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer113",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Country,ShippingCountry__c,Text,80,0,,Use first value as default value,3,,,,,None,None,Shipping Country,Shipping Country,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer114",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Email,Shipping_Email__c,Email,,,,Sort values alphabetically,3,,,,,None,None,Shipping Email,Shipping Email,FALSE,TRUE,FALSE,,sdsd@df.com,,,,,,,,,,,,,TRUE,';
        str += '\n'+ 'Upsert,Shipping Location,Shipping_location__c,Geolocation,5,5,,Sort values alphabetically,3,,,,,None,None,Shipping Location,dfdfdf,FALSE,TRUE,FALSE,,,,,,,,,,FALSE,,,"System Administrator,SFDCTrainer116",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Password,Shipping_password__c,Text(Encrypted),10,,,Sort values alphabetically,3,,,,,Credit Card Number,asterisk,Shipping Password,,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer117",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Price ,Shipping_Price__c,Currency,,"12,2",,Sort values alphabetically,3,,,,,None,None,Shipping Price ,Shipping Price ,FALSE,FALSE,FALSE,,56,,,,,,,,,,,"System Administrator,SFDCTrainer118",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Profit,Shipping_Profit__c,Percent,,"12,2",,Sort values alphabetically,3,,,,,None,None,Shipping Profit,Shipping Profit,FALSE,FALSE,FALSE,,1,,,,,,,,,,,"System Administrator,SFDCTrainer119",,TRUE,';
        str += '\n'+ 'Upsert,Shipping Registration Date,Shipping_Reg_Date__c,Formula,,,,Sort values alphabetically,3,,,DateTime,now(),None,None,Shipping Registration Date,sdfdfdf,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer120",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Rich Text,Shipping_richtext__c,Text Area (Rich),35000,,,Sort values alphabetically,11,,,,,None,None,Shipping Rich Text,,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer121",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping State/Province,ShippingState__c,Text,80,0,,Sort values alphabetically,3,,,,,None,None,Shipping State/Province,Shipping State/Province,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer122",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Street,ShippingStreet__c,Text Area (Long),700,0,,Sort values alphabetically,3,,,,,None,None,Shipping Street,Shipping Street,FALSE,TRUE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer123",Sales Profile,TRUE,';
        str += '\n'+ 'Delete,Shipping Test,Shipping_Test__c,Master-Detail Relationship,,,,Sort values alphabetically,3,,,,,None,None,Shipping Test,Shipping Test,FALSE,TRUE,FALSE,,,,ParentTest__c,ParentTest,TRUE,,,,,,,"System Administrator,SFDCTrainer124",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Test,Shipping_Test__c,Master-Detail Relationship,,,,Sort values alphabetically,3,,,,,None,None,Shipping Test,Shipping Test,FALSE,TRUE,FALSE,,,,ParentTest__c,ParentTest,TRUE,,,,,,,"System Administrator,SFDCTrainer124",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping URL,Shipping_URL__c,Url,,,,Sort values alphabetically,3,,,,,None,None,Shipping URL,Shipping URL,FALSE,TRUE,FALSE,,"""yahoo.com""",,,,,,,,,,,"System Administrator,SFDCTrainer125",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping user,Shipping_User__c,Lookup Relationship,,,,Sort values alphabetically,3,,,,,None,None,Shipping user,Shipping user,FALSE,TRUE,FALSE,,,,DemoUser__c,ShippingUser,,,,,,,,"System Administrator,SFDCTrainer126",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Shipping Zip/Postal Code,ShippingPostalCode__c,Text,20,0,,Sort values alphabetically,3,,,,,None,None,Shipping Zip/Postal Code,Shipping Zip/Postal Code,FALSE,TRUE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer127",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Skype name ,Skype4SF_skype_name__c,Text,128,0,,Sort values alphabetically,3,,,,,None,None,Skype name ,Skype name ,FALSE,FALSE,TRUE,,,,,,,,,,,,,"System Administrator,SFDCTrainer128",Sales Profile,TRUE,,,,,,,,,,,,, Upsert,SLA,SLA__c,Picklist,255,0,"A, B, C",Sort values alphabetically,3,,,,,None,None,SLA,SLA,FALSE,FALSE,FALSE,,Gold,,,,,,,,,,,"System Administrator,SFDCTrainer129",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,SLA Expiration Date,SLAExpirationDate__c,Date,0,0,,Sort values alphabetically,3,,,,,None,None,SLA Expiration Date,SLA Expiration Date,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer130",Sales Profile,TRUE,,,,,,,,,,,,, Upsert,SLA Serial Number,SLASerialNumber__c,Text,10,0,,Use first value as default value,3,,,,,None,None,SLA Serial Number,SLA Serial Number,FALSE,FALSE,FALSE,,,,,,,,,,,,,"System Administrator,SFDCTrainer131",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Upsell Opportunity ,UpsellOpportunity__c,Picklist,255,0,"Maybe, No, Yes",Sort values alphabetically,3,,,,,None,None,Upsell Opportunity ,Upsell Opportunity ,FALSE,FALSE,FALSE,,maybe,,,,,,,,,,,"System Administrator,SFDCTrainer132",Sales Profile,TRUE,';
        str += '\n'+ 'Upsert,Rollup,RollUp__c,Summary,255,5;0,"No, Yes",Use first value as default value,3,,,Number,,None,None,Active,Active,FALSE,FALSE,FALSE,,No,,,,,,,,,,,"System Administrator,SFDCTrainer100",Sales Profile,TRUE,';
        
        str += '\n'+ 'Custom Button and Web Link,,';
        str += '\n'+ 'Action,Label,Name,Display Type,URL,Add To default Layout,';
        str += '\n'+ 'Upsert,Google,Google,button,http://www.google.com,TRUE,URL,';
        str += '\n'+ 'Upsert,Google,Google,button,http://www.google.com,TRUE,VisualforcePage,';
        str += '\n'+ 'Upsert,Google,Google,button,http://www.google.com,TRUE,OnClickJavaScript,';
        str += '\n'+ 'Upsert,Accept,Accept,massActionButton,page5,TRUE,VisualforcePage';
        str += '\n'+ 'Managed Record Type,';
        str += '\n'+ 'Action,Label,Name,Active,Description,Compact Layout Assignment,';
        str += '\n'+ 'Upsert,Record Type 1,RecordType1,TRUE,Test,None,';
        str += '\n'+ 'Upsert,Record Type 2,RecordType2,TRUE,Test 2,None,';
        str += '\n'+ 'Managed Validation Rule,';
        str += '\n'+ 'Action,Rule Name,Active,Description,Error Condition Formula,Error Message,Error Location,';
        str += '\n'+ 'Upsert,Validation rule 1,TRUE,Test,CreatedDate = NULL,Error Message,Top,';
        str += '\n'+ 'Managed List View,';
        str += '\n'+ 'Action,Label,Name,Filter Scope,Column Names(API),Filter,1,2,';
        str += '\n'+ 'Upsert,All Records,All,Everything,"Active__c,Skype4SF_skype_name__c",(1 or 2),Active__c equals Yes,Active__c equals No,';
        str += '\n'+ 'Page Layout Assignment,';
        str += '\n'+ 'Action,,Record Type 1,Reord Type 2,';
        str += '\n'+ 'Upsert,Profile 1,Page layout 1,Page Layout 2,';
        str += '\n'+ 'Upsert,Profile 2,Page layout 2,Page Layout 1,';
        sheets.add(str);
        
        str = 'Profile Details,';        
        str += '\n'+ 'Action,Profile Name (API Name),Description,Custom,User License,';
        str += '\n'+ 'Upsert,SFDCTrainer100,SFDCTrainer,TRUE,Salesforce,';
        str += '\n'+ 'App Settings - Details,';
        str += '\n'+ 'Action,Application Name(Custom),Default,Visible,';
        str += '\n'+ 'Upsert,Configuration_Work_Book,TRUE,TRUE,';
        str += '\n'+ 'Tab Settings - Details,';
        str += '\n'+ 'Action,Tab Name(Custom),Visibility,';
        str += '\n'+ 'Upsert,Initial_Page_2,DefaultOn,';
        str += '\n'+ 'Field Level Security - Details,';
        str += '\n'+ 'Action,Field Name,Read Access,Edit Access,';
        str += '\n'+ 'Upsert,Do_Not_Delete__c.Do_Not_Delete__c,TRUE,TRUE,';
        
        sheets.add(str);
        str = 'Actions,FieldTypes,';
        sheets.add(str);
        test.starttest();
        system.debug('Return Msg ==>'+initialpagecontroller.processInput(sheets));
        
        
    }
    static testMethod void testmetnod2(){
        MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
        try{
        service.readMetadata('CustomField',new list<string>{'do_not_delete__c.test__c'});
        }
        catch(exception e){}
        
    }
}