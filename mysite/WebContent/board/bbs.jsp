<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
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
					<%
						ArrayList<BbsDto> list= (ArrayList<BbsDto>) request.getAttribute("list");
						for(int i=0; i<list.size(); i++){
					%>	
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="contentView.do?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
						
					
					<%
						}
					%>
					

				</tbody>
			</table>
			
			<%
				//현제 페이지가 첫 페이지가 아니면 이전 페이지 생성
				int pageNumber= (int) request.getAttribute("pageNumber");	
				if(pageNumber != 1){
			%>		
				<a href="bbs.do?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				}
				//다음페이지가 있으면 다음페이지 버튼 생성
				if((boolean) request.getAttribute("isNextPage")){
			%>
				<a href="bbs.do?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arrow-right">다음</a>
			<%
				}
			%>
			<a href="writeView.do" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	
</body>
</html>