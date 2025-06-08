/*First Demo class*/
public class DemoClass {
    public static String firstName;
    public String email='garf@gmail.com';
    public String lastName='Saini';
    
   public DemoClass(){
        system.debug('Constructor');
       thirdMethod();
       firstMethod();
    }
    
    public static void firstMethod(){
        firstName='Gauranshu';
        system.debug('FirstName :: '+firstName);
      //  DemoClass();
    }
    public  void thirdMethod(){
        firstName='Third Method';
        system.debug('FirstName :: '+firstName); 
    }
    public void secondMethod(){
        firstName='Garf';
        lastName='Saini';
        system.debug('FirstName :: '+firstName);
        system.debug('LastName :: '+lastName);
        firstMethod();
        system.debug('FirstName :: ');
        system.debug('LastName :: ');  
        thirdMethod();
    }
}