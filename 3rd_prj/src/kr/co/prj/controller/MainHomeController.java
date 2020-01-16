package kr.co.prj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.web.bind.annotation.RequestMethod.GET;


@Controller
public class MainHomeController {
	
	@RequestMapping(value = "main_home.do", method = GET )
	public String mypageMain(Model model) {
		
		
		
		return "main/home";
	}


}
