package kr.co.prj.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.prj.domain.QnABoardDetailDomain;
import kr.co.prj.domain.QnAListDomain;
import kr.co.prj.service.QnAService;
import kr.co.prj.vo.IndexListVO;
import kr.co.prj.vo.QnAAddRpVO;
import kr.co.prj.vo.QnAModifyVO;
import kr.co.prj.vo.QnAWriteVO;
import kr.co.prj.vo.RpModifyVO;
import kr.co.prj.vo.SearchVO;


@Controller
public class QnAController {

	@RequestMapping(value="board/qna_list.do",method =GET)
	public String searchQnABoard(HttpServletRequest request,Model model) {

		String currentPage = request.getParameter("page");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		
		int tempPage=1;
		if( currentPage != null ) {//유효성 검증
			tempPage=Integer.parseInt(currentPage);
		}//end if
		
		QnAService qs = new QnAService();
		int pageScale=qs.pageScale(); //한 화면에 보여줄 글 수 
		int startNum=qs.startNum(pageScale, tempPage);// 시작번호
		int endNum=qs.endNum(pageScale, startNum); //끝 번호
		SearchVO sVO = new SearchVO(field,keyword,tempPage,startNum,endNum);
		int totalCount=qs.selectTotalCount(sVO); // 전체 글 조회
		int totalPage=qs.totalPage(pageScale, totalCount); //총 페이지 수
		String indexList="";
		
		//인덱스 리스트 생성
		if(field==null&&keyword==null) {
			 indexList=qs.indexList(new IndexListVO(tempPage, totalPage, "qna_list.do?"));
			
		}else {
			 indexList=qs.indexList(new IndexListVO(tempPage, totalPage, "qna_list.do?field="+field+"&keyword="+keyword+"&"));
		}

		 List<QnAListDomain> list = qs.searchAllQnA(sVO);
		 model.addAttribute("list", list);
		 model.addAttribute("totalPage", totalPage);
		 //view에서 값을 사용할 수 있도록 scope객체에 값을 설정
		 model.addAttribute("indexList", indexList);
		 return "board/qna_list";
	}//searchBoard
	
	@RequestMapping(value="board/qna_post.do",method= {GET,POST})
	public String searchQnADetail(int q_num,Model model) {

		QnAService qs = new QnAService();
		QnABoardDetailDomain qbdd = qs.searchDetailQnA(q_num);
		model.addAttribute("qbdd",qbdd);
		return "board/qna_post";
	}//searchQnADetail
	
	@RequestMapping(value="board/write_form.do",method=GET)
	public String writeForm() {
		return "board/write_form";
	}//searchQnADetail
	/**
	 * @param session
	 * @param qwVO
	 * @return
	 */
	@RequestMapping(value="board/write_post.do",method=POST)
	@ResponseBody
	public String writeProcess(HttpSession session,QnAWriteVO qwVO) {
		System.out.println(qwVO.getUser_id()+"호호홍홍홍");
	
		JSONObject json = null;
		QnAService qs = new QnAService();
		 json = qs.insertQnAPost(qwVO);
		return json.toJSONString();
	}
	@RequestMapping(value="board/delete_post.do",method=GET)
	@ResponseBody
	public String deleteProcess(int q_num) {
		JSONObject json=null;
		QnAService qs = new QnAService();
		json = qs.deletePostQnA(q_num);
		return json.toJSONString();
	}//deleteProcess
	@RequestMapping(value="board/modify_form.do",method=POST)
	public String modifyForm() {
		
		return "board/modify_form";
	}//modifyForm
	@RequestMapping(value="board/modify_process.do",method=POST)
	@ResponseBody
	public String modifyProcess(QnAModifyVO qVo) {
		JSONObject json = null;
		QnAService qs = new QnAService();
		json =qs.updatePostQnA(qVo);
		return json.toJSONString();
	}//modifyProcess
	
	@RequestMapping(value="board/addRp.do" , method=POST)
	@ResponseBody
	public String addRp_process(QnAAddRpVO qarVO) {
		JSONObject json = null;
		QnAService qs = new QnAService();
		json = qs.updateQnARp(qarVO);
		
		return json.toJSONString();
	}//addRp_process
	@RequestMapping(value="board/rp_modify.do", method=POST)
	@ResponseBody
	public String rpModifyProcess(QnAAddRpVO qarVO) {
		JSONObject json = null;
		QnAService qs = new QnAService();
		json = qs.replyModify(qarVO);
		
		return  json.toJSONString();
	}//rpModifyProcess
}//class
