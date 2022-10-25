public class ResponseDTO {

	@AuraEnabled
	public String externalId {get; set;}

	@AuraEnabled
	public String fromAddress {get; set;}

	@AuraEnabled
	public String subject {get; set;}

	@AuraEnabled
	public String textBody {get; set;}
	
	public static List<ResponseDTO> parse(String json) {
		String replaceSubstring = json.replace('External_Id__c', 'externalId');
		return (List<ResponseDTO>) System.JSON.deserialize(replaceSubstring, List<ResponseDTO>.class);
	}
}