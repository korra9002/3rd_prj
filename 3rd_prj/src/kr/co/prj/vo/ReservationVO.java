package kr.co.prj.vo;

import java.util.Arrays;

public class ReservationVO {
	private String rsv_person, phone1, phone2, phone3, email,rsvRequest , id, room_name1;
	private int[] timetouse;
	private int totalCharge, year, month, day;
	public String getRsv_person() {
		return rsv_person;
	}
	public void setRsv_person(String rsv_person) {
		this.rsv_person = rsv_person;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRsvRequest() {
		return rsvRequest;
	}
	public void setRsvRequest(String rsvRequest) {
		this.rsvRequest = rsvRequest;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoom_name1() {
		return room_name1;
	}
	public void setRoom_name1(String room_name1) {
		this.room_name1 = room_name1;
	}
	public int[] getTimetouse() {
		return timetouse;
	}
	public void setTimetouse(int[] timetouse) {
		this.timetouse = timetouse;
	}
	public int getTotalCharge() {
		return totalCharge;
	}
	public void setTotalCharge(int totalCharge) {
		this.totalCharge = totalCharge;
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
		return "ReservationVO [rsv_person=" + rsv_person + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3="
				+ phone3 + ", email=" + email + ", rsvRequest=" + rsvRequest + ", id=" + id + ", room_name1="
				+ room_name1 + ", timetouse=" + Arrays.toString(timetouse) + ", totalCharge=" + totalCharge + ", year="
				+ year + ", month=" + month + ", day=" + day + "]";
	}
	
	

}
