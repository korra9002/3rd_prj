<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"
    %>
		<nav class="navbar fixed-top navbar-expand-lg navbar-light"  style="background: rgba(176,171,167,0.7); height: 130px;">
	<!-- HOME Logo 시작-->
  <a class="navbar-brand" href="/3rd_prj/index.do" style="margin-left: 30px; font-size: 40px;  font-family:'Yeseva One', cursive ; color: #FFFFFF;" id="nav-link" >[:P]</a>
	<!-- HOME Logo 끝-->
	
 	<!-- MENU 시작 -->
   <div class="collapse navbar-collapse" id="navbarNavDropdown" style="margin-left: 55%; font-family:'Amaranth','Yeseva One', cursive ; font-size: 22px;">
    <ul class="navbar-nav ">
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Introduce
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <a class="dropdown-item" href="/3rd_prj/introduce/introduce.do" id="sub-menuItem">introduce</a>
            <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/3rd_prj/introduce/about1.do" id="sub-menuItem" >party & bride</a>
          <a class="dropdown-item" href="/3rd_prj/introduce/about2.do" id="sub-menuItem" >meeting & conference</a>
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
        <a class="nav-link" href="/3rd_prj/login/login.do"  id="nav-link">Login</a>&nbsp;|&nbsp;<a href="/3rd_prj/login/signUp.do" class="nav-link" id="nav-link">sign up</a>
      </form>
      </li>
    </ul>
  </div>
</nav>
 	<!-- MENU 끝 -->