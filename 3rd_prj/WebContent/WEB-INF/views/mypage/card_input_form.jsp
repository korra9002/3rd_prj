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
	td{ padding: 10px}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Amaranth&display=swap" rel="stylesheet">
<script type="text/javascript">
$(function(){
	$("#goBtn").click(function(){
		//$("#cardInfoFrm").submit();
		var four= /^[0-9]{4}$/
		var three= /^[0-9]{3}$/
		var five= /^[0-9/]{5}$/
		var exData = /^[0-9]{2}$/-/^[0-9]{2}$/; 
		 if($("#cardNum1").val()!=""){
				$("#cardNum1").attr('class','form-control is-valid');
				$("#cardNum_div1").attr('class','valid-feedback');
				$("#cardNum_div1").text("");
		  		if($("#cardNum1").val().replace(four,"")!= ""){
					$("#cardNum1").attr('class','form-control is-invalid');
					$("#cardNum_div1").attr('class','invalid-feedback');
					$("#cardNum_div1").text("숫자 4개 적어주세요.");
					return;
				}//end if 				
			}else{
				$("#cardNum1").attr('class','form-control is-invalid');
				$("#cardNum_div1").attr('class','invalid-feedback');
				$("#cardNum_div1").text("카드번호를 입력해주세요.");
				return;
			}//카드1 값 존재 여부
			
		 if($("#cardNum2").val()!=""){
				$("#cardNum2").attr('class','form-control is-valid');
				$("#cardNum_div2").attr('class','valid-feedback');
				$("#cardNum_div2").text("");
		  		if($("#cardNum2").val().replace(four,"")!= ""){
					$("#cardNum2").attr('class','form-control is-invalid');
					$("#cardNum_div2").attr('class','invalid-feedback');
					$("#cardNum_div2").text("숫자 4개 적어주세요.");
					return;
				}//end if 
			}else{
				$("#cardNum2").attr('class','form-control is-invalid');
				$("#cardNum_div2").attr('class','invalid-feedback');
				$("#cardNum_div2").text("카드번호를 입력해주세요.");
				return;
			}//카드2 값 존재 여부
			
		 if($("#cardNum3").val()!=""){
				$("#cardNum3").attr('class','form-control is-valid');
				$("#cardNum_div3").attr('class','valid-feedback');
				$("#cardNum_div3").text("");
		  		if($("#cardNum3").val().replace(four,"")!= ""){
					$("#cardNum3").attr('class','form-control is-invalid');
					$("#cardNum_div3").attr('class','invalid-feedback');
					$("#cardNum_div3").text("숫자 4개 적어주세요.");
					return;
				}//end if 
			}else{
				$("#cardNum3").attr('class','form-control is-invalid');
				$("#cardNum_div3").attr('class','invalid-feedback');
				$("#cardNum_div3").text("카드번호을 입력해주세요.");
				return;
			}//카드3 값 존재 여부
			
		 if($("#cardNum4").val()!=""){
				$("#cardNum4").attr('class','form-control is-valid');
				$("#cardNum_div4").attr('class','valid-feedback');
				$("#cardNum_div4").text("");
		  		if($("#cardNum4").val().replace(four,"")!= ""){
					$("#cardNum4").attr('class','form-control is-invalid');
					$("#cardNum_div4").attr('class','invalid-feedback');
					$("#cardNum_div4").text("숫자 4개 적어주세요.");
					return;
				}//end if 
			}else{
				$("#cardNum4").attr('class','form-control is-invalid');
				$("#cardNum_div4").attr('class','invalid-feedback');
				$("#cardNum_div4").text("카드번호를 입력해주세요.");
				return;
			}//카드4 값 존재 여부
			
		 if($("#expireDate").val()!=""){
				$("#expireDate").attr('class','form-control is-valid');
				$("#exDate_div").attr('class','valid-feedback');
				$("#exDate_div").text("");
		  		if($("#expireDate").val().replace(five,"")!= ""){
					$("#expireDate").attr('class','form-control is-invalid');
					$("#exDate_div").attr('class','invalid-feedback');
					$("#exDate_div").text("'12/25' 형식의 5글자 입력해주세요.");
					return;
				}//end if 
			}else{
				$("#expireDate").attr('class','form-control is-invalid');
				$("#exDate_div").attr('class','invalid-feedback');
				$("#exDate_div").text("'12/25' 형식의 5글자 입력해주세요.");
				return;
			}//만료일 값 존재 여부
			
		 if($("#CVV").val()!=""){
				$("#CVV").attr('class','form-control is-valid');
				$("#cvv_div").attr('class','valid-feedback');
				$("#cvv_div").text("");
		  		if($("#CVV").val().replace(three,"")!= ""){
					$("#CVV").attr('class','form-control is-invalid');
					$("#cvv_div").attr('class','invalid-feedback');
					$("#cvv_div").text("숫자 3개 적어주세요.");
					return;
				}//end if 
			}else{
				$("#CVV").attr('class','form-control is-invalid');
				$("#cvv_div").attr('class','invalid-feedback');
				$("#cvv_div").text("보안코드를 입력해주세요.");
				return;
			}
			//보안코드 값 존재 여부
			if(confirm("카드를 추가 할까요?")){
				$("#cardInfoFrm").submit();
			}	
	});//click
	
/* 	$("#goBtn").click(function(){
		if(confirm("카드를 추가 할까요?")){
			$("#cardInfoFrm").submit();
		}	
	});//click */
	
	
	///////////////// 카드 유효기간 검증 /////////////////////////
	
			$("#expireDate").focusout(function(){
				
	
	        // replace 함수를 사용하여 슬래시( / )을 공백으로 치환한다.
	        var replaceCard =  $("#expireDate").val().replace(/\//g, "");
	       // var replaceCard = $("#expireDat).val().replace(/\//g, "");
	       
	
	        // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
	        if(replaceCard.length >= 4 && replaceCard.length < 5) {
	
	            var inputMonth = replaceCard.substring(0, 2);    // 선언한 변수 month에 월의 정보값을 담는다.
	            var inputYear = replaceCard.substring(2, 4);       // 선언한 변수 year에 년의 정보값을 담는다.
	
	
	            // 현재 날짜 값을 구한다.
	            var nowDate = new Date();
	
	            var nowMonth = autoLeftPad(nowDate.getMonth() + 1, 2);
	
	            var nowYear = autoLeftPad(nowDate.getFullYear().toString().substr(2, 2), 2);
	
	
	            // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
	            if(isFinite(inputMonth + inputYear) == false) {
	                alert("문자는 입력하실 수 없습니다.");
	                period.value = autoLeftPad((Number(nowMonth) + 1), 2) + "/" + nowYear;
	                return false;
	            }
	
	            // 입력한 월이 12월 보다 큰 경우
	            if(inputMonth > 12) {
	                alert("12월보다 큰 월수는 입력하실 수 없습니다. ");
	                period.value = "12/" + inputYear;
	                return false;
	            }
	
	
	
	            // 입력한 유효기간을 현재날짜와 비교하여 사용 가능 여부를 판단한다.
	            if((inputYear + inputMonth) <= (nowYear + nowMonth)) {
	                alert("유효기간이 만료된 카드는 사용하실 수 없습니다.");
	                period.value = inputMonth + "/" + autoLeftPad((Number(nowYear) + 1), 2);
	                return false;
	            }//end if
	
	            period.value = inputMonth + "/" + inputYear;
	        } else {
	        	alert("5자 이상은 입력 불가합니다. 월/년도(끝2자리) 형식으로 입력해주세요.")
	        }//end if
	    });
	
	
	    // 1자리 문자열의 경우 앞자리에 숫자 0을 자동으로 채워 00형태로 출력하기위한 함수
	    function autoLeftPad(num, digit) {
	        if(String(num).length < digit) {
	            num = new Array(digit - String(num).length + 1).join('0') + num;
	        }
	        return num;
	    }
		
		
	
	
});//ready
$(function(){
	form = document.form1;
	form.chApplNm.focus();
	$("#chBirthYmd").attr("masktype", "date");
	$("input:text").setMask();
});
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

<form class="card" id="cardInfoFrm" action="finishInputCardInfo.do" method="post" style="width: 550px; height: 550px; padding-top: 20px ; margin-left: auto; margin-right: auto;">
	<div class="card-body" align="center" >
		<div><img src="http://localhost:8080/3rd_prj/common/images/credit-card3.png">&nbsp;&nbsp;&nbsp;&nbsp;<strong>결제정보 입력</strong></div><br/>
			
			<table>
				<tr>
					<td style="width: 100px; margin-top: 0px; margin-bottom: 0px">카드번호</td>
					<td align="center">
						  <div class="form-row" >
							    <div class="form-group col-md-3" style="margin-top: 0px; margin-bottom: 0px">
							      <input type="text" class="form-control" id="cardNum1" name="cardNum1" maxlength="4"/>
							      <div id="cardNum_div1"></div>
							    </div>
							    <div class="form-group col-md-3">
							      <input type="text" class="form-control" id="cardNum2" name="cardNum2" maxlength="4"/>
							      <div id="cardNum_div2"></div>
							    </div>
							    <div class="form-group col-md-3">
							      <input type="text" class="form-control" id="cardNum3" name="cardNum3" maxlength="4" />
							      <div id="cardNum_div3"></div>
							    </div>
							    <div class="form-group col-md-3">
							      <input type="text" class="form-control" id="cardNum4" name="cardNum4" maxlength="4" />
							      <div id="cardNum_div4"></div>
							    </div>
						  </div>						  
					</td>
				</tr>		
						
				<tr>
					<td>카드유형</td>
					<td>
			    <select class="form-control" name="cardTypeCode" style="width: 160px">
  		  <c:forEach var="cardTypeList" items="${cardTypeList }">
			<option value="${ cardTypeList.cardTypeCode }"><c:out value="${ cardTypeList.cardType }"/></option>
		  </c:forEach>
    
	  </select></td>
				</tr>
				<tr>
					<td>만료일</td>
					<td>
						<input type="text" class="form-control" style="width: 160px; " align="center" id="expireDate" name="exDate" maxlength="5" >
						<label class="txt_hiden"></label>
						<div id="exDate_div"></div>
					</td>
				</tr>
				<tr>
					<td>보안코드</td>
					<td>
						<input type="text" class="form-control" style="width: 160px" id="CVV" name="cvv" maxlength="3">
						<div id="cvv_div"></div>
					</td>
				</tr>
				</table>
				
				<br/><br/>
				<div>
				<button type="button" style="width:100px "class="btn btn-secondary alert-danger btn" id="goBtn" >추가</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" style="width:100px "class="btn btn-secondary alert-secondary btn" id="backBtn" onClick="location.href='mypage.do'">취소</button>
				</div>
	</div>
</form>	 
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