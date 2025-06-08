trigger ApexTrigger on Account (before  insert, after insert,before update, after update ) {
    if(Trigger.isInsert){
        
        if(Trigger.isBefore){
           HelperClass.myMethod(trigger.new); 
        
        }else if(Trigger.isAfter){
            HelperClass.createRelatedOpp(trigger.New);
        }
        
    }
    if(Trigger.isUpdate ){
        
        if(trigger.isBefore){
            HelperClass.updatePhoneDescription(Trigger.New,Trigger.oldMap);
        }else If(Trigger.isAfter){
           HelperClass.updateRelatedOppPhone(Trigger.New,Trigger.oldMap);
        }
    }
    
}