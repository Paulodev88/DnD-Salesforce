trigger EndPointTrigger on EndPoint__c (before insert) {
    new EndPointTH().run();
}