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
<style type="text/css">
   #class4Wrap{ min-width:1100px; min-height: 1100px; margin: 0px auto;}
   /* 헤더 시작*/
   #naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
   /* 헤더 끝 */
   /* 컨테이너 시작  */
   #container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%;}
   #information{width: 535px; height: 300px;}
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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet"> -->
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
	$("#DeleteBtn").click(function(){
		if($('input[name=chk]').is(":checked")){
			if(confirm("선택한 카드를 삭제할까요?")){
			$("#deleteCardFrm").submit();
				
			return;
			};
		}
		if(!$('input[name=chk]').is(":checked")){
			alert("삭제할 카드를 선택해 주세요.");		
			return;
		}
	});

	
});//ready

function move(reservation_num){
	$("#reservation_num").val(reservation_num);
	$("#searchRsv").submit();
}
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

<div class="row" style="margin-bottom: 20px;" >
  <div class="col-sm-12">
    <div class="card" id="top" style="background-color: #E3C6C2; font-family: '고딕';" >
    	<h3 class="card-title" style="margin-left: 20px;"><strong>MyPage</strong></h3>
      </div>
    </div>
 </div>

<div class="row"  >
  <div class="col-sm-6"  >
    <div class="card" id="information">
      <div class="card-body" >
        <h5 class="card-title"><strong>회원정보</strong></h5>
        <p class="card-text">
        <div>
        <c:forEach var="infoData" items="${infoData}">
        	<strong>아이디 : </strong> <c:out value="${infoData.user_id}"/>
        	<br/>
        	<strong>이름 : </strong> <c:out value="${infoData.user_name}"/>
        	<br/>
        	<strong>이메일 : </strong> <c:out value="${infoData.email}"/>
        	<br/>
        	<strong>휴대폰 : </strong> <c:out value="${infoData.phone}"/>
        	</c:forEach>
        </div>
        </p>
        <div style="margin-left: 365px;  margin-bottom: 100px">
        <input type="button" class="btn btn-secondary alert-danger btn-sm" value="회원정보수정" id="btnChange" onclick="location.href='/3rd_prj/mypage/passwdChk.do'"/>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 예약확인 -->
  <div class="col-sm-6">
    <div class="card" id="information">
      <div class="card-body" style="position: relative;">
        <h5 class="card-title"><strong>예약확인</strong></h5>
        <p class="card-text">
			<div style="overflow:auto; width:490px; height:200px;">
			<table class="table table-hover table-sm" style="text-align: center; ">
			  <thead class="table" style="background-color:#C8C4C1;">
			    <tr>
			      <th scope="col">이용날짜</th>
			      <th scope="col">이름</th>
			      <th scope="col" >요금</th>
			      <th scope="col" >결제상태</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="rsv" items="${rsvData }">
			    <tr>
			      <td><a href="javascript:move('${ rsv.reservation_num }')"  class="text-reset"><c:out value="${rsv.use_date }"/></a></td>
			      <td><c:out value="${rsv.name }"/></td>
			      <td><c:out value="${rsv.charge }"/></td>
			      <td>
			      <c:choose>
			      	<c:when test="${rsv.pay_status eq 'N' }"><font color="red" >미완료</font></c:when>			      
			      	<c:when test="${rsv.pay_status eq 'D' }"><font color="red" >입금대기중</font></c:when>			      
			      	<c:when test="${rsv.pay_status eq 'Y' }"><font color="blue" >결제완료</font></c:when>			      
			      </c:choose>
			      </td>
			    </tr>
			    </c:forEach>
			   </tbody>
			</table> 
			</div>
        </p>
      </div>
    </div>
  </div>
   <form action="checkReservation.do" method="post" id="searchRsv">
            <input type="hidden" name="reservation_num" id="reservation_num"/>
   </form>
  
</div>
<!-- 등록된 카드 -->
<br/>
<div class="row">

<form action="deleteCard.do" method="post" id="deleteCardFrm">
  <div class="col-sm-6">
    <div class="card" id="information">
    <div class="card-body" >
<h5 class="card-title"><strong>등록된 카드</strong></h5>
<div style="overflow:auto; width:490px; height:150px;">
<table class="table table-hover table-sm" style="text-align: center">
  <thead class="table" style="background-color:#C8C4C1;">
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
      <th scope="row"><c:out value="${sc.card_type }"/></th>
      <td><c:out value="****-${sc.card_num4 }"/></td>
      <td><c:out value="${sc.ex_date }"/></td>
      <td><input type="radio" name="chk" id="chk" value="${sc.card_info_code}"></td>
    </tr>
    </c:forEach>
   </tbody>
</table>  
</div> 
    </div>
    <div class="form-group row" id="button" style="margin-left: 390px;">
    <div class="col-sm-10">
	  <button type="button" class="btn btn-secondary alert-danger btn-sm" onClick="location.href='inputCardInfo.do'">추가</button>
	  <button type="button" class="btn btn-secondary alert-secondary btn-sm" id="DeleteBtn">삭제</button>
    </div>
  </div>
    </div>
  </div>
 </form>
  
 <!-- 문의확인 --> 
  <div class="col-sm-1">
    <div class="card" id="information">
      <div class="card-body" style="position: relative;">
        <h5 class="card-title"><strong>문의확인</strong></h5>
        <p class="card-text">
			<div class="table-responsive">
			<div style="overflow:auto; width:490px; height:200px;">
			<table class="table table-hover table-sm" style="text-align: center;table-layout:fixed ">
			   <thead class="table" style="background-color:#C8C4C1;">
			    <tr>
			      <th scope="col" style="width: 280px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis; ">제목</th>
			      <th scope="col">작성일</th>
			      <th scope="col" >답변여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="qd" items="${qnaData }">
			    <tr>
			      <td style="width: 280px; overflow:hidden;white-space:nowrap;text-overflow:ellipsis; "><a href="../board/qna_post.do?q_num=${qd.q_num}" class="text-reset"><c:out value="${qd.q_subject }"/></a></td>
			      <td><c:out value="${qd.q_input_date }"/></td>
			      <td>
			      <c:choose>
			      	<c:when test="${qd.q_answer_flag eq 'N'}"><font color="#A49E99">답변미완료</font></c:when>			      
			      	<c:when test="${qd.q_answer_flag eq 'Y'}"><font color="#FF6262"><strong> 답변 완료</strong></font></c:when>			      
			      </c:choose>
			      </td>
			    </tr>
			    </c:forEach>
			   </tbody>
			</table> 
			</div>
			</div>
    </div>
  </div>
  
</div>
</div>
</div>
<br/>
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