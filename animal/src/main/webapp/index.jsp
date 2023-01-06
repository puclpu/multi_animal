<%@page import="com.multi.animal.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="total">	
	<div id="my">
		<jsp:include page="user/my.jsp"></jsp:include>
	</div>
	<a href="http://localhost:8081/animal/index.jsp" style="position: fixed;">
		<img alt="logo" src="resources/img/순양.png" width="100px;">
	</a>
	<div id = "top" style="height: 50px; display: inline-block; padding-left: 100px;">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="center">
	<h3>메인</h3>
	</div>
</div>
</body>
</html>