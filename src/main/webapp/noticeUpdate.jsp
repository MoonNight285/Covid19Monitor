<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오후 1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - 게시글 수정</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row mt-5">
            <div class="col-sm-12 mx-auto d-flex justify-content-center">
                <img src="img/advertisement.jpg" style="max-width: 100%; height: auto">
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-sm-2 mx-auto">
                <div class="form-floating">
                    <select class="form-select" id="posting-type">
                        <option selected>선택하세요.</option>
                        <option value="1">FAQ</option>
                        <option value="2">공지사항</option>
                    </select>
                    <label for="posting-type">분류 선택</label>
                </div>
            </div>
            <div class="col-sm-10 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-name">
                    <label for="posting-name">글 제목</label>
                </form>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm-12 mx-auto">
                <div class="form-floating">
                    <textarea id="posting-contents" class="form-control" style="height: 400px; resize:none"></textarea>
                    <label for="posting-contents">글 내용</label>
                </div>
            </div>
        </div>
        <div class="row my-3">
            <div class="col-sm-12 mx-auto d-flex justify-content-end">
                <button class="btn btn-primary mx-2">수정취소</button>
                <button class="btn btn-primary">수정</button>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
