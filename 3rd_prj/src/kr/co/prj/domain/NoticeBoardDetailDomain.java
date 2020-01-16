package kr.co.prj.domain;

public class NoticeBoardDetailDomain {
	private int n_num;
	private String n_subject , n_content, n_input_Date, n_delete_Flag;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_input_Date() {
		return n_input_Date;
	}
	public void setN_input_Date(String n_input_Date) {
		this.n_input_Date = n_input_Date;
	}
	public String getN_delete_Flag() {
		return n_delete_Flag;
	}
	public void setN_delete_Flag(String n_delete_Flag) {
		this.n_delete_Flag = n_delete_Flag;
	}
	
}//class
