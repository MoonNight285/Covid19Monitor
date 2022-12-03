<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-01
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    String autoLogin = request.getParameter("autoLogin"); // 미체크시 null 체크시 on
    String preUrl = request.getParameter("preUrl");
    String nickname = "";
    String adminUseable = "";

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT admin_nickname, admin_useable FROM admins WHERE admin_id = ? ";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        rs = psmt.executeQuery();

        if (rs.next()) {
            nickname = rs.getString("admin_nickname");
            adminUseable = rs.getString("admin_useable");

            if (adminUseable.equals("Y")) {
                adminUseable = "활동중";
            } else {
                adminUseable = "정지됨";
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    session.setAttribute("userId", userId);
    session.setAttribute("nickname", nickname);
    session.setAttribute("useable", adminUseable);

    response.sendRedirect("infectedCount.jsp");
%>
