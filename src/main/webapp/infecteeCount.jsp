<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>코로나 모니터 - 누적 감염자 수</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        @font-face{
            src: url("font/BlackHanSans-Regular.ttf");
            font-family: "BlackHanSans";
        }

        #web-title, #data-name, #admin-tel, #admin-tel-num {
            font-family: "BlackHanSans";
        }

        #web-title{
            font-size: 28px;
        }

        #web-title-enhance {
            color: #30E3CA;
        }

        .dropdown:hover .dropdown-menu {display:block;}

        body {
            margin: 0px 0px;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row my-5">
            <div class="col-sm-4 mx-auto">
                <h1 id="data-name" class="display-2">누적 확진자 수</h1>
            </div>
        </div>
        <div class="row mb-2">
            <div class="col-sm-4"></div>
            <div class="col-sm-2">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="selected-city" readonly>
                    <label for="selected-city">선택한 도시 이름</label>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="start-time">
                    <label for="start-time">조회 시작시간</label>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="end-time">
                    <label class="form-label" for="start-time">조회 종료시간</label>
                </div>
            </div>
            <div class="col-sm-2 mt-2">
                <button type="button" class="btn btn-primary">조회</button>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3 mx-auto mt-5">
                <jsp:include page="sample/map.jsp"></jsp:include>
            </div>
            <div class="col-sm-5 mx-auto mb-5">
                <jsp:include page="sample/chart.jsp"></jsp:include>
            </div>
            <div class="col-sm-2 mx-auto"></div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
