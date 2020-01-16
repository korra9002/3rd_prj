package kr.co.prj.domain;

public class AccountListDomain {
	private String bank, account_number;

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	@Override
	public String toString() {
		return "AccountListDomain [bank=" + bank + ", account_number=" + account_number + "]";
	}
	
}
