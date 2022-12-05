<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String preUrl = request.getHeader("referer");
    File file = new File(preUrl);
    preUrl = file.getName();
    file = null;
%>

<html>
<head>
    <title>코로나 모니터 - 게시글 작성</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            const btnNoticeCreate = $("#btn-notice-create");
            const btnHiddenNoticeCreate = $("#btn-hidden-notice-create");
            
            btnNoticeCreate.on("click", function () {
                const result = confirm("정말로 작성하시겠습니까?");
                if (result == true) {
                    btnHiddenNoticeCreate.click();
                }
            });
        });
    </script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container" id="main">
        <div class="row mt-5">
            <div class="col-sm-12 mx-auto d-flex justify-content-center">
                <img src="img/advertisement.jpg" style="max-width: 100%; height: auto">
            </div>
        </div>
        <form action="noticeCreateProcessor.jsp" method="post">
            <div class="row mt-5">
                <div class="col-sm-2 mx-auto">
                    <div class="form-floating">
                        <select class="form-select" id="posting-type" name="postingType">
                            <option value="FAQ" selected>FAQ</option>
                            <option value="Notice">공지사항</option>
                        </select>
                        <label for="posting-type">분류 선택</label>
                    </div>
                </div>
                <div class="col-sm-10 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-content-name" name="postingContentName">
                        <label for="posting-content-name">글 제목</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-12 mx-auto">
                    <div class="form-floating">
                        <textarea id="posting-contents" class="form-control" style="height: 400px; resize:none" name="postingContent"></textarea>
                        <label for="posting-contents">글 내용</label>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm-12 mx-auto d-flex justify-content-end">
                    <a href="<%=preUrl%>"><button class="btn btn-outline-danger mx-2">작성취소</button></a>
                    <button id="btn-notice-create" type="button" class="btn btn-outline-success">작성</button>
                    <button id="btn-hidden-notice-create" type="submit" style="display: none"></button>
                </div>
            </div>
        </form>
        <div class="row my-5"></div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
