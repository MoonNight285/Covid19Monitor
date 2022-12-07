<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    
    PreparedStatement psmt = null;
    int result = 0;
    String query = "DELETE FROM posting WHERE idx = ? ";
    
    try {
        psmt = conn.prepareStatement(query);
        psmt.setInt(1, idx);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }
    
    if (result == 1) {
        response.sendRedirect("notice.jsp?contentType=FAQ");
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 게시글 삭제 실패"/>
        <jsp:param name="enhanceContent" value="게시글 삭제"/>
        <jsp:param name="content" value="에 실패하였습니다.."/>
        <jsp:param name="toHref" value="notice.jsp?contentType=FAQ"/>
        <jsp:param name="toHrefContent" value="FAQ & 공지사항으로 이동"/>
    </jsp:forward>
<%
    }
%>
