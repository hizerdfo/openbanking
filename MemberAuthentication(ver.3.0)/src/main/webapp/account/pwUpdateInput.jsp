<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>비밀번호 수정</h2>
수정 비밀번호를 입력해주세요! <br/><br/>
<form action="pwUpdateOk.bank" method="post">
<%
	String accPw = (String) session.getAttribute("accPw");

%>

비밀번호: <input type="password" id="password" name="password" placeholder="기존 비밀번호 = <%=accPw%>">


 
<input type="submit" value="수정">
</form>
</body>
</html>