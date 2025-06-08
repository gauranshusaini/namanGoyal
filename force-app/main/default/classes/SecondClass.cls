/**Public Class SecondClass
{
  public static void myMethod()
  {
     list<List<Integer>> lList = new list <list<Integer>>();//Nested list or list of 2 dimension 
      list<Integer> l1 = new list <Integer>{11,20,33}; // array value
          system.debug(+l1);
      //OR
      //list <Integer> l1 = new list <integer>();
      //l1.add(11);
      //l1.add(20);
      //l1.add(33);
      //system.debug(+l1);
      list<Integer> l2 = new list <Integer>{12,40,22}; //array value 
          system.debug(+l2);
          list<Integer> l3 = new list <Integer>{13,50,11}; // array value 
              system.debug(+l3);
      lList.add(l1);
      lList.add(l2);
      lList.add(l3);
      system.debug(+lList); //((11,20,33),(12,40,22),(13,50,11))
      
      //3D list
      List <list<list<Integer>>> List3D = new List<List<list<Integer>>>{

new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90} },
new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90} },
new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90} }
      };
  system.debug('list3d='+List3D) ;//|list3d=(((10, 20, 30), (40, 50, 60), (70, 80, 90)), ((10, 20, 30), (40, 50, 60), (70, 80, 90)), ((10, 20, 30), (40, 50, 60), (70, 80, 90)))
       
  }
}

//             OR
Public Class SecondClass
{
  public static void myMethod()
  {
List<List<Integer>> lList = new List<List<Integer>>{
                                             new List<Integer>{11,20,33},
                                                   new List<Integer>{11,20,33},
                                                      new List<Integer>{11,20,33},
                                                      };
                  system.debug(+lList);

List <list<list<Integer>>> List3D = new List<List<list<Integer>>>{

new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90}},
new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90}},
new List<list<Integer>>{New List<Integer>{10,20,30},new list<Integer>{40,50,60},new list<Integer>{70,80,90}}
  system.debug(+List3D);
}
    
}
}
*/

Public Class SecondClass
{
  public static void myMethod()
  {
      //******** SET INITIALIZATION ********
      // Set<Datatype> s = new Set<Datatype>();
      // Creating & Initializing an integer set
      Set <Integer> s1 = new set <Integer>();
      
      // Adding values to the set 
      s1.add(3);
      s1.add(6);
      s1.add(9);
      s1.add(3);
      system.debug('set1'+s1); //set1{3, 6, 9}
      
      // Initializing and adding values together 
      Set<Integer> s2 = new set <Integer>{3,6,9,12,6};
      system.debug('set2'+s2); // set2{3, 6, 9, 12}
      // A string type set 
      Set<String> s3 = new set <string>{'This','is','how','we','do','it'};//case- sensitive matter
          system.debug('set3='+s3);//set3={This, do, how, is, it, we} //
      
      // uniqueness of sObjects 
      Set<Account> sSet = new Set<Account>();
      
      Account a1 = new Account (Name = 'GARF', NumberOfEmployees = 2000);
      Account a2 = new Account (Name = 'STAR', NumberOfEmployees = 2000);
      Account a3 = new Account (Name = 'GARF', NumberOfEmployees = 2000);
      Account a4 = new Account (Name = 'GARF');
      
      sSet.add(a1);
      sSet.add(a2);
      sSet.add(a3);
      sSet.add(a4);
      system.debug('sObjectSet='+sSet); //sObjectSet={Account:{Name=GARF}, Account:{Name=GARF, NumberOfEmployees=2000}, Account:{Name=STAR, NumberOfEmployees=2000}}7
      
      system.debug(sSet.size()); // 3 
      // Methods of sets
      List<Integer> l1 = new list <Integer>{2,4,6,8};
          s2.addall(l1);  // This method also take set as an argument
      system.debug(s2);  // {2, 3, 4, 6, 8, 9, 12} automatically sorted in set
      system.debug(s2.contains(3)); // true
      system.debug(s2.contains(52));//false
      system.debug(s2.containsAll(l1)); // true
      system.debug(s2.size());     //7
      system.debug(s2);            // {2, 3,4, 6, 8, 9, 12}
      system.debug(s2.retainAll(l1));
      system.debug(s2);
      set<Integer> s = s2.clone(); //
      s2.remove(3);
      system.debug(s2); //{2, 4, 6, 8, 9, 12}
      s2.removeAll(l1);
      s2.clear();
      system.debug(s2);
 
     //******* MAP INITIALIZATION *********
     //Map<Datatype key, Datatype value > mmap = new Map<Datatype key,Datatype value>();
     //Datatype key can only be PRIMITIVE
     //Datatype value can be PRIMITIVE , sOBJECT , APEX OBJECTS and other collections.
     
     
     
     
     // Creating and Initializing a map
     
      Map<Integer, String> mmap = new map<Integer,String>();
     
      //Adding values to map 
      mmap.put(11,'KL RAHUL');
      mmap.put(12,'ROHIT SHARMA');
      mmap.put(13,'VIRAT KOHLI');
      
      system.debug('MAP OF indian player: '+mmap); // |MAP OF indian player: {11=KL RAHUL, 12=ROHIT SHARMA, 13=VIRAT KOHLI}
      mmap.put(11,'MAYANK AGGARWAL'); // it will replace the value or override the value on key 11
      system.debug(mmap);// {11=MAYANK AGGARWAL, 12=ROHIT SHARMA, 13=VIRAT KOHLI}
      
      // Initializing and assigning value together 
      Map<Integer, String> m1 = new Map<Integer, String>{ 1=>'RAVICHANDRA ASHWIN ', 2=>'RAVINDRA JADEJA',3=>'AXAR PATEL'};
      system.debug(m1);//|{1=RAVICHANDRA ASHWIN , 2=RAVINDRA JADEJA, 3=AXAR PATEL}
      
      //Methods of Maps
      
      mmap.putAll(m1);
      system.debug(mmap);//{1=RAVICHANDRA ASHWIN , 2=RAVINDRA JADEJA, 3=AXAR PATEL, 11=MAYANK AGGARWAL, 12=ROHIT SHARMA, 13=VIRAT KOHLI}
      system.debug(mmap.get(1));///RAVICHANDRA ASHWIN 
     
      list<String> l =new list <string>();
      l = mmap.values();
      system.debug('values'+l); // values(MAYANK AGGARWAL, ROHIT SHARMA, VIRAT KOHLI, RAVICHANDRA ASHWIN , RAVINDRA JADEJA, AXAR PATEL)
        
      Map<Integer,String> o = new map <Integer,String>();
      o = mMap.clone();
      system.debug('New map O = '+o);//New map O = {1=RAVICHANDRA ASHWIN , 2=RAVINDRA JADEJA, 3=AXAR PATEL, 11=MAYANK AGGARWAL, 12=ROHIT SHARMA, 13=VIRAT KOHLI}
      system.debug(mmap.keyset()); //{1, 2, 3, 11, 12, 13}
      system.debug(mmap.containskey(3)); //true
      
      
      system.debug(mmap.isEmpty()); // false
      system.debug(mmap.size());  // 6
      mmap.remove(2); // removes the element at key 2
      system.debug(mmap);//{1=RAVICHANDRA ASHWIN , 3=AXAR PATEL, 11=MAYANK AGGARWAL, 12=ROHIT SHARMA, 13=VIRAT KOHLI}
      mmap.clear(); // clears the map
      system.debug(mmap);//{}
      
      //**** GROUP BY 
      LIST<AggregateResult> agrOpp1=[Select StageName from Opportunity GROUP BY StageName];
      
  }
  }