<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-25
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<form action="join" method="post">
    <input name="username" type="text" required placeholder="아이디"><br>
    <input name="password" type="password" required placeholder="비밀번호"><br>
    <button type="submit">회원가입</button>
</form>
</body>
</html>
