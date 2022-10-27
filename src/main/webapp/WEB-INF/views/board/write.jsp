<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-26
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="write" method="post">
    <input name="title" type="text" required placeholder="제목"><br>
    <input name="content" type="text" required placeholder="내용"><br>
    <input name="writer" type="text" required placeholder="작성자"><br>
    <button type="submit">제출</button>
</form>
</body>
</html>
