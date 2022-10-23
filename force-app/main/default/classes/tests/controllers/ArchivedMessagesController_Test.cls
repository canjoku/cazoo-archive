@IsTest
private class ArchivedMessagesController_Test {

    @IsTest
    static void getMessages_isSuccessful() {

        HttpCalloutUtilityMock mock = new HttpCalloutUtilityMock(TestFactory.statusCode, TestFactory.status, TestFactory.createTestResponse(), TestFactory.createResponseHeaders());
        Test.setMock(HttpCalloutMock.class, mock);
        Test.startTest();
        List<ResponseDTO> response = ArchivedMessagesController.getMessages('500xxxxx');
        Test.stopTest();

        System.assertNotEquals(null, response);
        System.assertNotEquals(null, response[0]);
        System.assertEquals(5, response.size());

    }
}