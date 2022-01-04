package user;

public class UserDTO {

	private String userID;
	private String password;
	private String userName;
	private String userPlant;
	private String userEmail;
	private String userEmailHash;
	private String userEmailChecked;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPlant() {
		return userPlant;
	}
	public void setUserPlant(String userPlant) {
		this.userPlant = userPlant;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public String getUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(String userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	
	public UserDTO(String userID, String password, String userName, String userPlant, String userEmail,
			String userEmailHash, String userEmailChecked) {
		super();
		this.userID = userID;
		this.password = password;
		this.userName = userName;
		this.userPlant = userPlant;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}
	
	
	public UserDTO() {
		
	}

}
