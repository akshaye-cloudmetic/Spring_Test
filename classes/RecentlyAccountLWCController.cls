public class RecentlyAccountLWCController {
    @AuraEnabled
    public static List<Account> recentlyAccounts(){
        try{
            return [Select id,Name,Type,Number_of_Contacts__c from Account Order By CreatedDate DESC LIMIT 10];
        }
        catch(Exception Ex ){
            throw new AuraHandledException(Ex.getMessage());
        }
    }
}