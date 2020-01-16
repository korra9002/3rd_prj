package kr.co.prj.vo;

public class QnAWriteVO {
	private String q_subject,q_content,user_id;

	public String getQ_subject() {
		return q_subject;
	}

	public String getQ_content() {
		return q_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "QnAWriteVO [q_subject=" + q_subject + ", q_content=" + q_content + ", user_id=" + user_id + "]";
	}


}
