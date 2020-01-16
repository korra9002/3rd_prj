package kr.co.prj.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.prj.dao.RoomConceptDAO;
import kr.co.prj.domain.RoomConceptDomain;

/**
 * Main화면에서 제공해야할 데이터를 정의
 * @author owner
 */
public class RoomConceptService {
	public List<RoomConceptDomain> conceptInfo(){
		List<RoomConceptDomain>list=null;
		//DAO단의 클래스를 생성하여 DB의 정보를 받는다.
		RoomConceptDAO rcDao = RoomConceptDAO.getInstance();
		try {
			list=rcDao.conceptInfo();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}//selectDept
}
