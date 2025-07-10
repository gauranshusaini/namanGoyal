@isTest
public class Naman_First_Class_Test {
    @isTest
    public static void firstTestMethod(){
        Account acc = new Account();
        acc.Name = 'Test Account 1 ';
        acc.Type = 'Prospect' ;
        
        Test.startTest();
        insert acc ; 
        Test.stopTest();
        
        Naman_First_Class.firstMethod();
    }  
}