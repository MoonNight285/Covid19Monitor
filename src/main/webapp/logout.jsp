<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-01
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("userId") != null) {
        session.removeAttribute("userId");
    }

    if (session.getAttribute("nickname") != null) {
        session.removeAttribute("nickname");
    }
%>

<html>
<head>
    <title>코로나 모니터</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row" style="height: 40%"></div>
        <div class="row mb-3">
            <div class="col-auto mx-auto">
                <h1 class="display-3 banner"><span id="enhance2">로그아웃</span>이 완료되었습니다.</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-auto mx-auto">
                <a href="dataView.jsp?dataType=누적_확진자_수"><button class="btn btn-dark" type="button">메인으로 이동</button></a>
            </div>
        </div>
    </div>
</body>
</html>
