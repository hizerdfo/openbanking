<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.DAO"%>
<%@ page import="dataControl.DTO"%>
<!DOCTYPE html>
<html>
<head>

</head>
<header>

	<body>
		<h1>TH은행</h1>		
		Main Page 입니다.
		<%-- <%
		if (session.getAttribute("loggedIn") == null) { %>
			<a href="joinInput.bank">회원가입</a>
			<a href="loginInput.bank">로그인</a>
		  
		
		<% } --%>
		<%
		String id = (String) session.getAttribute("loggedInId");
		String name = (String) session.getAttribute("name");

		boolean loggedIn =
		        (session.getAttribute("loggedIn") != null && (boolean) session.getAttribute("loggedIn"));
		boolean isAdmin =
		        (session.getAttribute("isAdmin") != null && (boolean) session.getAttribute("isAdmin"));

		if (loggedIn) {
		    if (isAdmin) {
		out.println("관리자 " + name + "님 환영합니다.");
		        %>

		<li><a href="./admin/manageUser.jsp">회원관리</a></li>
		<li><a href="logout.jsp">로그아웃</a></li>
		<%
		} else {
			out.println(name + "님 환영합니다.");
		%>
		<li><a href="./user/showMyInfo.jsp">개인정보관리</a></li>
		<li><a href="./timeDepositSelect.bank">금융상품보기</a></li>
		<li><a href="./user/wirhdrawalRequest.jsp">회원탈퇴요청</a></li>
		<li><a href="logout.jsp">로그아웃</a></li>
		<%
		}
		%>
		<%
		}
		 else { %>
			<a href="joinInput.bank">회원가입</a>
			<a href="loginInput.bank">로그인</a>
		<% } %>
	</body>
</html>