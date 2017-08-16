<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
		
		<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>	
		
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#mysite-navbar-collapse"
			aria-expanded="false">	
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
				
		</div>
		<div class="collapse navbar-collapse" id="mysite-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.do">게시판</a></li>
			</ul>
				
			<c:choose>
				<c:when test="${sessionScope.userID== 'admin' }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="admin.jsp"><span class="glyphicon glyphicon-user"></span> 관리자</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 회원관리 <span class="caret"></span>
						</a>
	
						<ul class="dropdown-menu">
							<li><a href="logout.do">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				</c:when>
				
				<c:when test="${!empty sessionScope.userID}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 회원관리 <span class="caret"></span>
						</a>
	
						<ul class="dropdown-menu">
							<li><a href="logout.do">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				</c:when>
				
				<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false"> 접속하기 <span class="caret"></span>
						</a>
	
						<ul class="dropdown-menu">
							<li><a href="login.do">로그인</a></li>
							<li><a href="join.do">회원가입</a></li>
						</ul>
					</li>
				</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>