<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="mail.MailSend" %>

<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    
    MailSend ms = new MailSend();
    ms.MailSend();
%>
