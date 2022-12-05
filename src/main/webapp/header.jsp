<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = "";
    String labelLogin = "관리자 로그인";
    String loginOutPath = "login.jsp";
    String welcome = "";
    String labelAdminPage = "";
    Object obj = session.getAttribute("nickname");
    if (obj != null) {
        nickname = obj.toString();
        labelLogin = "로그아웃";
        welcome = "님 환영합니다!";
        labelAdminPage = "관리자 전용 페이지로 이동";
        loginOutPath = "logout.jsp";
    }
%>
<html>
<head>
    <title>Title</title>
    <style>
        .navbar-nav .nav-item .nav-link:hover, #data-option:hover .navbar-nav .nav-item .nav-link {
            color: red;
        }
        #header {
            top: 0;
            position: fixed;
            z-index: 1000;
        }
    </style>
</head>
<body>
<div class="container-fluid" id="header">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-sm bg-white navbar-white">
                <div class="container-fluid">
                    <a class="navbar-brand" href="dataView.jsp"><span id="web-title"><span id="enhance1">코로나</span> 모니터</span></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" id="user-nickname"><span id="header-user-nickname"><%=nickname%></span><%=welcome%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="my-page" href="adminInfo.jsp"><%=labelAdminPage%></a>
                            </li>
                            <div class="collapse navbar-collapse" id="data-option">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            데이터 종류
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                                            <li><a class="dropdown-item" href="dataView.jsp?dataType=누적_확진자_수">누적 확진자 수</a></li>
                                            <li><a class="dropdown-item" href="dataView.jsp?dataType=전일_대비_확진자_증감수">전일 대비 확진자 증감수</a></li>
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
                                <a class="nav-link" href="notice.jsp?contentType=FAQ">FAQ & 공지사항</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%=loginOutPath%>"><%=labelLogin%></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <hr>
    </div>
</div>
</body>
</html>
