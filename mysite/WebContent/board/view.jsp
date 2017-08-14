<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dto.BbsDto" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	
	<jsp:include page= "/layout/header.jsp" />
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDto content= (BbsDto) request.getAttribute("content");
					
					%>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= content.getBbsTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= content.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= content.getBbsDate().substring(0, 11) + content.getBbsDate().substring(11, 13) + "시" + content.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left; "><%= content.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.do" class="btn btn-primary">목록</a>
			<%
				boolean isWriter= (boolean) request.getAttribute("isWriter");
				if(isWriter){
				/* if(userID != null && userID.equals(content.getUserID())){ */
			%>
					<a href="updateView.do?bbsID=<%= content.getBbsID() %>" class="btn btn-primary">수정</a>
					<a href="deleteAction.do?bbsID=<%= content.getBbsID() %>" class="btn btn-primary" onclick="return confirm('정말로 삭제 하시겠습니까?')">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	
</body>
</html>