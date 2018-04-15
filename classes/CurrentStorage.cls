public class CurrentStorage {

@Future(callout=true)
public static void getStorage() {

 //String sid = Login.login('Sowmith.naga28@gmail.com', 'amma!288WxwhlZIrHcIhJAdFKE5odMWFq');
String sid = '00D28000001H1EN!AQcAQHwwWKOh81mKc9uZM81JOsAKsNBY6_Vu6QZKVLCmnmMekog6Be7klKDfT3ty8XchahCVAdaxyT1tQt7SAog6pYrCH6Sq';
HttpRequest req = new HttpRequest();

req.setMethod('GET');
req.setEndpoint('https://na2.salesforce.com/services/data/v36.0/limits');
req.setHeader('Authorization', 'OAuth' + sid);

Http http = new Http();

HTTPResponse res = http.send(req);
System.debug('res'+res);
System.debug('res.getBody()'+res.getBody());
Map<String, Object> m = (Map<String,
Object>)JSON.deserializeUntyped(res.getBody());
Map<String, Object> dataStorage = (Map<String,
Object>)m.get('DataStorageMB');

System.debug('Current Storage: ' + dataStorage.get('Remaining'));
return;
}

}