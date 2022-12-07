<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-12-06
  Time: 오후 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    String cityName = request.getParameter("cityName"); // 선택한 도시이름
    String incDec = request.getParameter("incDecValue"); // 전일 대비 확진자 증감수
    String isolIngCnt = request.getParameter("isolIngCntValue"); // 격리 중환자 수
    String localOccCnt = request.getParameter("localOccCntValue"); // 지역 발생수
    String overFlowCnt = request.getParameter("overFlowCntValue"); // 해외 유입수
    String deathCnt = request.getParameter("deathCntValue"); // 누적 사망자
%>

<html>
<head>
    <title>코로나 모니터 - 모든 데이터 한눈에 보기</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div style="max-width: 700px; height: 100%">
        <canvas id="myChart"></canvas>
    </div>
</body>

<script>
    const config = document.getElementById('myChart');

    const data = {
        labels: [
            '전일 대비 확진자 증감수',
            '지역 발생수',
            '누적 사망자',
            '격리 중환자 수',
            '해외 유입수',
            '추가 예정',
            '추가 예정'
        ],
        datasets: [{
            label: "<%=cityName%>",
            data: ["<%=incDec%>", "<%=localOccCnt%>", "<%=deathCnt%>", "<%=overFlowCnt%>", "<%=isolIngCnt%>", "0", "0"],
            fill: true,
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor: 'rgb(255, 99, 132)',
            pointBackgroundColor: 'rgb(255, 99, 132)',
            pointBorderColor: '#fff',
            pointHoverBackgroundColor: '#fff',
            pointHoverBorderColor: 'rgb(255, 99, 132)'
        }]
    };

    new Chart(config, {
        type: 'radar',
        data: data,
        options: {
            elements: {
                line: {
                    borderWidth: 3
                }
            }
        },
    });
</script>

</html>
