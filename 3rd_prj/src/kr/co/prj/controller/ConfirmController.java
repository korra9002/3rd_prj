package kr.co.prj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.prj.domain.AccountListDomain;
import kr.co.prj.domain.BankInfoDomain;
import kr.co.prj.domain.CardListDomain;
import kr.co.prj.service.PaymentService;
import kr.co.prj.service.ReservationService;
import kr.co.prj.service.RsvInputService;
import kr.co.prj.vo.PayForBankVO;
import kr.co.prj.vo.PayForCardVO;
import kr.co.prj.vo.RTimeVO;
import kr.co.prj.vo.ReservationTimeVO;
import kr.co.prj.vo.ReservationTotalVO;
import kr.co.prj.vo.ReservationVO;

@Controller
public class ConfirmController {

	@RequestMapping(value = "payment/confirm_parameter.do")
	// 매개변수로 HttpServletRequest를 선언 : Spring MVC Framework에서
	// WAS에서 접속자가 요청할 때 생성되는 요청객체를 얻어 method arguments로
	// 할당한다.
	public String useRequestParameter(HttpSession session, HttpServletRequest request, ReservationVO rsvVO) {

		// 예약 insert쿼리
		// System.out.println("------------"+ rsvVO.toString());
		// rsvVO.setId((String)session.getAttribute("mamberId"));

		System.out.println("------------" + rsvVO.toString());
		rsvVO.setId((String) session.getAttribute("memberId"));
		rsvVO.setRoom_name1((String) session.getAttribute("room_name"));
		RsvInputService ris = new RsvInputService();
		System.out.println("------------" + rsvVO.toString());
		boolean insertFlag = ris.insertReservation(rsvVO);
		String reservationCode = ris.getReservationNum();

		int[] time = rsvVO.getTimetouse();

		for (int i = 0; i < time.length; i++) {
			ris.insertReservationTime(new ReservationTimeVO(reservationCode, rsvVO.getRoom_name1(), time[i],
					rsvVO.getYear(), rsvVO.getMonth(), rsvVO.getDay()));
		}
 
		System.out.println(insertFlag + "-------되는거????????<-- 당근 됨");
		System.out.println(reservationCode+"--insert후 예약코드");
		session.setAttribute("reservationCode", reservationCode);
 
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
		/////////////////////////////////////////////////////////////////////////////

		// 이름이 유일한 parameter 값 받기
	/*	String name = request.getParameter("rsv_person");
		String[] phone = request.getParameterValues("phone");
		String email = request.getParameter("email");
		// 이름이 동일한 parameter 값 받기
		String[] timetouse = request.getParameterValues("timetouse");
		String rsvRequest = request.getParameter("rsvRequest");

		request.setAttribute("phone", phone); // view로 값을 전달하기 위해 Scope객체에 값을 설정
		request.setAttribute("timetouse", timetouse); // view로 값을 전달하기 위해 Scope객체에 값을 설정

		System.out.println("이름 : " + name + "/ 이메일 : " + email);

		if (timetouse != null) {
			for (int i = 0; i < timetouse.length; i++) {
				System.out.println(timetouse[i]);
			} // end if
		} else {
			System.out.println("선택한 취미 없음");
		} // end else
*/
		return "payment/confirm_popup";

	}

	@RequestMapping(value = "payment/paymentProcess.do")
	public String paymentProcess(HttpSession session, HttpServletRequest request) {
		PaymentService ps = new PaymentService();
		List<AccountListDomain> aList = ps.accountMultiRow();
		List<CardListDomain> cList = ps.cardMultiRow((String) session.getAttribute("memberId"));
		System.out.println(aList);
		System.out.println(cList);
		request.setAttribute("AccountList", aList);
		request.setAttribute("CardList", cList);

		return "payment/trans_input";
	}
	
	@RequestMapping(value = "payment/payForCard.do")
	public String payForCard(HttpSession session,String chk,HttpServletRequest request) {
		System.out.println(chk+"------------------- chk 뭐냐");
		PaymentService ps = new PaymentService();
		System.out.println("-- 카드결제 예약 코드 "+(String)session.getAttribute("reservationCode"));
		System.out.println(ps.payForCard(new PayForCardVO((String)session.getAttribute("reservationCode"), chk)));
		System.out.println("-- 카드결제 완료");
			
		
		/*
		 * String reservationCode =(String)session.getAttribute("reservationCode");
		 * ReservationService rs = new ReservationService(); ReservationTotalVO rtVO =
		 * rs.selectReservation(reservationCode); List<RTimeVO> rTimeList =
		 * rs.selectReservationTime(reservationCode);
		 * 
		 * System.out.println(rtVO); System.out.println(rTimeList); String rTime = "";
		 * for (int i = 0; i < rTimeList.size(); i++) { if(i!=0) { rTime +=","; } rTime
		 * +=rTimeList.get(i).getRealtime(); } System.out.println(rTime);
		 * 
		 * 
		 * request.setAttribute("rInfo", rtVO); request.setAttribute("rTime", rTime);
		 */
		
		
		return checkReservation(session,request);
	}
	@RequestMapping(value = "payment/payForBank.do")
	public String payForBank(HttpSession session,String bank,HttpServletRequest request) {
		
		System.out.println(bank);
		PaymentService ps = new PaymentService();
		System.out.println(ps.payForBank1(new PayForBankVO(bank,(String)session.getAttribute("reservationCode") )));
		System.out.println(ps.payForBank2(new PayForBankVO(bank,(String)session.getAttribute("reservationCode") )));
	
		/*
		 * String reservationCode =(String)session.getAttribute("reservationCode");
		 * ReservationService rs = new ReservationService(); ReservationTotalVO rtVO =
		 * rs.selectReservation(reservationCode); List<RTimeVO> rTimeList =
		 * rs.selectReservationTime(reservationCode);
		 * 
		 * System.out.println(rtVO); System.out.println(rTimeList); String rTime = "";
		 * for (int i = 0; i < rTimeList.size(); i++) { if(i!=0) { rTime +=","; } rTime
		 * +=rTimeList.get(i).getRealtime(); } System.out.println(rTime);
		 * 
		 * 
		 * request.setAttribute("rInfo", rtVO); request.setAttribute("rTime", rTime);
		 */
		
		
		return checkReservation(session,request);
	}
	@RequestMapping(value = "payment/checkReservation.do")
	public String checkReservation(HttpSession session,HttpServletRequest request) {
		
		String reservationCode =(String)session.getAttribute("reservationCode");
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
	
	
}// class
