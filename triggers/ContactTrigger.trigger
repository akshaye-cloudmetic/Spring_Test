trigger ContactTrigger on Contact (After insert , After update , After delete) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        ContactTriggerHandler.processAfterOperation(trigger.new , null );
    }
    else if(Trigger.isUpdate && Trigger.isAfter){
        ContactTriggerHandler.processAfterOperation(trigger.new , trigger.oldMap );
    }
    else if(Trigger.isDelete && Trigger.isAfter){
        ContactTriggerHandler.processAfterOperation(trigger.old , null );
    }
}