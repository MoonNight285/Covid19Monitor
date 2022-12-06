<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-26
  Time: 오후 6:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String[] dates = new String[5];
    for(int i = 0; i < dates.length; ++i) {
        dates[i] = request.getParameter("date" + (i + 1));
        if(dates[i] == "") {
            dates[i] = "날짜 선택 없음";
        }
    }
%>

<html>
<head>
    <title>차트 테스트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div style="max-width: 900px; height: 100%">
        <canvas id="myChart"></canvas>
    </div>
    <input id="data1" type="hidden" value='<%=request.getParameter("data1")%>'>
    <input id="data2" type="hidden" value='<%=request.getParameter("data2")%>'>
    <input id="data3" type="hidden" value='<%=request.getParameter("data3")%>'>
    <input id="data4" type="hidden" value='<%=request.getParameter("data4")%>'>
    <input id="data5" type="hidden" value='<%=request.getParameter("data5")%>'>

    <input id="date1" type="hidden" value="<%=dates[0]%>">
    <input id="date2" type="hidden" value="<%=dates[1]%>">
    <input id="date3" type="hidden" value="<%=dates[2]%>">
    <input id="date4" type="hidden" value="<%=dates[3]%>">
    <input id="date5" type="hidden" value="<%=dates[4]%>">

    <input id="selected-city" type="hidden" value="<%=request.getParameter("selectedCity")%>">
</body>

<script>
    const ctx = document.getElementById('myChart');

    const data1 = document.getElementById('data1').value;
    const data2 = document.getElementById('data2').value;
    const data3 = document.getElementById('data3').value;
    const data4 = document.getElementById('data4').value;
    const data5 = document.getElementById('data5').value;

    const date1 = document.getElementById('date1').value;
    const date2 = document.getElementById('date2').value;
    const date3 = document.getElementById('date3').value;
    const date4 = document.getElementById('date4').value;
    const date5 = document.getElementById('date5').value;

    const city = document.getElementById('selected-city').value;

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [date1, date2, date3, date4, date5],
            datasets: [{
                label: city,
                data: [data1, data2, data3, data4, data5],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</html>
