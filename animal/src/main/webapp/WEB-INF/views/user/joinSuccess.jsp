<%@page import="com.multi.animal.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	UserVO vo = (UserVO)request.getAttribute("vo");
 	String userId = vo.getUserId();
 	String name = vo.getName();
 	session.setAttribute("userId", userId);
 	session.setAttribute("name", name);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#total {
    width:100%;
    height:100%;
}
#center {
	width:680px;
    height:500px;
    margin:0 auto;
    margin-top: 90px;
}
</style>
</head>
<body>
	<div id="total">
		<a href="http://localhost:8081/animal/index.jsp"> <img alt="logo"
			src="../resources/img/순양.png" width="100px;">
		</a>
		<div id="top" style="height: 50px; display: inline-block;">
			<jsp:include page="../../../top.jsp"></jsp:include>
		</div>
		<div id="center">
			<h3>환영합니다.</h3>
			<h3>회원가입이 완료되었습니다.</h3>
		</div> <!-- center -->
	</div> <!-- total -->
</body>
</html>