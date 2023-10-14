public with sharing class DnDHabilidadesService {

    @future(callout=true)
    public static void DnDHabilidadesService() {

        HTTPResponse res = DnDApi.ApiCallOut('/api/ability-scores');

        if (res.getStatusCode() == 200) {
           
            List<Map<String, Object>> items = (List<Map<String, Object>>)apiData.get('values');
            Set<String> keys = new Set<String>(apiData.keySet());            
           
            System.debug(indices);
            // List<Habilidade__c> existingEndPoint = [SELECT Id, ID_Externo__c FROM Habilidade__c WHERE ID_Externo__c in :keys]; 
            // List<Habilidade__c> insertEndPoint = new List<Habilidade__c>();
            // List<String> chk_insert = new List<String>();

            // for(EndPoint__c endp : existingEndPoint){
            //     chk_insert.add(endp.ID_Externo__c);
            // }

            for (String key : keys) {

                System.debug(apiData.get(key));
                
            }

            // if(!insertEndPoint.isEmpty()){
            //     insert insertEndPoint;
            // }else {
            //     System.debug('Vazio');
            // }

            
        }
         else {
             // Trate erros, registre mensagens de log, etc.
             System.debug('Erro ao buscar dados da API: ' + res.getBody());            
         } 

    }
}