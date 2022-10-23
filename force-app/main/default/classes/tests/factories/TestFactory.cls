@IsTest
@TestVisible
private class TestFactory {
    public static final String apiBase = 'callout:CazooArchive';
    public static final Integer statusCode = 200;
    public static final String status = 'OK';
    public static final String externalId = 'unq-4563546';
    public static final String fromAddress = 'catwoman@welcome.com';
    public static final String subject = 'Welcome email';
    public static final String textBody = 'Wellcome to cazoo';

    public static String createRequestBody() {
        String requestBody = JSON.serialize(new Map<String, String> {'ParentId' => '200xxxxx'});
        return requestBody;
    }
    public static String createTestResponse() {
        List<Map<String, String>> listOfEmailResponses = new List<Map<String, String>> {
            new Map<String, String> {
                'externalId' => 'unq-0001234',
                'fromAddress' => 'lions@zoo.com',
                'subject' => 'feed the lions time change',
                'textBody' => 'can we condiser a change to the lions feeding time window'
            },
            new Map<String, String> {
                'externalId' => 'unq-0009876',
                'fromAddress' => 'cats@zoo.com',
                'subject' => 'feed the cats time change',
                'textBody' => 'Cats are lovely'
            },
            new Map<String, String> {
                'externalId' => 'unq-0007657',
                'eromAddress' => 'monkeys@zoo.com',
                'subject' => 'feed the monkeys time change',
                'textBody' => 'Be careful with monkeys. they may bite'
            },
            new Map<String, String> {
                'externalId' => 'unq-0000909',
                'fromAddress' => 'tigers@zoo.com',
                'subject' => 'feed the tigers time change',
                'textBody' => 'tigers like to play'
            },
            new Map<String, String> {
                'externalId' => 'unq-0054549',
                'fromAddress' => 'mongoose@zoo.com',
                'subject' => 'feed the mongoose time change',
                'textBody' => 'mongoose hate snakes'
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