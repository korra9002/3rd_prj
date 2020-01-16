package kr.co.prj.domain;

public class PassHintDomain {
	private String hintCode,hint;

	public String getHintCode() {
		return hintCode;
	}

	public void setHintCode(String hintCode) {
		this.hintCode = hintCode;
	}

	public String getHint() {
		return hint;
	}

	public void setHint(String hint) {
		this.hint = hint;
	}

	@Override
	public String toString() {
		return "PassHintDomain [hintCode=" + hintCode + ", hint=" + hint + "]";
	}
	
	

}
