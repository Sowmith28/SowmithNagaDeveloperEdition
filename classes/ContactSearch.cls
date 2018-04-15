public class ContactSearch {

    public static list<Contact> searchForContacts(String s1,String s2)
    {
        list<Contact> listofmatchedcontacts=new list<Contact>();
        listofmatchedcontacts=[select id,Name from Contact where   LastName=:s1 and MailingPostalCode=:s2];
        return listofmatchedcontacts;
    }
    
}