public class ListClass {
	//variables
	//methods
    public void listMetd(){
        // decalre a list
        //List<datatype> listname = new List<datatype>();
          List<String>  myList   = new List<String>(); 
          myList.add('Sravan');

          myList.add('Anitha');
          myList.add('Kiran');
          myList.add('Tejal');
          myList.add('Sravan');
          System.debug('my string list is '+ myList);
          myList.add(2, 'Mahesh');
          system.debug('after adding an element at 2 location '+ myList);
          system.debug(myList.get(4));
          myList.remove(0);
          system.debug('after removing 0th element '+myList);
          myList.set(1, 'Ram');//Set method will overwrite the value
          system.debug('list is'+ myList);
          system.debug(myList.size());
          //myList.clear();
          system.debug('after clear my list '+ myList);   
        for(integer i=0; i<myList.size();i++){
            System.debug(myList.get(i));
        }
        for(String s:myList ){
            System.debug(s);
            //Anitha
            //Sunil
            //Johnny
        }
    }
    
     public void setMthd(){
        // decalare a set 
        Set<String> mySet = new Set<String>();
        mySet.add('Sravan');
        mySet.add('Anitha');
        mySet.add('Kiran');
        mySet.add('Tejal');
        mySet.add('Sravan');
        System.debug('the set is '+ mySet);
        mySet.add('Kiran');
        system.debug('the set after adding a value '+ mySet);
        system.debug(mySet.contains('Anitha'));
        mySet.remove('Sravan');
        system.debug('after removing an element '+ mySet);
        System.debug(mySet.size());
        mySet.clear();
        system.debug('after clear the set '+ mySet );     
    }
    
    public void mapMtd(){
        // decalre a map
        Map<String,Integer> cc = new Map<String,Integer>();
        cc.put('India',91);
        cc.put('Usa',1);
        cc.put('Uk',44);
        cc.put('Australia',57);
        system.debug('map is '+ cc);
        system.debug(cc.containsKey('India'));
        system.debug(cc.get('Usa'));
        System.debug(cc.keySet());
        System.debug(cc.values());
        cc.remove('Australia');
        system.debug('After removing aus '+ cc);
        
    }
    
     public void div(integer a, integer b){
        try{
        	integer c = a/b;
        	System.debug('the div of 2 nos is '+ c);
        }
        Catch(Exception e){
            system.debug('You cant divide any number by 0');
            System.debug(e.getMessage());
        }
        finally {
            System.debug('this is finally block');
        }
    }
    
}