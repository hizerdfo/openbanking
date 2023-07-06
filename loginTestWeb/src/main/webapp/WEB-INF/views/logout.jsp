<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	margin-top: 0;
}

li {
	margin-bottom: 10px;
}

a {
	color: #333;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

button {
	width: 200px;
	padding: 8px;
	border: none;
	background-color: #555;
	color: #fff;
	cursor: pointer;
	border-radius: 4px;
	margin: 0 auto;
	display: block;
}

button:hover {
	background-color: #333;
}
</style>
</head>
<body>
	<div class="container">
		<% session.invalidate(); %>
		<h1>로그아웃되었습니다.</h1>
		<ul>
			<button onclick="location.href='Main.jsp'">메인 페이지로 이동</button>
		</ul>
	</div>
</body>
</html>
