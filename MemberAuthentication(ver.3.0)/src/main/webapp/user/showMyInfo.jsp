<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dataControl.about.member.DAO"%>
<%@ page import="dataControl.about.member.DTO"%>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="static/css/styles.css">
<meta charset="UTF-8">
<title>유저정보</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
 
    body {
      font-family: 'NanumSquareRound', sans-serif;
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
      color: #6610f2;
      text-decoration: none;
    }

    .back-link button {
      width: 200px;
      padding: 8px;
      border: none;
      background-color: #6610f2;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }
	.back-link button {
      width: 200px;
      padding: 8px;
      border: none;
      background-color: #6610f2;
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
	<div id = first-header>
		<div id="main-text">
		    TH은행
		</div>
		<div class="first-header-container">
		                    <button class="header-button1" onclick="location.href='./checkMemberById.bank'">개인정보관리</button>
		                    <button class="header-button1" onclick="location.href='./timeDepositSelect.bank'">금융상품보기</button>
		                    <button class="header-button1" onclick="location.href='./accountSelect.bank'">조회</button>
		                    <button class="header-button1" onclick="location.href='./transfer.bank'">이체</button>
		                    <button class="header-button2" onclick="location.href='./logout.bank'">로그아웃</button>
		</div>
	</div>
	<br>
	<hr>
  <div class="container">
    <h1>유저정보조회</h1>
    
    <%	
    	String id;
		boolean isAdmin = (boolean) session.getAttribute("isAdmin");
    	if (!isAdmin) {
    	    id = (String) session.getAttribute("loggedInId");    
    	} else {
    	    id = (String) session.getAttribute("userId");
    	}
    	
        DAO dao = DAO.getInstance();
        DTO dto = dao.checkMemberById(id);        

        session.setAttribute("name", dto.getName());
        session.setAttribute("phoneNum", dto.getPhoneNum());
        session.setAttribute("email", dto.getEmail());
        session.setAttribute("postalCode", dto.getPostalCode());
        session.setAttribute("address", dto.getAddress());
        session.setAttribute("jibunAddress", dto.getJibunAddress());
        session.setAttribute("detailAddress", dto.getDetailAddress());
        session.setAttribute("grade", dto.getGrade());
        session.setAttribute("identityNum", dto.getIdentityNum());
        session.setAttribute("extraAddress", dto.getExtraAddress());
        System.out.println("여기 id null값 체크" + id);
    %>
    
    <div class="user-box">
      <div class="user-info">
        <div class="user-input">
          <strong>이름</strong>
          <input type="text" value="<%=dto.getName() %>" readonly>
        </div>
        <div class="user-input">
          <strong>전화번호</strong>
          <input type="text" value="<%=dto.getPhoneNum()%>" readonly>
        </div>
        <div class="user-input">
          <strong>Email</strong>
          <input type="text" value="<%=dto.getEmail() %>" readonly>
        </div>
        <div class="user-input">
          <strong>우편번호</strong>
          <input type="text" value="<%=dto.getPostalCode() %>" readonly>
        </div>
         <div class="user-input">
          <strong>도로명주소</strong>
          <input type="text" value="<%=dto.getAddress() %>" readonly>
        </div>
         <div class="user-input">
          <strong>지번주소</strong>
          <input type="text" value="<%=dto.getJibunAddress() %>" readonly>
        </div>
         <div class="user-input">
          <strong>상세주소</strong>
          <input type="text" value="<%=dto.getDetailAddress() %>" readonly>
        </div>
        <div class="user-input">
          <strong>유저등급</strong>
          <input type="text" value="<%=dto.getGrade() %>" readonly>
        </div>
      </div> 
      <div>
        <button onclick="manageMyInfoInput('<%=dto.getId() %>')" style="font-family: 'Hana'; background-color: pink;">개인 정보 수정</button>
      </div>
      <div>
        <button onclick="deleteMember('<%=dto.getId() %>')" style="font-family: 'Hana'; background-color: pink;">회원 탈퇴</button>
      </div>
    </div>
        <div class="back-link">
      <button onclick="location.href='./Main.bank'" style="font-family: 'Hana'; background-color: pink;">메인페이지로 이동하기</button>
    </div>
    
  </div>
  <script>
    function manageMyInfoInput(id) {
      window.location.href = "manageMemberInput.bank";
    }
    function deleteMember(id) {
        window.location.href = "deleteMember.bank";
      }
  </script>
</body>
</html>