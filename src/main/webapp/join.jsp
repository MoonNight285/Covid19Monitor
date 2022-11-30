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
    <script>
        $(document).ready(function () {
            const userId = $("#user-id");
            const password = $("#password");
            const passwordCheck = $("#password-check");
            const nickname = $("#nickname");
            const tel = $("#tel");
            const email = $("#email");
            const idOverlapCheck = $("#id-overlap-check");
            const passwordEqualCheck = $("#password-equal-check");
            const nicknameOverlapCheck = $("#nickname-overlap-check");
            const btnUserIdOverlapCheck = $("#btn-user-id-overlap-check");
            const btnNicknameOverlapCheck = $("#btn-nickname-overlap-check");
            const btnJoin = $("#btn-join");
            const btnHiddenJoin = $("#btn-hidden-join");

            userId.on("change", function () {
                const userIdValue = userId.val();
                for(let i = 0; i < userIdValue.length; ++i) {
                    if(((userIdValue.charCodeAt(i) >= 65 && userIdValue.charCodeAt(i) <= 90) ||
                        (userIdValue.charCodeAt(i) >= 97 && userIdValue.charCodeAt(i) <= 122) ||
                        (userIdValue.charCodeAt(i) >= 48 && userIdValue.charCodeAt(i) <= 57))) {

                    } else {
                        userId.val("");
                        idOverlapCheck.css("color", "red");
                        idOverlapCheck.text("아이디는 영어와 숫자만 가능합니다.");
                    }
                }
            });

            btnUserIdOverlapCheck.on("click", function () {
                if(userId.val() == "") {
                    idOverlapCheck.css("color", "red");
                    idOverlapCheck.text("아이디는 공백이 불가능합니다.");
                    return;
                }

                $.ajax({
                    url : "joinUserIdOverlapChecker.jsp",
                    type : "get",
                    data : {id : userId.val()},
                    success : function (data) {
                        let isOverlapId = JSON.parse(data);

                        if(isOverlapId.overlap == "true") {
                            idOverlapCheck.css("color", "red");
                            idOverlapCheck.text("이미 사용중인 아이디입니다.");
                        } else {
                            idOverlapCheck.css("color", "green");
                            idOverlapCheck.text("사용가능한 아이디입니다.");
                        }
                    },
                    error : function () {
                        idOverlapCheck.css("color", "red");
                        idOverlapCheck.text("문제가 발생했습니다. 다시 시도하세요.");
                    }
                });
            });

            passwordCheck.on("focusout", function () {
                if(password.val() == passwordCheck.val() && password.val() != "") {
                    passwordEqualCheck.css("color", "green");
                    passwordEqualCheck.text("암호가 일치합니다.");
                } else {
                    passwordEqualCheck.css("color", "red");
                    passwordEqualCheck.text("암호가 일치하지않습니다.");
                }
            });

            btnNicknameOverlapCheck.on("click", function () {
                if(nickname.val() == "") {
                    nicknameOverlapCheck.css("color", "red");
                    nicknameOverlapCheck.text("닉네임은 공백이 불가능합니다.");
                    return;
                }

                $.ajax({
                    url : "joinNicknameOverlapChecker.jsp",
                    type : "get",
                    data : {name : nickname.val()},
                    success : function (data) {
                        let isOverlapNickname = JSON.parse(data);

                        if(isOverlapNickname.overlap == "true") {
                            nicknameOverlapCheck.css("color", "red");
                            nicknameOverlapCheck.text("이미 사용중인 닉네임입니다.");
                        } else {
                            nicknameOverlapCheck.css("color", "green");
                            nicknameOverlapCheck.text("사용가능한 닉네임입니다.");
                        }
                    },
                    error : function () {
                        nicknameOverlapCheck.css("color", "red");
                        nicknameOverlapCheck.text("문제가 발생했습니다. 다시 시도하세요.");
                    }
                });
            });

            btnJoin.on("click", function () {
                if (idOverlapCheck.css("color") == "rgb(255, 0, 0)") {
                    alert("아이디 중복확인을 해주세요!");
                    return;
                }

                if (passwordEqualCheck.css("color") == "rgb(255, 0, 0)") {
                    alert("비밀번호가 일치하지않습니다!");
                    return;
                }

                if (nicknameOverlapCheck.css("color") == "rgb(255, 0, 0)") {
                    alert("닉네임 중복확인을 해주세요!");
                    return;
                }

                if (tel.val() == "") {
                    alert("전화번호가 비어있습니다!");
                    return;
                }

                if (email.val() == "") {
                    alert("이메일이 비어있습니다!");
                    return;
                }

                btnHiddenJoin.click();
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <div class="row" style="height: 100%">
            <div class="col-sm-10 col-lg-6 col-xl-5 col-xxl-4 mx-auto align-self-center">
                <!-- Register -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="mb-2 text-center">회원가입</h4>
                        <form id="formAuthentication" class="mb-3" action="joinProcessor.jsp" method="POST">
                            <div class="mb-3">
                                <div class="d-flex justify-content-between">
                                    <label for="user-id" class="form-label">아이디</label>
                                    <small id="id-overlap-check" style="color: red"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="아이디를 입력하세요." autofocus/>
                                    <button class="btn btn-outline-dark" id="btn-user-id-overlap-check" type="button">중복확인</button>
                                </div>
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
                                    <small id="password-equal-check" style="color: red"></small>
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
                                    <small id="nickname-overlap-check" style="color: red"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력하세요."/>
                                    <button class="btn btn-outline-dark" id="btn-nickname-overlap-check" type="button">중복확인</button>
                                </div>
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
                                <button id="btn-join" class="btn btn-primary d-grid w-100" type="button">회원가입</button>
                                <button id="btn-hidden-join" type="submit" style="display: none"></button>
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
