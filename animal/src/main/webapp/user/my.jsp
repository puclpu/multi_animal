<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#my {
		font-size: 10px;
		float: right;
	}
	ul{
		list-style: none;
	}
	li{
		padding : 10px;
	}
</style>
</head>
<body>
<div id="my">
	<%if(session.getAttribute("name") != null) {%>
		<ul>
			<li><a href="logout">로그아웃</a></li>
			<li><%=session.getAttribute("name") %>님</li>
		</ul>
	<%} else {%>
		<a href="/animal/user/login.jsp">로그인</a>
	<%} %>
</div>
</body>
</html>