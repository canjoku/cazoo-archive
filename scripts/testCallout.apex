HttpCalloutUtility.HttpCalloutSettings calloutSettings = new HttpCalloutUtility.HttpCalloutSettings();

calloutSettings.verb = 'POST';
calloutSettings.endpointOrNamedCredential = 'callout:CazooArchive';
calloutSettings.requestBody = JSON.serialize(new Map<String, String> {'parentId' => '500xxxxx'});

HttpCalloutUtility.HttpCalloutResponse response = new HttpCalloutUtility(calloutSettings).performRequest();

List<ResponseDTO> responseObject = ResponseDTO.parse(response.httpResponseBodyAsString);

System.debug('response Object  ' + responseObject[0]);
System.debug('response Object  ' + responseObject[1]);
System.debug('response Object  ' + responseObject[2]);
System.debug('response Object  ' + responseObject[3]);
System.debug('response Object  ' + responseObject[4]);
