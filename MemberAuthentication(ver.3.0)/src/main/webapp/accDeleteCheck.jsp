<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계좌해지</h1>
<form action="pwCheckInput.bank" method="post">
  <p>다음의 경우 해지가 불가능 합니다.</p>
  <ul>
    <li>한도대출, 체크카드, 자동납부 연결계좌</li>
    <li>대출원리금 출금 계좌</li>
    <li>입출금 정지상태의 계좌</li>
    <li>모임통장 서비스 이용중인 계좌</li>
    <li>증권 계좌 개설 혹은 신분증 확인이 진행중인 계좌</li>
    <li>잔액이 남아있는 계좌</li>
  </ul>
  <input type="submit" value="확인">
</form>
</body>
</html>
