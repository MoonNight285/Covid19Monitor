<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - 글 자세히 보기</title>

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
        <div class="row mt-3">
            <div class="col-sm-2 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-author" readonly>
                    <label for="posting-author">작성자</label>
                </form>
            </div>
            <div class="col-sm-10 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-name" readonly>
                    <label for="posting-name">글 제목</label>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-number" readonly>
                    <label for="posting-number">글 번호</label>
                </form>
            </div>
            <div class="col-sm-2 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-view-count" readonly>
                    <label for="posting-view-count">조회수</label>
                </form>
            </div>
            <div class="col-sm-4 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-create-time" readonly>
                    <label for="posting-create-time">등록시간</label>
                </form>
            </div>
            <div class="col-sm-4 mx-auto">
                <form class="form-floating">
                    <input type="text" class="form-control" id="posting-update-time" readonly>
                    <label for="posting-update-time">수정시간</label>
                </form>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-sm-12 mx-auto">
                <div class="form-floating">
                    <textarea id="posting-contents" class="form-control" style="height: 350px; resize:none" readonly></textarea>
                    <label for="posting-contents">글 내용</label>
                </div>
            </div>
        </div>
        <div class="row my-3">
            <div class="col-sm-12 mx-auto d-flex justify-content-end">
                <button class="btn btn-outline-dark">목록으로</button>
                <button class="btn btn-outline-warning mx-2">수정</button>
                <button class="btn btn-outline-danger">삭제</button>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
