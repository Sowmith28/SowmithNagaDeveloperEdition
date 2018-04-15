public class ContactAndLeadSearch {

    public static List<List< SObject>> searchContactsAndLeads(String s1   )
    {
     List<List< SObject>>  l=new List<List< SObject>>();
        l=[find 'Smith' in NAME FIELDS returning Contact(FirstName,LastName where FirstName=:s1 or LastName=:s1 ),Lead(FirstName,LastName where FirstName=:s1 or LastName=:s1)];
        System.debug(l);
        return l;
    }
}