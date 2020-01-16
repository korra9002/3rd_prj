package kr.co.prj.domain;

public class MypageDomain {
	private String user_id, user_name, email, phone,hint_code;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	public String getHint_code() {
		return hint_code;
	}

	public void setHint_code(String hint_code) {
		this.hint_code = hint_code;
	}

	public String getEmail1() {
		return email.substring(0,email.indexOf("@"));
	}//getEmail1
	
	public String getEmail2() {
		return email.substring(email.indexOf("@")+1);
	}//getEmail1

	public String getPhone0() {
		return phone.substring(0, phone.indexOf("-"));
	}
	public String getPhone1() {
		return phone.substring(4, phone.lastIndexOf("-"));
	}
	public String getPhone2() {
		return phone.substring(phone.lastIndexOf("-")+1);
	}
}
