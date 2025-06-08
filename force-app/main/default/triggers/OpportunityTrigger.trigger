trigger OpportunityTrigger on Opportunity (after insert,after update,after delete) {
             
    if(Trigger.isAfter){
        if(Trigger.isInsert){
         //  Opportunity.onAfterInsert (Trigger.new);
        }else if(Trigger.isUpdate){
           // Opportunity.onAfterUpdate(Trigger.New,Trigger.OldMap);
        }else if(Trigger.isDelete){
           // Opportunity.onAfterDelete0(Trigger.Old);
        }
    }
}