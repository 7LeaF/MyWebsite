<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>

	<%-- 게시판 글쓰기 오류 페이지 --%>
	<%
		String errorType= (String) request.getAttribute("errorType");
		if(errorType.equals("isNotLogin")){
	%>
		<script>
		alert('로그인이 되어있지 않습니다.');
		location.href= 'login.do';
		</script>
	<%		
		}else if(errorType.equals("isNull")){
	%>		
		<script>
		alert('입력이 안 된 사항이 있습니다.');
		history.back();
		</script>
		
	<%	
		}else if(errorType.equals("writeError")){
	%>	
		<script>
		alert('글쓰기에 실패했습니다.');
		history.back();
		</script>
	<%
		}
	%>

</body>
</html>