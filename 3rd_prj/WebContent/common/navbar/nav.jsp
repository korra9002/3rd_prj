<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"
    %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
		<nav class="navbar fixed-top navbar-expand-lg navbar-light"  style="background: rgba(176,171,167,0.7); height: 130px;">
	<!-- HOME Logo 시작-->
  <a class="navbar-brand" href="/3rd_prj/index.do" style="margin-left: 30px; font-size: 40px;  font-family:'Yeseva One', cursive ; color: #FFFFFF;" id="nav-link" >[:P]</a>
	<!-- HOME Logo 끝-->
	
 	<!-- MENU 시작 -->
   <div class="collapse navbar-collapse" id="navbarNavDropdown" style="margin-left: 52%; font-family:'Amaranth','Yeseva One', cursive ; font-size: 22px;">
    <ul class="navbar-nav ">
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Introduce
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <a class="dropdown-item" href="/3rd_prj/introduce/introduce.do" id="sub-menuItem">introduce</a>
            <div class="dropdown-divider"></div>
         <a class="dropdown-item" href="/3rd_prj/introduce/about1.do?concept=Concept_1" id="sub-menuItem" >party & bride</a>
          <a class="dropdown-item" href="/3rd_prj/introduce/about1.do?concept=Concept_2"" id="sub-menuItem" >meeting & conference</a>
        </div>
      </li>
      <li class="nav-item"> 
        <a class="nav-link" href="/3rd_prj/reservation/rsv_main.do" id="nav-link">Reservation</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/3rd_prj/contact/location.do" id="nav-link">Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button"  id="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
         	Board
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="/3rd_prj/board/notice_list.do" id="sub-menuItem">공지사항</a>
          <a class="dropdown-item" href="/3rd_prj/board/qna_list.do" id="sub-menuItem">문의게시판</a>
        </div>
      </li>
      <li class="nav-item" style="margin-left: 20px;" id="nav-link">
      <form class="form-inline" >
      	<%
      		String loginUri = "/3rd_prj/login/login.do";
      		String registerUri ="/3rd_prj/login/signUp.do";
      				
      		String login = "Login";
      		String register = "sign up";
      		String memberId ="";
      
      	if(session.getAttribute("memberId") !=null){
      		memberId = (String)session.getAttribute("memberId");
      		loginUri ="/3rd_prj/login/logout.do";
  			registerUri ="/3rd_prj/login/mypage.do";
  			login ="Logout";
  			register="MyPage";
      	}
      		
      	/* 	if(memberId != null || !memberId.trim().isEmpty()){
      		
      		}
      		 */
      	%>	
      
        <a class="nav-link" href=<%=loginUri %>  id="nav-link"><%=login %></a>&nbsp;|&nbsp;<a href=<%=registerUri %> class="nav-link" id="nav-link"><%=register %></a>
      </form>
      </li>
    </ul>
  </div>
</nav>
 	<!-- MENU 끝 -->