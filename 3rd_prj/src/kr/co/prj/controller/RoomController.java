package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.prj.domain.ConceptBriefDomain;
import kr.co.prj.domain.RoomInfoDomain;
import kr.co.prj.service.RoomService;

@Controller
public class RoomController {

	
	 @RequestMapping(value="introduce/about1.do") public String aboutForm1(Model
	 model,String concept) { RoomService rs=new RoomService();
	 
	 ConceptBriefDomain cbd = rs.conceptInfo(concept);
	 System.out.println(cbd);
	 List<RoomInfoDomain> RoomInfolist = rs.RoomInfo(concept);
	 model.addAttribute("RoomInfo", RoomInfolist); 
	 model.addAttribute("conceptInfo",cbd);
	 
	 
	 return "introduce/about1";
	 }//rsvForm
	  /*
		 * @RequestMapping(value="introduce/about1.do") public String aboutForm1(Model
		 * model,String concept) { RoomService rs=new RoomService();
		 * 
		 * String conceptbrief = rs.conceptName(concept); List<RoomInfoDomain>
		 * RoomInfolist = rs.RoomInfo(concept);
		 * 
		 * 
		 * model.addAttribute("RoomInfo", RoomInfolist);
		 * model.addAttribute("conceptBrief",conceptbrief); return "introduce/about1";
		 * }//rsvForm
		 */}//class
