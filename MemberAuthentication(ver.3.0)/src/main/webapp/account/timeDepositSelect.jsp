<%@page import="dataControl.account.dao.*"%>
<%@page import="dataControl.account.dto.*"%>
<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<style>

</style>
</head>
<body>
<jsp:include page="/include/mainHeader.jsp"></jsp:include>
	<div class ="container">
	<h1>상품 내역 확인</h1>
	<table class="custom-table">
		<tr>
			<th>상품코드</th>
			<th>상품분류</th>
			<th>상품이름</th>
			<th>가입</th>
		</tr>
		<%
		TimeDepositDAO dao = TimeDepositDAO.getInstance();
		ArrayList<TimeDepositDTO> dtoList = dao.timeDepositSelect();
/* 		String custId = (String) session.getAttribute("loggedInId"); */

		for (TimeDepositDTO dto : dtoList) {
			String timeDepositCode = dto.getAccCode();
			String timeDepositType = dto.getAccTypeName();
			String timeDepositName = dto.getAccName();
		%>
		<tr>
			<td><%=timeDepositCode%></td>
			<td><%=timeDepositType%></td>
			<td><%=timeDepositName%></td>
			<td>
				<form action="accJoinCheck.jsp" method="post">
					<input type="hidden" name="timeDepositCode"
						value="<%=timeDepositCode%>">
					<input type="hidden" name="timeDepositType"
						value="<%=timeDepositType%>">
					<input type="hidden" name="timeDepositName"
						value="<%=timeDepositName%>">
					<input type="submit" value="가입하기">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<br />
	<br />
	<button onclick="window.location.href='./Main.jsp'" class="custom-button">메인으로</button>
</div>

<jsp:include page="/include/mainFooter.jsp"></jsp:include>
</body>
</html>
