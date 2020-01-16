package kr.co.prj.service;

import java.sql.SQLException;

import kr.co.prj.dao.BoardDAO;
import kr.co.prj.dao.LoginDAO;
import kr.co.prj.vo.LoginVO;

public class LoginService {
	public boolean login(LoginVO lVo) {
		boolean flag = false;
		LoginDAO loDao = LoginDAO.getInstance();
		String id ="";
		try {
			id = loDao.login(lVo);
			System.out.println(id+"³Î?");
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		if(lVo.getInputId().equals(id)) {
			flag=true;
		}
		
		return flag;
	}//login
}//class
