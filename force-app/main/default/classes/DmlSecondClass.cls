public class DmlSecondClass {
    
        public Static Void myMethod()
        {
          //********Insert*****//
          

        //*****Insert an Account and associated Contacts & Opportunities
        
     Account a = new Account (Name='HARF SAINI',NumberOfEmployees=2000 );
            insert a;
            
            //Associated Contacts
            Contact c=new Contact(firstName='GARF',lastName='SAINI',accountId=a.Id);
            Contact c1= new Contact(FirstName='AARF',LastName='SAINI',accountId=a.Id);
            
            list<Contact> ConList=new list<Contact>();
            Conlist.add(c);
            Conlist.add(c1);
            
            insert conlist;
            
            
            //Associted Opportunities 
            Date d = Date.today()+30;
            //date d1=Date.newInstance(2022, 01, 26);
            
            Opportunity o=new Opportunity (Name='Sell Mobile Battery',StageName='Prospecting',closeDate=d,accountId=a.Id);
            Opportunity o1=new Opportunity (Name='Sell Laptop',StageName='Prospecting',closeDate=d,accountId=a.Id);
            
            List<Opportunity> oppList=new list<Opportunity>();
            
            oppList.add(o);
            oppList.add(o1);
            insert oppList;
            
            
        }
    
}