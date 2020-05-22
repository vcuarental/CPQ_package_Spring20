@isTest 
public class TestPopulatePricebookEntryExternalId {
    
    @isTest static void executeTest(){
        Product2 test_prod2 = new Product2();
        test_prod2.Name = 'Test Prod2';
        test_prod2.Family = 'None';
        test_prod2.ProductCode ='1234';
        test_prod2.External_Id__c = test_prod2.Name + test_prod2.Family + test_prod2.ProductCode;
        
        Pricebook2 standardPb = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );      
        insert test_prod2;
        standardPb.External_Id__c = standardPb.Name + standardPb.IsActive + standardPb.IsStandard;
        update standardPb;
        
        
        PricebookEntry pbe = Utils_Product2PB2PBE.createPricebookEntry(standardPb,test_prod2);
        
        SchedulableContext sc = null;
        PopulatePricebookEntryExternalId tsc = new PopulatePricebookEntryExternalId();
        tsc.execute(sc);
        
    }  
    
    
}