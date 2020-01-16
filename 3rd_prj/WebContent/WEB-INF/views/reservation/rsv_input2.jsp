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
		
		
		


		
		
		
	if(confirm("예약 할까요11?")){
		alert("!!!");
		$("#rsvFrm1").submit();   
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
			<img src="http://localhost:8080/3rd_prj/common/images/<c:out value="${ image1 }"/>" style="width: 400px">
			<br/><br/><br/>
		
			<div>
				<strong>예약 안내</strong><br/><br/>
				예약 전 촬영이 가능한 날인지 상담 후 작성 바랍니다.<br/>

				입력폼 양식대로 전송하시고 예약금50%를 입금해주시면 예약이 완료됩니다.<br/><br/>
				
				<strong>국민 280601-04-199521 마로브블랑쉬</strong><br/><br/>
				
				
				
				- 촬영가격은 현금결제 기준이며,  카드 결제시 10%가 부과 됩니다.<br/>
				
				- 예약금은 24시간 내 미 입금시 자동취소 됩니다.<br/>
				
				- 같은 시간에 중복 예약이 있을 시 입금순으로 예약이 확정되오니 양해 부탁드립니다.<br/>
				
				- 예약시간 준수 바랍니다. 일찍 오셔도 입실이 어렵습니다. <br/>
				
				  독채 예약으로 전 타임 예약자분들과 겹칠 수 있어 대기하실 곳이 마땅치 않습니다. <br/>
				
				- 취소 및 변경, 환불 규정은 반드시 필독사항을 참고 부탁드립니다.<br/>
			</div>
			<br/><br/>
			<div>
				<strong>변경 안내</strong><br/><br/>
					촬영 1주일전에 날짜변경 및 취소가 가능합니다.<br/>
					
					2시간 대관 시스템으로 해당 시간이 취소되는 경우<br/>
					
					다른 예약자분을 받지 못하기 때문에 변경시<br/>
					
					위약금이 발생하는 점 양해부탁드립니다.<br/>
					
					*우천으로 인한 날짜 변경은 불가능합니다.<br/>
					
					*위약금 안내<br/>
					
					촬영 7일전 100%<br/>
					
					촬영 6일전 90% / 촬영 5일전 80%<br/>
					
					촬영 4일전 70% / 촬영 3일전 60%<br/>
					
					촬영 2일전 50% / 촬영 1일전 40%<br/>
					
					촬영 당일 0%<br/>
			</div>
			<br/><br/>
			<div>
				<strong>필독사항</strong><br/><br/>

				셀프웨딩드레스 대여 시 소품 대여는 무료 입니다.<br/>
				
				다음 타임의 예약자분도 사용해야하므로 소중히 사용하여 주세요.<br/>
				
				오염된 의상은 바로 세탁에 들어갑니다.<br/>
				
				홈페이지에서 보신 의상이 준비가 안될 수 있으니<br/>
				
				양해 부탁드립니다.<br/>
				
				드레스 오염으로 다음 타임이 착용 불가능할 경우<br/>
				
				세탁비(2만원)가 발생할 수 있습니다.<br/>
				
				스튜디오 내부의 조명 및 카메라, 소품, 의상 등 훼손 시 <br/>
				
				그에 따른 변상이 발생합니다.<br/>
				
				갤러리에서 보셨던 사진과 다르게 인테리어 또는 소품이<br/>
				
				변경될 수 있습니다. <br/>
				
				마로브블랑쉬는 더 예쁜 컨셉으로 디벨롭 중 입니다.<br/>
				
				
				
				사진과 보정은 주관적인 예술작업으로 구도, 색감, 보정강도 등 <br/>
				
				주관적인 사항으로 인한 보상이나 환불은 불가합니다.<br/>
				
				좋아해주신 마로브블랑쉬 사진들은 먼저 다녀가신 분들께서 <br/>
				
				그날의 좋은 느낌을 함께 공유해 주셨기에 만나실 수 있었던 사진입니다.<br/>
				
				갤러리에서 보신 촬영 컷 들은 헤어/메이크업부터 드레스까지 <br/>
				
				완벽한 세팅 후 촬영한 컷 들입니다. <br/>
				
				최대한 드레스업에 맞는 헤어메이크업을 준비바랍니다.<br/>
				
				베스트컷은 갤러리, 블로그, SNS에 포트폴리오로 공개 될 수 있습니다.<br/>
				
				원하지 않으신 경우 얼굴 노출이 적은 감성컷으로 올라갈 예정입니다.<br/>
				
				세부보정 완료일 기준 2달까지 보관하며, 이 후 폐기 하므로 <br/>
				
				이메일 수신 즉시 다운로드 하셔서 소중히 보관해주세요.<br/>
				
				늘 마음 다해 최선을 다하겠습니다. 찾아주셔서 정말 감사합니다:)<br/>
			</div>
			
		</div>

		
		
		<div id="rightside">
		<form action="/3rd_prj/payment/confirm_parameter.do" method="post"  id="rsvFrm1">
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
					<input type="text" class="form-control form-control-sm" id="rsv_person" name="rsv_person" id="rsv_person">			
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
			
			
			
			
			<strong>총 금액 : <span id="chkboxCnt"></span> 원</strong><br/><br/>
			
			
			
		
			요청사항<br/>
			<textarea class="form-control" id="request" rows="5" name="rsvRequest" ></textarea><br/>
			<br/>
			
	개인정보 수집 및 동의
	<div style="width: 500px; height: 200px; border: 1px solid #333; overflow: auto; white-space:pre;"  >
	회사명(이하 ‘회사’라 한다)는 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.
	
	제1조 (개인정보의 처리목적)
	회사는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
	
	1. 홈페이지 회원 가입 및 관리
	회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다.
	
	2. 재화 또는 서비스 제공
	물품배송, 서비스 제공, 계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을 목적으로 개인정보를 처리합니다.
	
	3. 고충처리
	민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.
	
	제2조 (개인정보의 처리 및 보유기간)
	① 회사는 법령에 따른 개인정보 보유․이용기간 또는 정보주체로부터 개인정보를 수집시에 동의받은 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
	② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.
	
	1. 홈페이지 회원 가입 및 관리 : 사업자/단체 홈페이지 탈퇴시까지
	다만, 다음의 사유에 해당하는 경우에는 해당 사유 종료시까지
	1) 관계 법령 위반에 따른 수사․조사 등이 진행중인 경우에는 해당 수사․조사 종료시까지
	2) 홈페이지 이용에 따른 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
	
	
	2. 재화 또는 서비스 제공 : 재화․서비스 공급완료 및 요금결제․정산 완료시까지
	다만, 다음의 사유에 해당하는 경우에는 해당 기간 종료시까지
	1) 「전자상거래 등에서의 소비자 보호에 관한 법률」에 따른 표시․광고, 계약내용 및 이행 등 거래에 관한 기록
	- 표시․광고에 관한 기록 : 6월
	- 계약 또는 청약철회, 대금결제, 재화 등의 공급기록 : 5년
	- 소비자 불만 또는 분쟁처리에 관한 기록 : 3년
	2) 「통신비밀보호법」제41조에 따른 통신사실확인자료 보관
	- 가입자 전기통신일시, 개시․종료시간, 상대방 가입자번호, 사용도수, 발신기지국 위치추적자료 : 1년
	- 컴퓨터통신, 인터넷 로그기록자료, 접속지 추적자료 : 3개월
	
	
	제3조 (개인정보의 제3자 제공)
	① 회사는 정보주체의 개인정보를 제1조(개인정보의 처리목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
	② 회사는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
	- 개인정보를 제공받는 자 :  <![CDATA[   <예) (주) OOO 카드>
	- 제공받는 자의 개인정보 이용목적 : <예) 이벤트 공동개최 등 업무제휴 및 제휴 신용카드 발급>
	- 제공하는 개인정보 항목 : <예) 성명, 주소, 전화번호, 이메일주소, 카드결제계좌정보>
	- 제공받는 자의 보유․이용기간 : <예) 신용카드 발급계약에 따른 거래기간동안>
	
	
	제4조(개인정보처리의 위탁)
	① 회사는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
	
	1. 전화 상담센터 운영
	- 위탁받는 자 (수탁자) : OOO CS센터
	- 위탁하는 업무의 내용 : 전화상담 응대, 부서 및 직원 안내 등
	
	2. A/S 센터 운영
	- 위탁받는 자 (수탁자) : OOO 전자
	- 위탁하는 업무의 내용 : 고객 대상 제품 A/S 제공
	
	② 회사는 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
	③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
	
	제5조(정보주체의 권리․의무 및 행사방법)
	
	① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
	1. 개인정보 열람요구
	2. 오류 등이 있을 경우 정정 요구
	3. 삭제요구
	4. 처리정지 요구
	② 제1항에 따른 권리 행사는 회사에 대해 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 회사는 이에 대해 지체없이 조치하겠습니다.
	③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
	④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
	⑤ 정보주체는 개인정보 보호법 등 관계법령을 위반하여 회사가 처리하고 있는 정보주체 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.
	
	
	제6조(처리하는 개인정보 항목)
	회사는 다음의 개인정보 항목을 처리하고 있습니다.
	
	1. 홈페이지 회원 가입 및 관리
	필수항목 : <예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 성별, 이메일주소, 아이핀번호>
	선택항목 : <예) 결혼여부, 관심분야>
	
	2. 재화 또는 서비스 제공
	필수항목 : <예) 성명, 생년월일, 아이디, 비밀번호, 주소, 전화번호, 이메일주소, 아이핀번호, 신용카드번호, 은행계좌정보 등 결제정보>
	선택항목 : <관심분야, 과거 구매내역>
	
	3. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.
	IP주소, 쿠키, MAC주소, 서비스 이용기록, 방문기록, 불량 이용기록 등
	
	제7조(개인정보의 파기)
	① 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
	② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
	③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
	1. 파기절차
	회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
	2. 파기방법
	회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.
	
	제8조(개인정보의 안전성 확보조치)
	회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
	1. 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등
	2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보
	등의 암호화, 보안프로그램 설치
	3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제
	
	제9조(개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항)
	① 회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.
	② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
	가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해
	사용됩니다.
	나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
	다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
	
	
	제10조(개인정보 보호책임자)
	① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
	
	▶ 개인정보 보호책임자
	성명 : OOO
	직책 : OOO
	연락처 : <전화번호>, <이메일>, <팩스번호>
	※ 개인정보 보호 담당부서로 연결됩니다.
	
	▶ 개인정보 보호 담당부서
	부서명 : OOO 팀
	담당자 : OOO
	연락처 : <전화번호>, <이메일>, <팩스번호>
	
	② 정보주체께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.
	
	
	제11조(개인정보 열람청구)
	정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
	
	▶ 개인정보 열람청구 접수․처리 부서
	부서명 : OOO
	담당자 : OOO
	연락처 : <전화번호>, <이메일>, <팩스번호>
	
	제12조(권익침해 구제방법)
	정보주체는 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.
	
	▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영)
	- 소관업무 : 개인정보 침해사실 신고, 상담 신청
	- 홈페이지 : privacy.kisa.or.kr
	- 전화 : (국번없이) 118
	- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터
	
	▶ 개인정보 분쟁조정위원회
	- 소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)
	- 홈페이지 : www.kopico.go.kr
	- 전화 : (국번없이) 1833-6972
	- 주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층
	
	▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)
	▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)
	
	
	제13조(개인정보 처리방침 시행 및 변경)
	이 개인정보 처리방침은 20XX. X. X부터 적용됩니다.
	]]>
				</div>
				<br/>
					
				<input type="checkbox" name="checkbox"  class="checkbox"> 개인정보 수집 및 이용에 동의합니다. <br/>
				<input type="button" value="작성" class="btn btn-secondary alert-danger" id="goBtn" style="margin-right: 25px;margin-left: 200px" ><br/>
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