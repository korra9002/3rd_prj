<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script type="text/javascript">
$(function(){
	location.href="/3rd_prj/board/qna_post.do?q_num="+$("#q_num").val();
});//ready
</script>
<body>
<input type="hidden" name="q_num" id="q_num" value="<c:out value="${param.q_num}"/>"/>

</body>
</html>