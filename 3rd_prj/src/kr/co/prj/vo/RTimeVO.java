package kr.co.prj.vo;

public class RTimeVO {

	private String realtime, reservation_num;
	private int time;
	public String getRealtime() {
		return realtime;
	}
	public void setRealtime(String realtime) {
		this.realtime = realtime;
	}
	public String getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(String reservation_num) {
		this.reservation_num = reservation_num;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "RTimeVO [realtime=" + realtime + ", reservation_num=" + reservation_num + ", time=" + time + "]";
	}
	
}
