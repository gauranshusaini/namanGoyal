public class DmlFifthClass {
    public static Void myMethod (){
        List<Contact> cList=[SELECT Name FROM Contact];
        Map<String,ID>m1=new MAP<String,ID>();
            for(Contact c:cList)
            {
                m1.put(c.Name,c.Id);
            }
        List<Contact>UniqList=new List<Contact>();
        List<Contact>DelList=new List<Contact>();
        
        Set<String>s1=m1.keyset();
        Set<Id> UniqSet=new Set<Id>();
        
        for(String s:s1)
        {
            UniqSet.add(m1.get(s));
        }
        for(contact c1:cList)
        {
            if(UniqSet.Contains(c1.Id))
                UniqList.add(c1);
            else
                DelList.add(c1);
        }
        delete delList;
        //*******UNDELETE ******
        //Undelete the lead records which got deleted today 
        list<Contact>deleteContact=[SELECT FIRSTNAME,LASTNAME FROM CONTACT WHERE IsDeleted=true AND LastModifiedDate=TODAY ALL ROWS];
        undelete deleteContact;
       
        //**** MERGE ******
        
        //Merge Only works With Accounts,Leads And Contacts
        
        //Different Merging Combinations:
        // Sobject with Sobject (merge a1a2)
        // sObject with List<sObject>(merge a1accList)
        // sObject With ID(merge a1i)
        // sObject With List<ID>(merge a1IdList)
        
        // NOTE: List<sObject> or List<ID> in above combinations can have maximum 2 sObject or IDs  not more than 2
        // 
        List<Account> accList =[Select NAME FROM ACCOUNT WHERE NAME LIKE 'GAURANSH%' ORDER BY NAME LIMIT 3];
        Account a= accList[0];
        Account b=accList[1];
        Account c=accList[2];
        
        List<Account>Acclist2 = new List<Account>();
        Acclist2.add(accList[1]);
        Acclist2.add(accList[2]);
        
        // merge a b;        // for 2 records
       
        merge a Acclist2;     // for 3 records
        
        //merge a c.id;      //With ID
        
        //*****BEST PRACTICES********
        
        //1. Exceeding the total number of allowed SOQL queries.
        
        //NOT Appropriate 
        
        List<Account> accList3 =[Select ID,Name FROM Account WHERE CreatedDate=THIS_WEEK];
        
        for(Account a1:accList3)
        {
            List<Opportunity> oppList=[Select Name From Opportunity Where AccountId=:a1.id];
            
            for(Opportunity o:oppList)
            {
                system.debug('Opportunity: '+o.Name + 'is on Stage:'+o.StageName);
            }
        }
        
        
        // Approprate Way 
        
        List<Account> accList4 =[Select ID,Name FROM Account WHERE CreatedDate=THIS_WEEK];
        List<Opportunity> oppList1=[Select Name From Opportunity Where AccountId IN:accList4];
        
        for (Opportunity o:OppList1)
        {
                system.debug('Opportunity: '+o.Name + 'is on Stage:'+o.StageName);
            }
        
        
        
        //2. Exceeding the number Of allowed DML Statements.
        
        //NOT Appropriate 
        for(integer i=0; i<100;i++)
        {
            Account acc = new Account(Name ='Acc'+i);
            insert acc ;
        }
        
        
        
        // Appropriate way 
        List<Account> accList6 = new List<Account>();
        
        for(integer i=0; i<100;i++)
        {
            Account acc = new Account(Name ='Acc'+i);
             accList6.add(acc) ;
        }
        
        insert accList6;
    }
}