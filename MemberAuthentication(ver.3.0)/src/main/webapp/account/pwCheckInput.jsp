<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>���� ����</h2>
���� Ȯ���� ���� ���� ��й�ȣ�� �Է����ּ���. <br/><br/>

<form action="pwCheckOk.bank" method="post">
<%
    String accPw = (String) session.getAttribute("accPw");
%>

��й�ȣ: <input type="password" id="accPw" name="enteredPassword" required maxlength="4" pattern="[0-9]{4}"> 
<input type="hidden" name="password" value="<%= accPw %>">
<input type="submit" value="����" onclick="return checkPassword();">
</form>

<script>
    function checkPassword() {
        var enteredPassword = document.getElementById("accPw").value;
        var password = "<%= accPw %>";
        
        if (!/^[0-9]{4}$/.test(enteredPassword)) {
            alert("���� ��й�ȣ�� 4�ڸ� �����Դϴ�.");
            return false;
        }
        
        if (enteredPassword === password) {
            return true;
        } else {
            alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���.");
            return false;
        }
    }
</script>

</body>
</html>
