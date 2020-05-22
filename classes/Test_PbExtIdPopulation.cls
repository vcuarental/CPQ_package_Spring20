@isTest 
public class Test_PbExtIdPopulation {
     @isTest static void pb2ExtId(){
        Test.startTest();
        Pricebook2 new_pb = new Pricebook2(Name='Test Pricebook', IsActive=true); 
        Database.SaveResult result = Database.insert(new_pb);
        Test.stopTest();
        Pricebook2 savedPB2 = [SELECT Id, Name, External_Id__c from Pricebook2 where Id =: result.getId()];
        system.assertEquals(new_pb.Name + new_pb.IsActive + new_pb.IsStandard , savedPB2.External_Id__c );
    }
}