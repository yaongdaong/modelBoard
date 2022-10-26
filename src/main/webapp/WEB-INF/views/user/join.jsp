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
<%--<style>--%>
<%--    #possible{--%>
<%--        color:#008000;--%>
<%--        display: none;--%>
<%--    }--%>

<%--    #impossible{--%>
<%--        color:#6A82FB;--%>
<%--        display: none;--%>
<%--    }--%>
<%--</style>--%>
<body>
<form action="join" method="post">
    <%--아이디 중복 체크--%>
    <div>
    <input name="username" type="text" oninput="doubleIdCheck()" required placeholder="아이디"><br>
    <span id="possible" style="display:none; color:blue">사용 가능한 아이디입니다.</span>
    <span id="impossible" style="display:none; color:red">이미 존재하는 아이디입니다.</span>
    </div>

    <input name="password" type="password" required placeholder="비밀번호"><br>
    <button type="submit">회원가입</button>
</form>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    function doubleIdCheck() {
        let checkUsername = $('input[name=username]').val();
        $.ajax({
            url: "/doubleIdCheck",
            type: 'post',
            data: {"username": checkUsername},
            success: function (result) {
                console.log(result);
                // db에 없는 아이디면 사용가능한 아이디 문구 나오고, 이미 존재하는 아이디 문구 없어지게
                if (result == 0) {
                    $('#possible').css("display", "inline-block");
                    $('#impossible').css("display", "none");
                } else {
                    $('#possible').css("display", "none");
                    $('#impossible').css("display", "inline-block");
                    alert("다시 입력하세요.")
                    $("#username").val('');
                }
            },error : function(error){
                alert("error:" + error);
            }
        })

    }
</script>
</body>
</html>
