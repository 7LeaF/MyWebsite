<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<%-- 게시판 보기 오류 --%>
	<%
		String errorType= (String) request.getAttribute("errorType");
		if(errorType.equals("invalidContent")){
	%>		
		<script>
		alert('유효하지 않은 글입니다.');
		history.back();
		</script>
	<%		
		}
	%>

</body>
</html>