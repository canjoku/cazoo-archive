public with sharing class HttpCalloutUtility {
    

    public inherited sharing class HttpCalloutSettings {

        public String endpointOrNamedCredential { get; set;}
        public String requestBody { get; set;}
        public String verb { get; set;}

        public HttpCalloutSettings() {}

    }

    public inherited sharing class HttpCalloutResponse {

        public Boolean isSuccessful {get; set;}
        public Integer httpResponseStatusCode {get; set;}
        public Integer httpResponseBody {get; set;}

        public HttpCalloutResponse() {}

    }
    @testVisible
    protected HttpCalloutSettings calloutSettings;

    public HttpCalloutUtility(HttpCalloutSettings calloutSettings) {
        if(calloutSettings == null) {
            throw new Globalexceptions.HttpUtilityException('Http callout settings is required');
        }
        this.calloutSettings = calloutSettings;
    }

    public virtual HttpResponse performRequest() {
        HttpCalloutResponse returnResponse = new HttpCalloutResponse();
        Boolean isCalloutPossible = false;

        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.endpointOrNamedCredential)) {
                req.setEndpoint(this.calloutSettings.endpointOrNamedCredential);
            }

            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.verb)) {
                req.setMethod(this.calloutSettings.verb);
            } 
            if(this.calloutSettings != null && String.isNotBlank(this.calloutSettings.requestBody)) {
                req.setMethod(this.calloutSettings.requestBody);
            } 

            HttpResponse response = null;

            iscalloutPossible = (this.calloutSettings != null && (!String.isBlank(tjis.calloutSettings.verb) || !String.isBlank(this.calloutSettings.endpointOrNamedCredential)));

            if(isCalloutPossible) {
                response = http.send(request);
                returnResponse.httpResponseStatusCode = response.getStatusCode();
                returnResponse.httpResponseStatusCode = response.getBody();
            }
        }
        catch (Exception ex){
            throw ex;
        }
    }

}
