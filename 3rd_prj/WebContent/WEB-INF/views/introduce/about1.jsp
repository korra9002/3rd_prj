<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/jsp_prj/common/css/main.css"/>
<link href="https://fonts.googleapis.com/css?family=Pacifico&display=swap" rel="stylesheet">
<style type="text/css">
	#class4Wrap{ min-width:1100px; min-height: 1100px; margin: 0px auto;}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%; }
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
	
	html,body,div,ul,li {padding: 0;margin: 0;list-style: none;}
	
	/* .jhs-slider 의 높이를 100%로 했을 때 화면전체높이를 사용하도록 하기 위한 코드 */
	html,body {height: 100%;}
	
	.jhs-slider {min-width:284px;height: 100%;position: relative;}
	/* 후손요소들 중 absolute가 있어요. 그래서 이 코드로 후손 absolute 요소들을 가둬둡니다. */
	
	/* 슬라이드 */
	.jhs-slider .slides > div {position: absolute;top: 0;left: 0;width: 100%;height: 100%;background-repeat: no-repeat;background-size: cover;background-position: center;
	    /* absolute 요소들 간 우선순위, 숫자가 높을 수록 보여지는 우선순위가 높아집니다. */
	    z-index: 1;opacity:0;
	    /* 이미지 페이드아웃, 페이드인 효과 */
	    transition: opacity 0.5s;}
	
	/* active 클래스를 가진 슬라이드는 불투명도를 1로 줘서 보이도록 처리 */
	.jhs-slider .slides > div.active {opacity:1;}
	
	.jhs-slider .side-bar {position: absolute; top: 0;left: 0;width: 40%;bottom:0;z-index: 2;cursor: pointer;}
	/* 자식요소인 i 가 display:table-cell 이기 위해서는 부모가 display:table 이여야 한다. */
	.jhs-slider .side-bar.right {left: 60%;}
	.jhs-slider .side-bar:hover {background: linear-gradient(to right, rgba(45, 45, 45, 0.5), rgba(255, 255, 255, 0));}
	.jhs-slider .side-bar.right:hover {background: linear-gradient(to left, rgba(45, 45, 45, 0.5), rgba(255, 255, 255, 0));}
	.jhs-slider .side-bar i {position:absolute;top:50%;transform: translateY(-50%);left:10px;opacity: 0;}
	/* table-cell 이면 수직 중앙정렬이 가능하다. *//* 수직 중앙정렬 */
	
	.jhs-slider .side-bar.right i {left:auto;right:10px;}
	.jhs-slider .side-bar:hover i {opacity: 0.5;}
	.jhs-slider .side-bar:active i::before {position: relative;top: 2px;}
	
	/* 테이블 소스코드 */
	table.tb1 {width:100%;height:600px;}
	table.tb1 .jhs-slider {height:600px;}
	
	#mt-2{font-family: 'Pacifico', cursive; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<!-- jQuery 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
