package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.vo.LoginVO;

public class LoginDAO {
	private static LoginDAO loDao;
	public static SqlSessionFactory ssf;
	
	private LoginDAO() {
	}

	public static LoginDAO getInstance() {
		if(loDao==null) {
			loDao=new LoginDAO();
		}//end if
		return loDao;
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
	public String login(LoginVO lVo) throws SQLException{
		String id ="";
		System.out.println(lVo);
		SqlSession ss;
		try {
			ss = getSessionFactory().openSession();
			id=ss.selectOne("login",lVo);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return id;
	}//login
}
