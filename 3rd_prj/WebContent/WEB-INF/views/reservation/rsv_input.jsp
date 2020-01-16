<%@page import="kr.co.prj.domain.RsvTimeDomain"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" type="text/css" href="http://localhost:8080/3rd_prj/common/css/main.css"/>
<style type="text/css">
	#class4Wrap{ min-width:1100px; min-height: 1800px; margin: 0px auto;}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%;}
	.btn{width: 100px;height: 40px;}
	.nav-item{margin: 10px;}
	#sub-menuItem{font-family:"고딕";}
	#ex{padding-bottom: 20px; width: 150px; font-size: 15px;}
	#leftside{ width: 500px; font-size: 13px; float: left}
	#rightside{ width: 500px; font-size: 13px; float: right; padding-left: 100px;}
	/* 컨테이너 끝  */
	/* 푸터 시작  */
	#footer{  min-width:1100px;min-height: 250px;position:relative;  background-color: #E3C6C2;}
	#fContent{ width: 1100px;height: 110px; padding-top: 30px; margin-right: auto; margin-left: auto }
	/* 푸터 끝  */
	#hTitle{font-family: '고딕'; font-size: 30px; font-weight: bold;}
	
	
	
	
/* 	#chkboxCnt{ color: #FF0000; font-weight: bold; display: none; } */
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
	
	$("#infoCheckBtn").click(function(){

		if (document.getElementById("infoCheckBtn").checked ) {
			alert("체크함");
			
			$.ajax({
				url:"/3rd_prj/reservation/rsv_input1.do",
				type:"get",
				data:"user_id=${memberId}",
				dataType:"json",
				contentType: "application/json; charset=utf-8" ,
				error:function( xhr ){
					alert("문제발생\n"+ xhr.status+"\n"+xhr.statusText);
					
				},
				success:function( json ){
					var output="정보 없음";
					var phoneNum=json.phone;
					var phone1=phoneNum.substring(0, phoneNum.indexOf("-"));
					var phone2=phoneNum.substring(phoneNum.indexOf("-")+1,phoneNum.lastIndexOf("-"));
					var phone3=phoneNum.substring(phoneNum.lastIndexOf("-")+1);
					
					if( json.resultFlag ){
						output="<strong>"+json.data+"</strong>";
					}//end if
					
					$("#rsv_person").val ( decodeURIComponent(json.user_name) );
					$("#num1").val(phone1);
					$("#num2").val(phone2);
					$("#num3").val(phone3);
					$("#email").val(json.email);
					
				}
			});//ajax
		} else {
			alert("체크 노노");
		}//end else
	});//click	
	
	$("#goBtn").click(function(){
		
		//	rsv_person,num1,num2,num3,email,request   name:checkbox
		
		
		if($("#rsv_person").val() == ""){
	        alert("이름을 입력해 주세요");
	        $("#rsv_person").focus();
	        return ;
	      }	
		if($("#num1").val() == ""){
	        alert("핸드폰번호를 입력해 주세요");
	        $("#num1").focus();
	        return ;
	      }	
		if($("#num2").val() == ""){
	        alert("핸드폰번호를 입력해 주세요");
	        $("#num2").focus();
	        return ;
	      }	
		if($("#num3").val() == ""){
	        alert("핸드폰번호를 입력해 주세요");
	        $("#num3").focus();
	        return ;
	      }	
		if($("#email").val() == ""){
	        alert("이메일을 입력해 주세요");
	        $("#email").focus();
	        return ;
	      }	

  		 if(!$("input:checkbox[name='timetouse']").is(':checked')){
			alert("시간을 선택해 주세요");
			return;
		     }
		if(!$("input:checkbox[name='checkbox']").is(':checked')){
	        alert("개인정보 수집 및 이용에 동의해주세요");
	      
	        return ;
	      }	
		
		

		
	if(confirm("예약 할까요?")){
		  $("#rsvFrm").submit();  
	}
		
	})
	
	
	$(".checkbox").click(function(){
	var n=$("input:checkbox[name='timetouse']:checked").length;
		$("#chkboxCnt").text(n* ${ charge } );
		$("#totalCharge").val(n* ${ charge } );
	})//click
	
	
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
			
		<div id="leftside">
			<h3><strong> [ :P ] / <%= session.getAttribute("room_name") %> </strong></h3><br/>
			<img src="http://localhost:8080/3rd_prj/common/images/<c:out value="${ image1 }"/>" style="width: 490px">
			<br/><br/><br/>
		
			<div>		
			
				<h5><strong>예약 및 변경, 취소 규정</strong></h5>
				<br/>
					
				<h6><strong>예약 방법</strong></h6>
				
					문의 (문자, 전화) -> 이체 -> 예약 확정 문자 발송<br/><br/><br/>
					
				<h6><strong>예약시 주의사항</strong></h6>
				
					저녁 9시부터 아침 9시까지 사용가능한 패키지입니다.<br/>
					예약 시간 외 이용 시 추가금액이 발생합니다. 예약 시간보다 일찍 공간 사용이 완료되어도 예약시간 기준으로 금액이 산정됩니다.<br/>
					예약시, 공간 세팅, 테이블 세팅은 기본적으로 해드립니다.<br/>
					주차 가능대수는 2대입니다. 추가 차량 시, 유료 주차장으로 안내드립니다.<br/>
					예약 요청 시 인원 수를 꼭 남겨주시기 바랍니다. (기준 인원 추가시 인원별 추가비용 발생)<br/>
					분리수거 및 정리정돈 필수, 음식물 반입 시 청소 비용 발생.<br/>
					화보,영상 촬영 대관 및 강연,공연 대관 문의, 인사이터 홈 룸을 포함한 전체 대관은 전화로 문의 바랍니다.<br/>
					부가서비스 캐이터링 서비스, 영상 및 사진촬영, 포토월 설치, 현수막 및 초대장 제작 등이 필요할 시, 별도 문의는 전화로 문의주시길 바랍니다<br/><br/>
					<br/>
				<h6><strong>환불규정</strong></h6>

					
					모임 날짜 10일전까지는 80% 환불 (예약금 제외)<br/>
					모임 날짜 9일전부터는 환불 불가<br/><br/>
			
		
			</div>
			
			<br/><br/>

			
		</div>

		
		
		<div id="rightside">
		<form action="/3rd_prj/payment/confirm_parameter.do" method="post"  id="rsvFrm">
			<h6><c:out value="${ param.param_year }"/>-<c:out value="${ param.param_month }"/>-<c:out value="${ param.param_day }"/>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <a href="/3rd_prj/diary/diary.do" method="post">
				 <input type="button" value="변경" class="btn btn-secondary alert-secondary" id="backBtn" style="width:60px; height:35px; text-align: center;"></h6>
			 </a>
			<input type="checkbox" class="checkbox" id="infoCheckBtn"> 기존 회원정보와 동일 <br/><br/>
			
 <input type="hidden" value="${ param.param_year }" name="year"/>
 <input type="hidden" value="${ param.param_month }" name="month"/>
 <input type="hidden" value="${ param.param_day }" name="day"/>
 <input type="hidden" id="totalCharge" name="totalCharge"/>
  
			
					예약자<br/>
					<input type="text" class="form-control form-control-sm" id="rsv_person" name="rsv_person" >			
					<br/>
					
					연락처<br/>
					<div class="form-inline"> 
						<input type="text" class="form-control form-control-sm" id="num1" name="phone1" style="width:100px" >&nbsp;- &nbsp;
						<input type="text" class="form-control form-control-sm" id="num2" name="phone2" style="width:100px" >&nbsp;- &nbsp;
						<input type="text" class="form-control form-control-sm" id="num3" name="phone3" style="width:100px" >
					</div> 
					<br/>
					
					메일주소<br/>
					<input type="text" class="form-control form-control-sm" id="email" name="email" ><br/>
					
	
		
		사용시간<br/>
		<%
		List<Integer> timeList = (List)request.getAttribute("timeCheck");
		Set<Integer> set = new HashSet<Integer>();
		
		for(int i=0; i<timeList.size();i++){
			set.add(timeList.get(i));
		}
		
		
		List<RsvTimeDomain> rsvTime =(List)request.getAttribute("RsvTimeInfo");
		for(int i=0;i<rsvTime.size();i++){
		%>
		
		
<%-- 		<c:forEach var="rti" items="${ RsvTimeInfo }">
			<input type="checkbox" name="timetouse" class="checkbox" value="${ rti.r_time }">
		    <c:out value="${ rti.r_realtime }"/>&nbsp;&nbsp;<c:out value="${ charge }원"/><br/>
		</c:forEach> --%>
		
		
			<input type="checkbox" name="timetouse" class="checkbox" <%=set.contains(rsvTime.get(i).getR_time()) ? " disabled='disabled'" :"" %> value="<%=rsvTime.get(i).getR_time() %>">
		    <c:out value="<%=rsvTime.get(i).getR_realtime() %>"/>&nbsp;&nbsp;<c:out value="${ charge }원"/><br/>
		<%
		}
		%>	
			
		<!-- 	사용시간<br/>
			<input type="checkbox" name="timetouse" class="checkbox"> 8~12 (+40000) <br/>
			<input type="checkbox" name="timetouse" class="checkbox"> 12~4 (+40000) <br/>
			<input type="checkbox" name="timetouse" class="checkbox"> 4~8 (+40000) <br/>
			<input type="checkbox" name="timetouse" class="checkbox"> 8~12 (+40000) <br/><br/> -->
			
			
			<br/>
			
			<strong>총 금액 : <span id="chkboxCnt"></span> 원</strong><br/><br/>
			
			
			
			
			   <h3><font size="2">요청사항</font></h3>
			<textarea class="form-control" id="request" rows="5" name="rsvRequest" ></textarea>
			<br/>
			
<!-- 	개인정보 수집 및 동의 -->



   <h3><font size="2">개인정보 수집 및 이용에 대한 안내</font></h3>
   <div>
     <textarea readonly="readonly" rows="5" cols="66">

정보통신망법 규정에 따라 [ :P ]에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.


1. 수집하는 개인정보

이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
 
   </textarea>
   </div>
	
	
	

				<br/>
				<input type="checkbox" name="checkbox" class="checkbox"> 개인정보 수집 및 이용에 동의합니다. <br/><br/><br/>
				<input type="button" value="작성" class="btn btn-secondary alert-danger" id="goBtn" style="margin-right: 25px;margin-left: 200px; margin-top:20px;" ><br/>
					
			</form>
		    
			</div>
			
		</div>

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

</body>
</html>