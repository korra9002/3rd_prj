package kr.co.prj.vo;

public class PayForBankVO {
	private String bank,rNum;

	
	
	public PayForBankVO(String bank, String rNum) {
		super();
		this.bank = bank;
		this.rNum = rNum;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "PayForBankVO [bank=" + bank + ", rNum=" + rNum + "]";
	}
	
	
}
