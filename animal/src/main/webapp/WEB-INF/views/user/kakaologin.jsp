<%@page import="com.multi.animal.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO vo = (UserVO)request.getAttribute("vo");
	session.setAttribute("userId", vo.getUserId());
	session.setAttribute("name", vo.getName());
	response.sendRedirect("index.jsp");
%>