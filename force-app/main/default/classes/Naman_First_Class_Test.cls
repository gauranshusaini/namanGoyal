@isTest
public class Naman_First_Class_Test {
    @isTest
    public static void firstTestMethod(){
        Account acc = new Account();
        acc.Name = 'Test Account 1 ';
        acc.Type = 'Prospect' ;
        
        contact con = new contact();
        con.FirstName = 'Test';
        con.LastName = 'Contact 1';
        con.Phone = '1234567890';
        con.Email='test@gmail.com';
        
        
        Test.startTest();
        insert acc ; 
        insert con ; 
        Test.stopTest();      
        Naman_First_Class.firstMethod();
    }  
}