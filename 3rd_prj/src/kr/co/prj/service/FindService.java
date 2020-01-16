package kr.co.prj.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.print.attribute.standard.Fidelity;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.prj.dao.FindDAO;
import kr.co.prj.vo.FindIdEmailVO;
import kr.co.prj.vo.FindIdPhoneVO;
import kr.co.prj.vo.FindPwVO;
import kr.co.prj.vo.SendEmailVO;
import kr.co.prj.vo.UpdatePwVO;
import kr.co.sist.util.cipher.DataDecrypt;
import kr.co.sist.util.cipher.DataEncrypt;

@Component
public class FindService {

	@Autowired
	private JavaMailSender mailSender;

	public JSONObject findIdByPhone(FindIdPhoneVO fvo) {
		JSONObject jo = new JSONObject();
		String id = null;
		FindDAO fDao = FindDAO.getInstance();

		try {
			id = fDao.selectIdByPhone(fvo);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		jo.put("resultFlag", id != null);
		jo.put("id", id);

		return jo;
	}// findId

	public JSONObject findIdByEmail(FindIdEmailVO fevo) {
		JSONObject jo = new JSONObject();
		String id = null;
		FindDAO fDao = FindDAO.getInstance();

		try {
			id = fDao.selectIdByEmail(fevo);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		jo.put("resultFlag", id != null);
		jo.put("id", id);

		return jo;
	}// findIdByEmail

	public JSONObject findPw(FindPwVO fpvo) {
		JSONObject jo = new JSONObject();
		String id = null;
		FindDAO fDao = FindDAO.getInstance();

		try {
			id = fDao.selectPw(fpvo);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		jo.put("resultFlag", id != null);
		jo.put("id", id);

		return jo;
	}// findId

	/**
	 * 아이디 중복확인
	 * @param id
	 * @return
	 */
	public int checkId(String id) {
		int idCheck = 0;

		FindDAO fDao = FindDAO.getInstance();

		try {
			idCheck = fDao.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch
		return idCheck;
	}// checkId

	/**
	 * 임의 비밀번호 10자리 생성
	 * 
	 * @param fpvo
	 * @return
	 */
	public SendEmailVO setPw(String id, String email) {
		boolean updateFlag = false;
		/**
		 * String ranPw=null; for (int i = 0; i < 5; i++) { ranPw =
		 * UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. ranPw =
		 * ranPw.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. }
		 */

		char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
				'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };// 배열에 선언

		String ranPw = "";

		for (int i = 0; i < 10; i++) {
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));// Math.rondom()은 0.0이상 1.0미만의 난수를 생성해
																				// 준다.
			ranPw += pwCollection[selectRandomPw];
		}

		System.out.println("난수 : " + ranPw);

		FindDAO fDao = FindDAO.getInstance();
		// update할 쿼리 임시비밀번호
		String encryptPw;
		UpdatePwVO upvo = new UpdatePwVO();

		SendEmailVO sevo = new SendEmailVO();
		try {
			encryptPw = DataEncrypt.messageDigest("MD5", ranPw);
			upvo.setId(id);
			upvo.setPassword(encryptPw);
		} catch (NoSuchAlgorithmException e2) {
			e2.printStackTrace();
		}

		sevo.setId(id);
		sevo.setPassword(ranPw);

		sevo.setEmail(email);

		System.out.println("한번 해보장" + sevo.getId() + "-------" + sevo.getPassword() + "------" + sevo.getEmail());

		try {
			updateFlag = fDao.updatePw(upvo);

			/**
			 * if ( updateFlag ) {
			 * 
			 * sendPw(sevo); }
			 */

		} catch (SQLException e) {
			e.printStackTrace();
		} // end catch

		/**
		 * FindDAO fDao=FindDAO.getInstance();
		 * 
		 * try { id=fDao.selectPw(fpvo); } catch (SQLException e) { e.printStackTrace();
		 * }//end catch
		 * 
		 * 
		 * jo.put("resultFlag", id!=null); jo.put("id", id);
		 * 
		 */
		return sevo;

	}// setPw

	/**
	 * public void sendPw(SendEmailVO sevo) {
	 * 
	 * 
	 * 
	 * String setfrom = ""; String tomail = sevo.getEmail(); // 받는 사람 이메일 String
	 * title = sevo.getId() +"님의 임시 비밀번호 발급 메일입니다."; // 제목 String content =
	 * sevo.getId()+" 님의 임시 비밀번호는 "+sevo.getPassword()+"입니다."; // 내용
	 * 
	 * try {
	 * 
	 * System.out.println(mailSender);
	 * 
	 * MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 * 
	 * System.out.println("메일 보내고 싶어여ㅠ");
	 * 
	 * messageHelper.setFrom("pspace.rental@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
	 * messageHelper.setTo("rma1057@gmail.com"); // 받는사람 이메일
	 * messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	 * messageHelper.setText(content); // 메일 내용
	 * 
	 * mailSender.send(message); } catch (Exception e) { System.out.println(e);
	 * }//end catch
	 * 
	 * }
	 */
}
