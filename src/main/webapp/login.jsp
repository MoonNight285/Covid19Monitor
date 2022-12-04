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
    <script>
        $(document).ready(function () {
            const btnLogin = $("#btn-login");
            const btnHiddenLogin = $("#btn-hidden-login");

            btnLogin.on("click", function () {
                const userId = $("#user-id").val();
                const password = $("#password").val();
                const loginResult = $("#login-result");

                if (userId == "") {
                    loginResult.css("color", "red");
                    loginResult.text("아이디가 비어있습니다!");
                    return;
                }

                if (password == "") {
                    loginResult.css("color", "red");
                    loginResult.text("비밀번호가 비어있습니다!");
                    return;
                }

                $.ajax({
                    url : "loginChecker.jsp",
                    type : "post",
                    data : {Id : userId, pwd : password},
                    success : function (data) {
                        let result = JSON.parse(data);

                        if(result.isExist == "true") {
                            btnHiddenLogin.click();
                        } else {
                            loginResult.css("color", "red");
                            loginResult.text("유저정보가 일치하지않습니다!");
                        }
                    },
                    error : function () {
                        loginResult.css("color", "red");
                        loginResult.text("문제가 발생했습니다. 다시 시도하세요.");
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row" style="height: 100%">
        <div class="col-sm-9 col-md-7 col-lg-5 col-xl-4 col-xxl-4 mx-auto align-self-center">
            <!-- Register -->
            <div class="card">
                <div class="card-body">
                    <h4 class="mb-2 text-center">관리자 로그인</h4>
                    <form id="formAuthentication" class="mb-3" action="loginProcessor.jsp" method="POST">
                        <div class="mb-3">
                            <label for="user-id" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요." autofocus/>
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">비밀번호</label>
                                <a href="forgotPassword.jsp">
                                    <small>비밀번호를 분실하셨나요?</small>
                                </a>
                            </div>
                            <div class="input-group input-group-merge">
                                <input type="password" id="password" class="form-control" name="password" placeholder="*******" aria-describedby="password"/>
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>
                        <div class="mb-3 d-flex justify-content-between">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="remember-me" name="autoLogin">
                                <label class="form-check-label" for="remember-me">자동 로그인</label>
                            </div>
                            <small id="login-result"></small>
                        </div>
                        <div class="mb-3">
                            <button id="btn-login" class="btn btn-primary d-grid w-100" type="button">로그인</button>
                            <button id="btn-hidden-login" type="submit" style="display: none"></button>
                            <input type="hidden" name="preUrl" value="<%=request.getHeader("referer")%>">
                        </div>
                    </form>

                    <p class="text-center">
                        <span>아이디가 없으신가요?</span>
                        <a href="join.jsp">
                            <span>회원가입</span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
