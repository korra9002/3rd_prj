package kr.co.prj.domain;

public class ConceptBriefDomain {
	private String  concept_name2, brief_info   ;

	public String getConcept_name2() {
		return concept_name2;
	}

	public void setConcept_name2(String concept_name2) {
		this.concept_name2 = concept_name2;
	}

	public String getBrief_info() {
		return brief_info;
	}

	public void setBrief_info(String brief_info) {
		this.brief_info = brief_info;
	}

	@Override
	public String toString() {
		return "ConceptBriefDomain [concept_name2=" + concept_name2 + ", brief_info=" + brief_info + "]";
	}
	
	
	
	
}
