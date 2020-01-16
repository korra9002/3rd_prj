<%@page import="kr.co.prj.vo.DiaryResultVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
 %>
 <%
   String paramYear ="";
   String paramMonth ="";
   try{
   paramYear = request.getParameter("year");
   paramMonth = request.getParameter("month");
   }catch(NullPointerException ne){
      ne.printStackTrace();
   
   }
   //System.out.println(":"+paramYear+"/"+paramMonth);
   
   Calendar bCal = Calendar.getInstance();
     Calendar cal=Calendar.getInstance();     int nowYear=cal.get(Calendar.YEAR);
     int nowMonth = cal.get(Calendar.MONDAY);         
    if(paramYear != null &&paramMonth != null){
   nowYear = Integer.parseInt(paramYear);
   nowMonth =Integer.parseInt(paramMonth);
    }
      if(nowMonth < 0){
         nowYear--;
         nowMonth =11;
      }//end if
      if(nowMonth >11){
         nowYear++;
         nowMonth=0;
      }//end if
   int year = Calendar.getInstance().get(Calendar.YEAR);
   int month = Calendar.getInstance().get(Calendar.MONTH);
   int date = Calendar.getInstance().get(Calendar.DATE);
   
   //System.out.println(year+"/"+month+"/"+date);
   
   
 //  System.out.println(nowYear+"/"+nowMonth);
    cal.set(nowYear,nowMonth,1);
   bCal.set(nowYear,nowMonth-1, 1);
   int backLastDay = bCal.getActualMaximum(Calendar.DATE);
  // System.out.println(backLastDay+":마지막");
   
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="http://localhost:8080/jsp_prj/common/css/main.css">
<style type="text/css">
	#class4Wrap{ min-width:1100px; min-height: 100px; margin: 0px auto;}
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

	/* 푸터 시작  */
	#footer{  min-width:1100px;min-height: 250px;position:relative;  background-color: #E3C6C2;}
	#fContent{ width: 1100px;height: 110px; padding-top: 30px; margin-right: auto; margin-left: auto }
	/* 푸터 끝  */
	#hTitle{font-family: '고딕'; font-size: 30px; font-weight: bold;}

/* 달력 시작  */
#calWrap{width: 1000px; margin:0px auto;}
#calHeader{height: 70px;text-align:center;padding-top:10px;}
#calContent{min-height: 550px}
#diaryTab{border-spacing: 0px;border:1px solid #d6d7d7}

