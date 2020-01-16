package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.prj.domain.RoomInfoDomain;
import kr.co.prj.domain.RsvTimeDomain;
import kr.co.prj.service.ReservationService;
import kr.co.prj.service.RoomInfoService;
import kr.co.prj.service.RsvInputService;
import kr.co.prj.vo.ParamDateVO;


/**
 * Spring 장점 : 가벼운 프레임워크, POJO(Plain Old Java Object)지원
 * Spring MVC는 요청처리를 method로 한다.
 * @author sist
 */
@Controller
public class RsvInputController {	
	@RequestMapping(value="reservation/rsv_input.do")
	public String revInputForm(HttpSession session,Model model,ParamDateVO pVO) {
		//System.out.println("--------------"+room_name);
		RsvInputService ris=new RsvInputService();
		List<RsvTimeDomain> rsvTime=ris.searchRsvTime();
	//	int roomCharge=ris.searchRoomCharge(room_name);
		System.out.println(rsvTime);
		
		
		
		
		model.addAttribute("RsvTimeInfo", rsvTime);
		//System.out.println("--------------"+roomCharge);
//		model.addAttribute("RsvRoomCharge", roomCharge);
		System.out.println(session.getAttribute("memberId")+"---  -"+(String)session.getAttribute("room_name")+session.getAttribute("image1")+session.getAttribute("charge"));
		System.out.println(pVO);
		pVO.setRoomName((String)session.getAttribute("room_name"));
		System.out.println(pVO);
		
		ReservationService rs = new ReservationService();
		List<Integer> list = rs.timeCheck(pVO);
		
		model.addAttribute("timeCheck",list);
		
		
		return "reservation/rsv_input";
	}//revInputForm
	
	@RequestMapping(value="reservation/rsv_input1.do", method=RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String searchMemberInfo(String user_id) {
		RsvInputService ris=new RsvInputService();
		JSONObject json=ris.multiColumn(user_id);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}//searchMemberInfo


	

}//class





