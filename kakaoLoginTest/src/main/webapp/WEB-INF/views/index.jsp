<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<c:if test="${userId eq null}">
    <!-- 일반 로그인 폼 -->
    <form action="/login/regular" method="POST">
        <input type="text" name="id" placeholder="사용자명"><br>
        <input type="password" name="password" placeholder="비밀번호">
        <input type="submit" value="로그인"><br><br>
    </form>

    <!-- 카카오 로그인 버튼 -->
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=e0d4d25182bb6375cc3d43fc4ac827c5&redirect_uri=http://localhost:8080/login&response_type=code">
        <img src="/img/kakao_login.png">
    </a>
</c:if>


</body>
</html>
