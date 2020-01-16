package kr.co.prj.service;

import java.sql.SQLException;

import org.json.simple.JSONObject;

import kr.co.prj.dao.ReservationDAO;
import kr.co.prj.domain.MemberCheckDomain;


public class SelectService {

	   public JSONObject multiColumn(String user_id) {
		   JSONObject jo = new JSONObject();
		   
		   ReservationDAO rDao = ReservationDAO.getInstance();
		   
		   MemberCheckDomain mcd2=null;
		   try {
			   mcd2 = rDao.selectMemberInfo(user_id);
		   } catch (SQLException e) {
			   e.printStackTrace();
		   }//end catch
		   
		   jo.put("resultFlag", mcd2!=null);
		   jo.put("user_name",mcd2.getUser_name());
		   jo.put("phone",mcd2.getPhone());
		   jo.put("email",mcd2.getEmail());
		   
		   
		   return jo; 
	   }//multiColumn
	
	
}
