public class StringArrayTest {

    public static list<string> generateStringArray(integer n)
    {
        list<string> listofstrings=new list<string>();
        for(integer x=0;x<n;x++)
        {
           listofstrings.add((String)('Test '+x)); 
        }
        System.debug('The list contains'+listofstrings);
        return listofstrings;
    }
    
    
}