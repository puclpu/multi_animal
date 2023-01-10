<%@page import="com.multi.animal.sitter.SitterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	SitterVO vo = (SitterVO)request.getAttribute("vo");
    	String userId = vo.getUserId();
    	System.out.println(userId);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
#total {
    width:100%;
    height:100%;
    background:#000;
}
#center {
	width:680px;
    height:500px;
    margin:0 auto;
    margin-top: 90px;
}
.text, .comment{
	padding-left: 10px;
}
.text{
	height: 30px;
}
#btn{
	padding-top: 20px;
	text-align: right;
}
</style>
</head>
<body>
<div class = "total">
	<a href="http://localhost:8081/animal/index.jsp" style="position: fixed;">
		<img alt="logo" src="../resources/img/순양.png" width="100px;">
	</a>
	<div id = "top" style="height: 50px; display: inline-block; padding-left: 100px;">
		<jsp:include page="../../../top.jsp"></jsp:include>
	</div>
	<div id="center">
		<table>
			<tr>
				<td rowspan="5"><img src="../resources/img/${vo.img }" width="300"></td>
				<td style="font-weight: bold;" class="text">[${vo.reserve }]</td>
			</tr>
			<tr><td class="text">${vo.species }<td></tr>
			<tr><td class="text">${vo.care }<td></tr>
			<tr><td class="text">${vo.date }<td></tr>
			<tr><td class="comment">${vo.comment }<td></tr>
			
		</table>
		<%if (session.getAttribute("userId") == userId) { %>
		<div id="btn">
			<a href="sitter_update1?sitterId=${vo.sitterId }">
				<button class="btn btn-outline-secondary">수정</button>
			</a>
			<a href="sitter_delete?sitterId=${vo.sitterId }">
				<button class="btn btn-outline-secondary">삭제</button>
			</a>
		</div>
		<% }%>
	</div> <!-- center -->
</div> <!-- total -->

</body>
</html>