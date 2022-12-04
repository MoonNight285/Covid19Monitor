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
    String adminRank = "";

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT admin_nickname, admin_useable, admin_rank FROM admins WHERE admin_id = ? ";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        rs = psmt.executeQuery();

        if (rs.next()) {
            nickname = rs.getString("admin_nickname");
            adminUseable = rs.getString("admin_useable");
            adminRank = rs.getString("admin_rank");

            if (adminUseable.equals("Y")) {
                adminUseable = "활동중";
            } else {
                adminUseable = "정지됨";
            }

            if (adminRank.equals("N")) {
                adminRank = "일반 관리자";
            } else {
                adminRank = "특수 관리자";
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

    if (adminUseable.equals("활동중")) {
        session.setAttribute("userId", userId);
        session.setAttribute("nickname", nickname);
        session.setAttribute("useable", adminUseable);
        session.setAttribute("rank", adminRank);

        response.sendRedirect("infectedCount.jsp");
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 로그인 실패"/>
        <jsp:param name="enhanceContent" value="정지"/>
        <jsp:param name="content" value="된 계정입니다. 특수 관리자에게 문의하세요."/>
        <jsp:param name="toHref" value="infectedCount.jsp"/>
        <jsp:param name="toHrefContent" value="메인으로 이동"/>
    </jsp:forward>
<%
    }
%>
