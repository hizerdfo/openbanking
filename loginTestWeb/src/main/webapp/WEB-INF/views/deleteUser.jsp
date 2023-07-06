<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.tlf.ex.dao.MBDao"%>
<%@ page import="kr.co.tlf.ex.dto.MBDto"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 관리 페이지</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      padding: 20px;
    }

    h1 {
      text-align: center;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th, table td {
      padding: 10px;
      border: 1px solid #ccc;
    }

    button {
      width: 100px;
      padding: 6px;
      border: none;
      background-color: #555;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }

    button:hover {
      background-color: #333;
    }
  </style>
</head>
<body>
  <h1>회원 관리 페이지</h1>

  유저 정보 조회
  <h2>유저 정보 조회</h2>
  <table>
    <tr>
      <th>ID</th>
      <th>Password</th>
      <th>Name</th>
      <th>Contact</th>
      <th>Email</th>
      <th>Status</th>
      <th>Role</th>
      <th></th>
    </tr>
    <%
    MBDao memberDAO = new MBDao();
        ArrayList<MBDto> members = memberDAO.memberSelect();
        for (MBDto member : members) {
          if (!member.getRole().equals("관리자") && member.getStatus().equals("일시정지")) { // role이 "관리자"가 아닌 경우에만 출력
    %>
      <tr>
        <td><%= member.getId() %></td>
        <td><%= member.getPassword() %></td>
        <td><%= member.getName() %></td>
        <td><%= member.getPhoneNumber() %></td>
        <td><%= member.getEmail() %></td>
        <td><%= member.getStatus() %></td>
        <td><%= member.getRole() %></td>
        <td><button onclick="editMember('<%= member.getId() %>')">Edit</button></td>
      </tr>
    <% 
      }
    } 
    %>
  </table>

  <script>
    function editMember(id) {
      window.location.href = "editMemberInput.jsp?id=" + id;
    }
  </script>
</body>
</html>
 --%>