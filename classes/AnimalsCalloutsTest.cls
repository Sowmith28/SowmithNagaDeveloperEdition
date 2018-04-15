@isTest
private class AnimalsCalloutsTest {

    @isTest static void testGetCallout(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type','application/Json;charset:UTF-8');
        Test.setMock(HttpCalloutMock.class,mock);
        HttpResponse response = AnimalsCallouts.HttpCalloutGet();
    }
    @isTest static void testGetCallout1(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(404);
        mock.setHeader('Content-Type','application/Json;charset:UTF-8');
        Test.setMock(HttpCalloutMock.class,mock);
        HttpResponse response = AnimalsCallouts.HttpCalloutGet();
    }
}