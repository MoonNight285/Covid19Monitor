<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-07
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.math.BigInteger" %>

<%
    final int RADIX = 16;
    
    request.setCharacterEncoding("UTF-8");
    String title = new String((new BigInteger(request.getParameter("title"), RADIX)).toByteArray());
    String enhanceContent = new String((new BigInteger(request.getParameter("enhanceContent"), RADIX)).toByteArray());
    String content = new String((new BigInteger(request.getParameter("content"), RADIX)).toByteArray());
    String toHref = request.getParameter("toHref");
    String toHrefContent = new String((new BigInteger(request.getParameter("toHrefContent"), RADIX)).toByteArray());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%=title%></title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row" style="height: 40vh;"></div>
        <div class="row mb-3">
            <div class="col-auto mx-auto">
                <h1 class="display-3 banner"><span id="enhance3"><%=enhanceContent%></span><%=content%></h1>
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
