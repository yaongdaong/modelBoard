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

<%--댓글 쓰기--%>
<div id="replytext">

    <input type="text" name="replyWrite" id="replyWrite" placeholder="댓글을 입력하세요">
    <input type="text" name="replyer" id="replyer" placeholder="댓글 작성자">
    <button type="button" onclick="replySave()">입력</button>
</div>

<%--댓글 읽기--%>
<div id="replyRead">

</div>
<input type="hidden" id="rno" value="${reply.rno}">
<script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script>
    <%--댓글 쓰기--%>

    function replySave() {
        let reply = $('input[name=replyWrite]').val();
        let bno = ${board.bno};
        let replyer = $('input[name=replyer]').val();
        $.ajax({
            url: "/replyWrite",
            type: 'post',
            data: {"reply": reply, "bno": bno, "replyer": replyer},
            success: function (result) {
                let innerHTML = "";
                innerHTML += '<div id="' + result.rno + '">' + '<strong>' + result.replyer + '</strong>' + '<small>' + result.replyDate + '</small>' + '<p>' + result.reply + '</p>' + '</div>';
                $("#replyRead").prepend(innerHTML);
                $("#replyWrite").val('');
                $("#replyer").val('');
            }
        })
    }

    // $(document).ready(function () {
    // -> 웹브라우저시작-웹문서읽기-DOM생성-페이지로딩완료 순으로 웹페이지가 실행됨
    //     replyList();
    // });
    // -> jqeury 1.8 버전에서는 deprecated되고 3.0에서는 지원하지 않는다.
    $(function () {
        replyList();
    })

    // 댓글 읽기
    function replyList() {
        let bno = ${board.bno}; // 상단의 html에서 받아온 값
        $.ajax({
            url: "/replyList", // controller로 보내는 주소
            type: 'post', // controller로 보내는 방법
            data: {"bno": bno}, // 함수 아래 변수로 선언한 값
            success: function (result) { // result는 controller에서 return으로 받아오는 값
                console.log(result);
                let innerHTML = ""; // 변수를 선언하고 빈 값으로 남겨둠
                // console.log("replyRead : "+result)
                // const list = result;
                for (let i = 0; i < result.length; i++) { // 반복문을 돌려서 reply 데이터에 든 값들을 하나씩 불러오겠다.
                    innerHTML += '<div id="' + result[i].rno + '">' + '<strong>' + result[i].replyer + '</strong>' + '<small>' + result[i].replyDate + '</small>' + '<p>' + result[i].reply + '</p>' +
                        '<button type="button" onclick="replyModify(' + result[i].rno + ',\'' + result[i].replyer + '\',\'' + result[i].replyDate + '\',\'' + result[i].reply + '\')">수정</button> ' + '</div>' +
                        '<button type="button" onclick="replyDelete(' + result[i].rno + ')">삭제</button>';
                }
                $("#replyRead").html(innerHTML);
            }
        })
    }

    // 댓글 수정
    function replyModify(rno, replyer, replyDate, reply) {
        let innerHTML = "";
        innerHTML += '<div id="' + rno + '">' + '<strong>' + replyer + '</strong>' + '<small>' + replyDate + '</small>' + '<textarea id="replyEdit">' + reply + '</textarea>' +
            '<button type="button" onclick="replyUpdate(' + rno + ',\'' + replyer + '\',\'' + reply + '\',\'' + replyDate + '\')">저장</button> ' +
            '<button type="button" onclick="replyList(' + rno + ')">취소</button>' + '</div>';
        $("#" + rno).replaceWith(innerHTML);
        $("#" + rno + "#replyWrite").focus();
    }

    // 댓글 수정 저장
    function replyUpdate(rno, reply) {
        var reply = $("#replyEdit").val();
        $.ajax({
            url: "/replyModify",
            type: "post",
            data: {"rno": rno, "reply": reply},
            success: function (result) {
                console.log("reply:" + reply);
                replyList();
            }
        })
    }

    // 댓글 삭제
    function replyDelete(rno) {
        $.ajax({
            url: "/replyDelete",
            type: "post",
            data: {"rno":rno},
            success: function (result) {
                replyList();
            }
        })
    }
</script>
</body>
</html>
