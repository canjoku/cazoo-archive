public class RequestDTO {

	public String parentId;

	public static RequestDTO parse(String json) {
		return (RequestDTO) System.JSON.deserialize(json, RequestDTO.class);
	}
}