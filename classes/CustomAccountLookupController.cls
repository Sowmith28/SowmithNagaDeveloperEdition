public with sharing class CustomAccountLookupController {
 
  public Report account {get;set;} // new account to create
  public List<Report> results{get;set;} // search results
  public string searchString{get;set;} // search keyword
    public map<Report, String> mapofReports{get;set;}
     public CustomAccountLookupController(ApexPages.StandardController std) {
     }
  public CustomAccountLookupController() {
    //account = new Account();
    // get the current search string
    searchString = System.currentPageReference().getParameters().get('lksrch');
    runSearch();  
  }
 
  // performs the keyword search
  public PageReference search() {
    runSearch();
    return null;
  }
 
  // prepare the query and issue the search command
  private void runSearch() {
    // TODO prepare query string for complex serarches & prevent injections
    results = performSearch(searchString); 
      mapofReports = performSearchTwo(searchString);
  } 
 
  // run the search and return the records found. 
  private List<Report> performSearch(string searchString) {
 
    String soql = 'select id, name from Report';
    if(searchString != '' && searchString != null)
      soql = soql +  ' where name LIKE \'%' + searchString +'%\'';
    soql = soql + ' limit 25';
    System.debug(soql);
    return database.query(soql); 
 
  }
      public Map<Report,String> performSearchTwo(string searchString) {
 	 Map<id,Folder> mapofFol = new  Map<id,Folder>();
     Map<id,Report> mapofRep = new  Map<id,Report>();
          Map<Report,String> mapoffinalRep = new Map<Report,String>();
	list<Report> listOfRep = new list<Report>();
    listOfRep =[SELECT CreatedById,CreatedDate,Description,DeveloperName,FolderName,Format,Id,IsDeleted,LastModifiedById,LastModifiedDate,LastReferencedDate,LastRunDate,LastViewedDate,Name,NamespacePrefix,OwnerId,SystemModstamp FROM Report ];
          for(Report r :listOfRep){
              mapofRep.put(r.OwnerId,r);
          }
   	list<Folder> listoffol =new list<Folder>();
       listoffol=   [SELECT AccessType,CreatedById,CreatedDate,DeveloperName,Id,IsReadonly,LastModifiedById,LastModifiedDate,Name,NamespacePrefix,SystemModstamp,Type FROM Folder WHERE Type = 'Report'];
          for(Folder f :listoffol ){
              mapofFol.put(f.id,f);
          }
          for(id fo :mapofFol.keySet() ){
          if(mapofRep.keyset().contains(fo)){
              mapoffinalRep.put(mapofrep.get(fo),mapofFol.get(fo).Name);
          }
          }
          return mapoffinalRep;
      }
 
  // save the new account record
 /* public PageReference saveAccount() {
    insert account;
    // reset the account
    account = new Account();
    return null;
  }*/
 
  // used by the visualforce page to send the link to the right dom element
  public string getFormTag() {
    return System.currentPageReference().getParameters().get('frm');
  }
 
  // used by the visualforce page to send the link to the right dom element for the text box
  public string getTextBox() {
    return System.currentPageReference().getParameters().get('txt');
  }
 
}