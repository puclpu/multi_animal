<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/sittercss.css">
<style type="text/css">
#total {
    width:100%;
    position: relative;
}
*{margin:0; padding:0;}
ul{list-style:none;}
a{text-decoration:none; color:#333;}
.wrap{padding:15px; letter-spacing:-0.5px;}
.tab_menu{
	/* position:relative;
    height:300px;
     */
    width:500px;
    height:300px;
    margin:0 auto;
    margin-top: 50px;
	}
.tab_menu .list{overflow:hidden;}
.tab_menu .list li{float:left; margin-right:14px;}
.tab_menu .list .btn{font-size:28px;}
.tab_menu .list .cont{display:none; position:absolute; top:60px; left:0; background:#555; color:#fff; text-align:center; width:500px; height:220px; }
.tab_menu .list li.is_on .btn{font-weight:bold; color:gray;}
.tab_menu .list li.is_on .cont{display:block;}

form{
	position:relative;
	width: 380px;
	height: 160px;
	margin:0 auto;
	margin-top: 60px;
} 
</style>
</head>
<body>
<div class="total">
	<a href="http://localhost:8081/animal/index.jsp" style="position: fixed;">
		<img alt="logo" src="../resources/img/순양.png" width="100px;">
	</a>
	<div id = "top" style="height: 50px; display: inline-block; padding-left: 100px;">
		<jsp:include page="../top.jsp"></jsp:include>
	</div>
	<div class="tab_menu">
		<ul class="list">
			<li class="is_on"><a href="#tab1" class="btn">강아지</a>
				<div id="tab1" class="cont">
					<form action="sitter_search">
						<input type="hidden" name="species" value="강아지">
						<input type="hidden" name="page" value="1">
						<select name="care" class="form-control">
							<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
							<option value="산책 돌봄 (30분)">산책 돌봄 (30분)
						</select> <br> 
						<input type="date" name="date"	class="currentDate" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
						<script>
						document.getElementsByClassName('currentDate')[0].value = new Date().toISOString().substring(0, 10);
						</script>
						<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
						<button class="btn btn-dark">검색</button>
					</form>
				</div> <!-- tab1 --></li>
			<li><a href="#tab2" class="btn">고양이</a>
				<div id="tab2" class="cont">
					<form action="sitter_search">
						<input type="hidden" name="species" value="고양이">
						<input type="hidden" name="page" value="1">
						<select name="care" class="form-control">
							<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
						</select> <br> 
						<input type="date" name="date" class="currentDate" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
						<script>
						document.getElementsByClassName('currentDate')[1].value = new Date().toISOString().substring(0, 10);
						</script> 
						<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
						<button class="btn btn-dark">검색</button>
					</form>
				</div> <!-- tab2 --></li>
			<li><a href="#tab3" class="btn">기타</a>
				<div id="tab3" class="cont">
					<form action="sitter_search">
						<input type="hidden" name="species" value="기타">
						<input type="hidden" name="page" value="1">
						<select name="care" class="form-control">
							<option value="방문 돌봄 (30분)">방문 돌봄 (30분)
						</select> <br>
						<input type="date" name="date" class="currentDate" min="2022-12-24" max="2023-12-31" class="form-control form-control"> <br> <br>
						<script>
						document.getElementsByClassName('currentDate')[2].value = new Date().toISOString().substring(0, 10);
						</script> 
						<input type="hidden" name="searcher" value="<%=session.getAttribute("userId") %>">
						<button class="btn btn-dark">검색</button>
					</form>
				</div> <!-- tab3 -->
			</li>
		</ul>
	</div> <!-- tab menu -->
	<div id="sChatbot">
		<a href="sitterChatbot.jsp">
			<button>챗봇</button>
		</a>
	</div> <!-- chatbot -->
	<div class="alert alert-success alert-dismissible fade show" style="position: absolute; bottom: 0; margin: 0 auto;">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>참고!</strong> 시터 검색은 <%=session.getAttribute("name") %>님의 주소 정보를 기반으로 결과를 제공합니다.
	</div> <!-- alert -->
</div> <!-- total -->

	<script>
	const tabList = document.querySelectorAll('.tab_menu .list li');
	for(var i = 0; i < tabList.length; i++){
	  tabList[i].querySelector('.btn').addEventListener('click', function(e){
	    e.preventDefault();
	    for(var j = 0; j < tabList.length; j++){
	      tabList[j].classList.remove('is_on');
	    }
	    this.parentNode.classList.add('is_on');
	  });
	}
	</script>
</body>
</html>