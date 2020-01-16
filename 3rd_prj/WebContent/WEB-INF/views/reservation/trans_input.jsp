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
	.btn{width: 110px;height: 40px;}
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
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})//버튼누르는게 아니면 모달창이 안뜸ㅠ input_form의 작성버튼이랑 연결해야 할 듯욤
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
<div id="container" align="center">   
		<div id="transaction" style="width:450px ; height: 450px;">
	
		<div style="text-align: left; padding-top: 5px">&nbsp;&nbsp;<input type="radio" name="radio" value="카드결제" > <strong >&nbsp;&nbsp;카드결제</strong></div>
		<hr>
		<form action="deleteCard.do" method="post" id="deleteCardFrm">
  <div class="col-sm-6">
    <div class="card" id="information">
    <div class="card-body" >
<h5 class="card-title">등록된 카드</h5>
<table class="table table-hover" style="text-align: center;">
  <thead class="thead-dark">
    <tr>
      <th scope="col">유형</th>
      <th scope="col" style="width: 80px;">카드번호</th>
      <th scope="col">만료일</th>
      <th scope="col" >선택</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="sc" items="${cardData }">
    <tr>
      <th scope="row"><c:out value="${sc.card_type }"></c:out></th>
      <td><c:out value="****-${sc.card_num4 }"></c:out></td>
      <td><c:out value="${sc.ex_date }"></c:out></td>
      <td><div><input class="form-check-input" type="radio" name="chk" id="chk" value="${sc.card_info_code}"></div></td>
    </tr>
    </c:forEach>
   </tbody>
</table>    
    </div>
    <div class="form-group row" id="button" style="margin-left: 297px; margin-bottom: 100px">
    <div class="col-sm-10">
      <button type="button" class="btn btn-secondary alert-danger btn-sm">카드 추가</button>
     <button type="button" class="btn btn-secondary alert-secondary btn-sm">수정</button>
     <button type="button" class="btn btn-secondary alert-secondary btn-sm" id="DeleteBtn">삭제</button>
    </div>
  </div>
    </div>
  </div>
 </form>
		<br/>
		<div style="text-align: left; padding-top: 5px">&nbsp;&nbsp;<input type="radio" name="radio" value="무통장입금" > <strong >&nbsp;&nbsp;무통장입금</strong></div>
		<br/>
		<div class="dropdown">
		 계좌번호&nbsp;
		 <input type="text" name="acnum" value="계좌번호">&nbsp;
				
			  <button class="btn btn-secondary alert-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    은행 선택
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="#">우리은행</a>
			    <a class="dropdown-item" href="#">국민은행</a>
			    <a class="dropdown-item" href="#">하나은행</a>
			  </div>
			 </div>
			 <br/>
			  <input type="button" value="결제" class="btn btn-secondary alert-danger" id="goBtn" style="margin-right: 25px;" >
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
</div>

</body>
</html>