<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-04
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>코로나 모니터 - 비밀번호 변경</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            const newPassword = $("#new-password");
            const newPasswordCheck = $("#new-password-check");
            const newPasswordCheckResult = $("#new-password-check-result");
            const btnPasswordChange = $("#btn-password-change");
            const btnHiddenPasswordChagne = $("#btn-hidden-password-change");

            newPasswordCheck.on("focusout", function () {
                if (newPassword.val() == newPasswordCheck.val() && newPasswordCheck.val() != "") {
                    newPasswordCheckResult.css("color", "green");
                    newPasswordCheckResult.text("비밀번호가 일치합니다.")
                } else {
                    newPasswordCheckResult.css("color", "red");
                    newPasswordCheckResult.text("비밀번호가 일치하지않습니다.");
                }
            });

            btnPasswordChange.on("click", function () {
                if (newPasswordCheckResult.css("color") == "rgb(255, 0, 0)") {
                    newPasswordCheckResult.css("color", "red");
                    newPasswordCheckResult.text("비밀번호를 확인해주세요!");
                } else {
                    btnHiddenPasswordChagne.click();
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
    <div class="row" style="height: 100%">
        <div class="col-sm-4 mx-auto align-self-center">
            <div class="card">
                <div class="card-body">
                    <h4 class="mb-2 text-center">비밀번호를 변경합니다.</h4>
                    <form class="mb-3" action="adminPasswordChangeProcessor.jsp" method="POST">
                        <div class="mb-3">
                            <label for="new-password" class="form-label">신규 비밀번호</label>
                            <input type="password" class="form-control" id="new-password" placeholder="신규 비밀번호를 입력하세요." name="newPassword" autofocus/>
                        </div>
                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label for="new-password-check" class="form-label">신규 비밀번호 재확인</label>
                                <small id="new-password-check-result" style="color: red"></small>
                            </div>
                            <input type="password" class="form-control" id="new-password-check" placeholder="신규 비밀번호를 다시 입력하세요."/>
                        </div>
                        <button id="btn-password-change" type="button" class="btn btn-primary d-grid w-100 mb-3">비밀번호 변경</button>
                        <button id="btn-hidden-password-change" type="submit" style="display: none"></button>
                    </form>
                    <div class="text-center">
                        <a href="adminInfo.jsp" class="d-flex align-items-center justify-content-center">
                            관리자 전용페이지로 돌아가기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
