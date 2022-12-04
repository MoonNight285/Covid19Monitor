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
    String th1 = "", th2 = "", th3 = "", th4 = "";
    String tableName = "";

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "";
    String rowCountSelectQuery = "";
    String adminId = "", adminNickname = "", adminUseable = "", adminApplyTime = "", adminRank = "";

    final int SEARCH_ROW_COUNT = 13;

    if (tableType.equals("admins")) {
        tableName = "활동중인 관리자 목록";
        th1 = "아이디";
        th2 = "닉네임";
        th3 = "활동상태";
        th4 = "권한";
        query = "SELECT admin_id, admin_nickname, admin_useable, admin_rank FROM admins LIMIT ?, ? ";
        rowCountSelectQuery = "SELECT COUNT(*) FROM admins ";
    } else if (tableType.equals("waitAdmins")) {
        tableName = "신청 대기중인 관리자 목록";
        th1 = "아이디";
        th2 = "닉네임";
        th3 = "신청시간";
        th4 = "승인여부";
        query = "SELECT admin_id, admin_nickname, admin_apply_time FROM wait_admins LIMIT ?, ? ";
        rowCountSelectQuery = "SELECT COUNT(*) FROM wait_admins ";
    }
%>

<head>
    <script>
        $(document).ready(function () {
            const pageList = $(".page-list");
            const jspPageNumber = "<%=pageIdx + 1%>";
            const jspAdminRank = "<%=session.getAttribute("rank").toString()%>";
            const joinReject = $(".join-reject");
            const joinOk = $(".join-ok");
            const adminUseableChange = $(".admin-useable-change");
            const adminRankChange = $(".admin-rank-change");

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

            joinReject.on("click", function () {
                if (jspAdminRank == "일반 관리자") {
                    alert("일반 관리자는 권한이 없습니다. 특수 관리자에게 문의하세요.");
                    return;
                }

                if (confirm("정말로 거절하시겠습니까?")) {
                    const targetId = $(this).attr("href").split("#")[1];
                    $(this).attr("href", "adminJoinRejectProcessor.jsp?id=" + targetId);
                }
            });

            joinOk.on("click", function () {
                if (jspAdminRank == "일반 관리자") {
                    alert("일반 관리자는 권한이 없습니다. 특수 관리자에게 문의하세요.");
                    return;
                }

                if (confirm("정말로 수락하시겠습니까?")) {
                    const targetId = $(this).attr("href").split("#")[1];
                    $(this).attr("href", "adminJoinOkProcessor.jsp?id=" + targetId);
                }
            });

            adminUseableChange.on("click", function () {
                if (jspAdminRank == "일반 관리자") {
                    alert("일반 관리자는 권한이 없습니다. 특수 관리자에게 문의하세요.");
                    return;
                }

                if (confirm("대상 관리자의 활동 상태를 변경하시겠습니까?")) {
                    const targetId = $(this).attr("href").split("#")[1];
                    const targetUseStatement = $(this).text();
                    $(this).attr("href", "adminUseableChangeProcessor.jsp?id=" + targetId +
                        "&useStatement=" + targetUseStatement);
                }
            });

            adminRankChange.on("click", function () {
                if (jspAdminRank == "일반 관리자") {
                    alert("일반 관리자는 권한이 없습니다. 특수 관리자에게 문의하세요.");
                    return;
                }

                if (confirm("대상 관리자의 등급을 변경하시겠습니까?")) {
                    const targetId = $(this).attr("href").split("#")[1];
                    const targetRank = $(this).text();
                    $(this).attr("href", "adminRankChangeProcessor.jsp?id=" + targetId +
                        "&rank=" + targetRank);
                }
            });
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
                    <th><%=th4%></th>
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
                                adminRank = rs.getString("admin_rank");

                                if (adminUseable.equals("Y")) {
                                    adminUseable = "활동중";
                                } else {
                                    adminUseable = "정지됨";
                                }

                                if (adminRank.equals("N")) {
                                    adminRank = "일반 관리자";
                                } else {
                                    adminRank = "특수 관리자";
                                }
                %>
                <tr>
                    <td><%=adminId%></td>
                    <td><%=adminNickname%></td>
                    <td><a class="admin-useable-change" href="#<%=adminId%>"><%=adminUseable%><a/></td>
                    <td><a class="admin-rank-change" href="#<%=adminId%>"><%=adminRank%></a></td>
                </tr>
                <%
                    } else {
                        adminId = rs.getString("admin_id");
                        adminNickname = rs.getString("admin_nickname");
                        adminApplyTime = rs.getString("admin_apply_time");
                %>
                <tr>
                    <td><%=adminId%></td>
                    <td><%=adminNickname%></td>
                    <td><%=adminApplyTime%></td>
                    <td><a class="join-ok" href="#<%=adminId%>">승인</a>&nbsp;/&nbsp;<a class="join-reject" href="#<%=adminId%>">거부</a></td>
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
