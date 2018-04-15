public class ProjectController1 {
    public String SelectObject{get;set;}
    public String SelectChildObject{get;set;}
    
    
    public list<SelectOption> getTotalObject(){
    Map<String,Schema.SObjectType> globalMap= Schema.getGlobalDescribe();
        list<SelectOption> listofobjects=new list<SelectOption>();
        system.debug('The SelectObject is ' + SelectObject);
        for(String fieldName : globalMap.keySet())
        {
            
            listofobjects.add(new SelectOption(fieldName,fieldName));
        }
        return listofobjects;
    }
    
    
    public  list<SelectOption> getChildObject()
    {
        list<SelectOption> listOfChilds=new list<SelectOption>();
        
        
        return listOfChilds;
    }
}