public class ExceptionHandling1 {
    public static void myMethod(integer i){
        try{
            if(i==0)
            {
                integer a;
                integer b= a*5;    // Throws NullPointerException
            }
            else
            {
                Account acc = new Account();
                insert acc;         // Throws DMLException
            }
        }
        catch (NullPointerException npe)
        {
            system.debug('I execute when there is Null Pointer Exception occur in the try block');
        }
        catch (DMLException d)
        {
            system.debug('I execute when there is DMLException occur in the try block');
        }
        catch(Exception e)
        {
            system.debug('I execute when there is any other exception except DMLException Occurs in the try block');
          
        }
        Finally
        {
            system.debug('No matter whether an exception in the try block occured or not I always execute');
       }
      
        // calling :ExceptionHandling1.myMethos(0)
/*
        *****Try and Catch*****
        try
        {
          integer a;
        integer b = a*5;    
        
        }
        Catch (Exception e)
        {
          system.debug(e.getMessage());  
     }
        
       

        
        
        //******* TRY and Catch *******
try 
{
    Account a = new Account();
    insert a;
}
catch(DmlException e) 
{
    system.debug('Error = '+e.getMessage());
    // Process exception here
}

*/
    }
}