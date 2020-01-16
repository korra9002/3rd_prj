<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="스마트메뉴를 사용하기 위한 코드" 
    session="true"
    isELIgnored="false"
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    String url="login.jsp";
    String msg="로그인";
    String id=(String)session.getAttribute("admin_id");
    
    if (id !=null){ //로그인을 했다는 것
    	msg="로그아웃";
    	url="log_out.jsp";
    }//end if
    
    pageContext.setAttribute("msg", msg);
    pageContext.setAttribute("login_url", url);
    
    
    %>
	    <nav id="main-nav">
      <!-- Sample menu definition -->
      <ul id="main-menu" class="sm sm-simple">
        <li><a href="http://211.63.89.150:8080/spring_mvc_temp/diary/${ login_url }"><c:out value="${ msg }"/></a></li>
        
        <li><a href="#void">작업</a>
          <ul>
            <li><a href="http://211.63.89.150:8080/spring_mvc_temp/diary/diary.jsp">캘린더</a></li>
            <li><a href="http://211.63.89.150:8080/spring_mvc_temp/diary/list.jsp" >리스트</a></li>
          </ul>
        </li>
        <li><a href="#">Upload</a>
	        <ul>
	            <li><a href="#">Apache Commons File Upload</a></li>
	            <li><a href="#">MultipartRequest File Upload</a></li>
	        </ul>
        </li>
        </ul>
        </nav>	