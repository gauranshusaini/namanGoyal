public class ThirdCLass {
   
    Public static void myMethod(){
        
      /* // *** SOQL VARIABLE BINDING****
      
        // Comparing Static Value
        List<Contact> Conlist = [SELECT FirstName,lastName,email from Contact Where firstName='John'];
            system.debug('Static Binding = '+conlist); //Static Binding = (Contact:{FirstName=John, LastName=Bond, Email=bond_john@grandhotels.com, Id=0035g000009vR4nAAE})
      
        // Comparing value dynamically
        List<Contact> Conlist2 = [SELECT FirstName,lastName,email from Contact Where firstName= :str];     
        system.debug('Dynamic Binding = '+conlist2); */
        
        //*** SOQL AGGREGATE FUNCTIONS ****
        //
        //**** SUM
        AggregateResult ar1=[SELECT sum(Amount) FROM Opportunity];//will display the sum of Amount in all Opportunities 
        system.debug('Result is= '+ar1);//|DEBUG|Result is= AggregateResult:{expr0=5760000.0}
        
        //***MAX
        AggregateResult ar2=[SELECT MAX(Amount) FROM Opportunity];
        system.debug('Result is= '+ar2);
        
        //*** Min
        AggregateResult ar3=[SELECT MIN(Amount) FROM Opportunity];
        system.debug('Result is= '+ar3);
      
        // many Aggregate functions together
        AggregateResult ar4=[SELECT sum(Amount),Max(Amount),Min(Amount) FROM Opportunity];
        system.debug('Result is= '+ar4);//Result is= AggregateResult:{expr0=5760000.0, expr1=915000.00, expr2=15000.00} expris a key and 5760000 is an value
        
        // *****COUNT****
        Integer i=[SELECT Count() FROM Opportunity];  //47
        system.debug('result is = '+i); // will return the total number of opportunities and it is not a aggregate function it is a integer datatype 
        //because we have not written anything inside the count() if we will write something so it will display error beacause it will become aggregate function 
        // Integer ar5=[Select Count(Id) From Opportynity]; // error
        
        AggregateResult ar6 =[Select Count(Id) From Opportunity]; 
         system.debug('result is = '+ar6); //AggregateResult:{expr0=47}
        
        AggregateResult ar7 =[SELECT Count(Amount) FROM Opportunity];
         system.debug('result is= '+ar7); //{expr0=31}
        //will return the  number of opportunities having value in amount field
        //and will not include the opportunity records having amount as null
        
        //***Avg
        AggregateResult ar8= [SELECT Avg(Amount) From Opportunity];//will return the average amount of all the opportunities
        system.debug('result is= '+ar8); //{expr0=185806.4516129032}
        
        // ****Count Distinct****
        AggregateResult ar9=[SELECT Count_Distinct(Amount) from Opportunity];
       system.debug('result is='+ar9);//result is=AggregateResult:{expr0=21}
        //will return the number of opportunity records having unique amount value
        //and will also not include opportunities having null value in amount field
        
        
        //To acces the value from aggregate Result object 
        integer i2=(Integer)ar9.get('expr0');
        system.debug('integer='+i2);
    }
    }