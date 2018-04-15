public class metadatautility_profile{
    
    public static List<String> errorList = new List<String>();
    static String profileName; 
    final static Integer ACTION =  Integer.valueof(system.label.Profile_Action);
    final static Integer PRFLNAME =  Integer.valueof(system.label.Profile_Name);
    final static Integer DESCRIPTION =  Integer.valueof(system.label.Profile_Desc);
    final static Integer CUSTOM =  Integer.valueof(system.label.Profile_Custom);
    final static Integer LICENSE =  Integer.valueof(system.label.User_License);
    final static Integer APPNAME =  Integer.valueof(system.label.App_Name);
    final static Integer DEFAULT_X =  Integer.valueof(system.label.App_Default);
    final static Integer VISIBLE =  Integer.valueof(system.label.App_Visible);
    final static Integer TABNAME =  Integer.valueof(system.label.Tab_Name);
    final static Integer VISIBILITY =  Integer.valueof(system.label.Tab_Visibility);
    final static Integer FIELDNAME =  Integer.valueof(system.label.Profile_Field_Name);
    final static Integer READABLE =  Integer.valueof(system.label.Readable);
    final static Integer EDITABLE =  Integer.valueof(system.label.Profile_Editable);
    /**
     * Main Method for Creating Profile.
     */ 
    public static MetaData_CBA.Profile createProfile(String inputPrfl){
        
        System.debug('Start profile Creation');
        MetaData_CBA.Profile admin;
        try{
            
            if(inputPrfl != null){
                List<String> prflList = inputPrfl.split('\n');
                Map<String,List<String>> result = formatProfileData(prflList);
        
                //Setting Profile Details
                if(result != null && !result.isempty())
                    admin = setProfileDetails(result);
                else
                    return null;    
            }
            
            
        }catch(Exception ex){
            System.debug('Exception occurred in createProfile:'+ex.getMessage());
            return null;  
        }
        return admin;
        
    }
    /**
     * Format Input Profile data.
     */ 
    public static Map<String,List<String>> formatProfileData(List<String> prflList){
        
        List<String> prflDetailsList;
        List<String> appDetailsList;
        List<String> tabDetailsList;
        List<String> flsDetailsList;
        Map<String,List<String>> result = new Map<String,List<String>>();        
        try{
        
            if(prflList != null){
                Integer step=-1;
                    
                for(String prfl: prflList){
                    
                    String  p = prfl.remove(',');
                    if(prfl != null && !('').equalsignorecase(prfl.remove(',').trim())){
                       
                        if((String.valueof(system.label.Profile_Details)).indexOf(prfl.remove(','))>-1){
                            step=0;
                            prflDetailsList = new List<String>();
                        }
                        if((String.valueof(system.label.App_Settings_Details)).indexOf(prfl.remove(','))>-1){
                            step=1;
                            appDetailsList = new List<String>();
                        }
                        if((String.valueof(system.label.Tab_Settings_Details)).indexOf(prfl.remove(','))>-1){
                            step=2;
                            tabDetailsList = new List<String>();
                        }
                        if((String.valueof(system.label.Field_Level_Security_Details)).indexOf(prfl.remove(','))>-1){
                           step=3;
                            flsDetailsList = new List<String>();
                        }
                        system.debug('Dj==> Step '+step + ' Profile-- '+prfl);
                        if(step==0){
                            if(!prfl.startswithignorecase(system.label.Profile_Details) && !prfl.startswithignorecase('Action'))
                                prflDetailsList.add(prfl);
                            
                        }
                        if(step==1){
                            if(!prfl.startswithignorecase(system.label.App_Settings_Details) && !prfl.startswithignorecase('Action'))
                                appDetailsList.add(prfl);
                        }
                        if(step==2){
                            if(!prfl.startswithignorecase(system.label.Tab_Settings_Details) && !prfl.startswithignorecase('Action'))
                                tabDetailsList.add(prfl);
                        }
                        if(step==3){
                            if(!prfl.startswithignorecase(system.label.Field_Level_Security_Details) && !prfl.startswithignorecase('Action'))
                                flsDetailsList.add(prfl);
                        }
                        
                    }
                    if(prflDetailsList!= null && prflDetailsList.size()>0){
                       result.put(String.valueof(system.label.Profile_Details), prflDetailsList);
                    }
                    if(appDetailsList!= null && appDetailsList.size()>0){
                        result.put(String.valueof(system.label.App_Settings_Details), appDetailsList);
                    }
                    if(tabDetailsList!=null && tabDetailsList.size()>0){
                        result.put(String.valueof(system.label.Tab_Settings_Details), tabDetailsList);
                    }
                    if(flsDetailsList!= null && flsDetailsList.size()>0){
                        result.put(String.valueof(system.label.Field_Level_Security_Details), flsDetailsList);
                    }
                }
            }
        
        }catch(Exception ex){
            System.debug('Exception while formatting Profile Data:'+ex.getMessage());
        }
        return result;
    }
    
    /**
     * Creates Profile Data and child data.
     */ 
    public static MetaData_CBA.Profile setProfileDetails(Map<String,List<String>> result){
       
       MetaData_CBA.Profile admin = new MetaData_CBA.Profile();
       try{
           if(result != null){
            
                List<String> prflDetails = result.get(String.valueof(system.label.Profile_Details));
                List<String> appDetails = result.get(String.valueof(system.label.App_Settings_Details));
                List<String> tabDetails = result.get(String.valueof(system.label.Tab_Settings_Details));
                List<String> flsDetails = result.get(String.valueof(system.label.Field_Level_Security_Details));
               System.debug(prflDetails+'prfldetails size:'+prflDetails.size());
               System.debug('appDetails size:'+appDetails.size());
               System.debug('tabDetails size:'+tabDetails.size());
               System.debug('flsDetails size:'+flsDetails.size());
                MetaData_CBA.MetadataPort service = MetaDataAPIUtility_CBA.createService();
                //Profile Creation
                if(prflDetails != null){
                    List<String> prfl = prflDetails.get(2).split(',');
                    admin.fullName = prfl[PRFLNAME];
                    if(prfl!= null && !('Do Nothing').equalsIgnoreCase(prfl[ACTION])){
                        admin.description = prfl[DESCRIPTION];
                        admin.custom = prfl[CUSTOM]!=null?Boolean.valueOf(prfl[CUSTOM]):true;
                        admin.userLicense = prfl[LICENSE];
                    }
                    admin.tabVisibilities = setTabDetails(tabDetails);
                    admin.applicationVisibilities = setAppDetails(appDetails);
                    admin.fieldPermissions  = setFLSDetails(flsDetails) ;
               }
                
           }
             
        }catch(Exception ex){
            System.debug('Exception occurred in setProfileDetails method:'+ex.getMessage());
            errorList.add('Exception occurred:'+ex.getMessage()+' in Profile:'+profileName+'while creating/modifying profile details');
        }
        return admin;
        
    }
    /**
     * Creates/Modifies Field Level Security Data.
     */ 
    public static List<MetaData_CBA.ProfileFieldLevelSecurity> setFLSDetails(List<String> flsDetList){
        List<MetaData_CBA.ProfileFieldLevelSecurity> flsList;
        MetaData_CBA.ProfileFieldLevelSecurity fieldSec;
        try{
            if(flsDetList != null && flsDetList.size()>0){
                flsList =  new List<MetaData_CBA.ProfileFieldLevelSecurity>();
                for(Integer i=0;i<flsDetList.size();i++){
                
                    if(i==0 || i==1){
                        continue;
                    }
                    List<String> flsDet = flsDetList.get(i).split(',');
                    if(flsDet!=null && !('Do Nothing').equalsignoreCase(flsDet[ACTION])){
                        fieldSec = new MetaData_CBA.ProfileFieldLevelSecurity();
                        fieldSec.field=flsDet[FIELDNAME];
                        fieldSec.editable=flsDet[EDITABLE]!= null?Boolean.valueOf(flsDet[EDITABLE]):false;
                        fieldSec.readable=flsDet[READABLE]!= null?Boolean.valueOf(flsDet[READABLE]):false; 
                        flsList.add(fieldSec);
                    }
                }    
            }
        }catch(Exception ex){
            System.debug('Exception occurred in setFLSDetails:'+ex.getMessage());
            errorList.add('Exception occurred:'+ex.getMessage()+' in Profile:'+profileName+'while creating/modifying FLS details');
        }
        return flsList;
    }
    /**
     * Creates/Modifies App Level Details.
     */ 
    public static List<MetaData_CBA.ProfileApplicationVisibility> setAppDetails(List<String> appDetList){
        List<MetaData_CBA.ProfileApplicationVisibility> appList = new List<MetaData_CBA.ProfileApplicationVisibility>();
        MetaData_CBA.ProfileApplicationVisibility prflApp;
        try{
            if(appDetList!=null && appDetList.size()>0){
                for(Integer i=0;i<appDetList.size();i++){
            
                        if(i==0 || i==1){
                            continue;
                        }
                        List<String> appDet = appDetList.get(i).split(',');
                        if(appDet!= null && !('Do Nothing').equalsignoreCase(appDet[ACTION])){
                            prflApp = new MetaData_CBA.ProfileApplicationVisibility();
                            prflApp.application=appDet[APPNAME];
                            prflApp.visible=appDet[VISIBLE]!= null?Boolean.valueOf(appDet[VISIBLE]):false;
                            prflApp.default_x =appDet[DEFAULT_X]!= null?Boolean.valueOf(appDet[DEFAULT_X]):false;     
                            appList.add(prflApp);
                        }
                }        
            }
        }catch(Exception ex){
            System.debug('Exception occurred in setAppDetails method:'+ex.getMessage());
            errorList.add('Exception occurred:'+ex.getMessage()+' in Profile:'+profileName+'while creating/modifying APP details');
        }
        return appList;
    }
    
    public static List<MetaData_CBA.ProfileTabVisibility> setTabDetails(List<String> tabDetList){
        MetaData_CBA.ProfileTabVisibility prflVis;
        List<MetaData_CBA.ProfileTabVisibility> tabList = new List<MetaData_CBA.ProfileTabVisibility>();
        try{
            if(tabDetList != null && tabDetList.size()>0){
                for(Integer i=0;i<tabDetList.size();i++){
            
                    if(i==0 || i==1){
                        continue;
                    }
                    List<String> tabDet = tabDetList.get(i).split(',');
                    if(tabDet!= null && !('Do Nothing').equalsignoreCase(tabDet[ACTION])){
                        prflVis = new MetaData_CBA.ProfileTabVisibility();
                        prflVis.tab = tabDet[TABNAME];
                        prflVis.visibility=tabDet[VISIBILITY];    
                        tabList.add(prflVis);
                    }
                }
            }
        }catch(Exception ex){
            System.debug('Exception occurred in setTabDetails method:'+ex.getMessage());
            errorList.add('Exception occurred:'+ex.getMessage()+' in Profile:'+profileName+'while creating/modifying Tab details');
        }
        return tabList;
    }
    
}