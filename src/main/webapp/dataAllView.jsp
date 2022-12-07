<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-06
  Time: 오후 7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cityName = request.getParameter("responseCityName"); // 서버로부터 응답받은 도시이름
    String incDec = request.getParameter("incDec"); // 전일 대비 확진자 증감수
    String isolIngCnt = request.getParameter("isolIngCnt"); // 격리 중환자 수
    String localOccCnt = request.getParameter("localOccCnt"); // 지역 발생수
    String overFlowCnt = request.getParameter("overFlowCnt"); // 해외 유입수
    String deathCnt = request.getParameter("deathCnt"); // 누적 사망자
    
    if (cityName == null) {
        cityName = "시도 선택 안함";
    }
    
    if (incDec == null) {
        incDec = "0";
    }
    
    if (isolIngCnt == null) {
        isolIngCnt = "0";
    }
    
    if (localOccCnt == null) {
        localOccCnt = "0";
    }
    
    if (overFlowCnt == null) {
        overFlowCnt = "0";
    }
    
    if (deathCnt == null) {
        deathCnt = "0";
    }
%>

<html>
<head>
    <title>코로나 모니터 - 모든 데이터 한눈에 보기</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            let isFirstClick = true;
            const btnSearch = $("#btn-search");
            const btnHiddenSearch = $("#btn-hidden-search");
            const selectedCity = $("#selected-city");
            const searchDate = $("#search-date");
            const loading = $("#div_load_image");
            
            loading.hide();
            
            btnSearch.on("click", function () {
                if (selectedCity.val() == "시도선택") {
                    alert("시도가 선택되지 않았습니다!");
                    return;
                }
                
                sDate = new Date(searchDate.val());
                if (isNaN(sDate)) {
                    alert("조회날짜가 비어있습니다!");
                    return;
                }
    
                if(isFirstClick == false) {
                    alert("이미 조회중입니다. 잠시만 기다려주세요...");
                    return;
                } else {
                    isFirstClick = false;
                }
                
                loading.show();
                btnHiddenSearch.click();
            });
        });
    </script>
    <style>
        @media screen and (max-width: 1200px) {
            #search-area {
                display: flex;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container" id="main">
        <div class="spinner-border text-dark" id="div_load_image" style="position:absolute; top:45%; left:45%;width:100px;height:100px; z-index:9999; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
        </div>
        <div class="row my-3">
            <div class="col-sm-12 text-center">
                <h1 class="display-2 banner">데이터 한눈에 보기</h1>
            </div>
        </div>
        <form action="dataAllReadProcessor.jsp" method="get">
            <div class="row mb-2">
                <div class="col-xl-3 col-xxl-3"></div>
                <div class="col-sm-10 col-md-8 col-lg-7 col-xl-3 col-xxl-3 mx-auto d-flex">
                    <select id="selected-city" class="form-select mb-3" name="selectedCity">
                        <option selected>시도선택</option>
                        <option>서울</option>
                        <option>경기</option>
                        <option>인천</option>
                        <option>강원</option>
                        <option>충북</option>
                        <option>충남</option>
                        <option>대전</option>
                        <option>세종</option>
                        <option>광주</option>
                        <option>전북</option>
                        <option>전남</option>
                        <option>경북</option>
                        <option>경남</option>
                        <option>대구</option>
                        <option>부산</option>
                        <option>울산</option>
                        <option>제주</option>
                    </select>
                </div>
                <div class="col-sm-10 col-md-8 col-lg-7 col-xl-3 col-xxl-3 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="search-date" name="searchDate">
                        <label for="search-date">조회날짜 선택</label>
                    </div>
                </div>
                <div id="search-area" class="col-sm-12 col-xl-2 justify-content-center align-self-center">
                    <button id="btn-search" type="button" class="btn btn-outline-dark">조회</button>
                    <button id="btn-hidden-search" type="submit" style="display: none"></button>
                </div>
                <div class="col-xl-1"></div>
            </div>
        </form>
        <div class="row">
            <div class="col-sm-12 col-lg-9 col-xl-8 col-xxl-6 mx-auto mb-5">
                <jsp:include page="chartViewAllData.jsp">
                    <jsp:param name="cityName" value="<%=cityName%>"/>
                    <jsp:param name="incDecValue" value="<%=incDec%>"/>
                    <jsp:param name="isolIngCntValue" value="<%=isolIngCnt%>"/>
                    <jsp:param name="localOccCntValue" value="<%=localOccCnt%>"/>
                    <jsp:param name="overFlowCntValue" value="<%=overFlowCnt%>"/>
                    <jsp:param name="deathCntValue" value="<%=deathCnt%>"/>
                </jsp:include>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
