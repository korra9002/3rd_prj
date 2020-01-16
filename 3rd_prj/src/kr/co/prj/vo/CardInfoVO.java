package kr.co.prj.vo;

public class CardInfoVO {
	
	private String cardNum1,cardNum2,cardNum3,cardNum4,cardTypeCode,exDate,cvv,user_id;

	public String getCardNum1() {
		return cardNum1;
	}

	public void setCardNum1(String cardNum1) {
		this.cardNum1 = cardNum1;
	}

	public String getCardNum2() {
		return cardNum2;
	}

	public void setCardNum2(String cardNum2) {
		this.cardNum2 = cardNum2;
	}

	public String getCardNum3() {
		return cardNum3;
	}

	public void setCardNum3(String cardNum3) {
		this.cardNum3 = cardNum3;
	}

	public String getCardNum4() {
		return cardNum4;
	}

	public void setCardNum4(String cardNum4) {
		this.cardNum4 = cardNum4;
	}

	public String getCardTypeCode() {
		return cardTypeCode;
	}

	public void setCardTypeCode(String cardTypeCode) {
		this.cardTypeCode = cardTypeCode;
	}

	public String getExDate() {
		return exDate;
	}

	public void setExDate(String exDate) {
		this.exDate = exDate;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "CardInfoVO [cardNum1=" + cardNum1 + ", cardNum2=" + cardNum2 + ", cardNum3=" + cardNum3 + ", cardNum4="
				+ cardNum4 + ", cardTypeCode=" + cardTypeCode + ", exDate=" + exDate + ", cvv=" + cvv + ", user_id="
				+ user_id + "]";
	}
  
	
	
	
	
	
}
