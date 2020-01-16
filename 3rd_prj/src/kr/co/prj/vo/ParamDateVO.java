package kr.co.prj.vo;

public class ParamDateVO {
	private Integer param_year,param_month,param_day;
	private String roomName;

	
	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Integer getParam_year() {
		return param_year;
	}

	public void setParam_year(Integer param_year) {
		this.param_year = param_year;
	}

	public Integer getParam_month() {
		return param_month;
	}

	public void setParam_month(Integer param_month) {
		this.param_month = param_month;
	}

	public Integer getParam_day() {
		return param_day;
	}

	public void setParam_day(Integer param_day) {
		this.param_day = param_day;
	}
 
	@Override
	public String toString() {
		return "ParamDateVO [param_year=" + param_year + ", param_month=" + param_month + ", param_day=" + param_day
				+ ", roomName=" + roomName + "]";
	}

	
}
