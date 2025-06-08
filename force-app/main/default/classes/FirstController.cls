public class FirstController
{
  Public String AccName;
    Public Integer accEmployees{get;set;}  
    Public String conName{get;set;} 
    Public String conEmail{get;set;} 
    public String oppName{get;set;} 
    Public Decimal oppAmount{get;set;} 
    Public String oppStage {get;set;}
    
    
    public void saveTheRecord()
    {
        Account a = new Account(Name=AccName, NumberOfEmployees=accEmployees);
        insert a;
        
        Contact c= new Contact (lastName=conName, email=conEmail, accountid=a.id);
       
        Opportunity o = new Opportunity(Name=oppName, Amount= oppAmount, accountid=a.id, StageName=oppStage, CloseDate= System.today());
        insert c;
        insert o;
    }
    public void setAccName(String a)
    {
        AccName=a;
    }
    Public string getAccName()
    {
        return AccName;
    }
}