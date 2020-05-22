global class PopulatePricebookEntryExternalId Implements Schedulable{
    global void execute(SchedulableContext sc){
        setPBentExtId();
    }
    
    public void setPBentExtId(){
        List<Pricebookentry> pbentrylist2upd = [SELECT Id, Name, External_Id__c, Product2.External_Id__c,Pricebook2.External_Id__c 
                                                from Pricebookentry 
                                                where CreatedDate >:Datetime.now().addMinutes(-15)];
        if (pbentrylist2upd != NULL){
            for (Pricebookentry pbe_i : pbentrylist2upd){
                pbe_i.External_Id__c = pbe_i.Product2.External_Id__c + pbe_i.Pricebook2.External_Id__c;
            }
            update pbentrylist2upd;
        }
    }
}