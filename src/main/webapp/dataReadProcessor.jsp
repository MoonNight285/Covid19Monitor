<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-29
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Period" %>

<%!
    // API를 통해서 가져온 데이터를 클라이언트측으로 전달하기위해 데이터를 가공
    // dataName : XML 문서에서 얻고자하는 데이터의 태그 이름
    // result : 데이터 값을 저장할 배열 공간
    // labelDate : 날짜 값을 저장할 공간
    // itemNode : XML 문서의 node 값
    // standardDateString : 날짜 값
    // idx : 배열 인덱스 번호
    private void setData(String dataName, String[] result, String[] labelDate, Node itemNode, String standardDateString, int idx) {
        Element itemNodeElement = (Element) itemNode;
        NodeList defCntNodeList = itemNodeElement.getElementsByTagName(dataName).item(0).getChildNodes();
        Node defCntNode = defCntNodeList.item(0);
        result[idx] = defCntNode.getNodeValue();
        labelDate[idx] = standardDateString;
    }
%>

<%
    String[] result = new String[] {"0", "0", "0", "0", "0"}; // API 통해서 얻어온 결과값
    String[] labelDate = new String[] {"", "", "", "", ""}; // 날짜 정보
    request.setCharacterEncoding("UTF-8");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String selectedCity = request.getParameter("selectedCity");
    String dataType = request.getParameter("dataType");
    String serviceKey = "pAR7xB7Uwyh4RcIMj1YNS9nYmjzzbIEm%2BTOpaJa1IxsC%2FB7J96c6jR5lABRfJjfLbB323p8xThlPinRbLSe6pw%3D%3D";

    // 받은 날짜 데이터 문자 - 기준으로 자르기
    String[] tempStartDate = startDate.split("-");
    String[] tempEndDate = endDate.split("-");

    // 날짜 범위를 알기위해서 LocalDateTime 인스턴스 생성
    LocalDateTime startLocalDateTime = LocalDateTime.of(Integer.parseInt(tempStartDate[0]), Integer.parseInt(tempStartDate[1])
            , Integer.parseInt(tempStartDate[2]), 0, 0, 0);
    LocalDateTime endLocalDateTime = LocalDateTime.of(Integer.parseInt(tempEndDate[0]), Integer.parseInt(tempEndDate[1]),
            Integer.parseInt(tempEndDate[2]), 0, 0, 0);

    // 날짜 범위 계산 당일일시 0으로 나온다...
    Period diff = Period.between(startLocalDateTime.toLocalDate(), endLocalDateTime.toLocalDate());
    int addDays = diff.getDays();

    // 데이터를 가져오기위해 기준일을 설정
    Calendar standardDate = Calendar.getInstance();
    standardDate.set(Integer.parseInt(tempStartDate[0]), Integer.parseInt(tempStartDate[1]), Integer.parseInt(tempStartDate[2]));

    for(int i = 0; i <= addDays; ++i) {
        String standardDateString = String.format("%04d-%02d-%02d", standardDate.get(Calendar.YEAR), standardDate.get(Calendar.MONTH), standardDate.get(Calendar.DATE));
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1352000/ODMS_COVID_04/callCovid04Api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("apiType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
        urlBuilder.append("&" + URLEncoder.encode("std_day","UTF-8") + "=" + URLEncoder.encode(standardDateString, "UTF-8")); /*기준일자*/
        urlBuilder.append("&" + URLEncoder.encode("gubun","UTF-8") + "=" + URLEncoder.encode(selectedCity, "UTF-8")); /*시도명*/

        String url = urlBuilder.toString();

        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
        Document doc = dBuilder.parse(url);

        Element root = doc.getDocumentElement();
        NodeList item = root.getElementsByTagName("item");
        Node itemNode = item.item(0);
        if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
            setData(dataType, result, labelDate, itemNode, standardDateString, i);
        }

        standardDate.add(Calendar.DATE, 1);
    }
%>
<jsp:forward page="dataView.jsp?dataType=<%=dataType%>">
    <jsp:param name="data1" value="<%=result[0]%>"/>
    <jsp:param name="data2" value="<%=result[1]%>"/>
    <jsp:param name="data3" value="<%=result[2]%>"/>
    <jsp:param name="data4" value="<%=result[3]%>"/>
    <jsp:param name="data5" value="<%=result[4]%>"/>

    <jsp:param name="date1" value="<%=labelDate[0]%>"/>
    <jsp:param name="date2" value="<%=labelDate[1]%>"/>
    <jsp:param name="date3" value="<%=labelDate[2]%>"/>
    <jsp:param name="date4" value="<%=labelDate[3]%>"/>
    <jsp:param name="date5" value="<%=labelDate[4]%>"/>

    <jsp:param name="selectedCity" value="<%=selectedCity%>"/>
    <jsp:param name="startDate" value="<%=startDate%>"/>
    <jsp:param name="endDate" value="<%=endDate%>"/>
</jsp:forward>
