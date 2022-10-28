<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-28
  Time: 오전 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="boardUpdate" method="post">
    bno : ${board.bno}
    title :<input name="title" value="${board.title}"></input>
    content :<input name="content" value="${board.content}"></input>
    writer : ${board.writer}
    regdate : ${board.regdate}
</form>
<button type="button" onclick="saveBoard()">저장</button>
<button type="button" onclick="deleteBoard()">삭제</button>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    function saveBoard(){
        let bno = ${board.bno};
        let title = $('input[name=title]').val();
        let content = $('input[name=content]').val();
        $.ajax({
            url: "/updateBoard",
            type: 'post',
            data: {"bno":bno, "title": title, "content":content},
            success: function (result) {
                console.log(result)
               location.href = result;
            }
        })
    }

    function deleteBoard(){
        let bno = ${board.bno};
        $.ajax({
            url: "/deleteBoard",
            type: 'post',
            data: {"bno":bno},
            success: function (result) {
                console.log(result);
                location.href = result;
            }
        })
    }
</script>
</body>
</html>
