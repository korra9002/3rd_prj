package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.domain.CardTypeDomain;
import kr.co.prj.domain.PassHintDomain;
import kr.co.prj.vo.CardInfoVO;
import kr.co.prj.vo.SignUpVO;

public class SignUpDAO {
	private static SignUpDAO suDao;
	public static SqlSessionFactory ssf;
	
	private SignUpDAO() {
	}

	public static SignUpDAO getInstance() {
		if(suDao==null) {
			suDao=new SignUpDAO();
		}//end if
		return suDao;
	}//getInstance
	
	public SqlSessionFactory getSessionFactory()throws IOException {//싱글턴 //ssf가 없는 경우에만 만들어지고 있다면 만들어지지 않는다.
		if(ssf==null) {
			
			Reader reader = null;
			try {
				//1.설정용 xml을 스트림으로 연결
					reader = Resources.getResourceAsReader("kr/co/prj/dao/mybatis-config.xml");
				//2.SqlSessionFactoryBuilder 생성
					SqlSessionFactoryBuilder ssfb = new SqlSessionFactoryBuilder();
				//3.SqlSessionFactory 얻기
					ssf= ssfb.build(reader);
				 
			}finally {
				if(reader!=null) {reader.close();}//end if
			}//end finally
			
		}//end if
		return ssf;
	}//getSessionFactory
	
	public List<PassHintDomain> passHintList(){
		//쿼리에서는 인트로 나왔는데 Integer로 받는거 가능한가요~ㅇㅇ
		List<PassHintDomain> phList=null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			//입력되는 값 없이 모든 레코드를 조회
			phList=ss.selectList("passHint");
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return phList;	
	}//singleColumnMultiRow
	
	public List<CardTypeDomain> cardTypeList(){
		List<CardTypeDomain> ctList = null;
		
		try {
			SqlSession ss=getSessionFactory().openSession();
			ctList = ss.selectList("cardType");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return ctList;
		
	}
	
	public int insertSignUp(SignUpVO suVO) throws SQLException{
		int cnt=0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻는다.
			cnt=ss.insert("SignUp", suVO); //여기서 예외터지면 밑에꺼 안타고 나가니까 transaction처리 밑에 해줘도 됨
			//transaction 처리
			System.out.println("커밋 전");
			ss.commit();
			System.out.println("커밋 완료");
			
			//Handler를 사용완료 했다면 종료한다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		
		return cnt;
	}//insertCpEmp
	
	public int insertCardInfo(CardInfoVO ciVO) throws SQLException{
		int cnt=0;
		try {
			//4. MyBatis Handler 얻기
			SqlSession ss=getSessionFactory().openSession();
			//5. id를 넣어 mapper xml에서 해당 쿼리를 parsing하여 실행하고 결과를 얻는다.
			cnt=ss.insert("inputCardInfo", ciVO); //여기서 예외터지면 밑에꺼 안타고 나가니까 transaction처리 밑에 해줘도 됨
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
