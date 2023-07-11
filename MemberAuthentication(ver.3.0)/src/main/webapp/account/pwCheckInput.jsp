<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>계좌 해지</h2>
본인 확인을 위해 계좌 비밀번호를 입력해주세요. <br/><br/>

<form action="pwCheckOk.bank" method="post">
<%
    String accPw = (String) session.getAttribute("accPw");
%>

비밀번호: <input type="password" id="accPw" name="enteredPassword" required maxlength="4" pattern="[0-9]{4}"> 
<input type="hidden" name="password" value="<%= accPw %>">
<input type="submit" value="해지" onclick="return checkPassword();">
</form>

<script>
    function checkPassword() {
        var enteredPassword = document.getElementById("accPw").value;
        var password = "<%= accPw %>";
        
        if (!/^[0-9]{4}$/.test(enteredPassword)) {
            alert("계좌 비밀번호는 4자리 숫자입니다.");
            return false;
        }
        
        if (enteredPassword === password) {
            return true;
        } else {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            return false;
        }
    }
</script>

</body>
</html>
