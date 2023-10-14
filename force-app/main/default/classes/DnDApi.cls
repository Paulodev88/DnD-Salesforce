public with sharing class DnDApi {

    
    public static HTTPResponse ApiCallOut(String ctx) {

        String url = 'https://www.dnd5eapi.co' + ctx;
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res;

    }
}