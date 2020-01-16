package kr.co.prj.vo;

public class PayForCardVO {
	private String rNum,cardCod;

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	public String getCardCod() {
		return cardCod;
	}

	public void setCardCod(String cardCod) {
		this.cardCod = cardCod;
	}

	public PayForCardVO(String rNum, String cardCod) {
		super();
		this.rNum = rNum;
		this.cardCod = cardCod;
	}

	@Override
	public String toString() {
		return "PayForCardVO [rNum=" + rNum + ", cardCod=" + cardCod + "]";
	}

	
	
}
