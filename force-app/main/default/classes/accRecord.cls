public class accRecord {
    @AuraEnabled
    public static String insertRecord(Account acc){
        system.debug('Account :: '+acc);
        insert acc ;
        return acc.id;
    } 

}