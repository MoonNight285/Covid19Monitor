<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container-fluid">
      <div class="row">
        <div class="col">
          <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="#"><span id="web-title"><span id="web-title-enhance">코로나</span> 모니터</span></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                <ul class="navbar-nav">
                  <div class="collapse navbar-collapse" id="data-option">
                    <ul class="navbar-nav">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          데이터 종류
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                          <li><a class="dropdown-item" href="#">누적 확진자 수</a></li>
                          <li><a class="dropdown-item" href="#">전일 대비 확진자 증감수</a></li>
                          <li><a class="dropdown-item" href="#">누적 격리 해제수</a></li>
                          <li><a class="dropdown-item" href="#">격리 중환자 수</a></li>
                          <li><a class="dropdown-item" href="#">지역 발생수</a></li>
                          <li><a class="dropdown-item" href="#">해외 유입수</a></li>
                          <li><a class="dropdown-item" href="#">만명당 발생률</a></li>
                        </ul>
                      </li>
                    </ul>
                  </div>
                  <li class="nav-item">
                    <a class="nav-link" href="#">FAQ & 공지사항</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">관리자 로그인</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </div>
</body>
</html>
