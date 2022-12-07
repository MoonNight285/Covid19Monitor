<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-04
  Time: 오후 2:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    String userId = session.getAttribute("userId").toString();
    request.setCharacterEncoding("UTF-8");
    String newPassword = request.getParameter("newPassword");

    PreparedStatement psmt = null;
    int result = 0;
    String query = "UPDATE admins SET admin_pwd = ? WHERE admin_id = ? ";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, newPassword);
        psmt.setString(2, userId);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    if (result == 1) {
%>
    <jsp:forward page="processSuccessPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 비밀번호 변경 완료"/>
        <jsp:param name="enhanceContent" value="비밀번호"/>
        <jsp:param name="content" value="가 변경되었습니다."/>
        <jsp:param name="toHref" value="adminInfo.jsp"/>
        <jsp:param name="toHrefContent" value="관리자 전용 페이지로 이동"/>
    </jsp:forward>
<%
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 비밀번호 변경 실패"/>
        <jsp:param name="enhanceContent" value="변경"/>
        <jsp:param name="content" value="에 실패하였습니다.."/>
        <jsp:param name="toHref" value="adminInfo.jsp"/>
        <jsp:param name="toHrefContent" value="관리자 전용 페이지로"/>
    </jsp:forward>
<%
    }
%>