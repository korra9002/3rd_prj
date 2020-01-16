package kr.co.prj.domain;

/**
 * 방 예약 시간정보를 받아올 도메인
 * @author sist
 */
public class RsvTimeDomain {
	
	private boolean flag;
	private int r_time;
	private String r_realtime;
	
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	public int getR_time() {
		return r_time;
	}
	public void setR_time(int r_time) {
		this.r_time = r_time;
	}
	public String getR_realtime() {
		return r_realtime;
	}
	public void setR_realtime(String r_realtime) {
		this.r_realtime = r_realtime;
	}
	@Override
	public String toString() {
		return "RsvTimeDomain [flag=" + flag + ", r_time=" + r_time + ", r_realtime=" + r_realtime + "]";
	}
	
	

}
