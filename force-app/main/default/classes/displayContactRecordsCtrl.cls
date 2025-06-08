public class displayContactRecordsCtrl {{}
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactRecords(){
        List<Contact> conList=[Select firstName,LastName,Phone,Email,LeadSource From Contact ];
        return conList ;
    }}