.sunTitle{width:200px;height:30px;background-color:#D74E42;font-weight: bold;color:#FFFFFF}
.weekTitle{width:200px;height:30px;font-weight: bold;}
.satTitle{width:200px;height:30px;background-color:#4E8DF4;font-weight: bold;color:#FFFFFF}
th,td { border: 1px solid #D6D7D7;}
.diaryTd{height:110px;text-align: left;vertical-align: top}
   .blankTd{ color: #A2B3BA;height:110px;text-align: left;vertical-align: top}  
   .sunText{ color: #DC2E28; font-weight: bold }
   .weekText{ color: #333; }
   .satText{ color: #618FFC ; font-weight: bold; }
   
  
/* 달력   */
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
       $(function() {
          $('#main-menu').smartmenus({
             subMenusSubOffsetX: 1,
             subMenusSubOffsetY: -8
          });
       });
</script>

 <!-- SmartMenus 끝 -->

<script type="text/javascript">
$(function(){
   $("#next").click(function(){
      
   })
});
function moveResv( year,month,day){
	
	$("#param_year").val(year);
	$("#param_month").val(month);
	$("#param_day").val(day);
	$("#resvFrm").submit();
	
}


</script>
</head>
<body>
   <div id="class4Wrap">    
	<div id="naviBar">
	 	<!-- MENU 시작 -->
		<%@include file="../../../../common/navbar/nav.jsp" %>
	 	<!-- MENU 끝 -->
	</div>
      </div>
      <div id="container">
         <%
      
         

    	
   
         %>
         <div id="calWrap">
            <div id="calHeader">
           <%--  <a href='diary.do?<%="year="+nowYear+"&"+"month="+(nowMonth-1)%>'><img src="/3rd_prj/common/images/prev_btn.png"title="이전월"id="pre"/></a> --%>
            <a href="diary.do?month=<%=nowMonth-1<0?11:nowMonth-1%>&year=<%=
         nowMonth-1<0?nowYear-1:nowYear %>"><img src="/3rd_prj/common/images/prev_btn.png" title="이전월"/></a>
            <span style="font-family: 고딕  SansSerif;font-weight: bold;font-size: 27px"><%=nowYear%>.<%=nowMonth+1 %></span>
            <%-- <a href='diary.do?<%="year="+nowYear+"&"+"month="+(nowMonth+1)%>'><img src="/3rd_prj/common/images/next_btn.png"title="다음월"id="next"/></a> --%>
               <a href="diary.do?month=<%=nowMonth+1==12?0:nowMonth+1%>&year=<%=
            nowMonth+1==12?nowYear+1:nowYear %>"><img src="/3rd_prj/common/images/next_btn.png" title="다음월"/></a>    
            <a href='diary.do'><img src="/3rd_prj/common/images/today_btn.png"title="현재월"/></a>
            </div>         
            <div id="calContent">
            
            
            <form action="/3rd_prj/reservation/rsv_input.do" method="post" id="resvFrm">
            <input type="hidden" name="param_year" id="param_year"/>
            <input type="hidden" name="param_month" id="param_month"/>
            <input type="hidden" name="param_day" id="param_day"/>
            </form>
            
            <table id="diaryTab">
            <tr style="text-align: center; height:40px">
               <th class="sunTitle" style="background-color: #E3C6C2">일</th>
               <th class="weekTitle">월</th>
               <th class="weekTitle">화</th>
               <th class="weekTitle">수</th>
               <th class="weekTitle">목</th>
               <th class="weekTitle">금</th>
               <th class="satTitle" style="background-color: #C8C4C1">토</th>
            </tr>
            <tr>
            <%
            for(int tempDay=1;;tempDay++){//끝나는 일자를 모르기 때문에 무한loop
               cal.set(Calendar.DAY_OF_MONTH, tempDay);//증가하는 가상의 일자를 달력객체에 설정
               if(cal.get(Calendar.DAY_OF_MONTH)!=tempDay ){
                  //증가하는 임시일자와 설정된 날짜를 꺼내온것이 다르다면 다음달 1일 이므로 반복문을 빠져 나간다.
                //  System.out.println(cal.get(Calendar.MONTH)+"월/"+cal.get(Calendar.DAY_OF_WEEK)+"요일");
                  
                  if(cal.get(Calendar.DAY_OF_WEEK) != 1){
                  int nextDay = 1;
                  for(int blankTd=cal.get(Calendar.DAY_OF_WEEK);blankTd<8;blankTd++){
                  //System.out.println(blankTd);
               %>
               <td class="blankTd"><%=nextDay++ %></td> 
               <%
                     }//end for
                  }//end if
                  
                  
                  break;
               }//end if
               
               if(tempDay==1){//1일 인경우
                  //1일 출력하기 전에 공백을 만들어 준다.
                  //사람 :1 2 3 4 5 6 7 8 9 10 11 12
                  //자바:0 1 2 3 4 5 6 7 8 9 10 11
               int tempMonth =   nowMonth-1;
               int tempYear = nowYear;
            
                  
                  
               
                  for(int blankTd=cal.get(Calendar.DAY_OF_WEEK)-1;blankTd>0;blankTd--){
                   //  System.out.println(blankTd-1);
               %>
               <td class="blankTd"><!-- <a href="/3rd_prj/reservation/rsv_input.do"> -->
         
               <%= backLastDay-(blankTd-1)%></a></td>
               <%
                     
                  }//end for
               }//end if
               %>
               <%
                  String backColor ="";
               if(year == nowYear && month == nowMonth && date == tempDay){
                  backColor = "style='background-color: #e9f4fb'";
               }
               boolean flag = false;
               if(year < nowYear || (year ==nowYear &&  month <= nowMonth  && date < tempDay  )){
					flag =true;
               }
               
               
               
               %>
               
               
               <td class="diaryTd"<%= backColor %>>
               <%
               String color = "";
               switch(cal.get(Calendar.DAY_OF_WEEK)){
               case Calendar.SATURDAY:
                  color ="style='color:#0000FF'"; 
               break;
               case Calendar.SUNDAY:
                  color ="style='color:#FF0000'"; 
               break;
               default:
            	   color="style='color:#007BFF'";
            	   break;
               }
            
               
               %>
               
        <%
        
        // tempDay는 for문에서 해당 년월의 날짜를 표시한다
        Map<Integer, DiaryResultVO[]> map = (HashMap<Integer, DiaryResultVO[]>)request.getAttribute("rListMap");
        if(map.containsKey(tempDay)){
        	
          //해당 날짜를 키값으로 하여 예약정보가 담긴 VO객체를 얻는다.  
      	  DiaryResultVO[] drArr =  map.get(tempDay);
      	  String[] dayColor = {"white","white","white","white"};
      	  String[] dayTime = {"8-12","12-16","16-20","20-24"};
      	  boolean[] idFlag = new boolean[4];
      	  String id = (String)request.getAttribute("mamberId");
      	  
      	  int cnt=0;
      	  for(int i=0;i<drArr.length;i++){
      		  
      		  //인덱스 i에서 drArr이 null이라면 예약이 없는것이고 null이 아니라면 해당 {"8-12","12-16","16-20","20-24"}에서 i의 인덱스에 해당하는 시간이 예약되어있음
      		  if(drArr[i] != null){
      			  dayColor[i] ="#E6E6E6";
      		  	  cnt++;
      		  }else{
      			  dayTime[i]="&nbsp;";
      		  }
      	  }
      	  
      	  //cnt가 4라면 4타임 전부 예약된 것이라 클릭이 불가능 하도록 한다.
      	  if(cnt==4){%>
      		 <div <%=color %>><%=tempDay %></div>
      <%	}else{	  
    	  
     			//flag 변수에 현재 날짜보다 전의 날짜라면 false가 저장되어 링크를 생성하지 않는다.
     		  if(flag){%>
       			 <a href="javascript:moveResv('<%=nowYear %>','<%=nowMonth+1 %>', '<%=tempDay %>')"><div <%=color %>><%=tempDay %></div></a>
       		<%}else{%>
      	   		 <div <%=color %>><%=tempDay %></div>
       	    <%}    	
     
      		} 
      	 // {"8-12","12-16","16-20","20-24"}의 시간중에 예약된곳을 표시한다.
      		%> 
         <div style="background-color: <%=dayColor[0]%>"><div style='color:gray'><%=dayTime[0]%></div></div>
         <div style="background-color: <%=dayColor[1]%>"><div style='color:gray'><%=dayTime[1]%></div></div>
         <div style="background-color: <%=dayColor[2]%>"><div style='color:gray'><%=dayTime[2]%></div></div>
         <div style="background-color: <%=dayColor[3]%>"><div style='color:gray'><%=dayTime[3]%></div></div>
      	  
      <% }else{  
    	  	//map.containsKey(tempDay) !=true 인 경우. 예약이 되어있지 않은 날짜를 표시 
	      	 if(flag){%>
	       		 <a href="javascript:moveResv('<%=nowYear %>','<%=nowMonth+1 %>', '<%=tempDay %>')"><div <%=color %>><%=tempDay %></div></a>
	       	<%}else{%>
	      	     <div <%=color %>><%=tempDay %></div>
	      	<%}
     	 } %>
        
     </td>
     <%
     switch(cal.get(Calendar.DAY_OF_WEEK)){//설정된 일자의 요일이 토요일이면 줄을 변경
     case Calendar.SATURDAY:
     %>
     </tr><tr>
     <%
     }//end switch
  
  }//end for
  %>

            
            
            
            
         
            </table>
            
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