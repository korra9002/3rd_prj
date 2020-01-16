package kr.co.prj.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.prj.dao.PaymentDAO;
import kr.co.prj.domain.AccountListDomain;
import kr.co.prj.domain.CardListDomain;
import kr.co.prj.vo.PayForBankVO;
import kr.co.prj.vo.PayForCardVO;

public class PaymentService {

	  public List<AccountListDomain> accountMultiRow(){
		   List<AccountListDomain> list=null;
		   PaymentDAO pDao=PaymentDAO.getInstance();
		   list=pDao.AccountList();
		   return list;  
	   }//multiColumnMultiRow
	  
	  public List<CardListDomain> cardMultiRow(String id){
		   List<CardListDomain> list=null;
		   PaymentDAO pDao=PaymentDAO.getInstance();
		   list=pDao.cardList(id);
		   return list;  
	   }//multiColumnMultiRow
	  
	  
	  public boolean payForCard(PayForCardVO pcVO) {
			boolean flag=false;
			
			PaymentDAO pDao=PaymentDAO.getInstance();
			try {
				flag=pDao.payForCard(pcVO)==1;
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return flag;
		}//modifyEmp
	  
	  public boolean payForBank1(PayForBankVO pbVO) {
		  
		  System.out.println(pbVO.getBank()+"-----------------"+ pbVO.getrNum());
		  boolean flag=false;
		  
		  PaymentDAO pDao=PaymentDAO.getInstance();
		  try {
			  flag=pDao.payForBank1(pbVO)==1;
		  } catch (SQLException e) {
			  e.printStackTrace();
		  }//end catch
		  
		  return flag;
	  }//modifyEmp
	  
		public boolean payForBank2(PayForBankVO pbVO) {
			boolean flag=false;
			
			//DAO를 사용하여 
			PaymentDAO pDao=PaymentDAO.getInstance();
			try {
				//쿼리문을 수행하고 결과를 얻는다.
				int cnt=pDao.payForBank2(pbVO);
				if (cnt ==1) {
					flag=true;
				}//end if
			} catch (SQLException e) {
				e.printStackTrace();
			}//end catch
			
			return flag;
		}//addCpEmp
}
