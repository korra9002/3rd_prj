package kr.co.prj.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.prj.dao.BoardDAO;
import kr.co.prj.dao.ReservationDAO;
import kr.co.prj.domain.QnAListDomain;
import kr.co.prj.domain.RoomInfoDomain;

public class RoomInfoService {
	
	public List<RoomInfoDomain> searchRoomInfo(){
		List<RoomInfoDomain> list= null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			list=rsvDao.selectAllRoomInfo();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchRoomInfo
	
}//class
