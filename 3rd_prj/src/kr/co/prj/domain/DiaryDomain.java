package kr.co.prj.domain;

public class DiaryDomain {
	private String reservation_num, user_id;
	private int r_time, day;

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

	public int getR_time() {
		return r_time;
	}

	public void setR_time(int r_time) {
		this.r_time = r_time;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "DiaryDomain [reservation_num=" + reservation_num + ", user_id=" + user_id + ", r_time=" + r_time
				+ ", day=" + day + "]";
	}

}
