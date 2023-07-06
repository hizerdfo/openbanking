<%--
  Created by IntelliJ IDEA.
  User: 김하영
  Date: 2023-07-06
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!--카카오 회원가입 구현-->
<%@ page import="java.util.*" %>
<%
  // 이메일 정보를 가져옴
  String email = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    @font-face {
      font-family: 'Tenada';
      src:
              url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2')
              format('woff2');
      font-weight: normal;
      font-style: normal;
    }

    body {
      font-family: 'Tenada', Arial, sans-serif;
      background-color: #f2f2f2;
      display: flex;
      align-items: center; /* 수직 가운데 정렬 */
      justify-content: center; /* 수평 가운데 정렬 */
      min-height: 100vh; /* 화면 전체 높이로 설정 */
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
    }

    form {
      max-width: 1000px;
      margin: 0 auto;
      background-color: #fff;
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    form table {
      width: 100%;
    }

    form table td {
      padding: 5px;
    }

    input[type="text"], input[type="password"], input[type="email"], input[type="tel"]
    {
      width: 90%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="submit"] {
      width: 200px;
      padding: 8px;
      border: none;
      background-color: #4CAF50;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }

    #loginButton {
      background-color: #000000;
    }


    #joinButton {

    }

    button {
      width: 200px;
      padding: 8px;
      border: none;
      background-color: #555;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
      display: inline-block;
      margin-right: 10px;
    }


    button:hover {
      background-color: #333;
    }

    .error-message {
      color: red;
      display: none;
    }
  </style>
</head>
<body>
<script
        src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--카카오 로그인 구현-->
<script>
  // 이메일 필드에 자동으로 값 넣기
  var emailField = document.querySelector('input[name="email"]');
  emailField.value = '<%= email %>';
</script>
<script>
  function sample4_execDaumPostcode() {
    new daum.Postcode(
            {
              oncomplete : function(data) {
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if (data.bname !== ''
                        && /[동|로|가]$/g.test(data.bname)) {
                  extraRoadAddr += data.bname;
                }

                if (data.buildingName !== ''
                        && data.apartment === 'Y') {
                  extraRoadAddr += (extraRoadAddr !== '' ? ', '
                          + data.buildingName : data.buildingName);
                }

                if (extraRoadAddr !== '') {
                  extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById('sample4_roadAddress').value = roadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                if (roadAddr !== '') {
                  document.getElementById('sample4_extraAddress').value = extraRoadAddr;
                } else {
                  document.getElementById('sample4_extraAddress').value = '';
                }

                var guideTextBox = document.getElementById('guide');
                if (data.autoRoadAddress) {
                  var expRoadAddr = data.autoRoadAddress
                          + extraRoadAddr;
                  guideTextBox.innerHTML = '(예상 도로명 주소: '
                          + expRoadAddr + ')';
                  guideTextBox.style.display = 'block';
                } else if (data.autoJibunAddress) {
                  var expJibunAddr = data.autoJibunAddress;
                  guideTextBox.innerHTML = '(예상 지번 주소: '
                          + expJibunAddr + ')';
                  guideTextBox.style.display = 'block';
                } else {
                  guideTextBox.innerHTML = '';
                  guideTextBox.style.display = 'none';
                }

                // 주소 필드를 채운 후 loginResult 페이지로 값을 넘기는 부분

              }
            }).open();
  }
</script>
<script>
  function formatPhoneNumber() {
    var phoneNumberInput = document
            .querySelector('input[name="phone_number"]');
    var phoneNumber = phoneNumberInput.value.replace(/[^0-9]/g, '');
    var formattedPhoneNumber = '';

    if (phoneNumber.length > 3) {
      formattedPhoneNumber += phoneNumber.substr(0, 3) + '-';
      if (phoneNumber.length > 7) {
        formattedPhoneNumber += phoneNumber.substr(3, 4) + '-'
                + phoneNumber.substr(7);
      } else {
        formattedPhoneNumber += phoneNumber.substr(3);
      }
    } else {
      formattedPhoneNumber = phoneNumber;
    }

    phoneNumberInput.value = formattedPhoneNumber;
  }

  var phoneNumberInput = document
          .querySelector('input[name="phone_number"]');
  phoneNumberInput.addEventListener('keyup', formatPhoneNumber);

  document
          .querySelector('form')
          .addEventListener(
                  'submit',
                  function(event) {
                    var passwordInput = document
                            .querySelector('input[name="password"]');
                    var password = passwordInput.value;

                    if (!isPasswordValid(password)) {
                      event.preventDefault();
                      document.getElementById('passwordError').style.display = 'block';
                      passwordInput.focus();
                    }
                  });

  function isPasswordValid(password) {
    var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$/;
    return pattern.test(password);
  }

  function isEmailValid(email) {
    var pattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
    return pattern.test(email);
  }
</script>
<form id="joinForm" action="join.bank" method="post">
  <h1>회원가입</h1>
  <hr>
  <table>
    <tr>
      <td><b>아이디:</b></td>
      <td><input type="text" name="id" placeholder="아이디" required></td>
    </tr>
    <tr>
      <td><b>비밀번호:</b></td>
      <td><input type="password" name="password"
                 placeholder="영문+숫자 4자리 이상"
                 pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" required></td>
    </tr>
    <tr>
      <td colspan="2" id="passwordError" class="error-message">영문과
        숫자의 조합으로 4자리 이상 입력해주세요.</td>
    </tr>
    <tr>
      <td><b>이름:</b></td>
      <td><input type="text" name="name" placeholder="이름" required></td>
    </tr>
    <tr>
      <td><b>주민등록번호:</b></td>
      <td><input type="text" name="resident_number"
                 pattern="\d{6}-\d{7}" placeholder="주민등록번호 (예: 123456-1234567)"
                 required></td>
    </tr>
    <tr>
      <td><b>전화번호:</b></td>
      <td><input type="tel" name="phone_number"
                 pattern="\d{3}-\d{4}-\d{4}" placeholder="전화번호 (예: 010-1234-5678)"
                 required></td>
    </tr>
    <tr>
      <td><b>이메일:</b></td>
      <td><input type="email" name="email" value="<%= email %>"
                 placeholder="이메일 (예: example@example.com)" required></td>
    </tr>
    <tr>
      <td><b>주소:</b></td>
      <td><input type="text" id="sample4_postcode"
                 name="sample4_postcode" placeholder="우편번호"> <input
              type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
        <br> <input type="text" id="sample4_roadAddress"
                    name="sample4_roadAddress" placeholder="도로명주소"> <input
                type="text" id="sample4_jibunAddress" name="sample4_jibunAddress"
                placeholder="지번주소"> <span id="guide"
                                          style="color: #999; display: none"></span> <br> <input
                type="text" id="sample4_detailAddress" name="sample4_detailAddress"
                placeholder="상세주소"> <br> <input type="text"
                                                id="sample4_extraAddress" name="sample4_extraAddress"
                                                placeholder="참고항목"></td>
    </tr>
    <br>
    <tr>
      <td></td>
      <td>
        <input id="joinButton" type="submit" value="회원가입">
        <button id="loginButton" onclick="confirmAndRedirect()">로그인 페이지로 이동</button>
      </td>
    </tr>

  </table>

</form>
<script>
  function confirmAndRedirect() {
    var confirmResult = confirm("정말로 회원가입을 종료하시겠습니까?");
    if (confirmResult) {
      // userId 값을 null로 초기화
      var userId = null;
      alert("회원가입이 종료되었습니다.");
      window.location.href = "/"; // 로그인 페이지로 리다이렉트
    }
  }
</script>
<br>

</body>
</html>

