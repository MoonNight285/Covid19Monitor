<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String postingType = request.getParameter("postingType");
    String postingName = request.getParameter("postingName");
    String postingContent = request.getParameter("postingContent");
    
    PreparedStatement psmt = null;
    int result = 0;
    String query = "";
    
    if (postingType.equals("FAQ")) {
        query = "UPDATE posting SET posting_name = ?, posting_contents = ?, " +
              "posting_type = 'F' , posting_update_time = NOW() " +
              "WHERE idx = ? ";
    } else if (postingType.equals("Notice")) {
        query = "UPDATE posting SET posting_name = ?, posting_contents = ?, " +
              "posting_type = 'N' , posting_update_time = NOW() " +
              "WHERE idx = ? ";
    }
    
    try  {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, postingName);
        psmt.setString(2, postingContent);
        psmt.setInt(3, idx);
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
        // 실패
    }
%>
