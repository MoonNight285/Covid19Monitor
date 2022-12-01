<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-01
  Time: 오후 5:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>
<body>
    <div class="row">
        <div class="col-sm-12 mx-auto">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>글 제목</th>
                        <th>작성자</th>
                        <th>작성시간</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    PreparedStatement psmt = null;
                    ResultSet rs = null;
                    String query = request.getParameter("query");

                    try {
                      psmt = conn.prepareStatement(query);
                      rs = psmt.executeQuery();

                    while(rs.next()) {
                      int idx = rs.getInt("idx");
                      String postingName = rs.getString("posting_name");
                      String postingAuthor = rs.getString("posting_author");
                      String postingCreateTime = rs.getString("posting_create_time");
                %>
                <tr>
                    <td><%=idx%></td>
                    <td><%=postingName%></td>
                    <td><%=postingAuthor%></td>
                    <td><%=postingCreateTime%></td>
                </tr>
                <%
                          }
                      } catch (SQLException ex) {
                        ex.printStackTrace();
                        throw new SQLException();
                      } finally {
                        if (rs != null) { rs.close(); }
                        if (psmt != null) { psmt.close(); }
                        if (conn != null) { conn.close(); }
                      }
                %>
                </tbody>
            </table>
        </div>
    </div>
</body>
