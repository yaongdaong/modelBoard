<%--
  Created by IntelliJ IDEA.
  User: hrkim
  Date: 2022-10-28
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>bno</th>
        <th>title</th>
        <th>content</th>
        <th>writer</th>
        <th>regdate</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${board.bno}</td>
        <td>${board.title}</td>
        <td>${board.content}</td>
        <td>${board.writer}</td>
        <td>${board.regdate}</td>
    </tr>
    </tbody>
</table>
<a href="/updateBoard?bno=${board.bno}">업데이트</a>

<%--댓글--%>
<div id="reply">

</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    $(document).ready(function () {
        replyList();
    });

    function replyList() {
        let bno = ${board.bno};
        $.ajax({
            url: "/replyList",
            type: 'post',
            data: {"bno":bno},
            success: function (result) {
                let innerHTML="";
                console.log(result)
                const list = result;
                for (let i = 0; i < list.length; i++) {
                    innerHTML += '<div>' +
                        '<span>' + list[i].replyer + '</span>' +
                        '<span>' + list[i].replyDate + '</span>' +
                        '<span>' + list[i].reply + '</span>' +
                        // '<button type="button" id="'\+list[i].rno+'\" onclick="update()"></button>'
                        '</div>';
                }
                $("#reply").append(innerHTML);

            }
        })
    }
</script>
</body>
</html>
