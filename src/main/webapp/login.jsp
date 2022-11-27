<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - 관리자 로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row" style="height: 100%">
        <div class="col-sm-4 mx-auto align-self-center">
            <!-- Register -->
            <div class="card">
                <div class="card-body">
                    <h4 class="mb-2 text-center">관리자 로그인</h4>
                    <form id="formAuthentication" class="mb-3" action="index.html" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="email" name="email-username" placeholder="아이디를 입력하세요." autofocus/>
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">비밀번호</label>
                                <a href="auth-forgot-password-basic.html">
                                    <small>비밀번호를 분실하셨나요?</small>
                                </a>
                            </div>
                            <div class="input-group input-group-merge">
                                <input type="password" id="password" class="form-control" name="password" placeholder="*******" aria-describedby="password"/>
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="remember-me" />
                                <label class="form-check-label" for="remember-me">자동 로그인</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
                        </div>
                    </form>

                    <p class="text-center">
                        <span>아이디가 없으신가요?</span>
                        <a href="auth-register-basic.html">
                            <span>회원가입</span>
                        </a>
                    </p>
                </div>
            </div>
            <!-- /Register -->
        </div>
    </div>
</div>
</body>
</html>
