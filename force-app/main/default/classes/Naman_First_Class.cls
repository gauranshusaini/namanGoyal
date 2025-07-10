public class Naman_First_Class {
    
    public static void firstMethod(){
        
        List<Account> acclist = [SELECT Name,Type,Rating 
                                 FROM Account];
        
        List<Contact> conlist = [SELECT FirstName,LastName,Phone,Email 
                                 FROM Contact];
        
    }

}