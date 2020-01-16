package kr.co.prj.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.prj.domain.BankInfoDomain;
import kr.co.prj.domain.DiaryDomain;
import kr.co.prj.domain.MemberCheckDomain;
import kr.co.prj.domain.RoomInfoDomain;
import kr.co.prj.domain.RsvTimeDomain;
import kr.co.prj.vo.DiarySearchVO;
import kr.co.prj.vo.ParamDateVO;
import kr.co.prj.vo.RTimeVO;
import kr.co.prj.vo.ReservationTimeVO;
import kr.co.prj.vo.ReservationTotalVO;
import kr.co.prj.vo.ReservationVO;

public class ReservationDAO {
	private static ReservationDAO rsvDao;
	public static SqlSessionFactory ssf;

	private ReservationDAO() {
	}

	public static ReservationDAO getInstance() {
		if (rsvDao == null) {
			rsvDao = new ReservationDAO();
		} // end if
		return rsvDao;
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

	public List<RoomInfoDomain> selectAllRoomInfo() throws SQLException {
		List<RoomInfoDomain> list = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("RoomInfoList"); // parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;

	}// selectAllEmp

	public List<RTimeVO> selectReservationTime(String rNum) throws SQLException {
		List<RTimeVO> list = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("rTime", rNum); // parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;

	}// selectAllEmp

	public ReservationTotalVO selectReservation(String rNum) throws SQLException {
		ReservationTotalVO rVO = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			rVO = ss.selectOne("reservation", rNum); // parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return rVO;

	}// selectAllEmp

	public List<ReservationTotalVO> selectReservation2(String id) throws SQLException {
		List<ReservationTotalVO> list = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("reservation2", id); // parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;

	}// selectAllEmp

	public List<RsvTimeDomain> selectRsvTime() throws SQLException {
		List<RsvTimeDomain> list = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("selectRsvTime"); // parameterType속성이 존재하지 없기 때문에 아이디만 넣는다.
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;

	}// selectAllEmp

	public List<DiaryDomain> diaryList(DiarySearchVO dsVO) throws SQLException {
		List<DiaryDomain> list = null;

		// 3.Handler얻기
		try {
			SqlSession ss = getSessionFactory().openSession();
			list = ss.selectList("diaryList", dsVO); 
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return list;

	}// selectAllEmp

	public MemberCheckDomain selectMemberInfo(String user_id) throws SQLException {
		MemberCheckDomain mcd = null;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			mcd = ss.selectOne("memberChk", user_id);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return mcd;
	}// selectMemberInfo

	public int selectRoomCharge(String room_name) throws SQLException {
		int roomCharge = 0;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			System.out.println(room_name + "---------방이름");
			roomCharge = ss.selectOne("selectRoomCharge", room_name);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return roomCharge;
	}// selectMemberInfo

	public boolean insertReservation(ReservationVO rsvVO) {
		boolean insertFlag = false;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			insertFlag = ss.insert("insertReservation", rsvVO) == 1;
			ss.commit();
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return insertFlag;

	}// insertReservation

	public boolean insertReservationTime(ReservationTimeVO rsvTVO) {
		boolean insertFlag = false;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			insertFlag = ss.insert("insertTime", rsvTVO) == 1;
			ss.commit();
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return insertFlag;

	}// insertReservation

	public String getReservationNum() {
		String reservationCode = "";

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			reservationCode = ss.selectOne("reservationCode");

			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return reservationCode;

	}// insertReservation

	public BankInfoDomain selectBankInfo(String rNum) throws SQLException {
		BankInfoDomain bid = null;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			bid = ss.selectOne("bankInfo", rNum);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return bid;
	}// selectMemberInfo

	public List<Integer> timeCheck(ParamDateVO pdVO) throws SQLException {
		List<Integer> cnt = null;

		try {
			// Handler 얻기
			SqlSession ss = getSessionFactory().openSession();
			// 쿼리 수행 : 한 행 조회
			cnt = ss.selectList("rsvTimeCheck", pdVO);
			ss.close();
		} catch (IOException e) {
			e.printStackTrace();
		} // end catch

		return cnt;
	}

}// class
