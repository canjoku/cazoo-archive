@IsTest
public class HttpCalloutUtilityMock implements HttpCalloutMock {

    protected Integer statusCode;
    protected String status;
    protected String body;
    protected Map<string, String> responseHeaders;

    public HttpCalloutUtilityMock(Integer statusCode, String status, String body, Map<String, String> responseHeaders) {
        this.statusCode = statusCode;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }

    public HttpResponse respond(HttpRequest request) {
        HttpResponse response = new httpResponse();

        for(String key : this.responseHeaders.keySet()) {
            response.setHeader(key, this.responseHeaders.get(key));
        }

        response.setBody(this.body);
        response.setStatusCode(this.statusCode);
        response.setStatus(this.status);

        return response;
    }
}
