public class Container1 {
	public Wrapper2 obj;
    public Wrapper3 obj1;
    public void getWrapper(){
        obj = new Wrapper2();
        obj1= new Wrapper3();
        System.debug('obj.name'+obj.name);
        System.debug('obj.City'+obj.City);
         System.debug('obj.name'+obj1.rollNumber);
        System.debug('obj.City'+obj1.Rank);
    }
    
    public class Wrapper2 {

    public String Name;
    public String City;
        Wrapper2(){
            Name = 'Sunil';
            CIty ='Viazg';
        }
}
    
    public class Wrapper3 {

    public integer RollNumber;
    public Double Rank;
        Wrapper3(){
            RollNumber = 45;
            Rank =98;
        }
}
    
}