public class initialpagecontroller {
    public static string objectname = '';
    @RemoteAction
    public static String processInput(list<String> inputlist) { 
        string ret = '';
        integer step = 0;
        integer i =0;
        integer size = inputlist.size();
        
        //return json.serialize(inputlist[0]);
        try{
        
        for(integer sht =0; sht < size-1; sht++){
            string sheet = inputlist[sht];
            i =0;
            step = -1;
            //boolean isend = false;
            if(sheet.startswithignorecase(label.Object_Details)){
                map<string,list<string>> pagemap = new map<string,list<string>>();
                for(String line : sheet.split('\n')){
                    i++;
                    line = metadatautility2.formatString(line);
                     
                    string action = line.split(',').size() > 0 ? line.split(',')[0] : '';
                    if(line.startswithignorecase('END')){
                        //isend =true;
                        break;
                    }
                    else if(line.startswithignorecase(label.Object_Details)){
                        step = 0;
                    }
                    else if(line.startswithignorecase(label.Field_Details)){
                        step = 1;
                    }
                    else if(line.startswithignorecase(label.Custom_Button_and_Web_Link)){
                        step = 2;
                    }
                    else if(line.startswithignorecase(label.Record_Type)){
                        step = 3;
                    }
                    else if(line.startswithignorecase(label.Managed_List_View)){
                        step = 4;
                    }
                    else if(line.startswithignorecase(label.Page_Layout_Assignment)){
                        step = 5;
                    }
                    else if(line.startswithignorecase(label.Managed_Validation_Rule)){
                        step = 6;
                    }
                   /* if(step == 0 ){
                        if(!pagemap.containskey(label.Object_Details)){
                            pagemap.put(label.Object_Details,new list<string>());
                        }
                       // pagemap.get(label.Object_Details).add(line);
                    }*/
                    system.debug('ACTION ==>'+action);
                    if(step == 0){
                        if(action != null && action !='' && action !='Action' && action != label.Object_Details ){
                            //ret += sht+' =='+action;
                            objectname = line.split(',').size() > 2 ? line.split(',')[2] : '';
                            //ret += objectname +' ==';
                        }   
                    }
                    if(step == 5){
                        if(action.equalsIgnoreCase('Action')){
                            if(!pagemap.containskey(label.Page_Layout_Assignment)){
                                pagemap.put(label.Page_Layout_Assignment,new list<string>());
                                pagemap.get(label.Page_Layout_Assignment).add(line);
                            }
                        }
                            
                    }
                    
                    if(action !='' && ( action.equalsIgnoreCase(system.label.Upsert) || action.equalsIgnoreCase(system.label.Delete) )){
                        
                        if(step == 0){
                            pagemap.put(label.Object_Details,new list<string>());
                            pagemap.get(label.Object_Details).add(line);
                        }
                        
                        if(step == 1 ){
                            if(!pagemap.containskey(label.Field_Details)){
                                pagemap.put(label.Field_Details,new list<string>());
                            }
                            pagemap.get(label.Field_Details).add(line);
                        }
                        if(step == 2 ){
                            if(!pagemap.containskey(label.Custom_Button_and_Web_Link)){
                                pagemap.put(label.Custom_Button_and_Web_Link,new list<string>());
                            }
                            pagemap.get(label.Custom_Button_and_Web_Link).add(line);
                            //ret += line + i +' Step'+step ;
                        }
                        if(step == 3 ){
                            if(!pagemap.containskey(label.Record_Type)){
                                pagemap.put(label.Record_Type,new list<string>());
                            }
                            pagemap.get(label.Record_Type).add(line);
                        }
                        if(step == 4 ){
                            if(!pagemap.containskey(label.Managed_List_View)){
                                pagemap.put(label.Managed_List_View,new list<string>());
                            }
                            pagemap.get(label.Managed_List_View).add(line);
                        }
                        if(step == 5 ){
                            if(!pagemap.containskey(label.Page_Layout_Assignment)){
                                pagemap.put(label.Page_Layout_Assignment,new list<string>());
                            }
                            pagemap.get(label.Page_Layout_Assignment).add(line);
                        }
                        if(step == 6 ){
                            if(!pagemap.containskey(label.Managed_Validation_Rule)){
                                pagemap.put(label.Managed_Validation_Rule,new list<string>());
                            }
                            pagemap.get(label.Managed_Validation_Rule).add(line);
                        }
                    }
                }
                //system.debug('Object list==>'+pagemap.get(label.Object_Details));
               // return '=>'+(pagemap.get(label.Object_Details).size()); 
               if(pagemap.get(label.Object_Details) != null){
                    ret += MetaDataAPIUtility_CBA.createObject(pagemap.get(label.Object_Details));
               }
               if(pagemap.get(label.Field_Details) != null){
                    ret += metadatautility2.createfield(objectname,pagemap.get(label.Field_Details));
               }
               //return json.serialize(pagemap.get(label.Field_Details)) ;
               if(pagemap.get(label.Custom_Button_and_Web_Link) != null){
                    ret += MetaDataAPIUtility_CBA.createButtonLink(objectname,pagemap.get(label.Custom_Button_and_Web_Link));
               }
               if(pagemap.get(label.Record_Type) != null){
                    ret += MetaDataAPIUtility_CBA.createrecordtypes(objectname,pagemap.get(label.Record_Type));
               }
               if(pagemap.get(label.Managed_Validation_Rule) != null){
                    ret += MetaDataAPIUtility_CBA.createValidationrules(objectname,pagemap.get(label.Managed_Validation_Rule));
               }
               if(pagemap.get(label.Managed_List_View) != null){
                    ret += MetaDataAPIUtility_CBA.createListviews(objectname,pagemap.get(label.Managed_List_View));
               }
               if(pagemap.get(label.Page_Layout_Assignment).size() > 1){
                    ret += MetaDataAPIUtility_CBA.managepagelayoutAssignment(objectname,pagemap.get(label.Page_Layout_Assignment));
               }
           }
           else if(sheet.startswithignorecase(label.Profile_Details)){
                ret += MetaDataAPIUtility_CBA.createprofiles(sheet); 
           }
              
        }
        //ret = ''+i;
        system.debug(' Dj - Summary '+metadatautility2.summaryFieldList);
        if(!metadatautility2.summaryFieldList.isempty()){
            metadatautility2.upsertMetadata(metadatautility2.summaryFieldList);
            
        }
        }
        catch(exception e){
            ret += e.getmessage() +' @ '+ e.getlinenumber();
        }
        
        return ret ;
    }    
}