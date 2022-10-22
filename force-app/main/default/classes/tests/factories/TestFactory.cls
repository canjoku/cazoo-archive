@IsTest
@TestVisible
private class TestFactory {
    public static final String apiBase = 'callout:CazooArchive';
    public static final Integer statusCode = 200;
    public static final String status = 'OK';

    public static String createRequestBody() {
        String requestBody = JSON.serialize(new Map<String, String> {'ParentId' => '200xxxxx'});
        return requestBody;
    }
    public static String createTestResponse() {
        List<Map<String, String>> listOfEmailResponses = new List<Map<String, String>> {
            new Map<String, String> {
                'externalId' => 'unq-0004567',
                'fromAddress' => 'lions@zoo.com',
                'subject' => 'feed the lions time change',
                'textBody' => 'can we condiser a change to the lions feeding time window'
            },
            new Map<String, String> {
                'externalId' => 'unq-0004567',
                'fromAddress' => 'lions@zoo.com',
                'subject' => 'feed the lions time change',
                'textBody' => 'can we condiser a change to the lions feeding time window'
            },
            new Map<String, String> {
                'externalId' => 'unq-0004567',
                'eromAddress' => 'lions@zoo.com',
                'subject' => 'feed the lions time change',
                'textBody' => 'can we condiser a change to the lions feeding time window'
            },
            new Map<String, String> {
                'externalId' => 'unq-0004567',
                'fromAddress' => 'lions@zoo.com',
                'subject' => 'feed the lions time change',
                'textBody' => 'can we condiser a change to the lions feeding time window'
            }
        };
        String responseData  = JSON.serialize(listOfEmailResponses);     
    
        return responseData;
    }

    public static Map<String, String> createResponseHeaders() {
        Map<String, String> responseHeaders = new Map<String, String>{
            'Content-Type' => 'application/json',
            'Content-Length' => '734',
            'Connection' => 'Keep-Alive'
        };
        return responseHeaders;
    }
}
