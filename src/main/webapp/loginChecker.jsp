<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-01
  Time: 오전 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ include file="sqlConnector.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("Id");
    String password = request.getParameter("pwd");

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT COUNT(*) FROM admins WHERE admin_id = ? AND admin_pwd = ? ";
    int count = 0;

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        psmt.setString(2, password);
        rs = psmt.executeQuery();

        if (rs.next()) {
            count = rs.getInt("COUNT(*)");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    JsonObject result = new JsonObject();
    if (count == 0) {
        result.addProperty("isExist", "false");
    } else {
        result.addProperty("isExist", "true");
    }
    out.print(result);
%>
