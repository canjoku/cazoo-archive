public with sharing class ArchivedMessagesController {

    @AuraEnabled
    public static List<ResponseDTO> getMessages(String parentId){
        List<ResponseDTO> responseObject = new List<ResponseDTO>();
        HttpCalloutUtility.HttpCalloutSettings calloutSettings = new HttpCalloutUtility.HttpCalloutSettings();

        calloutSettings.verb = 'POST';
        calloutSettings.endpointOrNamedCredential = 'callout:CazooArchive';
        calloutSettings.requestBody = JSON.serialize(new Map<String, String> {'parentId' => parentId});

        try {
            HttpCalloutUtility.HttpCalloutResponse response = new HttpCalloutUtility(calloutSettings).performRequest();
            responseObject = ResponseDTO.parse(response.httpResponseBodyAsString);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return responseObject;
    }

    @AuraEnabled
    public static Boolean restoreMessage(final String externalId, String fromAddress, String subject, String textBody){
        Boolean result = false;
        try {
            RestoredMessage__c newMessage = new RestoredMessage__c();
            newMessage.externalId__c = externalId;
            newMessage.fromAddress__c = fromAddress;
            newMessage.subject__c = subject;
            newMessage.textBody__c = textBody;
            insert newMessage; 

            result = true;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return result;
    }
}