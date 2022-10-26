<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-26
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="login" method="post">
    <input name="username" type="text" required placeholder="아이디"><br>
    <input name="password" type="password" required placeholder="비밀번호"><br>
    <button type="submit">로그인</button>
    <button type="button"><a href="join">회원가입</a></button>
</form>
</body>
</html>
