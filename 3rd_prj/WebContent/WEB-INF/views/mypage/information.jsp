<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	$("#email2").click(function() {
		if($("#email2").val()=="none"){
			$("#email3").val("");
		}else{
		$("#email3").val($("#email2").val());
		}//end else
			
	})//click
	$("#email2").val($("#hemail").val()).selected=true;
	$("#phone1").val($("#phone0").val()).selected=true;
	$("#hint_code").val($("#hhint_code").val()).selected=true;
	
	
	$("#btnMyInfoChange").click(function() {
		if($("#curPassword").val()==""){
			alert("현재 비밀번호를 입력해주세요")
			return ;
		}//end if
		if($("#inputPassword").val()!=$("#inputPasswordCheck").val()){
			alert("변경하실 비밀번호를 올바르게 작성해주세요.");
			return;
		}//end if
		
		if($("#email1").val()==""){
			alert("이메일을 입력해주세요.");
			return;
		}//end if
		if($("#email3").val()==""){
			alert("이메일을 입력해주세요.");
			return;
		}//end if
		if($("#phone2").val().length>4 || $("#phone2").val().length<3){
			alert("연락처를 올바르게 입력해주세요.");
			return;
		}//end if
		if($("#phone3").val().length!=4){
			alert("연락처를 올바르게 입력해주세요.");
			return;
		}//end if
		if($("#email2").val()=="none"){
			alert("도메인 주소를 선택해주세요");
			return;
		}//end if
		if($("#phone2").val()==""){
			alert("핸드폰번호를 입력해주세요.");
			return;
		}//end if
		if($("#phone3").val()==""){
			alert("핸드폰번호를 입력해주세요.");
			return;
		}//end if
	if(confirm("회원정보를 변경하시겠습니까?")){
		var newPhone=$("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val();
		$("#phone").val(newPhone);
		var newEmail=$("#email1").val()+"@"+$("#email3").val();
		$("#email").val(newEmail);
		var newHintCode = $("#hint_code").val();
		$("#hint_code").val(newHintCode);
		if($("#inputPassword").val()==""&& $("#curPhone").val()==newPhone && $("#curEmail").val()==newEmail && newHintCode==$("#hhint_code").val()){
			alert("변경하실 정보가 존재하지 않습니다.");
			return;
		}//end if
		if($("#inputPassword").val()==$("#curPassword").val()){
			alert("현재 비밀번호와 변경하실 비밀번호가 일치합니다.");
			return;
		}
	modifyRun();
	}//end if
	});//click
	
});//ready
function modifyRun(){
	formData = $("#frm").serialize();
	
	$.ajax({
		url:"/3rd_prj/mypage/modifyInfo.do",
		type:"post",
		data:formData,
		dataType:"json",
		error:function(xhr){
			alert("서비스가 원활하지 못한 점 죄송합니다.");
			console.log("에러코드 : "+xhr.status);
			console.log("/ 에러 메세지 : "+xhr.statusText);
		},//error
		success:function(json_obj){
			var flag= json_obj.result;
			if(flag==true){
				alert("회원정보 변경 성공하였습니다.")
				location.href="/3rd_prj/login/mypage.do";	
				
			}else{
				alert("현재 입력하신 비밀번호가 올바르지 않습니다.")
			}
			
		}//success
	});//ajax
	
}//modifyRun
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
<form id="frm" style="margin-left: 140px">
<div class="card" style="width: 1000px;"  >
<c:forEach var="list" items="${infoList}">
<div style="margin-left: 100px">
  <h2 style="margin-top: 30px"><strong>회원정보 관리</strong></h2>
  <br/>
  <div class="form-group row" >
    <label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-3">
      <input type="text" readonly class="form-control-plaintext" id="id" name="user_id" value='<c:out value="${list.user_id }"/>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">현재비밀번호</label>
    <div class="col-sm-3" >
      <input type="password" class="form-control"  id="curPassword" name="curPassword"  placeholder="현재비밀번호 입력">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">새비밀번호 변경</label>
    <div class="col-sm-3" >
      <input type="password" class="form-control"  id="inputPassword" name="password" placeholder="새 비밀번호 입력">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-2 col-form-label">새비밀번호 확인</label>
    <div class="col-sm-3">
      <input type="password" class="form-control" id="inputPasswordCheck" placeholder="새 비밀번호 확인">
    </div>
  </div>
    <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
    <div class="col-sm-3">
      <input type="text" readonly class="form-control-plaintext" id="userName" value='<c:out value="${list.user_name }"/>'>
    </div>
  </div>
  <div class="container">
  <div class="form-group row">
 <label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="email1" value="<c:out value='${list.email1}'/>">
    </div>
    @
    <div class="col-sm-3">
    <input type="hidden" id="hemail"  value="<c:out value='${list.email2}'/>"/>
    <input type="hidden" id="curEmail" value="<c:out value='${list.email}'/>"/>
      <select class="form-control" id="email2" >
  		<option value="none">직접입력</option>
  		<option value="naver.com">naver.com</option>
  		<option value="hanmail.com">hanmail.com</option>
  		<option value="daum.net">daum.net</option>
  		<option value="gmail.com">gmail.com</option>
	  </select>
    </div>
	 	<div class="col-sm-3" id="inputEmail">
	  		<input type="text" class="form-control" id="email3" value="<c:out value='${list.email2}'/>">
    	</div>
  <input type="hidden" id="email" name="email"/>
  </div>
  </div>
  <div class="form-group row">
    <input type="hidden" id="phone0"  value="<c:out value='${list.phone0}'/>"/>
    <label for="inputPassword" class="col-sm-2 col-form-label">휴대전화</label>
    <div class="col-sm-3" >
      <select class="form-control" style="width:200px" id="phone1">
  		<option value="010">010</option>
  		<option value="011">011</option>
  		<option value="016">016</option>
  		<option value="017">017</option>
  		<option value="018">018</option>
  		<option value="019">019</option>
	  </select>
    </div>
    <div class="col-sm-3" align="left">
     <input type="text" class="form-control" id="phone2"  value="<c:out value='${list.phone1}'/>" >
    </div><span style="margin-top: 10px; margin-left: 10px;" >-</span>
    <div class="col-sm-3">
     <input type="text" class="form-control" id="phone3" value="<c:out value='${list.phone2}'/>">
      <div  id="phone_div"> </div> 
    </div>
    <input type="hidden"  id="curPhone" value="<c:out value='${list.phone}'/>"/>
    <input type="hidden" name="phone" id="phone"/>
  </div>
  <br/>
  <div class="form-group row">
  <label for="staticEmail" class="col-sm-2 col-form-label">비밀번호 힌트</label>
    <div class="col-sm-3">
      <select class="form-control" name="hint_code" id="hint_code" style="width: 300px;">
  		  <c:forEach var="passHintList" items="${passHintList }">
			<option value="${ passHintList.hintCode }"><c:out value="${ passHintList.hint }"/></option>
		  </c:forEach>
	  </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-2 col-form-label">힌트 정답</label>
    <input type="hidden" id="hhint_code"  value="<c:out value='${list.hint_code }'/>"/>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="hintAw" name="answer">
      <div  id="hintAw_div"> </div> 
    </div>
  </div> 
  </div>
  </c:forEach>
</div>  
    <div class="form-group row" style="margin-top: 20px; margin-left: 300px">
    <div class="col-sm-10" >
    	<input type="button" class="btn btn-secondary alert-danger btn" value="회원정보 수정" id="btnMyInfoChange"/>
    	<input type="button" class="btn btn-secondary alert-secondary btn" value="취소" id="btnCancle" onclick="location.href='/3rd_prj/login/mypage.do'"/>
    </div>
</div>

</form>   
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