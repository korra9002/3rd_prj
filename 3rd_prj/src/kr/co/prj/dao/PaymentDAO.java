package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.domain.AccountListDomain;
import kr.co.prj.domain.CardListDomain;
import kr.co.prj.domain.PassHintDomain;
import kr.co.prj.vo.PayForBankVO;
import kr.co.prj.vo.PayForCardVO;

public class PaymentDAO {
	private static PaymentDAO pDao;
	public static SqlSessionFactory ssf;

private PaymentDAO() {
}

	public static PaymentDAO getInstance() {
		if (pDao == null) {
			pDao = new PaymentDAO();
		} // end if
		return pDao;
	}// getInstance

	public SqlSessionFactory getSessionFactory() throws IOException {// 싱글턴 //ssf가 없는 경우에만 만들어지고 있다면 만들어지지 않는다.
		if (ssf == null) {

			Reader reader = null;
			try {
				// 1.설정용 xml을 스트림으로 연결
				reader = Resources.getResourceAsReader("kr/co/prj/dao/mybatis-config.xml");
				// 2.SqlSessionFactoryBuilder 생성
				SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				// 3.SqlSessionFactory 얻기
				ssf = ssfb.build(reader);

			} finally {
				if (reader != null) {
					reader.close();
				} // end if
			} // end finally

		} // end if
		return ssf;
	}// getSessionFactory
	
	
	public List<AccountListDomain> AccountList(){
		//쿼리에서는 인트로 나왔는데 Integer로 받는거 가능한가요~ㅇㅇ
		List<AccountListDomain> acList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			//입력되는 값 없이 모든 레코드를 조회
			acList=ss.selectList("accountList");
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return acList;	
	}//singleColumnMultiRow
	
	public List<CardListDomain> cardList(String id){
		//쿼리에서는 인트로 나왔는데 Integer로 받는거 가능한가요~ㅇㅇ
		List<CardListDomain> caList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			//입력되는 값 없이 모든 레코드를 조회
			caList=ss.selectList("selectCard", id);
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return caList;	
	}//singleColumnMultiRow
	
	
	public int payForCard( PayForCardVO pcVO ) throws SQLException {
		int cnt=0;
		
		try {
			//MyBatix Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//쿼리 수행하고
			cnt=ss.update("payForCard", pcVO);
			//다른 mapper에 똑같은 이름 잇음 에러남. 그래서 namespace와 id를 결합시키면 아이디가 유일해짐!
			//결과에 따라 transaction 완료 
			if(cnt==1) {
				ss.commit();
			}//end if
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}//updateCpEmp
	
	public int payForBank1( PayForBankVO pbVO ) throws SQLException {
		int cnt=0;
		
		try {
			//MyBatix Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			//쿼리 수행하고
			cnt=ss.update("payForBank1", pbVO);
			//다른 mapper에 똑같은 이름 잇음 에러남. 그래서 namespace와 id를 결합시키면 아이디가 유일해짐!
			//결과에 따라 transaction 완료 
			if(cnt==1) {
				ss.commit();
			}//end if
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return cnt;
	}//updateCpEmp
	
	
	
	public int payForBank2(PayForBankVO pbVO) throws SQLException{
		int cnt=0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻는다.
			cnt=ss.insert("payForBank2", pbVO); //여기서 예외터지면 밑에꺼 안타고 나가니까 transaction처리 밑에 해줘도 됨
			//transaction 처리
			ss.commit();
			
			//Handler를 사용완료 했다면 종료한다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		
		return cnt;
	}//insertCpEmp
	
	
}
