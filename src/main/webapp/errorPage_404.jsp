<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-07
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    System.out.println("------------------");
    System.out.println(LocalDateTime.now() + " : 404 error");
    System.out.println();
    
    final int RADIX = 16;
    
    String title = (new BigInteger("코로나 모니터 - 404 에러".getBytes())).toString(RADIX);
    String enhanceContent = (new BigInteger("404".getBytes())).toString(RADIX);
    String content = (new BigInteger(" Not Found".getBytes())).toString(RADIX);
    String toHref = "dataView.jsp";
    String toHrefContent = (new BigInteger("메인으로 이동".getBytes())).toString(RADIX);
    
    response.setCharacterEncoding("UTF-8");
    response.sendRedirect("errorPageContent.jsp?title=" + title + "&enhanceContent=" + enhanceContent + "&content=" + content +
            "&toHref=" + toHref + "&toHrefContent=" + toHrefContent);
%>
