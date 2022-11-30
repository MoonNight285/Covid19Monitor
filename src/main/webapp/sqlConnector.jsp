<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-30
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/covid19?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
    String user = "root";
    String passwd = "1234";
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, passwd);
%>
