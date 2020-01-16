<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/3rd_pprj/common/css/main.css"/>
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
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		chkNull();
	});//click
	$("#inputId").keydown(function(evt){
		if(evt.which == 13){
		chkNull();
		}//end if
	});//keydown
	$("#inputPassword").keydown(function(evt){
		if(evt.which == 13){
		chkNull();
		}//end if
	});//keydown
		
});//ready

function chkNull(){
	var id=$("#inputId").val();
	if(id.trim()==""){
		$("#inputId").focus();
		return;
	}//end if
	var passwd=$("#inputPassword").val();
	if(passwd.trim()==""){
		$("#inputPassword").focus();
		return;
	}//end if
	$("#logFrm").submit();
	
}//chkNull


//아이디 저장 기능 구현 - local storage 


// Q1. 발견된 문제 로그인이 안되는 아이디를 입력한 후 아이디 저장을 클릭하고
// 로그인 가능한 다른 아이디로 접속하고 로그아웃 후 로그인하려고 하면
// 유효하지 않은 아이디가 저장되어 있음.


$(function(){
	
	var saveId=localStorage.getItem("saveId");
	if( saveId != null ){
		
		$("#inputId").change(function() {
			localStorage.removeItem("saveId");
			localStorage.setItem("saveId", $("#inputId").val())
		});
		

		$("#inputId").val(saveId);
		$("#idSaveCheck").prop("checked", "checked='checked'");
		
	}//end if

	
	
	$("#idSaveCheck").click(function(){
		if($("#idSaveCheck").is(":checked")){
			
			localStorage.setItem("saveId", $("#inputId").val())
		}else{
			localStorage.removeItem("saveId");
		}//end else
	}); 
	
	
	
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key); 
     
    if($("#inputId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#inputId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#inputId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#inputId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
if(request.getProtocol().equals("HTTP/1.0")){
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	} else if(request.getProtocol().equals("HTTP/1.1")){
	response.setHeader("Cache-Control","no-cache");
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

<form class="form-signin" style=" height:500px; margin-left:450px;" action="login_process.do" method="post" id="logFrm">
  <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal" >LOGIN</h1>
  <label for="inputEmail" class="sr-only">Username</label>
  <input type="text" id="inputId" name="inputId" class="form-control" placeholder="Username" required="" autofocus="" style="width:300px; margin-bottom: 10px;">
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword"   name="inputPassword" class="form-control" placeholder="Password" required="" style="width:300px; margin-bottom: 10px;">
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me" id="idSaveCheck">아이디 저장
    </label>
  </div>
  <button class="btn btn-secondary alert-secondary" type="button" style="width: 300px;" id="btn">로그인</button>
	<p class="text-muted">
	<a href="find_id.do" class="text-reset">아이디찾기</a>&nbsp;|&nbsp;
	<a href="find_pw.do"" class="text-reset">비밀번호 찾기</a>&nbsp;|&nbsp;
	<a href="signUp.do" class="text-reset">회원가입</a>
	</p>
</form>

</div>
<div id="footer">
	<a href="#"><img src="http://localhost:8080/3rd_prj/common/images/arrow.png" width="50" height="50" style="position:fixed; left: 93%; top:85%; "/></a> 
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