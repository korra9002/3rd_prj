package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.domain.RoomConceptDomain;

public class RoomConceptDAO {
	private static RoomConceptDAO rcDao;
	private static SqlSessionFactory ssf;
	
	private RoomConceptDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}//RoomDAO
	public static RoomConceptDAO getInstance() {
		if(rcDao==null) {
			rcDao=new RoomConceptDAO();
		}//end if
		return rcDao;
	}//getInstance
	
	public SqlSessionFactory getsSessionFactory()throws IOException{
		if(ssf==null) {
			Reader reader=null;
			try {
			reader=Resources.getResourceAsReader("kr/co/prj/dao/mybatis-config.xml");
			SqlSessionFactoryBuilder ssfb=new SqlSessionFactoryBuilder();
			ssf=ssfb.build(reader);
			}finally {
				if(reader!=null) {reader.close();}//end if
			}//end finally
		}//end if
		return ssf;
	}//getsSessionFactory
	
	public List<RoomConceptDomain> conceptInfo()throws SQLException{
		List<RoomConceptDomain> list = null;
		
		//3.Handler얻기
		try {
			SqlSession ss = getsSessionFactory().openSession();
			list=ss.selectList("conceptInfo"); //parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//selectAllNotice
	
}//class


















