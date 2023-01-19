<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../resources/css/medical.css">
<div id="medicalHeader">
   <a class="medical-logo" href="../index.jsp"><img src="../resources/img/순양.png"></a>
   
   <div class="medical-menu-wrap">
      <nav class="medical-menu-list">
         <a class="medical-menu-item" href="adopt/adopt_main.jsp">보호소</a> 
         <a class="medical-menu-item" href="sitter/sitterSearch.jsp">시터</a>
         <a class="medical-menu-item" href="medical/medical.jsp">병원</a> 
         <a class="medical-menu-item" href="missingBoard/missingBoard.jsp">실종/보호</a> 
         <a class="medical-menu-item" href="market/marketHome.jsp">마켓</a>
      </nav>
      <!-- <button onclick="location.href='user/my.jsp'" class="medical-login-btn">로그인</button> -->
   </div>
   
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
</div>