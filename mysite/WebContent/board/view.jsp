<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.io.PrintWriter" %>

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

					<c:set var="content" value="${requestScope.content}" />
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${content.bbsTitle}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${content.userID}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${fn:substring(content.bbsDate,0,11)} ${fn:substring(content.bbsDate,11,13)}시 ${fn:substring(content.bbsDate,14,16)}분</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left; ">${content.bbsContent}</td>
						<%-- <td colspan="2" style="min-height: 200px; text-align: left; "><%= content.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td> --%>
					</tr>
				</tbody>
			</table>
			<a href="bbs.do" class="btn btn-primary">목록</a>
			<c:if test="${requestScope.isWriter}">
					<a href="updateView.do?bbsID=${content.bbsID}" class="btn btn-primary">수정</a>
					<a href="deleteAction.do?bbsID=${content.bbsID}" class="btn btn-primary" onclick="return confirm('정말로 삭제 하시겠습니까?')">삭제</a>
			</c:if>
		</div>
	</div>
	
</body>
</html>