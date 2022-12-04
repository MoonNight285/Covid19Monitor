<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-03
  Time: 오후 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String tableType = request.getParameter("tableType");
    String idx = request.getParameter("idx");

    // 디폴트 값으론 admins
    if (tableType == null) {
        tableType = "admins";
    }

    // 디폴트 값으론 0
    if (idx == null) {
        idx = "0";
    }
%>

<html>
<head>
    <title>코로나 모니터 - 관리자 페이지</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            const btnActiveAdminList = $("#btn-active-admin-list");
            const btnWaitAdminList = $("#btn-wait-admin-list");
            const btnHiddenTableChange = $("#btn-hidden-table-change");
            const tableTypeValue = $("#table-type-value");
            const jspTableType = "<%=tableType%>";

            if (jspTableType == "admins") {
                btnActiveAdminList.addClass("active");
            } else {
                btnWaitAdminList.addClass("active");
            }

            btnActiveAdminList.on("click", function () {
                tableTypeValue.val("admins");
                btnHiddenTableChange.click();
            });

            btnWaitAdminList.on("click", function () {
                tableTypeValue.val("waitAdmins");
                btnHiddenTableChange.click();
            });
        });
    </script>
    <style>
        p {
            font-size: 36px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="d-flex justify-content-between">
        <div class="container mt-5 text-center">
            <div class="row">
                <div class="col">
                    <img src="img/user.png">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <p class="my-3"><%=session.getAttribute("nickname").toString()%></p>
                    <p class="my-3">유저 권한</p>
                    <p class="my-3"><%=session.getAttribute("useable").toString()%></p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <a href="adminEdit.jsp"><button type="button" class="btn btn-outline-dark">유저정보 수정</button></a>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <a href="adminPasswordChange.jsp"><button type="button" class="btn btn-outline-dark">비밀번호 변경</button></a>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row mb-3">
                <div class="col">
                    <div style="width: 75%" class="d-flex justify-content-end">
                        <button id="btn-active-admin-list" type="button" class="btn btn-outline-dark mx-2">활동중인 관리자 목록</button>
                        <button id="btn-wait-admin-list" type="button" class="btn btn-outline-dark">신청 대기중인 관리자 목록</button>
                    </div>
                </div>
            </div>
            <jsp:include page="adminTable.jsp">
                <jsp:param name="tableType" value="<%=tableType%>"/>
                <jsp:param name="idx" value="<%=idx%>"/>
            </jsp:include>
            <form action="adminInfo.jsp" method="get">
                <input id="table-type-value" type="hidden" name="tableType">
                <input type="hidden" name="idx" value="0">
                <button type="submit" id="btn-hidden-table-change" style="display: none"></button>
            </form>
        </div>
    </div>
    <div class="container">
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
