public class DMLfirstClass {
    Public Static void myMethod()
    {
        /****** DML Standalone Statements******
         
        1.) insert 
        2.) update
        3.)upsert
        4.)delete
        5.)undelete
        6.) Merge




         Syntex Of DML Statements
       
           DML statement    sObject/ List of sObject 
        Example:   Account a = new Account(Name='Garf');
                   insert a; 

*/
        
        
        // insert
        List<Account> accList = new List<Account>();
        
        for(integer i=1; i<20;i++)
        {
            Account a = new Account(Name=' GAURANSHU;'+i);
            accList.add(a);
         
        }
        insert accList;
        
        
        // update
        accList =[Select Name ,NumberOfEmployees From Account where Name Like 'GAURANSHU%' ORDER BY NAME];
       
        for (Account a: accList)
        {
            a.Name = a.Name+' Update';
        }
        update accList;
        
        //*****upsert******
        for (Account a1:accList)
        {
            a1.NumberOfEmployees =1000;
        }
        for(integer i=1;i<=10;i++)
        {
            Account a= new Account(Name = 'Upsert Account'+i);
            acclist.add(a);
        }
        
        // Delete
        delete accList;
        
        //undelete
        undelete accList;
    }
}