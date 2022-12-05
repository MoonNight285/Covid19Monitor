<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-03
  Time: 오후 5:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sqlConnector.jsp"%>

<%
    String userId = session.getAttribute("userId").toString();
    PreparedStatement psmt = null;
    ResultSet rs = null;
    String query = "SELECT admin_phone_num, admin_email FROM admins " +
            "WHERE admin_id = ? ";
    String phoneNumber = "";
    String email = "";

    try {
        psmt = conn.prepareStatement(query);
        psmt.setString(1, userId);
        rs = psmt.executeQuery();

        if (rs.next()) {
            phoneNumber = rs.getString("admin_phone_num");
            email = rs.getString("admin_email");
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
    <title>코로나 모니터 - 관리자 정보 수정</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            const btnEdit = $("#btn-edit");
            const btnHiddenEdit = $("#btn-hidden-edit");

            btnEdit.on("click", function () {
                if(confirm("정말로 수정하시겠습니까?")) {
                    btnHiddenEdit.click();
                }
            });
        });
    </script>
    <style>
        img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container" id="main">
        <div class="row my-5"></div>
        <div class="row mt-5">
            <div class="col-sm-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="my-3 text-center">
                            <img src="img/user.png">
                        </div>
                        <div class="text-center my-3">
                            <input type="file">
                        </div>
                        <form class="mb-3" action="adminEditProcessor.jsp" method="POST">
                            <div class="mb-3 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="tel">전화번호</label>
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="tel" id="tel" class="form-control" name="phoneNumber" placeholder="전화번호를 입력하세요."
                                        value="<%=phoneNumber%>"/>
                                </div>
                            </div>
                            <div class="mb-5 form-password-toggle">
                                <div class="d-flex justify-content-between">
                                    <label class="form-label" for="email">이메일</label>
                                </div>
                                <div class="input-group input-group-merge">
                                    <input type="email" id="email" class="form-control" name="email" placeholder="이메일을 입력하세요."
                                        value="<%=email%>"/>
                                </div>
                            </div>
                            <div class="mb-3">
                                <a href="adminInfo.jsp"><button id="btn-back" type="button" class="btn btn-dark d-grid w-100">돌아가기</button></a>
                            </div>
                            <div class="mb-3">
                                <button id="btn-edit" class="btn btn-primary d-grid w-100" type="button">수정하기</button>
                                <button id="btn-hidden-edit" type="submit" style="display: none"></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-5"></div>
    </div>
</body>
</html>
