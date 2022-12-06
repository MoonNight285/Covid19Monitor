<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>

<%
    request.setCharacterEncoding("UTF-8");
    String dataType = request.getParameter("dataType");
    String title = "";

    if (dataType == null) {
        title = "누적 확진자 수";
        dataType = "defCnt";
    } else {
        switch (dataType) {
            case "defCnt" :
                title = "누적 확진자 수";
                break;
            case "incDec" :
                title = "전일 대비 확진자 증감수";
                break;
            case "isolClearCnt" :
                title = "누적 격리 해제수";
                break;
            case "isolIngCnt" :
                title = "격리 중환자 수";
                break;
            case "localOccCnt" :
                title = "지역 발생수";
                break;
            case "overFlowCnt" :
                title = "해외 유입수";
                break;
            case "qurRate" :
                title = "만명당 발생률";
                break;
        }
    }
%>

<html>
<head>
    <title>코로나 모니터 - <%=title%></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/commonDesign.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.addEventListener("hashchange", function () {
            const cityName = location.href.split("#")[1];
            const selectedCity = document.querySelector("#selected-city");
            switch (cityName) {
                case "seoul" :
                    selectedCity.value = "서울";
                    break;
                case "gygg" :
                    selectedCity.value = "경기";
                    break;
                case "incheon" :
                    selectedCity.value = "인천";
                    break;
                case "gangwon" :
                    selectedCity.value = "강원"
                    break;
                case "chungbuk" :
                    selectedCity.value = "충북";
                    break;
                case "chungnam" :
                    selectedCity.value = "충남";
                    break;
                case "daejeon" :
                    selectedCity.value = "대전";
                    break;
                case "sejong" :
                    selectedCity.value = "세종";
                    break;
                case "gwangju" :
                    selectedCity.value = "광주";
                    break;
                case "jeonbuk" :
                    selectedCity.value = "전북";
                    break;
                case "jeonnam" :
                    selectedCity.value = "전남";
                    break;
                case "gyeongbuk" :
                    selectedCity.value = "경북";
                    break;
                case "gyeongnam" :
                    selectedCity.value = "경남";
                    break;
                case "daegu" :
                    selectedCity.value = "대구";
                    break;
                case "busan" :
                    selectedCity.value = "부산";
                    break;
                case "ulsan" :
                    selectedCity.value = "울산";
                    break;
                case "jeju" :
                    selectedCity.value = "제주";
                    break;
            }
        });

        $(document).ready(function () {
            let isFirstClick = true;
            const loading = $("#div_load_image");
            const btnHiddenSearch = $("#btnHiddenSearch");
            const btnSearch = $("#search");
            const bannerWrapper = $("#banner-wrapper");
            const jspTitle = "<%=title%>";

            loading.hide();

            if (jspTitle == "누적 확진자 수" || jspTitle == "격리 중환자 수") {
                bannerWrapper.addClass("col-sm-8 col-md-7 col-lg-6 col-xl-5 col-xxl-4 mx-auto");
            } else if (jspTitle == "전일 대비 확진자 증감수") {
                bannerWrapper.addClass("col-sm-12 col-md-11 col-lg-9 col-xl-8 col-xxl-7 mx-auto");
            } else if (jspTitle == "누적 격리 해제수") {
                bannerWrapper.addClass("col-sm-9 col-md-8 col-lg-6 col-xl-6 col-xxl-5 mx-auto");
            } else if (jspTitle == "지역 발생수" || jspTitle == "해외 유입수") {
                bannerWrapper.addClass("col-sm-6 col-md-6 col-lg-5 col-xl-4 col-xxl-4 mx-auto");
            } else if (jspTitle == "만명당 발생률") {
                bannerWrapper.addClass("col-sm-7 col-md-6 col-lg-5 col-xl-5 col-xxl-4 mx-auto");
            }

            btnSearch.on("click", function () {
                const startTime = $("#start-time").val();
                const endTime = $("#end-time").val();
                const sDate = new Date(startTime);
                const eDate = new Date(endTime);
                const daySpan = (eDate.getTime() - sDate.getTime()) / (1000*60*60*24);
                const selectedCity = $("#selected-city").val();

                if(selectedCity == "null") {
                    alert("선택한 시도명이 비어있습니다.");
                    return;
                }

                if(isNaN(sDate.getFullYear()) || isNaN(eDate.getFullYear())) {
                    alert("검색 시작일 또는 종료일이 비어있습니다.");
                    return;
                }

                if(sDate > eDate) {
                    alert("검색 시작일은 종료일 보다 클수가 없습니다.");
                    return;
                }

                if(daySpan > 4) {
                    alert("검색 범위는 당일포함 최대 5일까지입니다.");
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
            #selected-city, #selected-city-label, #row-map {
                display: none;
            }

            #selected-city2, #search-button {
                display: flex;
            }
        }

        @media screen and (max-width: 600px) {
            #selected-city, #selected-city-label, #row-map {
                display: none;
            }

            #selected-city2, #search-button {
                display: flex;
            }

            .banner {
                text-align: center;
            }
        }
    </style>
