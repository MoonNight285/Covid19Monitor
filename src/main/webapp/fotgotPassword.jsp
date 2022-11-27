<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>비밀번호 찾기 테스트</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row" style="height: 100%">
            <div class="col-sm-4 mx-auto align-self-center">
                <div class="card">
                    <div class="card-body">
                        <!-- /Logo -->
                        <h4 class="mb-2 text-center">비밀번호를 분실하셨나요?</h4>
                        <p class="mb-4">가입할때 입력했던 이메일을 기입하세요. 해당 이메일주소로 메일이 날라갑니다.</p>
                        <form id="formAuthentication" class="mb-3" action="index.html" method="POST">
                            <div class="mb-3">
                                <label for="email" class="form-label">이메일</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요." autofocus/>
                            </div>
                            <button class="btn btn-primary d-grid w-100">이메일로 메세지 전송</button>
                        </form>
                        <div class="text-center">
                            <a href="auth-login-basic.html" class="d-flex align-items-center justify-content-center">
                                <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                                로그인 화면으로 돌아가기
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
