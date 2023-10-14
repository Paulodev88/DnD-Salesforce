public with sharing class DnDService {

    @future(callout=true)
    public static void DnDService() {

        HTTPResponse res = DnDApi.ApiCallOut('/api');     
         
        if (res.getStatusCode() == 200) {
           
            Map<String, Object> apiData = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());            
            Set<String> keys = new Set<String>(apiData.keySet());            
            List<EndPoint__c> existingEndPoint = [SELECT Id, ID_Externo__c FROM EndPoint__c WHERE ID_Externo__c in :keys]; 
            List<EndPoint__c> insertEndPoint = new List<EndPoint__c>();
            List<String> chk_insert = new List<String>();

            for(EndPoint__c endp : existingEndPoint){
                chk_insert.add(endp.ID_Externo__c);
            }

            for (String key : keys) {

                EndPoint__c endpoint = new EndPoint__c();
                endpoint.Name = key;
                endpoint.URL__c = (String) apiData.get(key);                
              
                if(!chk_insert.contains(key)){
                    insertEndPoint.add(endpoint);
                }
                
            }

            if(!insertEndPoint.isEmpty()){
                insert insertEndPoint;
            }else {
                System.debug('Vazio');
            }

            
        }
         else {
             // Trate erros, registre mensagens de log, etc.
             System.debug('Erro ao buscar dados da API: ' + res.getBody());            
         }    
 
       

    }
}