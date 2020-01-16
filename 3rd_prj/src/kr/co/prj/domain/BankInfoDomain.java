package kr.co.prj.domain;

public class BankInfoDomain {
	private String  reservation_num , deposit_flag, deposit_period, bank, account_number;

	public String getReservation_num() {
		return reservation_num;
	}

	public void setReservation_num(String reservation_num) {
		this.reservation_num = reservation_num;
	}

	public String getDeposit_flag() {
		return deposit_flag;
	}

	public void setDeposit_flag(String deposit_flag) {
		this.deposit_flag = deposit_flag;
	}

	public String getDeposit_period() {
		return deposit_period;
	}

	public void setDeposit_period(String deposit_period) {
		this.deposit_period = deposit_period;
	}

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
		return "BankInfoDomain [reservation_num=" + reservation_num + ", deposit_flag=" + deposit_flag
				+ ", deposit_period=" + deposit_period + ", bank=" + bank + ", account_number=" + account_number + "]";
	}
	
	
	
	
}
