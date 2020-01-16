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
	#class4Wrap{ min-width:1100px; min-height: 1100px; margin: 0px auto;}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%;}
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
</style>
<script type="text/javascript">
$(function(){
	
});//ready
</script>
</head>
<body>
<div id="class4Wrap">
<div id="naviBar">
		<nav class="navbar fixed-top navbar-expand-lg navbar-light"  style="background: rgba(176,171,167,0.7); height: 130px;">
	<!-- HOME Logo 시작-->
  <a class="navbar-brand" href="#" style="margin-left: 30px; font-size: 40px;  font-family:'Yeseva One', cursive ; color: #FFFFFF;" id="nav-link" >[:P]</a>
	<!-- HOME Logo 끝-->
	
 	<!-- MENU 시작 -->
  <div class="collapse navbar-collapse" id="navbarNavDropdown" style="margin-left: 55%; font-family:'Amaranth','Yeseva One', cursive ; font-size: 22px;">
    <ul class="navbar-nav ">
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Introduce
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
           <a class="dropdown-item" href="about.jsp" id="sub-menuItem">introduce</a>
            <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="about1.jsp" id="sub-menuItem" >party & bride</a>
          <a class="dropdown-item" href="about2.jsp" id="sub-menuItem" >meeting & conference</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="rsv_main.jsp" id="nav-link">Reservation</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="location.jsp" id="nav-link">Contact</a>
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
        <a class="nav-link" href="login.jsp"  id="nav-link">Login</a>&nbsp;|&nbsp;<a href="signUp.jsp" class="nav-link" id="nav-link">sign up</a>
      </form>
      </li>
    </ul>
  </div>
</nav>
 	<!-- MENU 끝 -->
</div>
            </div>
<div id="container">   
           
<div style="font-size: 25px; font-weight: bold">
오시는 길
</div>
<div style="width:900px; height:50px; font-size: 15px; text-align: center">
서울특별시 성동구 성수동2가 281-2<br/>
(서울특별시 성동구 광나루로8길 11)
</div>

<div class="media">
  <img src="http://localhost:8080/jsp_prj/common/images2/addr.PNG" class="align-self-center mr-3" alt="...">
  <div class="media-body">
    <h5 class="mt-0"><img src="http://localhost:8080/jsp_prj/common/images2/bus.png" style="width:60px; height:55px"></h5>
    <p>
    	성산2교 정류장(ID:14186) 도보2분<br/>
		성미약수터 정류장(ID:14910) 도보2분<br/><br/>
	</p>
   <img src="http://localhost:8080/jsp_prj/common/images2/car.png" style="width:60px; height:55px">
	  <p class="mb-0">서울시 마포구 월드컵북로 12안길 35 <br/>
		서울시 마포구 성산동 108-5 <br/>
		주소를 네비게이션에 입력해 주세요.<br/><br/></p>
	
	<img src="http://localhost:8080/jsp_prj/common/images2/subway.png" style="width:60px; height:55px">
	  <p class="mb-0">2호선 역삼역 3번출구 도보 3분<br/>
		2호선 강남역 10번출구 도보 7분<br/>
		경의중앙선 강남역 10번출구 도보 7분</p>
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