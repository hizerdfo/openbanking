<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 관리</title>
<style>
    body {
        font-family: Arial, sans-serif;
    }
    
    h1 {
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }
    
    a {
        display: inline-block;
        margin-bottom: 10px;
        padding: 8px 16px;
        background-color: #f2f2f2;
        border-radius: 4px;
        text-decoration: none;
        color: #333;
        font-weight: bold;
    }
    
    a:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>
<h1>계좌관리</h1>

<!-- 거래내역 조회 select (구현 예정)-->
<a href="tradeSelect.jsp">거래내역 조회</a><br><br>        

<!-- 변경할 비밀번호 입력 받아서 그 값을 update 처리 -->
<a href="pwUpdateInput.bank">계좌 비밀번호 변경</a><br><br>     

<%
    String accPw = (String) request.getParameter("accPw");
    session.setAttribute("accPw", accPw);
    String accNum = (String) request.getParameter("accNum");
    session.setAttribute("accNum", accNum);
    String accName = (String) request.getParameter("accName");
    session.setAttribute("accName", accName);
    
    String accTypeName = (String) request.getParameter("accTypeName");
    session.setAttribute("accTypeName", accTypeName);
%>

<%
    if (accTypeName.equals("적금")) {
%>
<!--         <script>
            alert("상품 전환은 예금 상품만 가능합니다.");
        </script>
 -->
        
<%
    }
    else {
%>
        <!-- 상품 분류명, 계좌명 update -->
        <a href="accTransSelect.bank">다른 예금 상품으로 전환</a><br><br>
<%
    }
%>

<!-- 계좌 삭제 delete -->
<a href="accDeleteCheck.jsp">계좌 해지</a>

</body>
</html>
