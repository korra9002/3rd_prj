package kr.co.prj.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.prj.dao.ReservationDAO;
import kr.co.prj.domain.BankInfoDomain;
import kr.co.prj.domain.DiaryDomain;
import kr.co.prj.domain.RsvTimeDomain;
import kr.co.prj.vo.DiarySearchVO;
import kr.co.prj.vo.ParamDateVO;
import kr.co.prj.vo.RTimeVO;
import kr.co.prj.vo.ReservationTimeVO;
import kr.co.prj.vo.ReservationTotalVO;
 
public class ReservationService {

	public ReservationTotalVO selectReservation(String rNum){
		ReservationTotalVO rVO= null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			rVO=rsvDao.selectReservation(rNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return rVO;
	}//searchRsvTime
	
	public List<ReservationTotalVO> selectReservation2(String id){
		List<ReservationTotalVO> list= null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			list=rsvDao.selectReservation2(id);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchRsvTime
	
	
	public List<RTimeVO> selectReservationTime(String rNum){
		List<RTimeVO> list= null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			list=rsvDao.selectReservationTime(rNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchRsvTime
	
	
	public List<DiaryDomain>  diaryList(DiarySearchVO dsVO){
		List<DiaryDomain> list= null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			list=rsvDao.diaryList(dsVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//searchRsvTime
	
	
	
	public BankInfoDomain selectBankInfo(String rNum) {
		BankInfoDomain bid = null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			bid=rsvDao.selectBankInfo(rNum);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return bid;
	}
	
	public List<Integer>  timeCheck(ParamDateVO pdVO){
		List<Integer> cnt = null;
		ReservationDAO rsvDao = ReservationDAO.getInstance();
		try {
			cnt=rsvDao.timeCheck(pdVO);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}
	
	
}
