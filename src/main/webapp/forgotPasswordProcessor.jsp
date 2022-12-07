<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오후 3:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="mail.MailSend" %>
<%@ page import="java.util.Random" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");

    Random random = new Random(System.currentTimeMillis());
    int randomNumber = random.nextInt(888888) + 111111;
    PreparedStatement psmt = null;
    int result = 0;
    String query = "UPDATE admins SET admin_pwd = ? WHERE admin_email = ? ";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, String.valueOf(randomNumber));
        psmt.setString(2, email);
        result = psmt.executeUpdate();
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }

    if (result == 1) {
        MailSend ms = new MailSend(email, "임시 비밀번호가 발급되었습니다.", "임시 비밀번호 : " + randomNumber + "\n" +
            "가급적이면 비밀번호를 바꿔서 사용해주시길바랍니다.");
        ms.MailSend();
%>
    <jsp:forward page="processSuccessPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 메일 전송 완료"/>
        <jsp:param name="enhanceContent" value="메일"/>
        <jsp:param name="content" value="이 발송되었습니다."/>
        <jsp:param name="toHref" value="dataView.jsp"/>
        <jsp:param name="toHrefContent" value="메인으로 이동"/>
    </jsp:forward>
<%
    } else {
%>
    <jsp:forward page="processFailPage.jsp">
        <jsp:param name="title" value="코로나 모니터 - 메일 전송 실패"/>
        <jsp:param name="enhanceContent" value="메일 전송"/>
        <jsp:param name="content" value="에 실패하였습니다.."/>
        <jsp:param name="toHref" value="dataView.jsp"/>
        <jsp:param name="toHrefContent" value="메인으로 이동"/>
    </jsp:forward>
<%
    }
%>
