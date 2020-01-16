package kr.co.prj.service;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONObject;

import kr.co.prj.dao.MypageDAO;
import kr.co.prj.domain.MyCardDomain;
import kr.co.prj.domain.MypageDomain;
import kr.co.prj.domain.MypageQnaDomain;
import kr.co.prj.vo.LoginVO;
import kr.co.prj.vo.modifyInfoVO;
import kr.co.sist.util.cipher.DataEncrypt;

/**
 * 등록된 카드 화면에서 제공해야 할 데이터 생성
 * @author kangg
 */
public class MypageService {	
	
	//등록된 카드
	public List<MyCardDomain> selectAllCard(String id){
		List<MyCardDomain> list=null;
		
		MypageDAO mDao=MypageDAO.getInstance();
		try {
			list = mDao.selectMypageCard(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//selectCard
	
	//문의확인
	public List<MypageQnaDomain> selectQna(String id){
		List<MypageQnaDomain> qnaList=null;
		
		MypageDAO mDao=MypageDAO.getInstance();
		try {
			qnaList=mDao.selectMyQna(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return qnaList;
	}//selectQna
	
	//등록된 카드 삭제
	public boolean removeCard(String chk) {
		boolean flag=false;
		
		MypageDAO mDao=MypageDAO.getInstance();
		try {
			flag= mDao.deleteCard(chk) ==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return flag;
	}//removeCard
	
	public JSONObject passwordChk(LoginVO lVO) {
		JSONObject json = new JSONObject();
		boolean flag = false;
		try {
			lVO.setInputPassword(DataEncrypt.messageDigest("MD5", lVO.getInputPassword()).trim());
		MypageDAO mDao  = MypageDAO.getInstance();
			flag = mDao.passwordChk(lVO);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}//end catch
		json.put("result",flag);
		return json;
	}//passwordChk
	 
	public List<MypageDomain> selectAllInfo(String user_id) {
		List<MypageDomain> list = null;
		MypageDAO mDao = MypageDAO.getInstance();
		try {
			list = mDao.selectAllInfo(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return list; 
	}//selectAllInfo
	
	public JSONObject modifyInfo(modifyInfoVO miVo) {
		JSONObject json=new JSONObject();
		boolean flag = false;
		MypageDAO mDao = MypageDAO.getInstance();
		try {
			 flag = mDao.modifyInfo(miVo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		json.putIfAbsent("result", flag);
		return json;
	}//modifyInfo
}//class
