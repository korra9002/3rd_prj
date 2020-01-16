package kr.co.prj.vo;

public class DiaryResultVO {
	private String reservationNum,userID;
	private int rTime;
	public DiaryResultVO(String reservationNum, String userID, int rTime) {
		super();
		this.reservationNum = reservationNum;
		this.userID = userID;
		this.rTime = rTime;
	}
	public String getReservationNum() {
		return reservationNum;
	}
	public void setReservationNum(String reservationNum) {
		this.reservationNum = reservationNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getrTime() {
		return rTime;
	}
	public void setrTime(int rTime) {
		this.rTime = rTime;
	}
	
	
}
