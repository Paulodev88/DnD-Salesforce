public with sharing class EndPointTH extends TriggerHandler  {
    
    private List<EndPoint__c> newList;
    private List<EndPoint__c> oldList;
    private Map<Id, EndPoint__c> newMap;
    private Map<Id, EndPoint__c> oldMap;

    public EndPointTH() {
        this.newList = (List<EndPoint__c>) Trigger.new;
        this.oldList = (List<EndPoint__c>) Trigger.old;
        this.newMap = (Map<Id,EndPoint__c>) Trigger.newMap;
        this.oldMap = (Map<Id,EndPoint__c>) Trigger.oldMap;
        
        if(this.oldList == null) this.oldList = new List<EndPoint__c>();
        if(this.oldMap == null) this.oldMap = new Map<Id, EndPoint__c>();

    }
    
    protected override void beforeInsert(){
        DnDExternalID dnDExternalID = new DnDExternalID(this.newList);
        dnDExternalID.run();
    }
    
    // protected override void beforeUpdate(){}
    
    // protected override void beforeDelete(){}
    
    // protected override void afterInsert(){}
    
    // protected override void afterUpdate(){}
    
    // protected override void afterDelete(){}
    
    // protected override void afterUndelete(){}

}