package kr.co.prj.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.prj.dao.BoardDAO;
import kr.co.prj.domain.NoticeBoardDetailDomain;
import kr.co.prj.domain.NoticeListDomain;
import kr.co.prj.domain.QnABoardDetailDomain;
import kr.co.prj.vo.IndexListVO;
import kr.co.prj.vo.NoticeModifyVO;
import kr.co.prj.vo.NoticeWriteVO;
import kr.co.prj.vo.QnAModifyVO;
import kr.co.prj.vo.QnAWriteVO;
import kr.co.prj.vo.SearchVO;

public class NoticeService {
	
	/**
	 * 검색값을 받아서 검색값이 없다면 전체 글의 갯수를 조회하고, 검색값이 있다면 
	 * 검색값에 해당하는 글의 갯수를 조회하는 일.
	 * @param sVO
	 * @return
	 */
	public int selectTotalCount(SearchVO sVO) {
		int cnt = 0;
		String mappedId="noticeTotalCount";
		BoardDAO bDao = BoardDAO.getInstance();
		try {
			cnt = bDao.selectTotalCount(mappedId,sVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return cnt;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	/**
	 * 한 화면에 보여줄 게시물의 수
	 * @return
	 */
	public int pageScale() {
		int pageScale=10;
		return pageScale;
	}//pageScale

	/**
	 * 총 페이지를 보여주기 위해 필요한 페이지 수
	 * @param pageScale 한 화면에 보여줄 게시물의 수 
	 * @param totalCount 총 게시물의 수 
	 * @return
	 */
	public int totalPage(int pageScale, int totalCount) {
	  	int totalPage= totalCount/pageScale ;//모든 게시물을 보여주기 위한 총 페이지 수
	  	
		if ( totalCount % pageScale !=0 ) {// pageScale로 딱 떨어지지 않으면 나머지 게시물을 보여주기 위해 한 장 더 필요하다.
			totalPage++;
		} //end if
		//int totalPage=(int)Math.ceil( (double) totalCount / pageScale );
		
		return totalPage;
	}//totalPage
	/**
	 * 페이지의 시작번호 구하는 일
	 * @param pageScale
	 * @param currentPage
	 * @return
	 */
	public int startNum( int pageScale, int currentPage) {
		int startNum=currentPage*pageScale()-pageScale()+1;
			
		return startNum;
	}//startNum
	
	/**
	 * 페이지의 끝번호 구하는 일
	 * @param pageScale
	 * @param startNum
	 * @return
	 */
	public int endNum(int pageScale, int startNum) {
		int endNum=startNum+pageScale-1;
		return endNum;
	}//endNum
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	public List<NoticeListDomain> searchAllNotice( SearchVO sVO){
		List<NoticeListDomain> noticeList= null;
		BoardDAO bDao = BoardDAO.getInstance();
		try {
			noticeList=bDao.selectAllNotice(sVO);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return noticeList;
	}//searchAllNotice
	public NoticeBoardDetailDomain searchDetailNotice(int num){
		NoticeBoardDetailDomain nbdd =null;
		BoardDAO bDao = BoardDAO.getInstance();
		
		try {
			nbdd = bDao.selectDetailNotice(num);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		return nbdd;
	}//searchDetailQnA
	
	public JSONObject insertNoticePost(NoticeWriteVO nwVO) {
		boolean flag = false;
		JSONObject json = new JSONObject();
		
		
		

		
			BoardDAO bDAO = BoardDAO.getInstance();
			

			flag = bDAO.insertNoticePost(nwVO)==1;
		
		json.put("result", flag);
		return json;
	}//insertNoticePost
	
	public JSONObject addFile(MultipartFile multipartFile) {
		JSONObject json = new JSONObject();
		boolean flag = false;
		File file = null;
		String uploadPath = "C:/Users/owner/git/3rd_prj/3rd_prj/WebContent/common/images/";
		try {
			if(!multipartFile.isEmpty()&&multipartFile.getName()!=null) {
				file = new File(uploadPath, multipartFile.getOriginalFilename());
				
				if(!file.exists()) {
					multipartFile.transferTo(file);
				}//end if
				}//end if
		
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		if(multipartFile.getOriginalFilename()!=null) {
			flag = true;
		}//end if
		json.put("result", flag);
		
		return json;
	}//addFile
	
	public JSONObject deletePostNotice(int n_num) {
		JSONObject json = new JSONObject();
		BoardDAO bDAO = BoardDAO.getInstance();
		boolean flag = bDAO.deletePostNotice(n_num)==1;
		json.put("result" , flag);
		return json;
	}//deletePostNotice
	
	public JSONObject updatePostNotice(NoticeModifyVO nmVO) {
		boolean flag=false;
		JSONObject json = new JSONObject();
		
		BoardDAO bDAO = BoardDAO.getInstance();
		flag = bDAO.updatePostNotice(nmVO)==1;
		
		json.put("result", flag);
		
		return json;
	}//deletePostNotice
	
	
	
	
	// 현재 게시판의 페이지 인덱스 설정
public String indexList(IndexListVO ilVO) {
			int pagenumber; // 화면에 보여질 페이지 인덱스 수
			int startpage; // 화면에 보여질 시작페이지 번호
			int endpage; // 화면에 보여질 마지막페이지 번호
			int curpage; // 이동하고자 하는 페이지 번호

			String strList=""; // 리턴될 페이지 인덱스 리스트

			pagenumber = 5; // 한 화면의 페이지 인덱스 수 

			// 시작 페이지번호 구하기
			startpage = ((ilVO.getCurrentPage() - 1) / pagenumber) * pagenumber + 1;

			// 마지막 페이지번호 구하기
			endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;

			// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 

			// 총 페이지 수가 마지막페이지 번호가 됨


			if (ilVO.getTotalPage() <= endpage){
				endpage = ilVO.getTotalPage();
			}//end if

			// 첫번째 페이지 인덱스 화면이 아닌경우
			if ( ilVO.getCurrentPage() > pagenumber) {
				curpage = startpage - 1; // 시작페이지 번호보다 1 적은 페이지로 이동														
				strList = strList + "<li class=\"page-item\"><a class=\"page-link text-dark\" href="+ilVO.getUrl()+"page="+curpage+" aria-label=\"Previous\">\r\n" + 
						"         <span aria-hidden=\"true\">&laquo;</span></a></li>"; 
			}else{
				strList = strList + "		    <li class=\"page-item\">\r\n" + 
										"		      <a class=\"page-link text-dark\" href=\"#\" aria-label=\"Previous\">\r\n" + 
										"		        <span aria-hidden=\"true\">&laquo;</span>\r\n" + 
										"		      </a>\r\n" + 
										"		    </li>";
			}

			//strList = strList + " ... ";

			// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
			curpage = startpage;

			while (curpage <= endpage){
				if (curpage == ilVO.getCurrentPage()) {
					strList = strList + "<li class=\"page-item\"><a class='page-link text-white  bg-secondary' title='현재페이지'>"+ilVO.getCurrentPage()+"</a></li>";
				} else {
					strList = strList +"<li class=\"page-item\"><a class=\"page-link text-dark \" href="+ilVO.getUrl()+"page="+curpage+">"+curpage+"</a></li>";
				}//end else

				curpage++;
			}//end while

			//strList = strList + " ... ";

			// 뒤에 페이지가 더 있는경우
			if ( ilVO.getTotalPage() > endpage) {
				curpage = endpage + 1; 
				strList = strList + "<li class=\"page-item\">\r\n" + 
						"		      <a class=\"page-link text-dark \" href="+ilVO.getUrl()+"page="+curpage+" aria-label=\"Next\">\r\n" + 
								"		        <span aria-hidden=\"true\">&raquo;</span></a>";
			}else{
				strList = strList + "<li class=\"page-item\">\r\n" + 
						"		      <a class=\"page-link text-dark \" href=\"#\" aria-label=\"Next\">\r\n" + 
						"		        <span aria-hidden=\"true\">&raquo;</span>\r\n" + 
						"		      </a>\r\n" + 
						"		    </li>";
			}//end else

			return strList;
		}//indexList
	
	
	
}//class
