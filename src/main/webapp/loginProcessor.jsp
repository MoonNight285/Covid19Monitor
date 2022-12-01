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

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT admin_nickname FROM admins WHERE admin_id = ? ";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        rs = psmt.executeQuery();

        if (rs.next()) {
            nickname = rs.getString("admin_nickname");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw new SQLException();
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    session.setAttribute("userId", userId);
    session.setAttribute("nickname", nickname);

    int queryIdx = preUrl.indexOf("?");

    // 쿼리 파라미터가 있는경우 자르기
    if (queryIdx != -1) {
        preUrl = preUrl.substring(0, queryIdx);
    }

    // .jsp 경로만 가져오기
    File file = new File(preUrl);
    preUrl = file.getName();
    file = null;

    // 현황표 페이지에서 로그인 시도한경우
    if (preUrl.equals("infectedCountProcessor.jsp")) {
        preUrl = "infectedCount.jsp";
    }

    response.sendRedirect(preUrl);
%>
