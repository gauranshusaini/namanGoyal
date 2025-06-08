public class HelperClass {
    Public Static void myMethod (list<Account>newList ){
     
        for(Account acc: newlist){
            if(acc.Industry !=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }else{
                acc.Rating='Cold';
            }
                
        }
         
    }
    Public static void createRelatedOpp(List<Account>newList){
        list<Opportunity> oppToBeInserted = new List<Opportunity>();
        
        for(account acc: newList){
            opportunity Opp= new opportunity();
            opp.Name = acc.Name;
            opp.AccountId=acc.Id;
            opp.StageName='Prospecting';
            opp.CloseDate=(system.today()+7);
            oppToBeInserted.add(opp);
        }
        insert oppToBeInserted;
    }
    Public static void updatePhoneDescription(List<Account>newList,Map<Id,Account>oldMap){
        for(Account acc: newList){
            if(oldMap!=null && acc.Phone!=oldMap.get(acc.Id).Phone){
                acc.Description='Phone is  modified on Account';
            }
        }
    }
    Public static void updateRelatedOppPhone(List<Account>newList,Map<Id,Account>oldMap){
        
        Map<Id,Account> accIdToAccountMap = new Map<Id,Account>();
        List<Opportunity>oppList = New List<Opportunity>();
        List<Opportunity> oppToBeUpdated = new List<Opportunity>();
        
        for(Account acc: newList){
            if(oldMap!=null && acc.Phone!=oldMap.get(acc.Id).Phone){
                accIdToAccountMap.put(acc.Id, acc);
            }
        }
        oppList= [Select Id,Phone__c,AccountId From opportunity Where AccountId IN :accIdToAccountMap.keySet()];
        for(opportunity opp:oppList){
            opportunity oppor = new Opportunity();
            if(accIdToAccountMap.containsKey(opp.AccountId)){
                oppor.Id=opp.Id;
                oppor.Phone__c=accIdToAccountMap.get(opp.AccountId).Phone ;
                oppToBeUpdated.add(oppor);
            }
        }
        update oppToBeUpdated;
    }
}