<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-26
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <!-- CSS only -->
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">--%>
<%--    <!-- JavaScript Bundle with Popper -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"--%>
<%--            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"--%>
<%--            crossorigin="anonymous"></script>--%>
</head>
<body>
<div class="container">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>글쓴이</th>
            <th>작성일</th>
        </tr>
        </thead>

        <c:forEach items="${boardList}" var="board">
            <tr>
                <td><c:out value="${board.bno}"></c:out></td>
                <td><a href="/read?bno=${board.bno}">${board.title}</a></td>
                <td><c:out value="${board.content}"></c:out></td>
                <td><c:out value="${board.writer}"></c:out></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>
</div>
<button><a href="write">글쓰기</a></button>
</body>
</html>
