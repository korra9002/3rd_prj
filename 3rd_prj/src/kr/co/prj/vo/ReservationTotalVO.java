package kr.co.prj.vo;

public class ReservationTotalVO {
	private String reservation_num, user_id, use_date, name, phone, email, pay_status, pay_method, pay_date,
			reservation_date, require, card_info_code;
	private int charge;

	public String getReservation_num() {
		return reservation_num;
	}

	public void setReservation_num(String reservation_num) {
		this.reservation_num = reservation_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUse_date() {
		return use_date;
	}

	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPay_status() {
		return pay_status;
	}

	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public String getCard_info_code() {
		return card_info_code;
	}

	public void setCard_info_code(String card_info_code) {
		this.card_info_code = card_info_code;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	@Override
	public String toString() {
		return "ReservationTotalVO [reservation_num=" + reservation_num + ", user_id=" + user_id + ", use_date="
				+ use_date + ", name=" + name + ", phone=" + phone + ", email=" + email + ", pay_status=" + pay_status
				+ ", pay_method=" + pay_method + ", pay_date=" + pay_date + ", reservation_date=" + reservation_date
				+ ", require=" + require + ", card_info_code=" + card_info_code + ", charge=" + charge + "]";
	}

}
