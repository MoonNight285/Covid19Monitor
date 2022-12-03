<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-27
  Time: 오전 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    String postingName = "";
    String postingAuthor = "";
    int postingViewCount = 0;
    String postingCreateTime = "";
    String postingUpdateTime = "";
    String postingContents = "";

    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT posting_name, posting_author, posting_view_count, posting_create_time, " +
            "posting_update_time, posting_contents FROM posting WHERE idx = ? ";
    String postingViewCountUpdateQuery = "UPDATE posting SET posting_view_count = posting_view_count + 1 " +
            "WHERE idx = ? ";
    
    try {
        psmt = conn.prepareStatement(postingViewCountUpdateQuery);
        psmt.setInt(1, idx);
        psmt.executeUpdate();
        
        psmt = conn.prepareStatement(query);
        psmt.setInt(1, idx);
        rs = psmt.executeQuery();

        if (rs.next()) {
            postingName = rs.getString("posting_name");
            postingAuthor = rs.getString("posting_author");
            postingViewCount = rs.getInt("posting_view_count");
            postingCreateTime = rs.getString("posting_create_time");
            postingUpdateTime = rs.getString("posting_update_time");
            postingContents = rs.getString("posting_contents");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        throw ex;
    } finally {
        if (rs != null) { rs.close(); }
        if (psmt != null) { psmt.close(); }
        if (conn != null) { conn.close(); }
    }
%>

<html>
<head>
    <title>코로나 모니터 - 글 자세히 보기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function isLogin() {
            const userNickname = $("#header-user-nickname").text();
            if (userNickname == "") {
                return false;
            } else {
                return true;
            }
        }
        
        function isUserCheck() {
            const loginNickname = "<%=session.getAttribute("nickname")%>";
            const postingAuhtor = $("#posting-author").val();
    
            if (loginNickname == postingAuhtor) {
                return true;
            } else {
                return false;
            }
        }
        
        $(document).ready(function() {
            const btnUpdateContent = $("#btn-update-content");
            const btnDeleteContent = $("#btn-delete-content");
            const btnHidden = $("#btn-hidden");
            const sendForm = $("#send-form");
            
            btnUpdateContent.on("click", function () {
                if (isLogin() == false) {
                    sendForm.attr("action", "login.jsp");
                    sendForm.attr("method", "get");
                    btnHidden.click();
                    return;
                }
                
                if (isUserCheck()) {
                    sendForm.attr("action", "noticeUpdate.jsp");
                    sendForm.attr("method", "get");
                    btnHidden.click();
                } else {
                    alert("본인이 작성한 글만 수정할수있습니다!");
                }
            });
            
            btnDeleteContent.on("click", function () {
                if (isLogin() == false) {
                    sendForm.attr("action", "login.jsp");
                    sendForm.attr("method", "get");
                    btnHidden.click();
                    return;
                }
    
                if (isUserCheck()) {
                    if (confirm("정말로 삭제하시겠습니까?")) {
                        sendForm.attr("action", "noticeDeleteProcessor.jsp");
                        sendForm.attr("method", "get");
                        btnHidden.click();
                    } else {
                        alert("삭제가 취소되었습니다.");
                    }
                } else {
                    alert("본인이 작성한 글만 삭제할수 있습니다!");
                }
            });
        });
    </script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row mt-5">
            <div class="col-sm-12 mx-auto d-flex justify-content-center">
                <img src="img/advertisement.jpg" style="max-width: 100%; height: auto">
            </div>
        </div>
        <form id="send-form">
            <div class="row mt-3">
                <div class="col-sm-2 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-author" value="<%=postingAuthor%>" placeholder="작성자" readonly>
                        <label for="posting-author">작성자</label>
                    </div>
                </div>
                <div class="col-sm-10 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-name" value="<%=postingName%>" placeholder="글 제목" name="postingName" readonly>
                        <label for="posting-name">글 제목</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-number" value="<%=idx%>" name="idx" readonly>
                        <label for="posting-number">글 번호</label>
                    </div>
                </div>
                <div class="col-sm-2 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-view-count" value="<%=postingViewCount%>" readonly>
                        <label for="posting-view-count">조회수</label>
                    </div>
                </div>
                <div class="col-sm-4 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-create-time" value="<%=postingCreateTime%>" readonly>
                        <label for="posting-create-time">등록시간</label>
                    </div>
                </div>
                <div class="col-sm-4 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="posting-update-time" value="<%=postingUpdateTime%>" readonly>
                        <label for="posting-update-time">수정시간</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-12 mx-auto">
                    <div class="form-floating">
                        <textarea id="posting-contents" class="form-control" style="height: 350px; resize:none" name="postingContent" readonly><%=postingContents%></textarea>
                        <label for="posting-contents">글 내용</label>
                    </div>
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm-12 mx-auto d-flex justify-content-end">
                    <a href="notice.jsp?contentType=FAQ"><button id="btn-back" type="button" class="btn btn-outline-dark">목록으로</button></a>
                    <button id="btn-update-content" class="btn btn-outline-warning mx-2">수정</button>
                    <button id="btn-delete-content" type="button" class="btn btn-outline-danger">삭제</button>
                    <button id="btn-hidden" style="display: none"></button>
                </div>
            </div>
        </form>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
