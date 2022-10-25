public class ResponseDTO {

	public String externalId;
	public String fromAddress;
	public String subject;
	public String textBody;

	
	public static List<ResponseDTO> parse(String json) {
		String replaceSubstring = json.replace('External_Id__c', 'externalId');
		return (List<ResponseDTO>) System.JSON.deserialize(replaceSubstring, List<ResponseDTO>.class);
	}
}