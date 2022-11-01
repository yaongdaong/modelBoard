<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-28
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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

    <tr>
        <td>${board.bno}</td>
        <td><input name="title" value="${board.title}"></td>
        <td><input name="content" value="${board.content}"></td>
        <td>${board.writer}</td>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"></fmt:formatDate></td>
    </tr>
</table>

<button type="button" onclick="saveBoard()">저장</button>
<button type="button" onclick="deleteBoard()">삭제</button>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    function saveBoard() {
        let bno = ${board.bno};
        let title = $('input[name=title]').val();
        let content = $('input[name=content]').val();
        $.ajax({
            url: "/updateBoard",
            type: 'post',
            data: {"bno": bno, "title": title, "content": content},
            success: function (result) {
                console.log(result)
                location.href = result;
            }
        })
    }

    function deleteBoard() {
        let bno = ${board.bno};
        $.ajax({
            url: "/deleteBoard",
            type: 'post',
            data: {"bno": bno},
            success: function (result) {
                console.log(result);
                location.href = result;
            }
        })
    }
</script>
</body>
</html>
