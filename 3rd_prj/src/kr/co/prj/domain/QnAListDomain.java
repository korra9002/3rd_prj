package kr.co.prj.domain;

/**
 * MyBatis에서 조회 결과를 저장할 객체.
 * 생성은 Framework에서 한다. 
 * @author owner
 */
public class QnAListDomain {
	private int num;
	private String id,input_date,subject,answer_flag;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnswer_flag() {
		return answer_flag;
	}
	public void setAnswer_flag(String answer_flag) {
		this.answer_flag = answer_flag;
	}
	

	
}//class
