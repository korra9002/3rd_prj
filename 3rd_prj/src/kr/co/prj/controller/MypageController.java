package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.prj.domain.BankInfoDomain;
import kr.co.prj.domain.CardTypeDomain;
import kr.co.prj.domain.MyCardDomain;
import kr.co.prj.domain.MypageDomain;
import kr.co.prj.domain.MypageQnaDomain;
import kr.co.prj.service.MypageService;
import kr.co.prj.service.ReservationService;
import kr.co.prj.service.SignUpService;
import kr.co.prj.vo.CardInfoVO;
import kr.co.prj.vo.LoginVO;
import kr.co.prj.vo.RTimeVO;
import kr.co.prj.vo.ReservationTotalVO;
import kr.co.prj.vo.modifyInfoVO;


@Controller
public class MypageController {
	
	@RequestMapping(value = "login/mypage.do", method =GET ) 
	public String mypageMain(HttpSession session, Model model) {
		 
		MypageService ss=new MypageService();
		//등록된 카드
		String id= (String)session.getAttribute("memberId");
		List<MyCardDomain> cardList=ss.selectAllCard(id);
		
		//문의확인 
		List<MypageQnaDomain> qnaList=ss.selectQna(id);

		//예약정보 리스트
		ReservationService rs = new ReservationService();
		List<ReservationTotalVO> rtList = rs.selectReservation2(id);
		
		List<MypageDomain> infoList =ss.selectAllInfo(id); 
		
		model.addAttribute("cardData", cardList);
		model.addAttribute("qnaData", qnaList);
		model.addAttribute("rsvData", rtList);
		model.addAttribute("infoData",infoList);
		
		
		String url = "mypage/loginMyPage";
		
		if (id == null) {
			url = "main/home";
		}//end if
		
		//System.out.println((String)session.getAttribute("memberId")); 		
		return url;
	}//mypageMain
	
	//등록된 카드 삭제
	@RequestMapping(value = "login/deleteCard.do",method =RequestMethod.POST)
	public String deleteCard(String chk) {
		System.out.println("Dasda");
		System.out.println(chk.trim()+"카드 번호");
		MypageService ss=new MypageService();
		
		boolean deleteCard=ss.removeCard(chk);
		
		
		return "redirect:mypage.do";
	}
	
	@RequestMapping(value = "login/inputCardInfo.do")
	public String inputCardInfo(Model model) {
		SignUpService ss = new SignUpService();
		List<CardTypeDomain> list = ss.cardTypeMultiRow();
		model.addAttribute("cardTypeList",list);
		
		
		return "mypage/card_input_form";
	}
	@RequestMapping(value = "login/finishInputCardInfo.do")
	public String finishInputCardInfo(HttpSession session,CardInfoVO ciVO) {
		ciVO.setUser_id((String)session.getAttribute("memberId"));
		SignUpService ss= new SignUpService();
		ss.inputCardInfo(ciVO);
		
		return "redirect:mypage.do";
	}
	
	@RequestMapping(value = "login/checkReservation.do")
	public String checkReservation(String reservation_num,HttpServletRequest request) {
		
		String reservationCode =reservation_num;
		ReservationService rs = new ReservationService();
		ReservationTotalVO rtVO = rs.selectReservation(reservationCode);
		List<RTimeVO> rTimeList = rs.selectReservationTime(reservationCode);
		
		System.out.println(rtVO);
		System.out.println(rTimeList);
		String rTime = "";
		for (int i = 0; i < rTimeList.size(); i++) {
			if(i!=0) {
			rTime +=",";	
			}
			rTime +=rTimeList.get(i).getRealtime(); 
		}
		System.out.println(rTime);
		BankInfoDomain bid=null;
		if("B".equals(rtVO.getPay_method())) {
			
			 bid = rs.selectBankInfo(reservationCode);
		}
		System.out.println("rtVO"+rtVO);
		System.out.println("rTime"+rTime);
		System.out.println("bid"+bid);
		
		request.setAttribute("rInfo", rtVO);
		request.setAttribute("rTime", rTime);
		request.setAttribute("bInfo", bid);
		
		
		return "payment/confirm_popup";
	}
	@RequestMapping(value="mypage/passwdChk.do" ,method = GET)
	public String passwdChk() {
		
		return "mypage/passwdChk";
	}//passwdChk
	
	@RequestMapping(value="mypage/passwdChkProc.do",method=POST)
	@ResponseBody
	public String passwdChkProc(LoginVO lVo) {
		JSONObject json =null;
		MypageService ms = new MypageService();
		
		json = ms.passwordChk(lVo);
		json.put("password",lVo.getInputPassword());
		
		return json.toJSONString();
	}//passwdChkProc

	@RequestMapping(value="mypage/information.do",method=GET)
	public String myInfo(HttpSession session,Model model) {
		List<MypageDomain> list = null;
		List list2 = null;
		MypageService ms = new MypageService();
		SignUpService sus = new SignUpService();
		String user_id =session.getAttribute("memberId").toString();
		list = ms.selectAllInfo(user_id);
		list2 = sus.passHintMultiRow();
		model.addAttribute("infoList",list);
		model.addAttribute("passHintList",list2);
		return "mypage/information";
	}//myInfo
	
	 
	@RequestMapping(value="mypage/modifyInfo.do",method=POST)
	@ResponseBody
	public String modifyInfo(modifyInfoVO miVo) {
		JSONObject json =null;
		MypageService ms = new MypageService();
		System.out.println(miVo.getEmail()+"오예예ㅔ에에");
		json = ms.modifyInfo(miVo);
		return json.toJSONString(); 
	}//modifyInfo
	
	
}//class
