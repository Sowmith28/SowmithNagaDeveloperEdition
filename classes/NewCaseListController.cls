public class NewCaseListController {
    public String sortOrder ='Lastname';
    public list<Case> getNewCases(){
        list<Case> listOfCases = new list<Case>();
        listOfCases = [select id, CaseNumber from case where status=:'New'];
        if(listOfCases != null){
            return listOfCases;
        }
        return null;
    }
    public list<Contact> getContactList(){
        list<contact> listOfContacts = new list<Contact>();
        listOfContacts = database.query('select id, Firstname ,LastName,title from Contact order by '+sortOrder +' asc limit 10');
        if(listOfContacts != null){
            return listOfContacts;
        }
        return null;
    }
    
    public void sortByFirstname(){
        this.sortOrder ='FirstName';
    }
    
    public void sortByLastname(){
        this.sortOrder ='LastName';
    }
     public void sortByTitle(){
        this.sortOrder ='Title';
    }
}