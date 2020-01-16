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
	 * ����â���� ���� ���������� �ش� ���� �޷� �������� ������
	 */
	@RequestMapping(value = "diary/diary.do")
	public String diary(HttpSession session, String image1, String room_name, String charge, Integer year,
			Integer month, Model model) {

		// �α������� �ʾ����� �α����������� ��������
		if (session.getAttribute("memberId") == null) {
			return "redirect:/login/login.do";

		}

		// �����Ϸ��� ���� ������ ���ǿ� ����
		if (room_name != null && image1 != null && charge != null) {
			session.setAttribute("room_name", room_name);
			session.setAttribute("image1", image1);
			session.setAttribute("charge", charge);
		}

		// ���� ��¥ ����
		int year1 = Calendar.getInstance().get(Calendar.YEAR);
		int month1 = Calendar.getInstance().get(Calendar.MONTH);

		// �޷��� �յڷ� �������� �� �޾ƿ��� year,month�� ����
		if (year != null || month != null) {
			year1 = year;
			month1 = month;
		}

		// ���� �޷¿��� �������� �ð����� ���������� List�� �޾ƿ�
		DiarySearchVO dsVO = new DiarySearchVO((String) session.getAttribute("room_name"), year1, month1 + 1);
		ReservationService rs = new ReservationService();
		List<DiaryDomain> dList = rs.diaryList(dsVO);

		Map<Integer, DiaryResultVO[]> map = new HashMap<Integer, DiaryResultVO[]>();
		DiaryResultVO[] drArr = null;

		// �޾ƿ� ���� ������ ��¥�� �ð��뺰�� �����ǵ��� Map�� ����
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

		// �������� ������ �� �ֵ��� map������ model�� �߰�
		model.addAttribute("rListMap", map);

		return "reservation/diary/diary";
	}
	
}// class
