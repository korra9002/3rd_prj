package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.prj.domain.NoticeBoardDetailDomain;
import kr.co.prj.domain.NoticeListDomain;
import kr.co.prj.service.NoticeService;
import kr.co.prj.service.QnAService;
import kr.co.prj.vo.IndexListVO;
import kr.co.prj.vo.NoticeModifyVO;
import kr.co.prj.vo.NoticeWriteVO;
import kr.co.prj.vo.QnAModifyVO;
import kr.co.prj.vo.SearchVO;


@Controller
public class NoticeController {

	@RequestMapping(value="board/notice_list.do" ,method =RequestMethod.GET )
	public String searchNoticeBoard(HttpServletRequest request,Model model) {
		
		String currentPage = request.getParameter("page");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		
		int tempPage=1;
		if( currentPage != null ) {//유효성 검증
			tempPage=Integer.parseInt(currentPage);
		}//end if
		
		NoticeService ns = new NoticeService();
		
		int pageScale=ns.pageScale(); //한 화면에 보여줄 글 수 
		int startNum=ns.startNum(pageScale, tempPage);// 시작번호
		int endNum=ns.endNum(pageScale, startNum); //끝 번호
		SearchVO sVO = new SearchVO(field,keyword,tempPage,startNum,endNum);
		int totalCount=ns.selectTotalCount(sVO); // 전체 글 조회
		int totalPage=ns.totalPage(pageScale, totalCount); //총 페이지 수
		
		String indexList="";
		
		//인덱스 리스트 생성
		if(field==null&&keyword==null) {
			 indexList=ns.indexList(new IndexListVO(tempPage, totalPage, "notice_list.do?"));
			
		}else {
			 indexList=ns.indexList(new IndexListVO(tempPage, totalPage, "notice_list.do?field="+field+"&keyword="+keyword+"&"));
		}

		
		
		List<NoticeListDomain> list= ns.searchAllNotice(sVO);
		model.addAttribute("list",list);
		model.addAttribute("totalPage", totalPage);
		 //view에서 값을 사용할 수 있도록 scope객체에 값을 설정
		 model.addAttribute("indexList", indexList);
		return "board/notice_list";
	}//searchBoard
	
	@RequestMapping(value="board/notice_post.do" ,method =RequestMethod.GET )
	public String searchNoticeDetail(int n_num,Model model) {
		NoticeService ns = new NoticeService();
		NoticeBoardDetailDomain nbdd = ns.searchDetailNotice(n_num);
		model.addAttribute("nbdd",nbdd);
		return "board/notice_post";
	}//searchBoard
	
	@RequestMapping(value="board/n_write_form.do",method=GET)
	public String writeForm() {
	
		return "board/n_write_form";
	}//searchQnADetail
	
	@RequestMapping(value="board/n_write_process.do",method=POST)
	@ResponseBody
	public String writeProcess(NoticeWriteVO nwVO) {
		JSONObject json = null;
		NoticeService ns = new NoticeService();
		
			json = ns.insertNoticePost(nwVO);
		return json.toJSONString();
	}//writeProcess
	
	@RequestMapping(value="board/n_delete_post.do",method=POST)
	@ResponseBody
	public String deleteProcess(int n_num) {
		JSONObject json=null;
		NoticeService ns = new NoticeService();
		json = ns.deletePostNotice(n_num);
		return json.toJSONString();
	}//deleteProcess
	
	@RequestMapping(value="board/n_modify_form.do",method=POST)
	public String modifyForm(int n_num,Model model) {
		model.addAttribute("n_num",n_num);
		return "board/n_modify_form";
	}//modifyForm
	
	@RequestMapping(value="board/addFile.do",method=POST)
	@ResponseBody
	public String addFile(@RequestParam(value ="image",required = false)MultipartFile file) {
		JSONObject json = null;
		NoticeService ns = new NoticeService();
		
		json = ns.addFile(file);
		
		return json.toJSONString();
	}//addFile
	
	@RequestMapping(value="board/n_modify_process.do",method=POST)
	@ResponseBody
	public String modifyProcess(NoticeModifyVO nmVO) {
		JSONObject json = null;
		NoticeService ns = new NoticeService();
		json =ns.updatePostNotice(nmVO);
		
		return json.toJSONString();
	}//modifyProcess
}//class
