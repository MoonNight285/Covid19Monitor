<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-07
  Time: 오전 8:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>

<%!
    // API를 통해서 가져온 데이터를 클라이언트측으로 전달하기위해 데이터를 가공
    // dataName : XML 문서에서 얻고자하는 데이터의 태그 이름
    // result : 데이터 값을 저장할 배열 공간
    // itemNode : XML 문서의 node 값
    // idx : 배열 인덱스 번호
    private String getData(String dataName, Node itemNode) {
        Element itemNodeElement = (Element) itemNode;
        NodeList nodeList = itemNodeElement.getElementsByTagName(dataName).item(0).getChildNodes();
        Node node = nodeList.item(0);
        return node.getNodeValue();
    }
%>

<%
    String incDec = "0"; // 전일 대비 확진자 증감수
    String isolIngCnt = "0"; // 격리 중환자 수
    String localOccCnt = "0"; // 지역 발생수
    String overFlowCnt = "0"; // 해외 유입수
    String deathCnt = "0"; // 누적 사망자
    
    request.setCharacterEncoding("UTF-8");
    String selectedCity = request.getParameter("selectedCity");
    String searchDate = request.getParameter("searchDate");
    String serviceKey = "pAR7xB7Uwyh4RcIMj1YNS9nYmjzzbIEm%2BTOpaJa1IxsC%2FB7J96c6jR5lABRfJjfLbB323p8xThlPinRbLSe6pw%3D%3D";
    
    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1352000/ODMS_COVID_04/callCovid04Api"); /*URL*/
    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
    urlBuilder.append("&" + URLEncoder.encode("apiType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
    urlBuilder.append("&" + URLEncoder.encode("std_day","UTF-8") + "=" + URLEncoder.encode(searchDate, "UTF-8")); /*기준일자*/
    urlBuilder.append("&" + URLEncoder.encode("gubun","UTF-8") + "=" + URLEncoder.encode(selectedCity, "UTF-8")); /*시도명*/
    
    String url = urlBuilder.toString();
    
    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
    Document doc = dBuilder.parse(url);
    
    Element root = doc.getDocumentElement();
    NodeList item = root.getElementsByTagName("item");
    Node itemNode = item.item(0);
    if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
        incDec = getData("incDec", itemNode);
        isolIngCnt = getData("isolIngCnt", itemNode);
        localOccCnt = getData("localOccCnt", itemNode);
        overFlowCnt = getData("overFlowCnt", itemNode);
        deathCnt = getData("deathCnt", itemNode);
    }
%>
<jsp:forward page="dataAllView.jsp">
    <jsp:param name="responseCityName" value="<%=selectedCity%>"/>
    <jsp:param name="incDec" value="<%=incDec%>"/>
    <jsp:param name="isolIngCnt" value="<%=isolIngCnt%>"/>
    <jsp:param name="localOccCnt" value="<%=localOccCnt%>"/>
    <jsp:param name="overFlowCnt" value="<%=overFlowCnt%>"/>
    <jsp:param name="deathCnt" value="<%=deathCnt%>"/>
</jsp:forward>
