<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none; color:#333;}
.menu:after{display:block; content:''; clear:both;}
.menu > li{position:relative; float:left; margin-right:50px;}
.menu > li > a{display:block; padding: 15px; background:#333; height:40px; line-height:40px;}
.menu > li:hover .depth_1 {display:block;}
.menu .depth_1{display:none; position:absolute; left:0; right:0; text-align:center; width: 80px;}
.menu .depth_1 a{display:block; padding:5px; background:#666; color:#fff;}
.my{
	font-size: 10px;
	float: right;
	padding : 5px;
}
.my > ul {list-style: none;}
.my > li {padding : 10px;}
#nav{
	padding-left: 150px;
	padding-top: 20px;
}
</style>
</head>
<body>
	<div id="nav">
		<ul class="menu">
			<li>보호소</li>
			<li><span> 시터 </span>
				<ul class="depth_1">
					<li><a href="http://localhost:8081/animal/sitter/sitterSearch.jsp">시터 신청</a></li>
					<li><a href="http://localhost:8081/animal/sitter/sitterInsert.jsp">시터 구인</a></li>
				</ul></li>
			<li>병원</li>
			<li>실종/보호</li>
			<li>마켓</li>
		</ul>
	</div>
</body>
</html>