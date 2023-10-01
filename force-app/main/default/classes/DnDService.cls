public with sharing class DnDService {
    public DnDService() {

        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.dnd5eapi.co/api/');
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
       

    }
}