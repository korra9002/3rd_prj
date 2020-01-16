package kr.co.prj.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.prj.domain.PassHintDomain;
import kr.co.prj.service.FindService;
import kr.co.prj.service.LoginService;
import kr.co.prj.service.SignUpService;
import kr.co.prj.vo.FindIdEmailVO;
import kr.co.prj.vo.FindIdPhoneVO;
import kr.co.prj.vo.FindPwVO;
import kr.co.prj.vo.LoginVO;
import kr.co.prj.vo.SendEmailVO;
import kr.co.sist.util.cipher.DataEncrypt;
 @Controller
public class LoginController {

	 @Autowired
		private JavaMailSender mailSender;
	

	@RequestMapping(value="login/login.do")
	public String loginForm() {
		return "login/login";

		
	}//introduceForm
	
	@RequestMapping(value="login/login_process.do")
	public String loginProcess(HttpSession session,LoginVO lVO) {
		System.out.println( lVO.getInputId()+"/"+lVO.getInputPassword());
		
		String uri = "login/failLogin";
		
		
		try {
			lVO.setInputPassword(DataEncrypt.messageDigest("MD5", lVO.getInputPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		LoginService ls = new LoginService();
		if(ls.login(lVO)) {
			session.setAttribute("memberId", lVO.getInputId());
			uri = "main/home";
		}
		
		System.out.println("로그인 성공 아이디:"+session.getAttribute("memberId"));
		return uri;
	}
	
	@RequestMapping(value = "login/logout.do")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate();
		
		
		return "main/home";
	}//logoutProcess
	
	
	@RequestMapping(value = "login/find_id.do")
	public String findId() {
	
		
		return "login/find_id";
	}//ajax로 해서 alert
	
	@RequestMapping(value = "login/find_id1.do",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String findId(FindIdPhoneVO fvo) {
		FindService fs=new FindService();
		JSONObject json=fs.findIdByPhone(fvo);
		System.out.println(json.toJSONString());
		return json.toJSONString();		
	}//findId
	
	@RequestMapping(value = "login/find_id2.do",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String findIdByEmail(FindIdEmailVO fevo) {
		FindService fs=new FindService();
		JSONObject json=fs.findIdByEmail(fevo);
		System.out.println(json.toJSONString());
		return json.toJSONString();		
	}//findId
	

	@RequestMapping(value = "login/find_pw.do")
	public String findPw(Model model) {	
		
		SignUpService ss = new SignUpService();
		List<PassHintDomain> list = ss.passHintMultiRow();
		
		model.addAttribute("passHintList",list);
		System.out.println(list);
		
		return "login/find_pw";
	}//ajax로 해서 alert
	
	
	 @RequestMapping(value = "login/find_pw2.do", produces =
	 "application/json; charset=utf8")
	 
	 @ResponseBody
	 public String setPw(FindPwVO fpvo) { 
	 boolean updateFlag=false;

	 System.out.println(fpvo.getId()+"------"+fpvo.getPhone()+"------"+fpvo.getEmail()+"--------"+fpvo.getHint_code()+"---"+fpvo.getAnswer());
	 
	 FindService fs=new FindService();
	 JSONObject json=fs.findPw(fpvo);
	 String email=fpvo.getEmail();
	 String id=(String)json.get("id");

	 System.out.println(json.toJSONString()); 

	 FindService fs1=new FindService();
	// updateFlag=fs1.setPw(id, email);
	//	 System.out.println(updateFlag);
	
	 
	 SendEmailVO sevo=fs1.setPw(id, email);
	 
	 updatePw(sevo);
	 
	 return json.toJSONString();	
	// return "login/send_email";
	 }//findId
	 

	 
	 
	 public void updatePw(SendEmailVO sevo) {
		 
		 
		 
		 String setfrom = "";
			String tomail = sevo.getEmail(); // 받는 사람 이메일
			String title = sevo.getId() +"님의 임시 비밀번호 발급 메일입니다.";  // 제목
			StringBuilder content=new StringBuilder();
			

			
			content.append("<h1>"+"[ :P ]"+"</h1> \n\n")
					  //.append("<img src=\"http://211.63.89.150:8080/3rd_prj/common/images/plogo.png\">")
						
					  .append("비밀번호는 관리자도 알 수 없도록<br/>")
					  .append("암호화하여 저장되기 때문에<br/>")
					  .append("새로운 임시비밀번호를 생성하여 안내해 드리오니<br/>")
					  .append("임시비밀번호로 로그인하신 후, <br/>")
					  .append("비밀번호 분실 방지를 위해 개인정보 변경을 통해 <br/>")
					  .append("새로운 비밀번호로 변경하여 사용해 주십시오. <br/>")
					  .append("<br/>")
					  .append(sevo.getId()+" 님의 임시 비밀번호는 '<strong>"+sevo.getPassword()+"'</strong> 입니다.<br/>")
					  .append("<br/>")
					  .append("서울시 강남구 역삼동 409-7 3F, 4F [ :P ] | Copyright(C)2010 Worldjob.or.kr.All Rights Reserved. ");

										 

			try {
				
				
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,
						true, "UTF-8");
				
				System.out.println("메일 보내고 싶어여ㅠ");

				messageHelper.setFrom("pspace.rental@gmail.com"); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo( tomail ); // 받는사람 이메일
				messageHelper.setSubject( title ); // 메일제목은 생략이 가능하다
				messageHelper.setText(String.valueOf(content), true); // 메일 내용

				/**
				 * 이미지 보내기 안됨 시간 나면 하기
				String contents = content+ "<img src=\"cid:plogo.png\">";
				messageHelper.setText(contents, true);
				
				FileSystemResource file = new FileSystemResource(new File("c:/plogo.png")); 
				messageHelper.addInline("plogo.png", file);
				*/
				
				
				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e);
			}//end catch
			
			return;
		 
	 }//updatePw


}
