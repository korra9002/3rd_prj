package kr.co.prj.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.prj.dao.SignUpDAO;
import kr.co.prj.domain.CardTypeDomain;
import kr.co.prj.domain.PassHintDomain;
import kr.co.prj.vo.CardInfoVO;
import kr.co.prj.vo.SignUpVO;


public class SignUpService {

	
	  public List<PassHintDomain> passHintMultiRow(){
		   List<PassHintDomain> list=null;
		   SignUpDAO suDao=SignUpDAO.getInstance();
		   list=suDao.passHintList();
		   return list;  
	   }//multiColumnMultiRow
	   
	  public List<CardTypeDomain> cardTypeMultiRow(){
		  List<CardTypeDomain> ctList = null;
		  SignUpDAO suDao=SignUpDAO.getInstance();
		  ctList = suDao.cardTypeList();
		  return ctList;
	  }
	  
	  public int inputSignUp(SignUpVO suVO) {
		  int cnt =0;
		  SignUpDAO suDao= SignUpDAO.getInstance();
		  try {
			cnt = suDao.insertSignUp(suVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		  return cnt;
	  }
	  
	  public int inputCardInfo(CardInfoVO ciVO) {
		  int cnt =0;
		  SignUpDAO suDao= SignUpDAO.getInstance();
		  try {
			cnt = suDao.insertCardInfo(ciVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		  return cnt;
	  }
	  
}
