<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %> 
<link rel="stylesheet" href="static/css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Vollkorn&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Login</title>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
 @import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');
 
 
</style>
</head>
<body>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
	<script type="text/javascript">
    $(document).ready(function() {
        // URL에서 이메일 값을 가져와서 이메일 입력란에 설정
        function getEmailFromURL() {
            var urlParams = new URLSearchParams(window.location.search);
            return urlParams.get('refinedEmail');
        }

        var refinedEmail = getEmailFromURL();
        $('#emailInput').val(refinedEmail);
	    });
	</script>
	<jsp:include page="/include/mainHeader.jsp"></jsp:include>
	<br><br>
	
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
			  <td><input type="email" name="email" placeholder="이메일 (예: example@example.com)" id ="emailInput"  required></td>
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
      <br>
        <input id="joinButton" type="submit" value="회원가입">
        <button id="loginButton" onclick="loginInput.bank">로그인</button>
      </td>
    </tr>
    
	</table>

	</form>
	
	<br>
	<br><br>
	
<jsp:include page="/include/mainFooter.jsp"></jsp:include>
</body>
</html>
