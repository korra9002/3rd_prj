package kr.co.prj.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.prj.domain.CardTypeDomain;
import kr.co.prj.domain.PassHintDomain;
import kr.co.prj.service.FindService;
import kr.co.prj.service.SignUpService;
import kr.co.prj.vo.CardInfoVO;
import kr.co.prj.vo.SignUpVO;
import kr.co.sist.util.cipher.DataEncrypt;

@Controller
public class SignUpController {

	@RequestMapping(value="login/signUp.do")
	public String signUpForm(Model model) {
		
		SignUpService ss = new SignUpService();
		List<PassHintDomain> list = ss.passHintMultiRow();
		
		model.addAttribute("passHintList",list);
		System.out.println(list);
		
		
		return "login/signUp";
	}//introduceForm
	
	@RequestMapping(value="login/input_card.do")
	public String signUpNext(HttpSession session,Model model,SignUpVO suVO) {

		session.setAttribute("signUpVO",suVO);
		
		SignUpService ss = new SignUpService();
		List<CardTypeDomain> list = ss.cardTypeMultiRow();
		model.addAttribute("cardTypeList",list);
		
		return "login/input_form";
	}//introduceForm
	
	@RequestMapping(value="login/finish_signUp.do")
	public String signUpFinish(HttpSession session, CardInfoVO ciVO) {
		
		SignUpVO suVO = (SignUpVO) session.getAttribute("signUpVO");
		ciVO.setUser_id(suVO.getUser_id());
		signUpProcess(suVO, ciVO);
		
		
		
		return "main/home";
	}//introduceForm
	
	@RequestMapping(value="login/finish_signUp_noCard.do")
	public String signUpFinishNoCard(HttpSession session) {
		
		SignUpVO suVO = (SignUpVO) session.getAttribute("signUpVO");
		System.out.println(suVO+"탓다");
		signUpProcess(suVO, null);
		
		return "main/home";
	}//introduceForm
	
	
	
	
	
	
	
	
	//아이디 중복 체크
	@RequestMapping(value = "/login/checkSignup.do", method = RequestMethod.POST)
		public @ResponseBody String AjaxView( @RequestParam("id") String id){
			String str = "";
			FindService fs=new FindService();
			int idcheck = fs.checkId(id);
			if(idcheck==1){ //이미 존재하는 계정
				str = "NO";	
			}else{	//사용 가능한 계정
				str = "YES";	
			}
			return str;
		}

	


	
	public void signUpProcess(SignUpVO suVO, CardInfoVO ciVO) {
		SignUpService ss= new SignUpService();
		if(suVO !=null) {
			passEncrypt(suVO);
			ss.inputSignUp(suVO);
		}
		if(ciVO !=null) {
			ss.inputCardInfo(ciVO);
		}
	
		
	}
	
	
	
	public void passEncrypt(SignUpVO suVO) {
		try {
			suVO.setPassword(DataEncrypt.messageDigest("MD5", suVO.getPassword()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	//	return suVO;
	}
	
	
	
	
	
}
