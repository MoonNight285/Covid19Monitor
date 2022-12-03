<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-03
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String tableType = request.getParameter("tableType");
    int pageIdx = Integer.parseInt(request.getParameter("idx"));
    String th1 = "", th2 = "", th3 = "";
    String tableName = "";

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "";
    String rowCountSelectQuery = "";
    String adminId = "", adminNickname = "", adminUseable = "", adminApplyTime = "";

    final int SEARCH_ROW_COUNT = 13;

    if (tableType.equals("admins")) {
        tableName = "활동중인 관리자 목록";
        th1 = "아이디";
        th2 = "닉네임";
        th3 = "활동상태";
        query = "SELECT admin_id, admin_nickname, admin_useable FROM admins LIMIT ?, ? ";
        rowCountSelectQuery = "SELECT COUNT(*) FROM admins ";
    } else if (tableType.equals("waitAdmins")) {
        tableName = "신청 대기중인 관리자 목록";
        th1 = "아이디";
        th2 = "신청시간";
        th3 = "승인여부";
        query = "SELECT admin_id, admin_apply_time FROM wait_admins LIMIT ?, ? ";
        rowCountSelectQuery = "SELECT COUNT(*) FROM wait_admins ";
    }
%>

<head>
    <script>
        $(document).ready(function () {
            const pageList = $(".page-list");
            const jspPageNumber = "<%=pageIdx + 1%>";

            for (let i = 0; i < pageList.children().length; ++i) {
                if (pageList.children().eq(i).text() == jspPageNumber) {
                    pageList.children().eq(i).addClass("active");
                    break;
                }
            }

            if (jspPageNumber == 1) {
                pageList.children().first().addClass("disabled");
            }

            if (jspPageNumber == pageList.children().eq(pageList.children().length - 2).text() || pageList.children().length == 2) {
                pageList.children().last().addClass("disabled");
            }
        });
    </script>
</head>

<body>
    <div class="row">
        <div class="col">
            <p class="mb-0"><%=tableName%></p>
            <hr class="mt-0" style="width: 75%">
        </div>
    </div>
    <div class="row">
        <div class="col">
        <table class="table table-hover" style="width: 75%">
            <thead>
                <tr>
                    <th><%=th1%></th>
                    <th><%=th2%></th>
                    <th><%=th3%></th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        psmt = conn.prepareStatement(query);
                        psmt.setInt(1, pageIdx * SEARCH_ROW_COUNT);
                        psmt.setInt(2, SEARCH_ROW_COUNT);
                        rs = psmt.executeQuery();

                        while (rs.next()) {
                            if (tableType.equals("admins")) {
                                adminId = rs.getString("admin_id");
                                adminNickname = rs.getString("admin_nickname");
                                adminUseable = rs.getString("admin_useable");

                                if (adminUseable.equals("Y")) {
                                    adminUseable = "활동중";
                                } else {
                                    adminUseable = "정지됨";
                                }
                %>
                <tr>
                    <td><%=adminId%></td>
                    <td><%=adminNickname%></td>
                    <td><a href="#"><%=adminUseable%><a/></td>
                </tr>
                <%
                    } else {
                        adminId = rs.getString("admin_id");
                        adminApplyTime = rs.getString("admin_apply_time");
                %>
                <tr>
                    <td><%=adminId%></td>
                    <td><%=adminApplyTime%></td>
                    <td><a href="#">승인</a>&nbsp;/&nbsp;<a href="#">거부</a></td>
                </tr>
                <%
                            }
                        }
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                        throw ex;
                    } finally {
                        if (rs != null) { rs.close(); }
                        if (psmt != null) { psmt.close(); }
                    }
                %>
            </tbody>
        </table>
        <div style="width: 75%" class="d-flex justify-content-center">
            <nav>
                <ul class="pagination page-list">
                    <li class="page-item">
                        <a class="page-link" href="adminInfo.jsp?tableType=<%=tableType%>&idx=<%=pageIdx - 1%>">
                            <span>&laquo;</span>
                        </a>
                    </li>
                    <%
                        int rowCount = 0;
                        try {
                            psmt = conn.prepareStatement(rowCountSelectQuery);
                            rs = psmt.executeQuery();

                            if (rs.next()) {
                                rowCount = rs.getInt("COUNT(*)");
                            }
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                            throw ex;
                        } finally {
                            if (rs != null) { rs.close(); }
                            if (psmt != null) { psmt.close(); }
                            if (conn != null) { conn.close(); }
                        }

                        int addNumber = 1; // 한 페이지에 최대 9개 표시되는데 딱 맞춰서 게시물수가 떨어지면 값 보정
                        if (rowCount % SEARCH_ROW_COUNT == 0) {
                            addNumber = 0;
                        }

                        for (int i = 0; i < rowCount / SEARCH_ROW_COUNT + addNumber; ++i) {
                    %>
                    <li class="page-item"><a class="page-link" href="adminInfo.jsp?tableType=<%=tableType%>&idx=<%=i%>"><%=i + 1%></a></li>
                    <%
                        }
                    %>
                    <li class="page-item">
                        <a class="page-link" href="adminInfo.jsp?tableType=<%=tableType%>&idx=<%=pageIdx + 1%>">
                            <span>&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        </div>
    </div>
</body>
