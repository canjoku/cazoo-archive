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
}
