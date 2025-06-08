public class DatabaseClass1 {
    Public Static void myMethod(){
        // update contact phone and custom Opportunity phone field 
        list<Account>AccList=[Select ID, Name,Phone,(Select Name,ID,Phone From Contacts ),(Select ID,Name From Opportunities )  From Account];
        list<Contact>ConList=new List<Contact>();
        List<Opportunity>OppList=new List<Opportunity>();
        for (account a:AccList)
        {
            if(a.Phone!=Null){
                for(Contact c:a.Contacts){
                    c.Phone=a.Phone;
                    ConList.add(c);
                }
                for(opportunity o:a.Opportunities){
                    o.Type='New Customer';
                    o.Phone__c=a.Phone;
                    OppList.add(o);
                }
            }
        }
        update ConList;
        update OppList;
            /* 
        list<Contact> ConList= new List<Contact>();
        for(integer i=0;i<10;i++){
            if(i==5)
                conlist.add(new Contact());
            else 
                conlist.add(new Contact(lastName='ABC'+i));
            //insert conlist; //throws Dml exception
            Database.insert(ConList,false);
        }

        list<Contact> Conlist = [Select Name From Contact where Name Like 'ABC%'];
        for(contact c:Conlist){
            c.Phone='123456780';
            c.Email='Garf8800@gmail.com';
        }
        contact c= new Contact();
        conlist.add(c);
        Database.upsert(Conlist,false) ;
 

       // Lead Conversion
        lead l = [select Name,Id From lead Where Name Like '%STAR' Limit 1];
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.Id);
        system.debug('ID of record Inserted is '+l.id);
        lc.convertedstatus='Closed - Converted';
        lc.ownerid='0055g00000ALcFoAAL';
        
        Database.LeadConvertResult lCr= database.convertLead(lc);
            }
}

        
        /*
        // Create a list Of Contacts
        List<Contact> ConList = new List<Contact>{
            new Contact(FirstName='THOR4',LastName='Avenger'),
                new Contact(FirstName='THOR5',LastName='Avenger'),
                new Contact()};
        
                    // Bulk insert all Contacts with one DML call  
                  
               Database.SaveResult[] srList= Database.insert (ConList,false);//srList means 
        
       // Iterate through each returned result 
        for (Database.SaveResult sr :srList){
            if (sr.isSuccess()){
                // operation was successful , so we get the ID of the record that was processed
                system.debug('Succesfully Inserted Contact , ContactId:'+sr.getId());
            }else {
                // Operation failed,so get all errors
                for(Database.Error err : sr.getErrors()){
                    system.debug(err.getStatusCode()); //required Fields Are missing
                    system.debug(err.getMessage()); // required fields are missing (lastName)
                    system.debug('Contact Fields that affected this error:'+err.getFields()); //LastName (it will display only fields)
                }
            }
        }

    }
}

*/
    }
}