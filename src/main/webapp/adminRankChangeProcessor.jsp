<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-04
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String targetId = request.getParameter("id");
    String usedRank = request.getParameter("rank");

    PreparedStatement psmt = null;
    int result = 0;
    String query = "";

    if (usedRank.equals("일반 관리자")) {
        query = "UPDATE admins SET admin_rank = 'S' WHERE admin_id = ? ";
    } else {
        query = "UPDATE admins SET admin_rank = 'N' WHERE admin_id = ? ";
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
        response.sendRedirect("adminInfo.jsp");
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 관리자 등급 변경 실패"/>
        <jsp:param name="enhanceContent" value="관리자 등급"/>
        <jsp:param name="content" value="을 변경하는데 실패했습니다."/>
        <jsp:param name="toHref" value="adminInfo.jsp"/>
        <jsp:param name="toHrefContent" value="관리자 전용 페이지로"/>
    </jsp:forward>
<%
    }
%>