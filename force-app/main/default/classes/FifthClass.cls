// ***** SOSL *****
public class FifthClass {
    Public static void myMethod()
    {
       // list<List<sObject>> l=[Find 'Volkswagen'];
       // the above statement will give an error, in apex code it is necesaary to specified returning (any entity/OBJECT) 
       // SOSL in apex needs to have the entities/objects specified
       
        List<List<sObject>> l1=[Find 'GARF' Returning Account,Contact];
        system.debug('SOSL= '+l1);
        
        // Return Specified Fields
                List<List<sObject>> l2=[Find 'GARF' Returning Account(Name,NumberOfEmployees),Contact(Name,Phone)];
        system.debug('SOSL= '+l2);
        
        // How to Access records In apex returned by SOSL
        List<Account> accList = l2[0];
        List<Contact> conList = l2[1];
        
        for(Account a: accList)
        {
            system.debug(a.Name);
            system.debug(a.NumberOfEmployees);
        }
        for(Contact c: conlist)
        {
            system.debug(c.Name);
            system.debug(c.Phone);
        }
        /* 
                 **** Search in specified fields (SEARCH GROUP)****
        1) All Fields (By Default)
        2) Name Fields 
        3) Email Fields
        4) Phone Fields 
        5) Sidebar Fields 
      */
        
        /******* All Fields ******/
        list<List<sObject>> sList = [Find 'Test' IN All FIELDS RETURNING Account, Contact];
        
        list<Account> aList = sList[0];
        list<Contact> cList = sList[1];
        for (Account a: aList)
        {
            system.debug(a);
        }
        for(Contact c:Conlist)
        {
            System.debug(c);
        }
       
        
        /**** Name Fields *****/
        List<List<sObject>> results = [Find 'Gaur*' IN Name Fields Returning Account (Name,BillingCountry),Contact(FirstName,LastName)];
            list<Account> accountsList =results[0];
        system.debug(accountsList[0].Name);
        
        
        /***** Email Fields*****/
        List<List<sObject>> sList1 = [Find '*com' IN EMAIL FIELDS Returning Contact(FirstName,LastName,Email)];
        List<Contact> con1= sList1[0];
        system.debug(con1[0].Email);
        
        /***** Sidebar Fields ****/
        List<List<sObject>> sObList = [Find '(336) 222-7000' IN Phone Fields Returning Contact(FirstName,LastName,Phone)];
        system.debug(sObList);
        
        
        /****** Sidebar Fields *******/
        List<List<sObject>> sObList2= [Find '(336) 222-7000' IN SIDEBAR Fields Returning Contact(FirstName,LastName,Phone)];
        system.debug(sObList2);
        
        
        
        /********   WildCards In SOSL ********/
        
        
        // 1) *(Asterisk) => 0 or N number of Characters
        List<List<sObject>> sList2 = [Find 'Gaur*' IN NAME FIELDS RETURNING Account, Contact];
        
        // will return the records which have 'gaur' appended by anything
        
        // 2) ? (Question Mark) => A Single Character 
        List<List<sObject>> sList3 = [Find 'Jo?n' Returning Account , Contact ]; 
        //  will return the records which have any character at the place of? in "Jo?n" 
          
        
        
        //  ***** Clauses in SOSL *****/
        
        // WHERE Clause 
        List<List<sObject>> sList4 = [Find 'gaur*' IN NAME FIELDS RETURNING Account(Name, BillingCountry WHERE CreatedDate<Today),Contact,Student__c(Name Where Name!=null)];
        
            // NOTE: while using any clause,you must include a field list with atleast one specific field.
               
        
        
        
            // ORDER BY Clause
            List<List<sObject>> sList5 =[Find 'Gaur' RETURNING Account(Name,Phone WHERE Website!=null ORDER BY Name DESC),Contact(Name ORDER BY Name)];
        
           
        
        
        // LIMIT Clause
           List<List<sObject>> sList6=[Find 'Gaur' Returning Account (Name,Phone Limit 10)];
        
        /***** SOSL Keywords  ***/
        
        //1.OR
        List<List<sObject>> sList8=[Find 'John OR Test' Returning Account, Contact];
        system.debug(slist8);
        
        //2.AND
        List<List<sObject>> sList9=[Find 'John AND Test' Returning Account, Contact];
        system.debug(slist9);
        
        //***** Dynamic SOSL*******
        string str1 = 'Find\'john\'RETURNING Account , Contact';
        List<List<sObject>> sList7 =Search.query(str1);
        
    }

}