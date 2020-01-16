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
	#class4Wrap{ width: 900px; height: 1100px; margin: 0px auto;}
	/* 헤더 시작 */	
	#header{ width:1100px; height: 150px; position:relative; font-size: 20px;}
	#hContent{ width:700px; height: 90px; padding-top :10px; position:absolute; top:0px; left:200px;}
	#naviBar{ width:1100px; height: 50px;position:fixed;top:100px;}
	/* 헤더 끝 */
	
	/* 컨테이너 시작 */
	#container{ width: 900px; height: 300px; margin-top:70px;}
	#container1{ margin-left: 200px}
	/* 컨테이너 끝 */
	
	/* 푸터 시작 */
	#footer{ width: 900px; height: 150px; background-color: #FAFAFA;}
	#fLogo{ width: 180px; height: 130px; padding-top: 20px; padding-left: 20px; float: left;}	
	#fContent{ width: 670px; height: 110px; padding-top: 40px; padding-left: 30px; float: right;}	
	/* 푸터 끝 */
	
	#hTitle{ font-family: '고딕'; font-size: 30px; font-weight: bold;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function(){
	$("#submit").val()==""){
	alert("카드가 추가되었습니다");
	return;
	}//end if
	$("#back").click(function(){
		if(confirm('로그인 창으로 돌아가시겠습니까?')){
		location.href=""; //로그인창 연결해주기
		}//end if
	});//click
});
</script>
</head>
<body>
<div id="class4Wrap">
<div id="header">
<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white"  >
	<!-- HOME Logo -->
  <a class="navbar-brand" href="#" style="margin-left: 30px;"><img src="http://localhost:8080/jsp_prj/project333/project/images/home.png"/> </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown" style="margin-left: 1100px; font-family: Times New Roman, Times, serif;">
    <ul class="navbar-nav">
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	Introduce
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
        	<a class="dropdown-item" href="about.jsp">introduce</a>
       	  <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="about1.jsp" >party & bride</a>
          <a class="dropdown-item" href="about2.jsp" >meeting & conference</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Reservation</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	Board
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="project/notice_list.jsp">공지사항</a>
          <a class="dropdown-item" href="project/qna_list.jsp">문의게시판</a>
        </div>
      </li>
      <li class="nav-item" style="margin-left: 30px;">
      <form class="form-inline" >
        <a class="nav-link" href="#">Login</a>&nbsp;|&nbsp;<a href="#"><font color="#000000">sign up</font></a>
      </form>
      </li>
    </ul>
  </div>
</nav>
	<div id="naviBar">
	</div>
</div>

<div id="container">
<div style="font-size: 30px; font-weight: bold; width:300px; height:70px; margin: auto;">
<img style="width:65px;height:60px" src="http://localhost:8080/jsp_prj/common/images2/card.png">
카드 정보 수정
</div>

<div id="container1">
<form>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">만료일</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="inputPassword3" placeholder="유효기간(MM/YY)">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">보안코드</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="inputPassword3" placeholder="CVC">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">청구 주소</label>
    <div class="col-sm-10" style="margin: auto">
      <button type="submit" class="btn btn-primary" id="AddrModify">변경하기</button>
    </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10" style="margin-left: 300px">
      <button type="submit" class="btn btn-primary" id="modify">변경</button>
      <button type="submit" class="btn btn-primary" id="back">취소</button>
    </div>
  </div>
</form>

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