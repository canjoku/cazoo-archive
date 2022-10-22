public class ResponseDTO {

	public String externalId;
	public String fromAddress;
	public String subject;
	public String textBody;

	
	public static List<ResponseDTO> parse(String json) {
		return (List<ResponseDTO>) System.JSON.deserialize(json, List<ResponseDTO>.class);
	}
}