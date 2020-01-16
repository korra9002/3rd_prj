package kr.co.prj.domain;

public class CardTypeDomain {
	
	private String cardTypeCode, cardType;

	public String getCardTypeCode() {
		return cardTypeCode;
	}

	public void setCardTypeCode(String cardTypeCode) {
		this.cardTypeCode = cardTypeCode;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	@Override
	public String toString() {
		return "CardTypeDomain [cardTypeCode=" + cardTypeCode + ", cardType=" + cardType + "]";
	}
	
	
	
	
}
