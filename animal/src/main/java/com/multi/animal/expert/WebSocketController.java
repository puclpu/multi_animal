package com.multi.animal.expert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {
	
	@Autowired
	ExpertService es;
	
	@MessageMapping("/chat")
	@SendTo("/topic/messages")
	public OutputMessage2 send2(Message message, ExpertVO expertvo) {
		String menu = "";
		switch (message.getText()) {
		case "0":
			menu = "1) 전문시터등록		2) 전문시터추천";
			break;
		case "1":
			menu = "다른 이용자에게 회원님의 개인정보를 제공, 추천하는 것에 동의하시나요?"
					+ "10) 예	0)아니요";
			break;
		case "10":
			menu = "다른 회원에게 어떤 전문 시터로 추천되고 싶으신가요? \n" +
						"11) 강아지전문시터		12)고양이전문시터	0)처음으로 돌아가기";
			break;
		case "11":
			menu = "강아지전문시터를 선택하셨습니다. 돌봄을 골라주세요."
					+ "111) 강아지 산책 전문 시터		112) 강아지 방문 전문 시터	0)처음으로 돌아가기";
			break;
		case "111":
			// mongodb에 {species : 강아지, care : 산책, userId : userId} insert
			expertvo.setSpecies("강아지");
			expertvo.setCare("산책");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "강아지산책전문시터로 등록되셨습니다.\n"
					+ "0) 처음으로 돌아가기";
			break;
		case "112":
			// mongodb에 {species : 강아지, care : 방문, userId : userId} insert
			expertvo.setSpecies("강아지");
			expertvo.setCare("방문");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "강아지방문전문시터로 등록되셨습니다.\n"
					+ "0) 처음으로 돌아가기";
			break;
		case "12":
			// mongodb에 {species : 고양이, userId : userId} insert
			expertvo.setSpecies("고양이");
			expertvo.setUserId(message.getFrom());
			es.insert(expertvo);
			
			menu = "고양이전문시터로 등록되셨습니다.\n"
					+ "0) 처음으로 돌아가기";
			break;
		case "2":
			menu = "아직 개발중인 메뉴입니다."
					+ "0) 처음으로 돌아가기";
			break;
		default:
			menu = "챗 봇>>선택한 번호는 없는 메뉴입니다. 다시 입력해주세요.";
			break;
		}
		OutputMessage2 outputmessage2 = new OutputMessage2(menu);
		return outputmessage2;
	}
}
