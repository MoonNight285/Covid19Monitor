<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - FAQ & 공지사항</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row mt-5">
            <div class="col-sm-12 mx-auto">
                <h1 class="display-3 banner text-center"><span id="">도움이</span></h1>
                <h1 class="display-3 banner text-center">필요한가요?</h1>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-sm-12 mx-auto d-flex justify-content-end">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                    <label class="form-check-label" for="flexCheckDefault">
                        내가 작성한 글만 보기
                    </label>
                </div>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-sm-12 mx-auto d-flex justify-content-end">
                <button class="btn btn-primary">FAQ</button>
                <button class="btn btn-primary mx-2">공지사항</button>
                <button class="btn btn-primary">글쓰기</button>
            </div>
        </div>
        <div class="row my-2">
            <div class="col-sm-8"></div>
            <div class="col-sm-4 mx-auto d-flex justify-content-end">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="검색할 제목을 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <span class="input-group-text" id="basic-addon2">검색</span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 mx-auto">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>글 제목</th>
                            <th>작성자</th>
                            <th>작성시간</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>테스트 제목1</td>
                            <td>작성자1</td>
                            <td>2022-11-27</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 mx-auto d-flex justify-content-center">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
