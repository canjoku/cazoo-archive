HttpCalloutUtility.HttpCalloutSettings calloutSettings = new HttpCalloutUtility.HttpCalloutSettings();

calloutSettings.verb = 'POST';
calloutSettings.endpointOrNamedCredential = 'callout:CazooArchive';
calloutSettings.requestBody = JSON.serialize(new Map<String, String> {'parentId' => '500xxxxx'});

HttpCalloutUtility.HttpCalloutResponse response = new HttpCalloutUtility(calloutSettings).performRequest();

List<ResponseDTO> responseObject = ResponseDTO.parse(response.httpResponseBodyAsString);

System.debug(responseObject[0]);
System.debug(responseObject[1]);
System.debug(responseObject[2]);
System.debug(responseObject[3]);


