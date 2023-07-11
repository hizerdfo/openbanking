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
<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
<%
    String name = (String) session.getAttribute("name");
%>

<h1>조회</h1>
<%
    out.println(name + " 고객님");
%>
<br/>
<%
    String custId = (String) session.getAttribute("loggedInId");
    TimeDepositDAO dao = TimeDepositDAO.getInstance();
    ArrayList<TimeDepositDTO> dtoList = dao.accountCheck(custId);
    int dtoListSize = dtoList.size(); // dtoList의 개수 저장
    
    out.println("총 1개 금융기관에 "+ dtoListSize +"개의 계좌가 등록되어 있습니다.");
%>
<br/><br/>

<h2>보유계좌목록</h2>
<table>
    <tr>
        <th>상품분류</th>
        <th>계좌명</th>
        <th>계좌번호</th>
        <th>잔액</th>
        <th>관리</th>
    </tr>

    <%
    for (TimeDepositDTO dto : dtoList) {
        String accTypeName = dto.getAccTypeName();
        String accName = dto.getAccName();
        String accNum = dto.getAccNum();
        String accBalance = String.valueOf(dto.getAccBalance());
        String accPw = dto.getAccPw();
%>
  
    <tr>
        <td><%= accTypeName %></td>
        <td><%= accName %></td>
        <td><%= accNum %></td>
        <td><%= accBalance %></td>
        
        <td>
            <form action="accountManage.bank" method="post">
                <input type="hidden" name="accTypeName" value="<%= accTypeName %>">
                <input type="hidden" name="accName" value="<%= accName %>">
                <input type="hidden" name="accNum" value="<%= accNum %>">
                <input type="hidden" name="accBalance" value="<%= accBalance %>">
                <input type="hidden" name="accPw" id="accPw" value="<%= accPw %>">
                
                <input type="submit" value="계좌관리">
            </form>
        </td>
    </tr>

    <%
    }
    %>
</table>
<br/><br/>
<button onclick="window.location.href='./Main.jsp'">메인으로 돌아가기</button>

</body>
</html>