<style type="text/css">
.alert-danger{color: #000000; background-color: #E3C6C2}
</style>
<script type="text/javascript">
$(function(){

	/* each => .jhs-slider 에 해당하는 엘리먼트 하나하나 작업하겠습니다. */
	$('.jhs-slider').each(function(index, node) {
	    
	    /* 개별 슬라이더 */
	    var $slider = $(node);
	    /* 슬라이더 안의 슬라이드 들 */
	    var $slides = $slider.find('div.slides');
	    /* 처음 슬라이더 */
	    var $firstSlide = $slides.find(' > div:first-child');
	    /* 마지막 슬라이더 */
	    var $lastSlide = $slides.find(' > div:last-child');
	    
	    /* 좌측 버튼 */
	    var $leftBtn = $slider.find('.side-bar').eq(0);
	    /* 우측 버튼 */
	    var $rightBtn = $slider.find('.side-bar.right');
	    
	    $leftBtn.on('click', function() {
	        var $activeSlide = $slider.find('div.active');
	        var $postSlide = null;
	        if ( $activeSlide.prev().length == 0 )
	        {
	            $postSlide = $lastSlide;
	        }
	        else {
	            $postSlide = $activeSlide.prev();
	        }//end if
	        
	        $activeSlide.removeClass('active');
	        $postSlide.addClass('active');
	    });
	    
	    $rightBtn.on('click', function() {
	        var $activeSlide = $slider.find('div.active');
	        var $postSlide = null;
	        
	        if ( $activeSlide.next().length == 0 )
	        {
	            $postSlide = $firstSlide;
	        }
	        else {
	            $postSlide = $activeSlide.next();
	        }
	        
	        $activeSlide.removeClass('active');
	        $postSlide.addClass('active');
	    });
	    
	    $slider.on('mouseover', function() {
	        if ( $slider.data('autoplay') == "Y" ) {
	            $slider.data('autoplay-available', 'N');
	        }
	    });
	    
	    $slider.on('mouseout', function() {
	        if ( $slider.data('autoplay') == "Y" ) {
	            $slider.data('autoplay-available', 'Y');
	        }
	    });
	    
	    $slider.mouseout();
	    
	    setInterval(function() {
	        if ( $slider.data('autoplay-available') == 'Y' ) {
	            $rightBtn.click();
	        }
	    }, 3000);
	});
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
<div>      

<%-- <div style="font-size: 30px; font-weight: bold; text-align: center ">
<c:forEach var="list"  items="${RoomInfo}" >
<c:out value="${ list.room_name}"/>
<div style="font-size: 15px;  text-align: center ">
<c:out value="${concept.brief_Info}"/>
</div>
</c:forEach>
</div> --%>
<div id="mt-2"style="font-size: 50px; font-weight: bold; text-align: center ">
<c:out value="${conceptInfo.concept_name2}"/>
</div><br/>
<div style="font-size: 15px;  text-align: center ; font-weight: bold;" >
<c:out value="${conceptInfo.brief_info}"/>
</div><br/><br/>

<div style="margin: auto;">
<img style="width:1100px;height:300px" src="http://localhost:8080/3rd_prj/common/images/main.PNG">
</div><br/><br/>
</div>

<div style="margin: auto;">
<c:forEach var="list"  items="${RoomInfo}"><br/>
<div id="mt-2" style="font-size: 35px; font-weight: bold; text-align: center; ">
<c:out value="${list.room_name}"/>
</div><br/>
<div style="font-size: 20px; font-weight: bold; text-align: center; ">
<c:out value="${list.room_name2}"/>
</div><br/>


<h1 class="sliders-count"></h1>
<table class="tb1">
    <tr>
        <td>
            <div class="jhs-slider" data-autoplay="Y">
                <div class="side-bar">
                    <i class="fa fa-angle-double-left fa-2x fa-inverse" aria-hidden="true"></i>
                </div>
                <div class="side-bar right">
                    <i class="fa fa-angle-double-right fa-2x fa-inverse" aria-hidden="true"></i>
                </div>
                <div class="slides">
                    <div class="active" style="background-image:url(http://localhost:8080/3rd_prj/common/images/<c:out value="${list.image3}"/>);"></div>
                    <div style="background-image:url(http://localhost:8080/3rd_prj/common/images/<c:out value="${list.image3}"/>);"></div>
                    <div style="background-image:url(http://localhost:8080/3rd_prj/common/images/<c:out value="${list.image2}"/>);"></div>
                    <div style="background-image:url(http://localhost:8080/3rd_prj/common/images/<c:out value="${list.image1}"/>);"></div>
                </div>
            </div>
        </td>
    </tr>
</table>
<h5 class="title" style="font-weight: bold; color: black; ">&lt;<c:out value="${list.room_name2}"/>&gt;</h5>
  	<a class="card-text" style="color: black; "><c:out value="${list.info}"/></a>
  <br/><br/>
  </c:forEach>
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
	</div></div>
</div>
</div>

</body>
</html>