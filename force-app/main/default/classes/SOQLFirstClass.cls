public class SOQLFirstClass {
    Public Static void myMethod(){
        List<Account>accList= [SELECT Name,NumberOfEmployees FROM Account];
        system.debug('Acclist='+accList);
        for(integer i=0; i<accList.size();i++)
        {
            system.debug('accName='+accList[i].Name+'NumberOfEmp'+accList[i].NumberOFEmployees);
        }
        for(Account a:accList)
        {
            system.debug('accName='+a.Name+'NumberOfEmployees='+a.NumberOfEmployees);
        }
    }
    
}