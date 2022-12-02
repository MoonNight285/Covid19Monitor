<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오전 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    String contentType = request.getParameter("contentType");
    String searchTitle = request.getParameter("searchTitle");
    String query = "";
    String noticeCountSelectQuery = "SELECT MOD(COUNT(*),5) FROM posting "; // 한페이지에 최대 5개씩 보여준다.

    if (searchTitle != null && contentType.equals("FAQ")) {
        query = "SELECT idx, posting_name, posting_author, posting_view_count, posting_create_time FROM posting " +
                "WHERE posting_type = 'F' AND posting_name LIKE '%" + searchTitle + "%' ";
    } else if (searchTitle == null && contentType.equals("FAQ")) {
        query = "SELECT idx, posting_name, posting_author, posting_view_count, posting_create_time FROM posting " +
                "WHERE posting_type = 'F'";
    } else if (searchTitle != null && contentType.equals("Notice")) {
        query = "SELECT idx, posting_name, posting_author, posting_view_count, posting_create_time FROM posting " +
                "WHERE posting_type = 'N' AND posting_name LIKE '%" + searchTitle + "%' ";
    } else if (searchTitle == null && contentType.equals("Notice")) {
        query = "SELECT idx, posting_name, posting_author, posting_view_count, posting_create_time FROM posting " +
                "WHERE posting_type = 'N'";
    }
%>

<html>
    <head>
        <title>코로나 모니터 - FAQ & 공지사항</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/commonDesign.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                const btnFAQ = $("#btn-FAQ");
                const btnNotice = $("#btn-notice");
                const btnWrite = $("#btn-write");
                const btnSearchContent = $("#btn-search-content");
                const sendForm = $("#send-form");
                const contentType = $("#content-type");
                const contentTypeVar = "<%=contentType%>"; // 글의 타입을 저장하고있는 JSP 변수를 가져온다.
                const searchContent = $("#search-content"); // 검색하는 부분의 input 태그 이름
                const searchTitle = $("#search-title"); // 파라미터로 넘겨주는 input 태그 이름

                if (contentTypeVar == "FAQ") {
                    btnFAQ.addClass("active");
                }
                else if (contentTypeVar == "Notice") {
                    btnNotice.addClass("active");
                }

                btnFAQ.on("click", function () {
                    contentType.val("FAQ");
                    sendForm.attr("action", "notice.jsp");
                    sendForm.attr("method", "get");
                });

                btnNotice.on("click", function () {
                    contentType.val("Notice");
                    sendForm.attr("action", "notice.jsp");
                    sendForm.attr("method", "get");
                });

                btnSearchContent.on("click", function () {
                    const btnFAQClasses = btnFAQ.attr("class");
                    const activeIdx = btnFAQClasses.indexOf("active");

                    // btnFAQ 에 불이 들어왔다는건 공지사항 버튼에는 불이 없다는것을 의미..
                    if (activeIdx != -1) {
                        contentType.val("FAQ");
                        searchTitle.val(searchContent.val());
                        sendForm.attr("action", "notice.jsp");
                        sendForm.attr("method", "get");
                    } else { // 공지사항 버튼에 불이 들어온경우..
                        contentType.val("Notice");
                        searchTitle.val(searchContent.val());
                        sendForm.attr("action", "notice.jsp");
                        sendForm.attr("method", "get");
                    }
                });
                
                btnWrite.on("click", function () {
                    const loginNickname = "<%=session.getAttribute("nickname")%>";
                    const userNickname = $("#header-user-nickname").text();
                    
                    if (userNickname == "") {
                        sendForm.attr("action", "login.jsp");
                        sendForm.attr("method", "get");
                    }
                    
                    if (loginNickname == userNickname) {
                        sendForm.attr("action", "noticeCreate.jsp");
                        sendForm.attr("method", "get");
                    }
                    
                });
            });
        </script>
    </head>
    <body>
        <form id="send-form">
            <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row mt-5">
                    <div class="col-sm-12 mx-auto">
                        <h1 class="display-3 banner text-center"><span id="">도움이</span></h1>
                        <h1 class="display-3 banner text-center">필요한가요?</h1>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-12 mx-auto d-flex justify-content-end">
                        <button id="btn-FAQ" class="btn btn-outline-dark">FAQ</button>
                        <button id="btn-notice" class="btn btn-outline-dark mx-2">공지사항</button>
                        <button id="btn-write" class="btn btn-outline-success">글쓰기</button>
                    </div>
                </div>
                <div class="row my-2">
                    <div class="col-sm-8"></div>
                    <div class="col-sm-4 mx-auto d-flex justify-content-end">
                        <div class="input-group mb-3">
                            <input id="search-content" type="text" class="form-control" placeholder="검색할 제목을 입력">
                            <button id="btn-search-content" class="btn btn-dark">검색</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 mx-auto">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>조회수</th>
                                <th>글 제목</th>
                                <th>작성자</th>
                                <th>작성시간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                PreparedStatement psmt = null;
                                ResultSet rs = null;

                                try {
                                    psmt = conn.prepareStatement(query);
                                    rs = psmt.executeQuery();

                                    while(rs.next()) {
                                        int idx = rs.getInt("idx");
                                        String postingName = rs.getString("posting_name");
                                        String postingAuthor = rs.getString("posting_author");
                                        int postingViewCount = rs.getInt("posting_view_count");
                                        String postingCreateTime = rs.getString("posting_create_time");
                            %>
                            <tr onclick="location.href='noticeDetail.jsp?idx=<%=idx%>'" style="cursor: hand">
                                <td><%=idx%></td>
                                <td><%=postingViewCount%></td>
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
                                    // conn 은 밑에서 close 처리
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 mx-auto d-flex justify-content-center">
                        <nav>
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        <span>&laquo;</span>
                                    </a>
                                </li>
                                <%
                                    PreparedStatement psmt2 = null;
                                    ResultSet rs2 = null;
                                    int noticeCount = 0;
                                    
                                    try {
                                        psmt2 = conn.prepareStatement(noticeCountSelectQuery);
                                        rs2 = psmt2.executeQuery();
                                        
                                        if (rs2.next()) {
                                            noticeCount = rs2.getInt("MOD(COUNT(*),5)");
                                        }
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                        throw new SQLException();
                                    } finally {
                                        if (rs2 != null) { rs2.close(); }
                                        if (psmt2 != null) { psmt2.close(); }
                                        if (conn != null) { conn.close(); }
                                    }
                                    
                                    for (int i = 0; i < noticeCount; ++i) {
                                %>
                                <li class="page-item"><a class="page-link" href="#"><%=i + 1%></a></li>
                                <%
                                    }
                                %>
                                <li class="page-item">
                                    <a class="page-link" href="#">
                                        <span>&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <input id="content-type" name="contentType" type="hidden">
            <input id="search-title" name="searchTitle" type="hidden">
        </form>
    </body>
</html>
