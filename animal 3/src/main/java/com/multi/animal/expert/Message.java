package com.multi.animal.expert;

public class Message {

	private String from;
	private String text;

	public Message() {
		super();
		// 부모클래스인 object()를 먼저 호출하여 먼저 객체를 만들어라!
		
	}

	public Message(String from, String text) {
		super();
		this.from = from;
		this.text = text;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return "Message [from=" + from + ", text=" + text + "]";
	}

	// getters and setters

}
