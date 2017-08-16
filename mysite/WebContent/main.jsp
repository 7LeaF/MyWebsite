<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	<jsp:include page= "layout/header.jsp" />

	<div class= "container">
		<div class="jumbotron">
	 		<div class="container">
	 			<h1>웹 사이트 소개</h1>
	 			<p> 웹 사이트 프로토 타입 </p>
	 			<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
	 		</div>
		</div>
	</div>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="resources/images/1.jpg">
				</div>
				<div class="item">
					<img src="resources/images/2.jpg">
				</div>
				<div class="item">
					<img src="resources/images/3.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

</body>
</html>