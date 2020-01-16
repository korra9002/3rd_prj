package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.prj.domain.RoomConceptDomain;
import kr.co.prj.service.RoomConceptService;

@Controller
public class RoomConceptController {
	
	@RequestMapping(value = "introduce/introduce.do",method =GET)
	public String RoomConcept(Model model) {
		RoomConceptService rcs=new RoomConceptService();
		List<RoomConceptDomain> RoomConceptlist = rcs.conceptInfo();
			 model.addAttribute("concept", RoomConceptlist);
		return "introduce/about";
	}//RoomConcept
	
}//class
