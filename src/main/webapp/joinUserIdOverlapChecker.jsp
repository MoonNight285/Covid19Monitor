<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-30
  Time: 오후 7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.JsonObject"%>
<%@ include file="sqlConnector.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT COUNT(*) FROM admins WHERE admin_id = ? " +
            "UNION ALL " +
            "SELECT COUNT(*) FROM wait_admins WHERE admin_id = ? ";
    int usedIdCount = 0;
    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, id);
        psmt.setString(2, id);
        rs = psmt.executeQuery();

        while(rs.next()) {
            int count = rs.getInt("COUNT(*)");
            usedIdCount += count;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw new SQLException();
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    JsonObject result = new JsonObject();

    if(usedIdCount == 0) {
        result.addProperty("overlap", "false");
    } else {
        result.addProperty("overlap", "true");
    }

    out.print(result);
%>
