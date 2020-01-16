<%@page import="kr.co.prj.domain.BankInfoDomain"%>
<%@page import="kr.co.prj.vo.ReservationTotalVO"%>
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


	#class4Wrap{ min-width:1100px; min-height: 1100px; margin: 0px auto; 
	display: flex; min-height: 100vh; flex-direction: column; 
	}
	/* 헤더 시작*/
	#naviBar{ min-width:1100px; min-height: 130px; position:relative; font-size: 20px;}
	/* 헤더 끝 */
	/* 컨테이너 시작  */
	#container{ width:1100px; height: 0px auto; position:relative; margin: 0px auto; margin-top:70px; margin-bottom: 10%; flex: 1;}
	.btn{width: 100px;height: 40px;}
	.nav-item{margin: 10px;}
	#sub-menuItem{font-family:"고딕";}
	#ex{padding-bottom: 20px; width: 150px; font-size: 15px;}
	
	.trTable{ width:30px ; height:40px; }
	.tdTable{ padding-right: 20px; font-size: 15px;}
	.tdTable2{ font-size: 15px; }
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
	$("#paymentBtn").click(function(){
		
		
		
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

<div id="container" align="center"> 
	<div style="border: 1px solid #333; border-color: #A4A19E ; width:450px ; height: 550px;">
	<br/><br/>
	<% ReservationTotalVO rsVO = (ReservationTotalVO)request.getAttribute("rInfo"); %>
		<table>
			<tr class="trTable">
				<td class="tdTable">예약날짜</td><td class="tdTable2"><c:out value="${rInfo.use_date }"></c:out></td>
			</tr>
			<tr class="trTable">
				<td class="tdTable">예약시간</td><td class="tdTable2"><c:out value="${rTime }"></c:out></td>
			</tr>
			<tr class="trTable">
				<td class="tdTable">이름</td><td class="tdTable2"><c:out value="${rInfo.name }"></c:out></td>
			</tr>
			<tr class="trTable">
				<td class="tdTable">연락처</td><td class="tdTable2"><c:out value="${rInfo.phone }"></c:out></td>
			</tr>
			<tr class="trTable">
				<td class="tdTable">이메일</td><td class="tdTable2"><c:out value="${rInfo.email }"></c:out></td>				
			</tr>			
			
			<tr class="trTable">
				<td class="tdTable">예약일자</td><td class="tdTable2"><c:out value="${rInfo.reservation_date }"></c:out></td>				
			</tr>		
			
			<%
			if("B".equals(rsVO.getPay_method())){
				BankInfoDomain bid = (BankInfoDomain)request.getAttribute("bInfo");
			
			%>
				<tr class="trTable">
					<td class="tdTable"><strong>입금은행</strong></td><td class="tdTable"><strong><%= bid.getBank() %></strong></td>			
				</tr>
				<tr class="trTable">
					<td class="tdTable"><strong>입금계좌</strong></td><td class="tdTable"><strong><%= bid.getAccount_number() %></strong></td>			
				</tr>
			<%-- 	<tr class="trTable">
					<td class="tdTable"><strong>결제요금</strong></td><td class="tdTable"><strong><c:out value="${rInfo.charge }"></c:out></strong></td>			
				</tr> --%>
					
					
					<%} %>
			
			<tr class="trTable">
				<td class="tdTable"><strong>결제요금</strong></td><td class="tdTable"><strong><c:out value="${rInfo.charge }"></c:out></strong></td>			
			</tr>
			
						<%
		if("D".equals(rsVO.getPay_status()) && "B".equals(rsVO.getPay_method())){
			BankInfoDomain bid = (BankInfoDomain)request.getAttribute("bInfo");
		
		%>
			<tr class="trTable">
				<td class="tdTable"><strong>결제상태</strong></td><td class="tdTable"><strong>입금대기</strong></td>			
			</tr>
				
				<%}else if(rsVO.getPay_status().equals("Y")&& rsVO.getPay_method().equals("C")) { %>
			<tr class="trTable">
				<td class="tdTable"><strong>결제상태</strong></td><td class="tdTable"><strong>카드결제 완료</strong></td>			
			</tr>
				
				<%}else if(rsVO.getPay_status().equals("Y")&& rsVO.getPay_method().equals("B")){ %>
			<tr class="trTable">
				<td class="tdTable"><strong>결제상태</strong></td><td class="tdTable"><strong>입금 완료</strong></td>			
			</tr>
				
				<%}else{%>
			<tr class="trTable">
				<td class="tdTable"><strong>결제상태</strong></td><td class="tdTable"><strong>결제대기</strong></td>			
			</tr>
			<% }%>	
			
			
		</table>
		<br/><br/>
		<div>
				<input type="button" value="확인" class="btn btn-secondary alert-danger" id="goBtn" style="margin-right: 25px;" onClick="location.href='/3rd_prj/index.do'">
		<%
		if(rsVO.getPay_status().equals("N")){
			
		
		%>
		<input type="button" value="결제" class="btn btn-secondary alert-secondary" id="backBtn" onClick="location.href='/3rd_prj/payment/paymentProcess.do'">
				
				<%} %>

		</div>
		<br/><br/>
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