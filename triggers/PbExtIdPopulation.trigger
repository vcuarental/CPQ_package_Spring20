trigger PbExtIdPopulation on Pricebook2 (before insert) {
    for (Pricebook2 pb_i : Trigger.new){
        pb_i.External_Id__c = pb_i.Name + pb_i.IsActive + pb_i.IsStandard;
    }
    
}