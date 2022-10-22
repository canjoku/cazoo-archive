@IsTest
private class HttpCalloutUtility_Test {
    
    @IsTest
    static void setCalloutSettings_isSuccessful() {
        HttpCalloutUtility.HttpCalloutSettings calloutSettings = new HttpCalloutUtility.HttpCalloutSettings();
        calloutSettings.verb = 'POST';
        calloutSettings.endpointOrNamedCredential = TestFactory.apiBase;
        calloutSettings.requestBody = TestFactory.createRequestBody();
        RequestDTO requestBodyObject = RequestDTO.parse(calloutSettings.requestBody);

        System.assertEquals('POST', calloutSettings.verb, 'Method is set');
        System.assertEquals('callout:CazooArchive', calloutSettings.endpointOrNamedCredential, 'end point is set');
        System.assertEquals('200xxxxx', requestBodyObject.parentId, 'parent Id is set');
        System.assertEquals(30, calloutSettings.timeOutInSeconds, 'time out is set');
        System.assertEquals(false, calloutSettings.gzipRequest, 'gzip request is set');
    }

    @IsTest
    static void performRequest_isSuccessful() {
        HttpCalloutUtilityMock mock = new HttpCalloutUtilityMock(TestFactory.statusCode, TestFactory.status, TestFactory.createTestResponse(), TestFactory.createResponseHeaders());
        HttpCalloutUtility.HttpCalloutSettings calloutSettings = new HttpCalloutUtility.HttpCalloutSettings();

        calloutSettings.verb = 'POST';
        calloutSettings.endpointOrNamedCredential = TestFactory.apiBase;
        calloutSettings.requestBody = TestFactory.createRequestBody();
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        final HttpCalloutUtility.HttpCalloutResponse response;
        response = new HttpCalloutUtility(calloutSettings).performRequest();
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertEquals(true, response.isSuccessful);
        System.assertNotEquals(null, response.httpResponseHeaders);
    }
}
