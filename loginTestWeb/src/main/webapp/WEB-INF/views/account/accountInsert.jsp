<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String timeDepositCode = request.getParameter("timeDepositCode");
	String timeDepositType = request.getParameter("timeDepositType");
	String timeDepositName = request.getParameter("timeDepositName");

%>
	<h2>상품 가입</h2>
	아래 항목을 기입해주세요 <br/><br/>
	<form action="insertAccount.bank" method="post">
		
		상품코드: <input type="text"	name="accCode" id="accCode" value="<%= timeDepositCode %>"> <br/>
		상품분류: <input type="text"	name="accTypeName" id="accTypeName" value="<%= timeDepositType %>"><br/>
		상품이름: <input type="text"	name="accName" id="accName" value="<%= timeDepositName %>"><br/>
		계좌비밀번호: <input type="password" name="password" id="password"> <br/>
		계좌별칭: <input type="text"	name="accNickName" id="accNickName"> <br/><br/>
		
		<input type="submit" value="계좌생성">
	</form>	
</body>
</html>

