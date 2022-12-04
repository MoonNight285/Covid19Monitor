<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-04
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String targetId = request.getParameter("id");

    PreparedStatement psmt = null;
    ResultSet rs = null;
    int result = 0;
    String query1 = "SELECT admin_pwd, admin_nickname, admin_phone_num, admin_email FROM wait_admins " +
            "WHERE admin_id = ? ";
    String query2 = "INSERT INTO admins(admin_id, admin_pwd, admin_nickname, admin_phone_num, admin_email) " +
            "VALUES (?, ?, ?, ?, ?) ";
    String query3 = "DELETE FROM wait_admins WHERE admin_id = ? ";

    try {
        psmt = conn.prepareStatement(query1);
        psmt.setString(1, targetId);
        rs = psmt.executeQuery();

        String pwd = "";
        String nickname = "";
        String phoneNum = "";
        String email = "";

        if (rs.next()) {
            pwd = rs.getString("admin_pwd");
            nickname = rs.getString("admin_nickname");
            phoneNum = rs.getString("admin_phone_num");
            email = rs.getString("admin_email");
        } else {
            throw new Exception("일치하는 아이디가 존재하지않음");
        }

        psmt = conn.prepareStatement(query2);
        psmt.setString(1, targetId);
        psmt.setString(2, pwd);
        psmt.setString(3, nickname);
        psmt.setString(4, phoneNum);
        psmt.setString(5, email);
        result = psmt.executeUpdate();

        if (result == 0) {
            throw new Exception("회원가입 진행이 정상적으로 되지않음");
        }

        psmt = conn.prepareStatement(query3);
        psmt.setString(1, targetId);
        result = psmt.executeUpdate();

        if (result == 0) {
            throw new Exception("가입대기 테이블에 있는 데이터 삭제가 정상적으로 진행되지않음");
        }
    } catch(SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    response.sendRedirect("adminInfo.jsp?tableType=waitAdmins&idx=0");
%>
