package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.domain.ConceptBriefDomain;
import kr.co.prj.domain.RoomInfoDomain;

public class RoomDAO {
	private static RoomDAO rDao;
	private static SqlSessionFactory ssf;
	
	private RoomDAO() {
		org.apache.ibatis.logging.LogFactory.useLog4JLogging();
	}//RoomDAO
	public static RoomDAO getInstance() {
		if(rDao==null) {
			rDao=new RoomDAO();
		}//end if
		return rDao;
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
	
	public List<RoomInfoDomain> RoomInfo(String concept)throws SQLException{
		List<RoomInfoDomain> list = null;
		
		//3.Handler얻기
		try {
			SqlSession ss = getsSessionFactory().openSession();
			System.out.println(concept);
			list=ss.selectList("selectRoomInfo",concept); //parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return list;
	}//selectAllNotice
	public ConceptBriefDomain conceptInfo(String concept)throws SQLException{
		ConceptBriefDomain cbD = null;
		
		//3.Handler얻기
		try {
			SqlSession ss = getsSessionFactory().openSession();
			System.out.println(concept);
			cbD=ss.selectOne("conceptBrief",concept); //parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		return cbD;
	}//selectAllNotice
	
}//class


















