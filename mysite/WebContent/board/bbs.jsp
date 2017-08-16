<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.ArrayList" %>

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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${requestScope.list}">
						<tr>
			 				<td>${list.bbsID}</td>
							<td><a href="contentView.do?bbsID=${list.bbsID}">${fn:replace(list.bbsTitle,' ','&nbsp;')}</a></td> <!-- 리스트 출력시 띄어쓰기 처리 -->
							<td>${list.userID}</td>
							<td>${fn:substring(list.bbsDate,0,11)} (${fn:substring(list.bbsDate,11,13)}시 ${fn:substring(list.bbsDate,14,16)}분)</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			
			<!-- 이전, 다음 버튼 생성 -->
			<c:if test="${requestScope.pageNumber!= 1}">		
				<a href="bbs.do?pageNumber=${requestScope.pageNumber -1}" class="btn btn-success btn-arrow-left">이전</a>
			</c:if>
		
			<c:if test="${requestScope.isNextPage}">
				<a href="bbs.do?pageNumber=${requestScope.pageNumber +1}" class="btn btn-success btn-arrow-right">다음</a>
			</c:if>

			<a href="writeView.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
</body>
</html>