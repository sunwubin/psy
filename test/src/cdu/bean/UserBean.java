package cdu.bean;

public class UserBean {

	private String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public UserBean(){
		
	}
	public UserBean(String username, String password, String phone, String power) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.power = power;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	private String password;
	private String phone;
	private String power;

	@Override
	public String toString() {
		return "UserBean [username=" + username + ", password=" + password
				+ ", phone=" + phone + ", power=" + power + "]";
	}

}
