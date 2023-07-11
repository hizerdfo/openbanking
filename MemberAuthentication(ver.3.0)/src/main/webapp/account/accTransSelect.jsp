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
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .checkbox-cell {
            text-align: center;
            padding-right: 20px;
        }

        .name-cell {
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <h2>상품 선택</h2>
    변경하실 예금 상품을 선택해주세요.
    <br />
    <br />

    <form action="accTransOk.bank" method="post">
        <table>
            <thead>
                <tr>
                    <th class="name-cell">계좌 상품명</th>
                    <th class="checkbox-cell">선택</th>
                </tr>
            </thead>
            <tbody>
                <%
                String accName = (String) session.getAttribute("accName"); 
                AccountDAO dao = new AccountDAO(); 
                ArrayList<AccountDTO> dtoList = dao.accTransSelect(accName);

                for (AccountDTO dto : dtoList) {
                    String accName1 = dto.getAccName(); 
                %>
                
                <tr>
                    <td class="name-cell"><%=accName1%></td> 
                    <td class="checkbox-cell">
                        <input type="radio" name="selectedAccName" value="<%=accName1%>"> 
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <br>
        <input type="submit" value="변경">
    </form>
</body>
</html>
