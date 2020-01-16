package kr.co.prj.vo;

public class MyCardVO {
	private String card_type_code, ex_date, card_info_code;

	public MyCardVO(String card_type_code, String ex_date, String card_info_code) {
		super();
		this.card_type_code = card_type_code;
		this.ex_date = ex_date;
		this.card_info_code = card_info_code;
	}

	public MyCardVO() {
		super();
	}

	public String getCard_type_code() {
		return card_type_code;
	}

	public void setCard_type_code(String card_type_code) {
		this.card_type_code = card_type_code;
	}

	public String getEx_date() {
		return ex_date;
	}

	public void setEx_date(String ex_date) {
		this.ex_date = ex_date;
	}

	public String getCard_info_code() {
		return card_info_code;
	}

	public void setCard_info_code(String card_info_code) {
		this.card_info_code = card_info_code;
	}
	
	

}
