public with sharing class DnDExternalID implements DnDInterfaceTrigger{

    private List<EndPoint__c> endpointList;
    
    public DnDExternalID(List<EndPoint__c> newList) {
        this.endpointList = newList;
    }

    public void run(){        
        if(!this.endpointList.isEmpty()){
            this.preencherIdExterno();
        }

    }

    private void preencherIdExterno(){

        for (EndPoint__c endPoint : this.endpointList) {            
            endPoint.ID_Externo__c = endPoint.Name;
        }
    }

}