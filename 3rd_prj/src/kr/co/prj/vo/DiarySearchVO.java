package kr.co.prj.vo;

public class DiarySearchVO {
	private String roomName;
	private int year, month;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
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

	@Override
	public String toString() {
		return "DiarySearchVO [roomName=" + roomName + ", year=" + year + ", month=" + month + "]";
	}

	public DiarySearchVO(String roomName, int year, int month) {
		super();
		this.roomName = roomName;
		this.year = year;
		this.month = month;
	}

}
