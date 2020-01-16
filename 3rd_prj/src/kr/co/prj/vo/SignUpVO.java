package kr.co.prj.vo;

public class SignUpVO {
	//user_id=&user_name=&password=&password2=&hint_code=01&answer=&phon1=010&phon2=&phon3=&email1=&email3=
	private String user_id,user_name,password,password2,hint_code,answer,phon1,phon2,phon3,email1,email3;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getHint_code() {
		return hint_code;
	}

	public void setHint_code(String hint_code) {
		this.hint_code = hint_code;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getPhon1() {
		return phon1;
	}

	public void setPhon1(String phon1) {
		this.phon1 = phon1;
	}

	public String getPhon2() {
		return phon2;
	}

	public void setPhon2(String phon2) {
		this.phon2 = phon2;
	}

	public String getPhon3() {
		return phon3;
	}

	public void setPhon3(String phon3) {
		this.phon3 = phon3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail3() {
		return email3;
	}

	public void setEmail3(String email3) {
		this.email3 = email3;
	}

	@Override
	public String toString() {
		return "SignUpVO [user_id=" + user_id + ", user_name=" + user_name + ", password=" + password + ", password2="
				+ password2 + ", hint_code=" + hint_code + ", answer=" + answer + ", phon1=" + phon1 + ", phon2="
				+ phon2 + ", phon3=" + phon3 + ", email1=" + email1 + ", email3=" + email3 + "]";
	}
	
	
}
