<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-03
  Time: 오후 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String title = request.getParameter("title");
    String enhanceContent = request.getParameter("enhanceContent");
    String content = request.getParameter("content");
    String toHref = request.getParameter("toHref");
    String toHrefContent = request.getParameter("toHrefContent");
%>

<html>
<head>
    <title><%=title%></title>

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
                <h1 class="display-3 banner"><span id="enhance2"><%=enhanceContent%></span><%=content%></h1>
            </div>
        </div>
        <div class="row">
            <div class="col-auto mx-auto">
                <a href="<%=toHref%>"><button class="btn btn-dark" type="button"><%=toHrefContent%></button></a>
            </div>
        </div>
    </div>
</body>
</html>
