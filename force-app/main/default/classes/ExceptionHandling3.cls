public class ExceptionHandling3 {

    //********** Custom Exceptions
    public static void myMethod(integer i)
    {
        try{
              if(i<0)
    {
        throw new NumberIsNegativeException();
    }
    else 
    {
        i=i*i*10;
        system.debug(i);
    } 
        
        }
        catch(NumberIsNegativeException n){
            system.debug('The Number is Negative');
        }
        
      
    }
       
}