<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{ width:1100px; height: 1100px; margin: 0px auto;}
	/* 헤더 시작*/
	#header{ width:1100px; height: 150px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 800px;}
	#star{color: red; font-weight: bold;}
	.btn{width: 100px;height: 40px; margin: 10px;}
	.nav-item{margin: 10px;}
	#sub-menuItem{font-family:"고딕";}
	#ex{padding-bottom: 20px; width: 100px; text-align: center;}
	/* 컨테이너 끝  */
	/* 푸터 시작  */
	#footer{ min-width:1100px;height: 250px;position:relative;  background-color: #E3C6C2;}
	#fContent{ width: 1100px;height: 110px; padding-top: 30px; margin-right: auto; margin-left: auto }
	/* 푸터 끝  */
	#hTitle{font-family: '고딕'; font-size: 30px; font-weight: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#goBtn").click(function() {
		if($("#qnaValue").val()=="none"){
			alert("문의 종류를 선택해주세요.");
			return;
		}//end if
		if($("#subject").val()==""){
			alert("게시글 제목을 입력해주세요.");
			return;
		}//end if
		if($("#passwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return;
		}//end if
		if($("#contain").val().trim()==""){
			alert("내용을 작성해주세요.");
			return
		}//end if
		if(document.getElementById("secretChk").checked){
			confirm("비밀글로 작성하시겠습니까?");
		}
		
		$("#frm").submit();
	});//click
	$("#backBtn").click(function(){
		if(confirm('작성하지 않고 돌아가시겠습니까?')){
		location.href="qna_list.jsp";
		}//end if
	});//click
});//ready
</script>
</head>
<body>
<div id="class4Wrap">
<div id="header">
	<nav class="navbar fixed-top navbar-expand-lg navbar-light disable"  style="background: rgba(176,171,167,0.7); height: 130px;">
	<!-- HOME Logo -->
  <a class="navbar-brand" href="#" style="margin-left: 30px; font-size: 40px;  font-family:'Yeseva One', cursive ; color: #FFFFFF;" id="nav-link" >[:P]</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown" style="margin-left: 1050px; font-family:'Amaranth','Yeseva One', cursive ; font-size: 22px;">
    <ul class="navbar-nav ">
      <li class="nav-item" >
        <a class="nav-link" href="#" id="nav-link" >Introduce</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id="nav-link">Reservation</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" id="nav-link">Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button"  id="nav-link" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
         	Board
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="notice_list.jsp" id="sub-menuItem">공지사항</a>
          <a class="dropdown-item" href="qna_list.jsp" id="sub-menuItem">문의게시판</a>
        </div>
      </li>
      <li class="nav-item" style="margin-left: 20px;" id="nav-link">
      <form class="form-inline" >
        <a class="nav-link" href="#"  id="nav-link">Login</a>&nbsp;|&nbsp;<a href="#" class="nav-link" id="nav-link">sign up</a>
      </form>
      </li>
    </ul>
  </div>
</nav>
	<div id="naviBar">
	</div>
</div>
<div id="container">   
   <div align="center">
         <table>
            <tr>
               <td id="ex">문의종류</td>
               <td>
              	<select class="form-control form-control-sm" name="qnaValue" id="qnaValue"  style="width: 150px;">
					<option value="none">카테고리 선택</option>
					<option value="대관문의">대관문의</option>
				</select>
				<br/>
               </td>
            </tr>
            <tr>
               <td id="ex">제목</td>
               <td>
         			<input class="form-control form-control-sm" type="text" name="subject" id="subject" autofocus="autofocus" placeholder="게시글 제목을 입력해주세요." style="width: 400px;"/>
        			<br/>
        		</td>
            </tr>
            <tr>
               <td id="ex">비밀번호</td>
               <td>
               		<input class="form-control form-control-sm" type="password" name="passwd" id="passwd" placeholder="비밀번호 입력"/><br/>
               </td>
            </tr>
            <tr>
               <td id="ex">비밀글 </td>
               <td>
               		<input class="form-check-input" type="checkbox" id="secretChk" value="secret" />&nbsp;비밀글<br/>
               </td>
            </tr>
            <tr>
               <td id="ex">내용</td>
               <td>
                  <textarea class="form-control form-control-sm" id="contain" rows="15" cols="100" placeholder="문의사항이 있을경우 자유롭게 기재해주세요."></textarea>
               </td>
            </tr>         
            </table>
            <br/><br/>
            </div>
            <div id="btnClass"style="position: absolute; top: 700px; margin-left: 400px; " >
				<input type="button" value="등록" class="btn btn-outline-secondary" id="goBtn" >
				<input type="button" value="돌아가기" class="btn btn-outline-secondary" id="backBtn">
			</div>
         </div>
</div>
<div id="footer">
	<a href="#"><img src="http://localhost:8080/3rd_prj/view/images/arrow.png" width="50" height="50" style="position:fixed; left: 93%; top:85%; "/></a> 
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


</body>
</html>