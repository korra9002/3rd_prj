package kr.co.prj.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.prj.domain.DiaryDomain;
import kr.co.prj.service.ReservationService;
import kr.co.prj.vo.DiaryResultVO;
import kr.co.prj.vo.DiarySearchVO;

@Controller
public class DiaryController {

	/**
	 * 예약창에서 방을 선택했을때 해당 방의 달력 스케줄을 보여줌
	 */
	@RequestMapping(value = "diary/diary.do")
	public String diary(HttpSession session, String image1, String room_name, String charge, Integer year,
			Integer month, Model model) {

		// 로그인하지 않았을때 로그인페이지로 돌려보냄
		if (session.getAttribute("memberId") == null) {
			return "redirect:/login/login.do";

		}

		// 예약하려는 방의 정보를 세션에 저장
		if (room_name != null && image1 != null && charge != null) {
			session.setAttribute("room_name", room_name);
			session.setAttribute("image1", image1);
			session.setAttribute("charge", charge);
		}

		// 현재 날짜 저장
		int year1 = Calendar.getInstance().get(Calendar.YEAR);
		int month1 = Calendar.getInstance().get(Calendar.MONTH);

		// 달력을 앞뒤로 움직였을 때 받아오는 year,month를 대입
		if (year != null || month != null) {
			year1 = year;
			month1 = month;
		}

		// 현재 달력에서 보여지는 시간상의 예약정보를 List에 받아옴
		DiarySearchVO dsVO = new DiarySearchVO((String) session.getAttribute("room_name"), year1, month1 + 1);
		ReservationService rs = new ReservationService();
		List<DiaryDomain> dList = rs.diaryList(dsVO);

		Map<Integer, DiaryResultVO[]> map = new HashMap<Integer, DiaryResultVO[]>();
		DiaryResultVO[] drArr = null;

		// 받아온 예약 내역을 날짜와 시간대별로 구별되도록 Map에 저장
		for (int i = 0; i < dList.size(); i++) {
			if (map.containsKey(dList.get(i).getDay())) {
				map.get(dList.get(i).getDay())[dList.get(i).getR_time() - 1] = new DiaryResultVO(
						dList.get(i).getReservation_num(), dList.get(i).getUser_id(), dList.get(i).getR_time());
			} else {
				drArr = new DiaryResultVO[4];
				drArr[dList.get(i).getR_time() - 1] = new DiaryResultVO(dList.get(i).getReservation_num(),
						dList.get(i).getUser_id(), dList.get(i).getR_time());
				map.put(dList.get(i).getDay(), drArr);
			}
		}

		// 페이지에 보여질 수 있도록 map변수를 model에 추가
		model.addAttribute("rListMap", map);

		return "reservation/diary/diary";
	}
	
}// class
