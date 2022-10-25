public with sharing class HttpCalloutUtility {
    
    public inherited sharing class HttpCalloutSettings {

        public String endpointOrNamedCredential { get; set;}
        public String requestBody { get; set;}
        public String verb { get; set;}
        public integer timeOutInSeconds {get; set;}
        public Boolean gzipRequest {get; set;}

        public HttpCalloutSettings() {
            this.timeOutInSeconds = 300;
            this.gzipRequest = false;
        }
    }

    public inherited sharing class HttpCalloutResponse {

        public Boolean isSuccessful {get; set;}
        public List<String> httpResponseHeaders {get; set;}
        public Integer httpResponseStatusCode {get; set;}
        public String httpResponseBodyAsString {get; set;}

        public HttpCalloutResponse() {
            this.isSuccessful = false;
            this.httpResponseHeaders = new List<String>();
        }
    }

    @testVisible
    protected HttpCalloutSettings calloutSettings;

    public HttpCalloutUtility(HttpCalloutSettings calloutSettings) {
        this.calloutSettings = calloutSettings;
    }

    public HttpCalloutResponse performRequest() {
        HttpCalloutResponse returnResponse = new HttpCalloutResponse();
        Boolean isCalloutPossible = false;

        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();

            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.endpointOrNamedCredential)) {
                request.setEndpoint(this.calloutSettings.endpointOrNamedCredential);
            }

            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.verb)) {
                request.setMethod(this.calloutSettings.verb);
            } 

            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.requestBody)) {
                request.setBody(this.calloutSettings.requestBody);
            }
            
            HttpResponse response = null;

            iscalloutPossible = (this.calloutSettings != null && (!String.isBlank(this.calloutSettings.verb) || !String.isBlank(this.calloutSettings.endpointOrNamedCredential)));

            if(isCalloutPossible) {
                response = http.send(request);
                returnResponse.httpResponseStatusCode = response.getStatusCode();
                returnResponse.httpResponseBodyAsString = response.getBody();
                if (response != null) {
                    for (String s : response.getHeaderKeys()) {
                        returnResponse.httpResponseHeaders.add(s + ': ' + response.getHeader(s));
                    }
                }
            }
            
        }
        catch (Exception ex){
            throw ex;
        }

        finally {
            returnResponse.isSuccessful = ((isCalloutPossible == true) && (returnResponse.httpResponseStatusCode != null && String.valueOf(returnResponse.httpResponseStatusCode).startsWithIgnoreCase('2') == true));
        }

        return returnResponse;
    }

}