</head>
<body id="body" style="margin:0px; height: auto">
    <div class="spinner-border text-dark" id="div_load_image" style="position:absolute; top:45%; left:45%;width:100px;height:100px; z-index:9999; filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; text-align:center">
    </div>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container" id="main">
        <div class="row my-5">
            <div id="banner-wrapper" class="">
                <h1 class="display-2 banner"><%=title%></h1>
            </div>
        </div>
        <form action="dataReadProcessor.jsp" method="get">
            <div class="row mb-2">
                <div class="col-xl-4 col-xxl-4"></div>
                <div class="col-sm-12 col-md-10 col-lg-7 col-xl-2 col-xxl-2 mx-auto">
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
                <div class="col-sm-12 col-md-10 col-lg-7 col-xl-2 col-xxl-2 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="start-time" name="startDate" value="<%=request.getParameter("startDate")%>">
                        <label for="start-time">조회 시작시간</label>
                    </div>
                </div>
                <div class="col-sm-12 col-md-10 col-lg-7 col-xl-2 col-xxl-2 mx-auto">
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="end-time" name="endDate" value="<%=request.getParameter("endDate")%>">
                        <label class="form-label" for="end-time">조회 종료시간</label>
                    </div>
                </div>
                <div id="search-button" class="col-sm-2 col-md-10 col-lg-7 col-xl-2 col-xxl-2 mt-2 justify-content-center mx-auto">
                    <button id="search" type="button" class="btn btn-outline-dark">조회</button>
                    <button id="btnHiddenSearch" type="submit" style="display: none"></button>
                </div>
            </div>
            <input type="hidden" name="dataType" value="<%=dataType%>">
        </form>
        <div class="row">
            <div id="row-map" class="col-sm-12 col-lg-3 col-xl-4 col-xxl-4 mx-auto mt-5">
                <jsp:include page="map.jsp"></jsp:include>
            </div>
            <div class="col-sm-12 col-lg-9 col-xl-8 col-xxl-8 mx-auto mb-5">
                <jsp:include page="chart.jsp">
                    <jsp:param name="data1" value='<%=request.getParameter("data1")%>'/>
                    <jsp:param name="data2" value='<%=request.getParameter("data2")%>'/>
                    <jsp:param name="data3" value='<%=request.getParameter("data3")%>'/>
                    <jsp:param name="data4" value='<%=request.getParameter("data4")%>'/>
                    <jsp:param name="data5" value='<%=request.getParameter("data5")%>'/>

                    <jsp:param name="date1" value='<%=request.getParameter("date1")%>'/>
                    <jsp:param name="date2" value='<%=request.getParameter("date2")%>'/>
                    <jsp:param name="date3" value='<%=request.getParameter("date3")%>'/>
                    <jsp:param name="date4" value='<%=request.getParameter("date4")%>'/>
                    <jsp:param name="date5" value='<%=request.getParameter("date5")%>'/>

                    <jsp:param name="selectedCity" value='<%=request.getParameter("selectedCity")%>'/>
                </jsp:include>
            </div>
        </div>
        <div class="row my-4"></div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
