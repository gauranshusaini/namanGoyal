public class FirstClass 
     {
         Public Static void myMethod(){
             //******** list Initializing******
             //list<Datatype> abc= new list<datatype>();
             
             //Creating and Initializing an integer list
             list <integer> l1 = new list <integer>();
             
             // Adding value to the list
             l1.add(2);
             l1.add(4);
             l1.add(6);
             system.debug('even number=' +l1);
             
             // Initializing and adding value together 
             list<Integer> l2 = new list<Integer>{3,6,9};
                 system.debug('multiple of 3'+l2);
             
             // A String type list 
              list<string> l3 = new list<string>();
             l3.add('APPLE');
             l3.add('BANANA');
             l3.add('PAPAYA');
             l3.add('ORANGE');
             system.debug('FRUITS NAME : '+l3);
                           // OR
             list<String> l4 = new list <string>{'Apple','Banana','Papaya','Orange'};
                 system.debug('fruits Name ='+l4);
             
            
             // list array notation like as java 
             Integer [] l5 = new integer [4];
             // OR
             Integer [] l6 = new list<Integer>();
             // OR 
             list<Integer> l7 = new Integer[5] ; // it is necessary to write array index 
             
             //Adding values using array Notation 
             l7[0] = 10 ;
             l7[1] = 20 ;
             l7[2] = 30 ;
             l7[3] = 40 ;
             l7[4] = 50 ;
             system.debug('Array= '+l7);
             
             // Accesing Nth element of a list 
             system.debug(l7[2]);   //30
            
             /****** Methods of lists*******/
             
             system.debug(l7.size()); //5
             //OR  system.debug('size of l7 list= '+l7.size());
             system.debug(l7.get(3));  //40
             l7.remove(3);    // it will remove the value(40) which is stored in index 3
             system.debug(l7[3]);    //50
             
             list<Integer> l8 = l7.clone();// it will clone all the values of l8.
             system.debug(l8);	
             
             l8.set(0,60);
             system.debug(l8);// we can assign a value for a particular index like as index 0 
             l8.sort(); // sorting is a methods in which we can arrange a value in accending order 
             system.debug(l8);  // example {20,30,50,60}
             system.debug(l8.isEmpty()); // false
            l8.clear(); // clears the list                         
             system.debug(+l8);    //it will clear the all values it will not display any value it will be blank                      
            
             
         }
     }