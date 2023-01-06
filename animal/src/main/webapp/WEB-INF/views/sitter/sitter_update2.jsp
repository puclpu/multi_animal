<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width:500px;
    height:500px;
    margin:0 auto;
    margin-top: 90px;
    text-align: center;
}
span{
	padding-left: 25px;
}
h5{
	padding: 10px;
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
		<h5>시터 구인 수정이 완료되었습니다.</h5>
		<a href="sitterList"><button class="btn btn-outline-secondary">목록보기</button></a>
		<span><a href="sitterInsert.jsp"><button class="btn btn-outline-secondary">구인등록</button></a></span>
	</div> <!-- center -->
</div> <!-- total -->
</body>
</html>