public class B extends A{

    integer b=20;
    public void getMethodB(){
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
          myList.clear();
          system.debug('after clear my list '+ myList); 
        System.debug('The value of B'+b);
        
         Set<String> mySet = new Set<String>();
        mySet.add('Sravan');
        mySet.add('Anitha');
        mySet.add('Kiran');
        mySet.add('Tejal');
        System.debug('the set is '+ mySet);
        mySet.add('Kiran');
        system.debug('the set after adding a value '+ mySet);
        system.debug(mySet.contains('Anitha'));
        mySet.remove('Srava');
        system.debug('after removing an element '+ mySet);
        System.debug(mySet.size());
        mySet.clear();
        system.debug('after clear the set '+ mySet );     
    }
}
//Added comment to test the terminal commit