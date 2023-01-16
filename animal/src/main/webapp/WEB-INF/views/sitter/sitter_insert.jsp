<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/sittercss.css">
<style type="text/css">
span{
	padding-left: 25px;
}
h5{
	padding: 10px;
}
</style>
</head>
<body>
<div id = "total">
	<a href="http://localhost:8081/animal/index.jsp" style="position: fixed;">
		<img alt="logo" src="../resources/img/순양.png" width="100px;">
	</a>
	<div id = "top" style="height: 50px; display: inline-block; padding-left: 100px;">
		<jsp:include page="../../../top.jsp"></jsp:include>
	</div>
	<div id="center">
		<h5>시터 구인 등록이 완료되었습니다.</h5>
		<a href="sitterSearch.jsp"><button class="btn btn-outline-secondary">검색하기</button></a>
		<span><a href="sitterInsert.jsp"><button class="btn btn-outline-secondary">구인등록</button></a></span>
	</div> <!-- center -->
</div> <!-- total -->

</body>
</html>