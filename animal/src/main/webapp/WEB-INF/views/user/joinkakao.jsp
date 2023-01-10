<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function checkNull(){
		var frm = document.form1;
		
		if(!frm.name.value) {
			alert("이름을 입력하세요");
			return false;
		}

		if(!frm.phone.value) {
			alert("전화번호를 입력하세요");
			return false;
		}

		if(!frm.add1.value) {
			alert("주소를 입력하세요");
			return false;
		}
	}
</script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#total {
	width: 100%;
	height: 100%;
}

#center {
	width: 500px;
	height: 500px;
	margin: 0 auto;
	margin-top: 50px;
}

table {
	text-align: center;
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
			<form action="join" name="form1" onsubmit="return checkNull();">
				<table class="table table-borderless">
					<tr>
						<td>아이디</td>
						<td><input value="${userId }" readonly="readonly"
							name="userId"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" value="${name }" name="name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" placeholder="010-1234-5678"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" id="address" placeholder="주소" name="add1">
							<input type="button" onclick="execDaumPostcode()" value="검색">
							<br><input type="text"
							id="detailAddress" placeholder="상세주소" name="add2">
							<input type="hidden" id="sigungu" name="sigungu">
							<input type="hidden" id="sigunguCode" name="sigunguCode">
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script>
								function execDaumPostcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var addr = ''; // 주소 변수
													var sigungu = ' '; //시군구 변수

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													sigungu = data.sigungu;
													sigunguCode = data.sigunguCode;

													// 시군구 정보를 해당 필드에 넣는다.
													document.getElementById("sigungu").value = sigungu;
													document.getElementById("sigunguCode").value = sigunguCode;
													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document.getElementById("address").value = addr;
													// 커서를 상세주소 필드로 이동한다.
													document.getElementById(
															"detailAddress")
															.focus();
												}
										}).open();
								}
							</script></td>
					</tr>
					<tr><td colspan="2"><button class="btn btn-light">가입</button></td></tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>