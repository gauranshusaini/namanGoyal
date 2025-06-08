public class FourthClass {
    public static void myMethod(){
        //    **** SOQL KEYWORDS********
                                       //*****IN KEYWORDS
        //with List
        //
        List<String> nameList = new List<String>{'RITIK SAINI','GAURANSHU SAINI','monty'};
            List<Contact> conList1 = [SELECT firstName,lastName,email FROM Contact WHERE name IN:nameList];
        
        system.debug('namelist'+conList1);//namelist(Contact:{FirstName=RITIK, LastName=SAINI, Email=ritik@gmail.com, Id=0035g00000GBgZFAA1},
        //Contact:{LastName=monty, Email=garf8800@gmail.com, Id=0035g00000DOlXgAAL},
        //Contact:{FirstName=GAURANSHU, LastName=SAINI, Email=garf8800@gmail.com, Id=0035g00000FPVGQAA5})
   
        
        //**With Set
        
        Set<ID> idSet = new Set<ID>{'0035g00000DOlXgAAL','0035g00000FPVGQAA5'};
            List<Contact> conList2 = [SELECT firstName,lastName,email FROM Contact WHERE ID IN:idSet];
         system.debug('namelist'+conList2);
        
        //Note: Map Cannot be used with IN keyword because it is not an iterable collection.
        
        
                                          //****NOT KEYWORD*****
    List<Contact> conlist3=[SELECT firstName,lastName,email FROM Contact WHERE name NOT IN:nameList LIMIT 2];
        system.debug('conlist3= '+conlist3);
        
        List<Contact> conList4 = [SELECT firstName,lastName,email FROM Contact WHERE ID NOT IN:idSet LIMIT 3];
         system.debug('namelist'+conList4);
        
        
                                            //****LIKE
        List<Account> accList =[SELECT Name From Account WHERE Name like 'ANKIT1'];
        system.debug('Acclist='+acclist);
        //Wildcards 1. %(Percentage) => 0 or multiple Characters it will query automatically
        //          2._(UnderScore)  => Single Character if you want to query single character so that time we use(_)
        list<Account> accList1 = [SELECT Name from Account Where Name like 'Gauranshu%'];   
        list<Account> accList2 = [SELECT Name from Account Where Name like '%Gauranshu%'];
        list<Account> accList3 = [SELECT Name from Account Where Name like '_auranshu1'];
        system.debug('Acclist='+acclist1);
        system.debug('Acclist='+acclist2);
        system.debug('Acclist='+acclist3);
        
                                       //**** AND / OR
        
        List<Opportunity> oppList1= [Select Name,Amount FROM Opportunity Where Amount >100 AND stageName = 'Qualification'];
        List<Opportunity> oppList2= [Select Name,Amount FROM Opportunity Where Amount >10000 OR stageName = 'Closed-Won'];
        system.debug('Opplist1='+oppList1);
        system.debug('oppList2='+oppList2);
        
        
                  // **** ORDER BY****
                  // List<Opportunity> oppList3=[SELECT Name,Amount From Opportunity];in This SOQL records will display in unorder
                  // if you want to store it in order that time we use order by SOQL keywords &we have to write this code in query editor. 
        List<Opportunity> oppList3=[SELECT Name,Amount From Opportunity ORDER BY Amount];
        //return the list of opportunities sorted by the amount in ascending order 
        system.debug('oppList3'+oppList3);
        
        List<Opportunity> oppList4=[SELECT Name,Amount From Opportunity ORDER BY Amount ASC];
        // same as Above
        
        List<Opportunity> oppList5=[SELECT Name,Amount From Opportunity ORDER BY Amount DESC];
        //return the list of opportunities sorted by the amount in descending order 
        
        List<Opportunity> oppList6=[SELECT Name,Amount From Opportunity ORDER BY Amount NULLS FIRST];
        //return the list of opportunities sorted by the amount and having nulls first(default)
        
        List<Opportunity> oppList7=[SELECT Name,Amount From Opportunity ORDER BY Amount NULLS LAST];
         //return the list of opportunities sorted by the amount and having nulls last(default)
        
        List<Opportunity> oppList8=[SELECT Name,Amount From Opportunity ORDER BY Amount DESC NULLS LAST];
        
                        //**** GROUP BY ****
      LIST<AggregateResult> agrOpp1=[Select StageName from Opportunity GROUP BY StageName];
        //This will return all the values we have in stageName Field of Opportunity
        system.debug('agrOpp1'+agrOpp1);
        LIST<AggregateResult> agrOpp2=[Select Count(ID) from Opportunity GROUP BY StageName];
        //will return the total number of opportunities grouped by stage
        //Count() cannot be used with Group  BY we need to put ID or any other field in it 
        LIST<AggregateResult> agrOpp3=[Select StageName,Count(ID) from Opportunity GROUP BY StageName];
        //We can only include the field in the query by which we are grouping the result
         LIST<AggregateResult> agrOpp4=[Select StageName,Max(Amount) from Opportunity GROUP BY StageName];
        // will return the maximum amount within that particular stage
                 LIST<AggregateResult> agrOpp5=[Select StageName,Max(Amount),Sum(Amount) from Opportunity GROUP BY StageName];
        
        //We can use below mentioned aggregate functions with GROUP BY,Like;
        // 1.AVG()
        // 2.COUNT()
        // 3.MIN()
        // 4.MAX()
        // 5.SUM()
        // 6.COUNT_DISTINCT()
         
        //****LIMIT *****
        
        List<Account> acclist4 = [Select Name From Account LIMIT 10];
        // will return only 10 Accounts you can see in query editor
        
        List<Account> accList5=[Select Name from Account LIMIT 1];
        //THIS LIST will have only 1 sObject 
        
       // Account a=[SELECT Name FROM Account Limit1];
        // THIS QUERY will only return only one sObject
         
        //  *** FOR UPDATE ***
        List<Account>  accList6 = [Select Name FROM Account FOR UPDATE];
        // for update keyword we use when two user are inserting or updating same records so that time we use for update keyword 
        // from which only one user can update the record because for another user it will be lock
         
        // ***** ALL ROWS****
        List<Account> accList7=[Select Name FROM Account All ROWS];
        //This will return all the account object records including the deleted ones .in query editor it will not work
        
        List<Account> accList8=[Select Name From Account where isDeleted=true All ROWS];
        //This will return all the deleted account object records.
        
        List<Account> accList9=[Select Name From Account where isDeleted=true];
        //This will not return any record as we have not used ALL ROWS keyword.
        
        
        //******** DATE LITERALS ******
        List<Account> accList10;
        //****** YESTERDAY******
        accList10=[Select Name From Account Where CreatedDate=yesterday];
        system.debug('yesterday Record:'+accList10);
       
        //****** TODAY******
        List<Account> accList11;
        accList11=[Select Name From Account Where CreatedDate=today];
        system.debug('yesterday Record:'+accList11);
        
        //****** TOMORROW******
        List<Account> accList14;
        accList14=[Select Name From Account Where CreatedDate=today];
        system.debug('yesterday Record:'+accList14);
        
        //*****last_week/last_Month*****
        List<Account> accList12;
        accList12=[Select Name From Account Where CreatedDate=last_week];
        system.debug('yesterday Record:'+accList12);
         List<Account> accList13;
        accList13=[Select Name From Account Where CreatedDate=last_month];
        system.debug('yesterday Record:'+accList13);
        
        //**** RELATIONSHIP QUERIES *****
        //There are Two Types of relationship Queries:
        //1.child To Parent Queries 
        //2.Parent To Child Queries
        
        //****** CHILD TO PARENT RELATIONSHIP*****
             // ***** STANDARD OBJECT *******
            list<contact> conList5 = [Select firstName,lastName,Account.Name,Account.NumberOfEmployees From Contact ];
        system.debug('Child to Parent Record='+conlist5);
        list<contact> conList6 = [Select firstName,lastName,Account.Name,Account.NumberOfEmployees From Contact where Account.Name!=null AND Account.NumberOfEmployees!=null];
        system.debug('Child to Parent Record='+conlist6);
         
      // ****** CUSTOM OBJECT*****
      List<Student__c> std1=[Select Name,E_mail__c,ROLL_NO__c,School__r.Name FROM Student__c];
       
                //****** PARENT TO CHILD RELATIONSHIP*****
             // ***** STANDARD OBJECT *******
             List<Account> acclist15=[Select Name,NumberOfEmployees,(Select lastName,Phone From Contacts)From Account];
       //dont write contact , we have not to write object name we have to write child relationship name
        // Here Contacts is the Child-Relationship Name
        // &
        // (Select lastName,Phone From Contacts) is a subquery / innerquery
        //       // ****** CUSTOM OBJECT*****
        List<student__c> stdlist5=[select Name,ROLL_NO__c,E_mail__c,(Select Book_Name__c,Price__c From Books__r)  from student__c] ; 
        //Here Books is the child relationship name which needs to appended with __r in case of a custom field
        //&
        //(Select Book_Name__c,Price__c From Books__r) is a subquery/ innerquery
        
        //**** MULTI-LEVEL RELATIONSHIPS
        // ****Child to Parent *****
        // **** Standard Object *****
        // 1st Option
        list<opportunityLineItem> oppLineList =[Select Name,Quantity,opportunity.Name,Opportunity.Amount,Opportunity.Account.Name,Opportunity.Account.NumberOfEmployees From opportunityLineItem ];
        
        //2nd Option 
        list<Opportunity>oppList11=[Select Name,Amount,Account.name,Account.NumberOfEmployees,(select Name,Quantity From OpportunityLineItems) From Opportunity];
        //In Soql You can traverse up to maximum of five levels when quering data from child object to parent.
        
        //**** Custom Object ****
        //1st Option
        list<Book__c>Book1=[select 	Book_Name__c,Price__c,student__r.Name,student__r.E_mail__c,student__r.school__r.Name from Book__c];
        system.debug('Book1='+Book1);
        // 2nd Option
        list<student__c>std11=[Select Name,E_mail__c,school__r.Name,( Select Book_Name__c,Price__c From Books__r ) From student__c]; 
        
        
        //***** Parent to Child******
        //
        //Note:A subquery cannot have a subquery inside it.
        //[select Name,(Select Name,Amount,(Select Name from OpportunityListItems) From Opportunity)From Accounts];
        //Above query is not allowed.
        //
        //Select Name,NumberOfEmployees,(Select Name, Amount From Opportunities),(select firstName,lastName from Contacts) from Account
        // we can write two subquery inside the query like this but we can write any subquery inside the subquery of query.
        // check it in query editor
    }
}