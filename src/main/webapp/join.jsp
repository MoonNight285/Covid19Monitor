<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - 회원가입</title>

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
                        <h4 class="mb-2 text-center">회원가입</h4>
                        <form id="formAuthentication" class="mb-3" action="index.html" method="POST">
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="user-id" class="form-label">아이디</label>
                                    <small>사용할수있는 아이디입니다.</small>
                                </div>
                                <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요." autofocus/>
                            </div>
                            <div class="mb-3 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="password">비밀번호</label>
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" class="form-control" name="password"
                                            placeholder="*******" aria-describedby="password"/>
                                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                </div>
                            </div>
                            <div class="mb-3 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="password-check">비밀번호 확인</label>
                                    <small>암호가 일치합니다.</small>
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password-check" class="form-control" name="passwordCheck"
                                            placeholder="*******" aria-describedby="password-check"/>
                                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="nickname" class="form-label">닉네임</label>
                                    <small>사용할수있는 닉네임입니다.</small>
                                </div>
                                <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요."/>
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="tel" class="form-label">전화번호</label>
                                </div>
                                <input type="tel" class="form-control" id="tel" name="tel" placeholder="전화번를 입력하세요.">
                            </div>
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="email" class="form-label">이메일</label>
                                </div>
                                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-grid w-100" type="submit">회원가입</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Register -->
            </div>
        </div>
    </div>
</body>
</html>
