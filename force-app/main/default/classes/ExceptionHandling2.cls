public class ExceptionHandling2 {

    public static void myMethod(integer i){
        /************* system Exceptions********/
        
        //**********1.) DML  Exceptions*******
        
        try
        {
            Account a=new Account();
            insert a;
        }
        catch(DMLException de)
        {
            system.debug('Record cannot be inserted'+de.getMessage());
        }
        
        //****** 2.) ListException **********
        try
        {
            list<String> StList = new List<String>{'Aman','Anish','Deepika'};
                
                system.debug(stList.get(0));      //'Aman'
            system.debug(stList.get(1));         // 'Anish'
            system.debug(stList.get(2));        // 'Deepika'
            system.debug(stList.get(3));       // will throw a listException as there is no element on index 3
        }
        catch(ListException le)
        {
            system.debug('there is no value in this index'+le.getMessage());
        }
        
        
        //*********3.) NullPointerException***********
        try
        {
            //Exaple 1
            integer a;
            integer b= a*8;   // will throw a NullPointer Exception we are trying to get the value of a which 
                             // is null  Hence whenever we try to de-reference a variable which stores null
                             // then apex throws a NullPointerWxception
            
            //Example 2
            List<Integer>iList;
            iList.add(30);    // Throws NullPointeraException as iList does not refer to any object
            
            //Example3
            Account acc;
            acc.Name='Disney'; //  Throws NullPointeraException as acc does not refer to any sObject
            
        }
        catch(NullPointerException npe)
        {
            system.debug('There is no object in the reference variable'+npe.getMessage());
        }
        
        //******** 4.) QueryException*******
        
        try
        {
            Account a =[Select Name From Account where Name='Gauranshu']; // This query will return more than one record
                                                                          //but we are assigning it to a single sObject 
                                                                          //Hence it will throw a Query Exception 
            
            Account b=[Select Name From Account Where Name='Any COmpany'];//this will returned no record and will throw
                                                                          
        }
        Catch (QueryException qe)
        {
            system.debug('There is problem with this query: '+qe.getMessage());
        }
       
        //**** 5.) sObjectException******
        
        try
        {
            list<Account> accList =[Select Name From Account];
            for(Account a:accList)
            {
                system.debug(a.NumberOfEmployees);    // you are trying to access the field which is not 
                                                      // Hence will throw an sObjectException
            }
        }
        catch(sObjectException soe)
        {
            system.debug('There is a problem with this query:'+soe.getMessage());
        }
        
        //********** Generic Exception*********
        
        //If you dont know which exception might occur in the try block then in that case use generic exception 
        //
        //Generic Exception "Exception" is a super Class Of all the exception classes which can catch any type of exception
        
        try
        {
          List<Account> accList= [Select Name From Account];
            
            for(Account a:accList)
            {
                a.NumberOfEmployees=1000;
            }
            update accList;
        }
        Catch(Exception e)
        {
            system.debug('This is generic Exception '+e.getMessage());
        }
        
        
        //Note: if you are using generic exception catch block then make sure it is last catch block in the list of catch block
        //Otherwise the catch block that you will write down after it will be never be executed and will be considered as Unreachable
        //code which is not allowed in apex
        
        try
        {
            if(i==0)
            {
                integer a;
                integer b=a*5;
            }
            else 
            {
                Account acc = new Account();
                insert acc;
            }
        }
        catch(NullPointerException npe)
        {
            system.debug('I execute when a NullPointerException occurs in the try block');
        }
          catch(DMLException d)
        {
            system.debug('I execute when a DMLException occurs in the try block');
        }
                  catch(Exception d)
        {
            system.debug('I execute when there is any other exception except NullPointerException and DMLException occurs in the try block');
            
            
        }
        
        // ***** Common Exception Methods
         try
        {
            if(i==0)
            {
                integer a;
                integer b=a*5;   // Returns NullPointer Exception
            }
            else 
            {
                Account acc = new Account();
                insert acc;     // Returns DMLException
            }
        }
        catch(Exception e)
        {
            system.debug(e.getCause());  // Returns the cause of the exception
            
            system.debug(e.getLineNumber());// returns the line Number from where the exception was thrown
            
            system.debug(e.getMessage()); // Returns the error message that display for the user.
            
            system.debug(e.getStackTraceString()); // Returns the stack trace (details ) as a string
            
            system.debug(e.getTypeName()); // Returns the type of execution
              
                }
        
    }
}