<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<!DOCTYPE html>
<html>
<head>
<title>TH은행</title>
<link rel="stylesheet" href="static/css/styles.css">
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');  
</style>
</head>
	<body>
		<div id="header">
        <div id="main-text">
            TH은행
        </div>
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
		out.println("TH은행 관리자 페이지");
		        %>

		<li><a href="./manageAdmin.bankadmin">회원관리</a></li>
		<li><a href="./logout.bank">로그아웃</a></li>
		<%
		} else {
			out.println(name + "(" + id + ")" + "님 환영합니다.");
		%>
		<div class="button-user-container"> <!-- 버튼 컨테이너로 감싸줍니다. -->
                    <button class="button1" onclick="location.href='./checkMemberById.bank'">개인정보관리</button>
                    <button class="button1" onclick="location.href='./timeDepositSelect.bank'">금융상품보기</button>
                    <button class="button1" onclick="location.href='./accountSelect.bank'">조회</button>
                    <button class="button1" onclick="location.href='./transfer.bank'">이체</button>
                    <button class="button2" onclick="location.href='./logout.bank'">로그아웃</button>
        </div>
		<%
		}
		%>
		<%
		}
		 else { %>
			 <div class="menu">
                    <a href="joinInput.bank">회원가입</a>
                    <a href="loginInput.bank">로그인</a>
              </div>
		<% } %>
	</div>
    <div id ="main_wrap">
    <div id="main_color">
    	<div id = "main_content">
	    	<h3>TH뱅크 기록통장 첫번째 서비스</h3>
	    	<h1>사랑하는 만큼,</h1>
	    	
	    	<div id="image-container">
	    	<h1>TH적금</h1>
			    <img src="static/img/main_icon_bank.png">
			</div>
			<br>
	        <p>사랑하는 대상과의 의미있는 순간마다</p>
	        <p> 규칙을 정해서 돈을 모을 수 있어요.</p>
	        <br><br>
	        <div id="button-container">
	        <a href="#" class="button">고객센터</a>
	        <a href="#" class="button">이벤트</a>
	    	</div>
    	</div>
    	<div id= "main-recommand">
    		<div id ="recommand1">
    		<p>추천1</p>
    		</div>
    		<div id ="recommand2">
    		<p>추천2</p>
    		</div>
    	</div>
    </div>
    <div id="terms">
    	<p>이용약관 | 위치정보 이용약관 | 개인정보처리방침 | 운영정책 | 공지사항 | 사이버윤리실 | Contact Us </p>
		<p>© Kakao Corp. All rights reserved.</p>
    </div>
    </div>
</body>
</html>