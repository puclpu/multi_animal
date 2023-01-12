<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="../resources/js/stomp.js"></script>
<script type="text/javascript"
	src="../resources/js/webSocketSendToUserApp.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script> -->
<script type="text/javascript">
	var stompClient = null;

	//css 담당 함수
	function setConnected(connected) { //연결 여부에 따라 설정 
		//document.getElementById('disconnect').disabled = !connected;
		document.getElementById('conversationDiv').style.visibility = connected ? 'visible'
				: 'hidden';
		//$('#response').html('')와 동일한 코드 
		document.getElementById('response').innerHTML = '';
	}

	//서버로 연결함. 
	function connect() {
		//1.소켓 객체 생성
		var socket = new SockJS('${pageContext.request.contextPath}/chat');
		//2.데이터를 전송하고, 받을 수 있는 stompClent 객체 생성
		stompClient = Stomp.over(socket);
		//3.채팅방 지정하여 가입
		stompClient.connect({}, function(frame) {
			setConnected(true); //css설정
			alert('연결됨.' + frame)
			//가입
			//가입할 채팅방 이름, 닫을 때 어떻게 처리할 지 
			stompClient.subscribe('/topic/messages', function(messageOutput) {
				//서버에서 받은 메시지 출력 
				showMessageOutput(JSON.parse(messageOutput.body));
			});
		});
		//4.서버에서 보냈을 때 어떻게 처리할지 지

		/* //chat주소 서버와의 소켓객체 생성
		var socket = new SockJS('${pageContext.request.contextPath}/chat');
		//소켓을 통해 클라이언트 객체 획득 
		stompClient = Stomp.over(socket);
		//소켓 클라이언트를 통해 연결 획득 
		stompClient.connect({}, function(frame) {
			setConnected(true); //연결 설정 
			console.log('Connected: ' + frame);
			//소켓 클라이언트를 통해 챗팅하고 싶은 특정 사이트에 연결 
			//messageOutput : 받은 메시지
			//topic/messages로 가입한 클라이언트에게 messageOutput을 보냄.
			//@SendTo("/topic/messages")와 동일해야함.
			//config.enableSimpleBroker("/topic");와 동일해야함.
			stompClient.subscribe('/topic/messages',
					function(messageOutput) {
						//서버에서 받은 메시지 출력 
						showMessageOutput(JSON.parse(messageOutput.body));
					});
		}); */
	}

	//서버로 연결 끊음. 
	function disconnect() {
		if (stompClient != null) {
			stompClient.disconnect();
		}
		setConnected(false); //연결끊어졌을 때 설정 변경 
		console.log("Disconnected");
	}

	//서버로 메세지 보냄 
	function sendMessage() {
		//입력한 정보를 가지고 와서 
		var from = "<%=session.getAttribute("userId")%>";
		var text = document.getElementById('text').value;
		//url을 /app/cht을 호출하고,data를 json형태의 sring으로 만들어서 보내라. 
		stompClient.send("/app/chat", {}, JSON.stringify({
			'from' : from,
			'text' : text
		}));
		
		var p = document.createElement('p');
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(text));
		response.appendChild(p);
		document.getElementById('text').innerHTML = '';
	}

	//받은 데이터를 원하는 위치에 넣음. ==> 받은 데이터를 채팅목록으로 쌓는다
	function showMessageOutput(messageOutput) {
		var response = document.getElementById('response');
		var p = document.createElement('p');
		p.style.wordWrap = 'break-word';
		p.appendChild(document.createTextNode(messageOutput.menu));
		response.appendChild(p);
		document.getElementById('text').innerHTML = '';
	}
</script>
</head>
<body onload="connect();">
	<div id="total">
		<div id="center">
			<div>안녕하세요!<br>0) 챗봇 사용하기</div>
			<br>
			<div id="response">
			
			</div>
			<div id="conversationDiv">
				<table>
					<tr>
						<td><input type="text" id="text" style="width: 400px; background: yellow"></td>
						<td><button id="sendMessage" onclick="sendMessage();">Send</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>