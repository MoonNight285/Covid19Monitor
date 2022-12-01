<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-01
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
    <div class="row mt-5">
      <div class="col-sm-12 mx-auto">
        <h1 class="display-3 banner text-center"><span id="">도움이</span></h1>
        <h1 class="display-3 banner text-center">필요한가요?</h1>
      </div>
    </div>
    <div class="row my-2">
      <div class="col-sm-12 mx-auto d-flex justify-content-end">
        <button id="btn-FAQ" class="btn btn-outline-dark active">FAQ</button>
        <button id="btn-notice" class="btn btn-outline-dark mx-2">공지사항</button>
        <button id="btn-write" class="btn btn-outline-success">글쓰기</button>
      </div>
    </div>
    <div class="row my-2">
      <div class="col-sm-8"></div>
      <div class="col-sm-4 mx-auto d-flex justify-content-end">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="검색할 제목을 입력" aria-label="Recipient's username" aria-describedby="basic-addon2">
          <button type="button" class="btn btn-dark">검색</button>
        </div>
      </div>
    </div>
</body>
