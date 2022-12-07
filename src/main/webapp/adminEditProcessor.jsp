<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-03
  Time: 오후 8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String userId = session.getAttribute("userId").toString();
    String phoneNumber = request.getParameter("phoneNumber");
    String email = request.getParameter("email");

    PreparedStatement psmt = null;
    String query = "UPDATE admins SET admin_phone_num = ?, admin_email = ? " +
            "WHERE admin_id = ? ";
    int result = 0;

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, phoneNumber);
        psmt.setString(2, email);
        psmt.setString(3, userId);
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
        <jsp:param name="title" value="코로나 모니터 - 수정 완료"/>
        <jsp:param name="enhanceContent" value="수정"/>
        <jsp:param name="content" value="이 완료되었습니다."/>
        <jsp:param name="toHref" value="adminInfo.jsp"/>
        <jsp:param name="toHrefContent" value="관리자 전용 페이지로"/>
    </jsp:forward>
<%
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 수정 실패"/>
        <jsp:param name="enhanceContent" value="수정"/>
        <jsp:param name="content" value="에 실패하였습니다.."/>
        <jsp:param name="toHref" value="adminInfo.jsp"/>
        <jsp:param name="toHrefContent" value="관리자 전용 페이지로"/>
    </jsp:forward>
<%
    }
%>