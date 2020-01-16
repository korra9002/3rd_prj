package kr.co.prj.domain;

/**
 * MyBatis에서 조회 결과를 저장할 객체.
 * 생성은 Framework에서 한다. 
 * @author owner
 */
public class NoticeListDomain {
	private int num;
	private String subject,input_date,delete_flag;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getDelete_flag() {
		return delete_flag;
	}
	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}
	



	
}//class
