<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	
	<%-- 회원가입 오류 체크 페이지 --%>
	<% 
		String errorType= (String) request.getAttribute("errorType");
		if(errorType.equals("isNull")){ 
	%>
		<script>
		alert('입력이 안 된 사항이 있습니다.');
		history.back();
		</script>
	<%} else if (errorType.equals("isMember")){ %>
		<script>
		alert('이미 존재하는 아이디 입니다.');
		history.back();
		</script>
	<%} %>

</body>
</html>