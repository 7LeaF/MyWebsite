<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.BbsDto" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<jsp:include page= "/layout/header.jsp" />
	
	<div class="container">
		<div class="row">
		<%
			BbsDto content= (BbsDto) request.getAttribute("content");
		%>
		<form method="post" action="updateAction.do?bbsID=<%= content.getBbsID() %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value=<%= content.getBbsTitle() %>></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= content.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글수정"  onclick="return confirm('정말로 수정 하시겠습니까?')">
		</form>
		</div>
	</div>
	
</body>
</html>