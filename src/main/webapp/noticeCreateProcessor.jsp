<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="sqlConnector.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");
    String postingType = request.getParameter("postingType");
    String postingContentName = request.getParameter("postingContentName");
    String postingContent = request.getParameter("postingContent");
    
    PreparedStatement psmt = null;
    String query = "";
    int result = 0;
    
    if (postingType.equals("FAQ")) {
        query = "INSERT INTO posting(posting_name, posting_author, posting_create_time, posting_contents, posting_type) " +
                "VALUES(?, ?, NOW(), ?, 'F') ";
    } else if (postingType.equals("Notice")) {
        query = "INSERT INTO posting(posting_name, posting_author, posting_create_time, posting_contents, posting_type) " +
                "VALUES(?, ?, NOW(), ?, 'N') ";
    }
    
    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, postingContentName);
        psmt.setString(2, session.getAttribute("nickname").toString());
        psmt.setString(3, postingContent);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }
    
    if (result == 1) {
        if (postingType.equals("FAQ")) {
            response.sendRedirect("notice.jsp?contentType=FAQ");
        } else if (postingType.equals("Notice")) {
            response.sendRedirect("notice.jsp?contentType=Notice");
        }
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 게시글 작성 실패"/>
        <jsp:param name="enhanceContent" value="신규글 작성"/>
        <jsp:param name="content" value="에 실패하였습니다.."/>
        <jsp:param name="toHref" value="notice.jsp?contentType=FAQ"/>
        <jsp:param name="toHrefContent" value="FAQ & 공지사항으로 이동"/>
    </jsp:forward>
<%
    }
%>
