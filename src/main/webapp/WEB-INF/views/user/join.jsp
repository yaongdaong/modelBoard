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
        <input id="username" name="username" type="text" oninput="doubleIdCheck()" required placeholder="아이디"><br>
        <span id="possible" style="display:none; color:blue">사용 가능한 아이디입니다.</span>
        <span id="impossible" style="display:none; color:red">이미 존재하는 아이디입니다.</span>
    </div>

    <input name="password" type="password" oninput="passwordReg()" required
           placeholder="비밀번호, 8자 이상, 숫자, 대문자, 소문자, 특수문자 포함"><br>
    <span id="reg" style="display:none; color:red">비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 포함해야 합니다.</span>
    <span id="ok" style="display:none; color:blue">비밀번호 사용가능</span>

    <input name="passwordCheck" type="password" oninput="passwordChk()" required placeholder="비밀번호 확인"><br>
    <span id="match" style="display:none; color:blue">비밀번호 일치</span>
    <span id="notMatch" style="display:none; color:red">비밀번호 불일치</span>
    <button type="submit">회원가입</button>
</form>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    <%--아이디 일치--%>
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
                }
            }
        })
    }

    // 정규식 함수
    function passwordReg() {
        let password = $('input[name=password]').val();
        // 정규식
        let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        if (!reg.test(password)) {
            $('#reg').css("display", "inline-block");
            $('#ok').css("display", "none");
        } else {
            $('#reg').css("display", "none");
            $('#ok').css("display", "inline-block");
        }
    }

    //비밀번호 일치
    function passwordChk() {
        let password = $('input[name=password]').val();
        let passwordChk = $('input[name=passwordCheck]').val();
        // 앞에 친 비밀번호와 비교하여 일치하면
        if (password == passwordChk) {
            $('#match').css("display", "inline-block");
            $('#notMatch').css("display", "none");
        } else {
            $('#match').css("display", "none");
            $('#notMatch').css("display", "inline-block");
            $("#passwordChk").val('');
        }
    }
</script>
</body>
</html>
