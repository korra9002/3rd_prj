package kr.co.prj.vo;

public class ReservationTimeVO {
	
	private String reservation_num, room_name;
	private int r_time, year, month, day;
	
	
	public ReservationTimeVO(String reservation_num, String room_name, int r_time, int year, int month, int day) {
		super();
		this.reservation_num = reservation_num;
		this.room_name = room_name;
		this.r_time = r_time;
		this.year = year;
		this.month = month;
		this.day = day;
	}
	
	public String getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(String reservation_num) {
		this.reservation_num = reservation_num;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getR_time() {
		return r_time;
	}
	public void setR_time(int r_time) {
		this.r_time = r_time;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "ReservationTimeVO [reservation_num=" + reservation_num + ", room_name=" + room_name + ", r_time="
				+ r_time + ", year=" + year + ", month=" + month + ", day=" + day + "]";
	}

	
	
	
	
}
