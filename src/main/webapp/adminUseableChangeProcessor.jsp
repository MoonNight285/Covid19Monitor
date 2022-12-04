<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-04
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String targetId = request.getParameter("id");
    String useStatement = request.getParameter("useStatement");

    PreparedStatement psmt = null;
    int result = 0;
    String query = "";

    if (useStatement.equals("활동중")) {
        query = "UPDATE admins SET admin_useable = 'N' WHERE admin_id = ? ";
    } else {
        query = "UPDATE admins SET admin_useable = 'Y' WHERE admin_id = ? ";
    }

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, targetId);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    if (result == 1) {
        response.sendRedirect("adminInfo.jsp?tableType=admins&idx=0");
    } else {
        // 실패...
    }
%>
