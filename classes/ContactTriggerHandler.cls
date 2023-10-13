public class ContactTriggerHandler {
    
    public static void processAfterOperation(List<Contact> newContactList , Map<id,Contact> contactOldMap){
        Set<Id> accountIdSet = new Set<Id>();
        for(Contact contactObj : newContactList){
            if(contactObj.AccountId != null && (contactOldMap == null || contactOldMap.isEmpty() ) ){
                accountIdSet.add(contactObj.AccountId);
            }
            else if(contactOldMap != null && !contactOldMap.isEmpty() && contactObj.AccountId != contactOldMap.get(contactObj.Id).AccountId )
            {
                if(contactObj.AccountId != null ){
                    accountIdSet.add(contactObj.AccountId);
                }
                if(contactOldMap.get(contactObj.Id).AccountId != null ){
                    accountIdSet.add(contactOldMap.get(contactObj.Id).AccountId);
                }
            }
        }
        
        if(!accountIdSet.isEmpty()){
            List<Account> accountList = new List<Account>();
            for(Account accountObj : [Select id,Number_of_Contacts__c ,(Select id from Contacts) from Account where Id In:accountIdSet])
            {
                accountObj.Number_of_Contacts__c = accountObj.Contacts.size();
                accountList.add(accountObj);
            }
            if(!accountList.isEmpty()){
                update accountList;
            }
        }
    }
}