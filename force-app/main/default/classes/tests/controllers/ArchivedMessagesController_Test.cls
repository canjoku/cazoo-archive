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

    static void restoreMessage_isSuccessful() {
        Test.startTest();
        Boolean result = ArchivedMessagesController.restoreMessage(TestFactory.externalId, TestFactory.fromAddress, TestFactory.subject, TestFactory.textBody);

        RestoredMessage__c createdMessage = [SELECT externalId__c, fromAddress__c, subject__c, textBody__c FROM RestoredMessage__c LIMIT 1];
        Test.stopTest();

        System.assert(result, true);
        System.assertEquals(TestFactory.externalId, createdMessage.externalId__c);
        System.assertEquals(TestFactory.subject, createdMessage.subject__c);
    }
}