public with sharing class displayContactCtrl {
    @AuraEnabled(Cacheable=true)
    public static List<Contact> getContactRecords(){
        List<Contact> conList=[Select firstName,LastName,Phone,Email,LeadSource From Contact ];
        return conList ;

}
}

// Display Account Records in your org