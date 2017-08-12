<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<%-- 로그인 에러 체크 페이지 --%>
	<% 
		String errorType= (String) request.getAttribute("errorType");
		if(errorType.equals("invalidPassword")){
	%>	
		<script>
		alert('비밀번호가 틀립니다.');
		history.back();
		</script>
	<%
		}else if(errorType.equals("invalidUserID")){
	%>
		<script>
		alert('존재하지 않는 아이디 입니다.');
		history.back();
		</script>
			
	<%
		}else if(errorType.equals("dbError")){
	%>
		<script>
		alert('데이터베이스 오류가 발생하였습니다.');
		history.back();
		</script>
	<%
	}
	%>
	 
</body>
</html>