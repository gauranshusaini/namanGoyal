trigger OppTrigger on Opportunity (before insert,before update ) {
    if(Trigger.isInsert && Trigger.isBefore){
        for(Opportunity opp:Trigger.New){
            if(opp.stageName=='Closed WON'){
                if(opp.NextStep=='Null'){
                    opp.addError('Next Step Cant be Null');
                }
                
            }
        }
    }

}