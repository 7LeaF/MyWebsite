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
		}else if(errorType.equals("invalidContent")){
	%>		
		<script>
		alert('유효하지 않은 글입니다.');
		history.back();
		</script>
		
	<%	
		}else if(errorType.equals("notAuth")){
	%>	
		<script>
		alert('권한이 없습니다.');
		location.href= 'bbs.do';
		</script>
	<%
		}else if(errorType.equals("isNull")){
	%>	
		<script>
		alert('입력이 안 된 사항이 있습니다.');
		history.back();
		</script>
	<%
		}else if(errorType.equals("deleteFail")){
	%>	
		<script>
		alert('글 삭제에 실패 하였습니다.');
		history.back();
		</script>
	<%
		}
	%>


</body>
</html>