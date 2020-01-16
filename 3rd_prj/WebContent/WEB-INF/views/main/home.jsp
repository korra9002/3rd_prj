<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/3rd_prj/common/css/main.css"/>
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<style type="text/css">
	#class4Wrap{ min-width:1100px; min-height: 1100px; margin: 0px auto;}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ max-width:100%; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%; }
	#container1{ width:1100px; height: 0px auto; position:relative; margin: 0px auto;  }
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
	
	
	.mt-2{font-family: 'Pacifico', cursive; font-size: 40px;}
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
 	<!-- MENU 시작 -->
	<%@include file="../../../common/navbar/nav.jsp" %>
 	<!-- MENU 끝 -->
</div>
<div id="container" style="margin-top:0px;">   
          

<div style="max-width: 100%;">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner" style="max-width:100%; height:600px; ">
    <div class="carousel-item active">
      <img src="http://localhost:8080/3rd_prj/common/images/c1.png" class="d-block w-100" alt="1">
    </div>
    <div class="carousel-item">
      <img src="http://localhost:8080/3rd_prj/common/images/c2.jpg" class="d-block w-100" alt="2">
    </div>
    <div class="carousel-item">
      <img src="http://localhost:8080/3rd_prj/common/images/sl_party_01.png" class="d-block w-100" alt="3">
    </div>
    <div class="carousel-item">
      <img src="http://localhost:8080/3rd_prj/common/images/sl_party_02.png" class="d-block w-100" alt="4">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div><br/><br/>


 <div class="mt-2 mb-3" style="font-size: 45px;" align="center">Our special place only for you</div>
<br/><br/><br/><br/>

<div id="container1">
<ul class="list-unstyled">
 <div class="media">
  <div class="media-body">
  

  
  
  
  
    <h5 class="mt-2 mb-3">Propose</h5>
   프로포즈
나의 연인에게 진심을 담아 전하는 사랑고백.

인생의 한번 뿐인 중요한 순간이다보니 설레기도하고 많은 분들이 긴장을 하신답니다.

저희는 완벽한 프로포즈 준비를 위해 한분한분 친절하게 상담을 진행하고 있으며 또 그에 맞는 준비를 도와드립니다.

  </div>
  <img src="http://localhost:8080/3rd_prj/common/images/main1.jpg" class="ml-3" style="width:550px; height:400px" >
</div><br/>
  <li class="media my-4">
   <img src="http://localhost:8080/3rd_prj/common/images/main2.jpg" class="mr-3" style="width:550px; height:400px" >
    <div class="media-body">
      <h5 class="mt-2 mb-3">meeting & workshop</h5>
      미팅룸, 두 개의 룸은 각기의 매력을 갖추고 있으며, 더 좋은 환경의 스터디와 회의 진행, 워크샵을 원하는 분들을 위한 공간입니다. 코르크벽과 공간을 비추는 주광등은 집중력을 더합니다.
    </div>
  </li>
</ul><br/>
<div class="media">
  <div class="media-body">
    <h5 class="mt-2 mb-3">Bridal Shower</h5>
   브라이덜 샤워는 ‘신부에게 우정이 비처럼 쏟아진다’라는 뜻으로, 결혼을 앞둔 친구를 위한 서프라이즈 파티, 신부를 위한 신랑의 프로포즈 이벤트로 지금의 아름다움과 행복한 추억을 남길 수 있습니다.
   
    
  </div>
  <img src="http://localhost:8080/3rd_prj/common/images/main3.jpg" class="ml-3" style="width:550px; height:400px" >
</div>
</div>

</div>
</div>

<div id="footer">
<a href="#"><img src="http://localhost:8080/3rd_prj/common/images/arrow.png" width="50" height="50" style="position:fixed; left: 93%; top:85%; "/></a> 
  <div id="fContent">
	<div style="float: left; margin-left:150px; margin-right:8%; font-size:14px;">
		<h4><strong>[:P]</strong></h4>
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