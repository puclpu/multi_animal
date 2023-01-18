<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://business.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	//request.setCharacterEncoding("UTF-8"); //해당시스템의 인코딩타입이 UTF-8일 경우
	//request.setCharacterEncoding("EUC-KR"); //해당시스템의 인코딩타입이 EUC-KR일 경우
	//한글이 깨지는 경우 주석 제거
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String engAddr = request.getParameter("engAddr");
	String jibunAddr = request.getParameter("jibunAddr");
	String admCd = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn = request.getParameter("bdMgtSn");
	String detBdNmList = request.getParameter("detBdNmList");
	String bdNm = request.getParameter("bdNm");
	String bdKdcd = request.getParameter("bdKdcd");
	String siNm = request.getParameter("siNm");
	String sggNm = request.getParameter("sggNm");
	String emdNm = request.getParameter("emdNm");
	String liNm = request.getParameter("liNm");
	String rn = request.getParameter("rn");
	String udrtYn = request.getParameter("udrtYn");
	String buldMnnm = request.getParameter("buldMnnm");
	String buldSlno = request.getParameter("buldSlno");
	String mtYn = request.getParameter("mtYn");
	String lnbrMnnm = request.getParameter("lnbrMnnm");
	String lnbrSlno = request.getParameter("lnbrSlno");
	String emdNo = request.getParameter("emdNo");
%>
</head>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. 
// ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
// document.domain = "abc.go.kr";
function init(){
var url = location.href;
var confmKey = "U01TX0FVVEgyMDIyMTIyMzE3NDgzMDExMzM3MTQ="; // 연계신청시 부여받은 승인키 입력(테스트용 승인키 : TESTJUSOGOKR)
var resultType = "1"; // 도로명주소 검색결과 화면 출력유형, 
 // 1 : 도로명, 2 : 도로명+지번
var inputYn= "<%=inputYn%>";
if(inputYn != "Y"){
 document.form.confmKey.value = confmKey;
 document.form.returnUrl.value = url;
 document.form.resultType.value = resultType;
 document.form.action="https://business.juso.go.kr/addrlink/addrMapUrl.do"; //인터넷망(행정망의 경우 별도 문의)
 document.form.submit();
}else{
opener.jusoCallBack("<%=roadFullAddr%>","<%=engAddr%>","<%=jibunAddr%>","<%=admCd%>","<%=rnMgtSn%>","<%=bdMgtSn%>", "<%=detBdNmList%>","<%=bdNm%>","<%=bdKdcd%>", "<%=siNm%>","<%=sggNm%>","<%=emdNm%>", "<%=liNm%>","<%=rn%>","<%=udrtYn%>","<%=buldMnnm%>","<%=buldSlno%>","<%=mtYn%>", "<%=lnbrMnnm%>","<%=lnbrSlno%>","<%=emdNo%>");
window.close();
		}
	}
</script>
<body onload="init()">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value="" /> <input
			type="hidden" id="returnUrl" name="returnUrl" value="" /> <input
			type="hidden" id="resultType" name="resultType" value="" />
		<!– 기본 인코딩 타입은 UTF-8임. 해당시스템의 인코딩타입이 EUC-KR일 경우 아래 내용 추가-->
		<!-- <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/> -->
	</form>
</body>
</html>