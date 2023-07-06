<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kr.co.tlf.ex.dao.MBDao"%>
<%@ page import="kr.co.tlf.ex.dto.MBDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보</title>
<style>
    body {
      font-family: 'Hana', Arial, sans-serif;
    }

    h2 {
      color: #333;
      text-align: center;
    }

    .container {
      margin-top: 20px;
      text-align: center;
    }

    .user-box {
      display: inline-block;
      width: 400px;
      margin: 20px;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 4px;
      background-color: #f5f5f5;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .user-info {
      text-align: center;
      margin-bottom: 10px;
    }

    .user-input {
      margin-bottom: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .user-input strong {
      width: 100px;
      margin-bottom: 5px;
      text-align: center;
    }

    .user-input input[type="text"] {
      width: 200px;
      padding: 6px;
      border: none;
      border-radius: 4px;
      background-color: #ffffff;
      text-align: center;
    }

    .user-button {
      margin-top: 20px;
    }

    .back-link {
      display: flex;
      justify-content: center;
      margin-top: 20px;
      text-align: center;
      color: #888;
      text-decoration: none;
    }

    .back-link button {
      width: 200px;
      padding: 8px;
      border: none;
      background-color: pink;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }

    .back-link button:hover {
      background-color: #ff6b9b;
    }
</style>
</head>
<body>
  <div class="container">
    <h2>유저정보조회</h2>
    <%
    String memberId = (String) session.getAttribute("loggedInId");
        MBDao memberDAO = new MBDao();
        ArrayList<MBDto> members = memberDAO.getLoggedInMember(memberId);
        for (MBDto member : members) {
          if (member.getStatus().equals("정상")) { // Only output if the role is not "관리자"
    %>
    <div class="user-box">
      <div class="user-info">
        <div class="user-input">
          <strong>ID</strong>
          <input type="text" value="<%= member.getId() %>" readonly>
        </div>
        <div class="user-input">
          <strong>Password</strong>
          <input type="text" value="<%= member.getPassword() %>" readonly>
        </div>
        <div class="user-input">
          <strong>Name</strong>
          <input type="text" value="<%= member.getName() %>" readonly>
        </div>
        <div class="user-input">
          <strong>Contact</strong>
          <input type="text" value="<%= member.getPhoneNumber() %>" readonly>
        </div>
        <div class="user-input">
          <strong>Email</strong>
          <input type="text" value="<%= member.getEmail() %>" readonly>
        </div>
      </div>
      <div>
        <button onclick="manageMyInfoInput('<%= member.getId() %>')" style="font-family: 'Hana'; background-color: pink;">수정하기</button>
      </div>
    </div>
    <% 
      }
    } 
    %>
    <div class="back-link">
      <button onclick="location.href='../Main.jsp'" style="font-family: 'Hana'; background-color: pink;">메인페이지로 이동하기</button>
    </div>
  </div>
  <script>
    function manageMyInfoInput(id) {
      window.location.href = "manageMyInfoInput.jsp";
    }
  </script>
</body>
</html>
 --%>