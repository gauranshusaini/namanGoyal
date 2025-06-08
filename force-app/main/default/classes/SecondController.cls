public class SecondController {
    
    Public string searchText{get;set;}
    public list<Account> accList {get;set;}
    
    
     public void search()
     {
         searchText= searchText+'%';
         accList=[Select Name,NumberOfEmployees From Account where Name like :searchText];
     }

}