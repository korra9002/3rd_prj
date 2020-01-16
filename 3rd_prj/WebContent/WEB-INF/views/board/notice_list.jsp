<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    trimDirectiveWhitespaces="true"
    %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/3rd_prj/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{ min-width:1100px; margin: 0px auto;
	display: flex; min-height: 100vh; flex-direction: column;
	}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%; flex: 1;}
	.btn{width: 100px;height: 40px;}
	.nav-item{margin: 10px;}
	#sub-menuItem{font-family:"고딕";}
	#ex{padding-bottom: 20px; width: 150px; font-size: 15px;}
	/* 컨테이너 끝  */
	/* 푸터 시작  */
	#footer{  min-width:1100px;min-height: 250px;position:relative;  background-color: #E3C6C2;}
	#fContent{ width: 1100px;height: 110px; padding-top: 30px; margin-right: auto; margin-left: auto }
	/* 푸터 끝  */
	#hTitle{font-family: '고딕'; font-size: 30px; font-weight: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
<style type="text/css">
.alert-danger{color: #000000; background-color: #E3C6C2}
bg-secondary{ background-color: #E3C6C2}
</style>
<script type="text/javascript">
$(function(){
	$("#searchBtn").click(function(){
		//유효성 검증
		if ($("#keyword").val().trim() ==""){
			alert("검색어를 입력해주세요");
			$("#keyword").focus();
			return;
		};//end if /* id는 자바스크립트에서 편하게 쓰려고 하는거고 name은 백엔드로 넘길 값 */
		$("#searchFrm").submit();
	});//click
});//ready
</script>
</head>
<body>
<div id="class4Wrap">
<div id="naviBar">
 	<!-- MENU 시작 -->
 	<%@include file="../../../common/navbar/nav.jsp" %>
 	<!-- MENU 끝 -->
</div>
<div id="container">
<h3>공지 게시판</h3>
<table class="table table-hover" style="text-align: center;">
  <thead class="thead" style="background-color: #C8C4C1" >
    <tr>
      <th scope="col" >no</th>
      <th scope="col" style="width: 700px;">제목</th>
      <th scope="col" >작성일</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="list" items="${list}">
    <tr>
      <th scope="row" ><c:out value="${list.num }"/></th>
      <td><a href="notice_post.do?n_num=${list.num}" style="color: black;"><c:out value="${list.subject}"/></a></td>
      <td><c:out value="${list.input_date}"/></td>
    </tr>
    </c:forEach>
    <c:if test="${empty list}">
			<tr>
			<td colspan="5" style="text-align: center;">공지사항 내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
  </tbody>
</table>

<form action="notice_list.do"method="get" id="searchFrm">
<div class="form-row" style="margin: 0px auto; margin-left: 250px;">
  <div class="form-group col-mb-2">
      <select id="field" name="field" class="form-control" style="width: 150px;">
        <option value="n_subject"${param.field eq 'n_subject'?" selected='selected'":"" }>제목</option>
        <option value="n_content"${param.field eq 'n_content'?" selected='selected'":"" }>내용</option>
      </select>
    </div>
    <div class="form-group col-mb-2">
      <input type="text" class="form-control" value="${param.keyword}" name="keyword" id="keyword">
    </div>
    <div class="form-group col-mb-2">
      <input type="button" class="btn btn-outline-secondary alert-danger" value="검색" id="searchBtn">
    </div>
    <c:if test="${admin_id ne null }">
     <div class="form-group col-mb-2" style="margin-left:750px; margin-top: 10px;">
      <input type="button"  class="btn btn-outline-secondary alert-secondary btn-sm" value="글쓰기" id="btnSearch" onclick="location.href='n_write_form.do'">
    </div>
    </c:if>
</div>
</form>
	


<div style="margin:0px auto; margin-left: 40%; margin-top: 10px;">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
			<c:out value="${ indexList }" escapeXml="false"/>
		    
		  </ul>
		</nav>
	 </div>
</div>
<div id="footer">
<a href="#"><img src="http://localhost:8080/3rd_prj/common/images/arrow.png" width="50" height="50" style="position:fixed; left: 93%; top:85%;  "/></a> 
	<div id="fLogo">
		
	</div>
	<div id="fContent">
	<div style="float: left; margin-left:150px; margin-right:8%; font-size:14px;">
		<h4><strong>[;P]</strong></h4>
		사업자명 : (주)Baek's company<br/>
		 대표이사 : 윤태식   <br/> 
		이메일 : wo2015@naver.com<br/>
		대표전화 : 02-336-0562<br/>
		사업자등록번호 : 138-87-00193<br/>
		<br/>
		</div>
		<div style="float: left; margin-right:8%; font-size:14px;">
		<strong>LOCATION</strong><br/><br/>
		서울시 강남구 역삼동 409-7 3F, 4F<br/><br/>
		 <strong>OPEN</strong><br/><br/>
		MON-FRI 10:00 ~ 19:00<br/>
		</div>
		<div style="float: left; font-size:14px;">
		<strong>BANK ACCOUNT</strong><br/><br/>
		기업은행 015-074953-04-018<br/>
		​예금주 : 백승규<br/><br/><br/>
			&copy;CopyRight. AllRight Reserved.<br/>
		</div>
	
		
	</div>
</div>
</div>

</body>
</html>