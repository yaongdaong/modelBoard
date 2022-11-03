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
</head>
<body>
<a href="logout">로그아웃</a>

<%--게시글리스트--%>
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
                <%--게시글 제목 누르면 각 게시글 이동--%>
                <td><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
                <td><c:out value="${board.content}"></c:out></td>
                <td><c:out value="${board.writer}"></c:out></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"></fmt:formatDate></td>
            </tr>
        </c:forEach>
    </table>

<%--페이징 처리--%>
    <c:if test="${pageMaker.prev}">
        <a class="page-item" href="${pageMaker.startPage-1}">Previous</a>
    </c:if>
    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        <a class="page-item ${pageMaker.cri.pageNum == num? "active":""}" href="${num}">${num}</a>
    </c:forEach>
    <c:if test="${pageMaker.next}">
        <a class="page-item" href="${pageMaker.endPage+1}">Next</a>
    </c:if>

    <form id="actionForm" action="/boardList" method="get">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
    </form>
</div>
<button><a href="write">글쓰기</a></button>

<script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script>
    var actionForm = $("#actionForm");

    $(".move").on("click", function (e) {
        e.preventDefault();
        actionForm.append("<input type='hidden' name='bno' value='" +
            $(this).attr("href") + "'>"
        );
        actionForm.attr("action", "/read");
        actionForm.submit();
    })

    // 페이지 번호 누르면 페이지 이동
    $(".page-item").on("click", function (e) {
        // $(".paginate_button a").on("click", function (e) {
        e.preventDefault();
        console.log("click");
        actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        actionForm.submit();
    });
</script>
</body>
</html>
