<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-30
  Time: 오후 5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");

    int result = -1;
    PreparedStatement psmt = null;
    String query = "INSERT INTO wait_admins(admin_id, admin_pwd, admin_nickname, admin_phone_num, admin_email, admin_apply_time) " +
            "VALUES(?, ?, ?, ?, ?, NOW())";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        psmt.setString(2, password);
        psmt.setString(3, nickname);
        psmt.setString(4, tel);
        psmt.setString(5, email);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    if(result == 1) {
%>
    <jsp:forward page="processSuccessPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 가입신청 완료"/>
        <jsp:param name="enhanceContent" value="가입신청"/>
        <jsp:param name="content" value="이 완료되었습니다."/>
        <jsp:param name="toHref" value="infectedCount.jsp"/>
        <jsp:param name="toHrefContent" value="메인으로 이동"/>
    </jsp:forward>
<%
    } else {
        // 실패..
    }
%>

