trigger SecondTrigger on Opportunity (before update) {
    // ****** Context Variable*****
    // 
    // 2.) Trigger.Old
    
    //Only available in Update and Delete Triggers
    
    for (Opportunity oldOpp:Trigger.old)
    {
        for(opportunity newOpp:trigger.New)
        {
            if(oldOpp.id== newOpp.id && oldOpp.Name!= newOpp.Name)
              //  newOpp.Name.addError('Name cannot be changed');// it will display error on amount field of opportunity
                newOpp.addError('Dont chane Name Field');// it willdisplay error on page 
        }
    }

}