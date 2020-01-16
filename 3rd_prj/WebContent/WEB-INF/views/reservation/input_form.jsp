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
/* 	.btn{width: 100px;height: 40px;} */
	.nav-item{margin: 10px;}
	#sub-menuItem{font-family:"고딕";}
	#ex{padding-bottom: 20px; width: 150px; font-size: 15px;}
	/* 컨테이너 끝  */
	/* 푸터 시작  */
	#footer{  min-width:1100px;min-height: 250px;position:relative;  background-color: #E3C6C2;}
	#fContent{ width: 1100px;height: 110px; padding-top: 30px; margin-right: auto; margin-left: auto }
	/* 푸터 끝  */
	#hTitle{font-family: '고딕'; font-size: 30px; font-weight: bold;}
	td{ padding: 10px}
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
<div id="container">   
         <div align="center" style=" width: 550px; height: 700px; padding-top: 20px ; margin-left: auto; margin-right: auto;">
		<div><img src="http://localhost:8080/3rd_pprj/view/images/credit-card3.png">&nbsp;&nbsp;&nbsp;&nbsp;<strong>결제정보 입력</strong></div><br/>
			<table>
				<tr>
					<td>카드번호</td><td><input type="password" class="form-control" id="inputPassword2"></td>
				</tr>
				<tr>
					<td>카드유형</td>
					<td><button class="btn btn-secondary alert-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Dropdown button
		  	</button>
		 	 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="#">VISA</a>
			    <a class="dropdown-item" href="#">master</a>
			    <a class="dropdown-item" href="#">unipay</a>
		 	 </div></td>
				</tr>
				<tr>
					<td>만료일</td><td><input type="text" class="form-control" id="expireDate"></td>
				</tr>
				<tr>
					<td>보안코드</td><td><input type="text" class="form-control" id="CVV"></td>
				</tr>
				<tr>
					<td>청구주소</td>
					<td>
						<div class="form-inline"><input type="text" class="form-control" id="zipcode1" style="width: 80px">&nbsp;-&nbsp;<input type="text" class="form-control" id="zipcode2" style="width: 80px">
						&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary">우편번호 찾기</button>
						</div><br/>
						<div><input type="text" class="form-control" id="addr1"></div><br/>
						<div><input type="text" class="form-control" id="addr2"></div>
					</td>
				</tr>			
				</table>
				<br/><br/>
	          <!--  <div id="btnClass"style="position: relative; margin-top: 50px;" align="center"> -->
					<input type="button" value="가입하기" class="btn btn-secondary alert-danger" id="goBtn" style="margin-right: 25px;" >
					<input type="button" value="다음에 하기" class="btn btn-secondary alert-secondary" id="backBtn">					
				<!-- </div>    -->		
			</div>	 
	 </div> 
</div>

<div id="footer">
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


</body>
</html>