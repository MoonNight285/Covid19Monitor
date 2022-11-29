<%--
  Created by IntelliJ IDEA.
  User: kimjy
  Date: 2022-11-29
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.JsonParser" %>
<%@ page import="com.google.gson.JsonElement" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="com.example.covid19monitor.Covid" %>
<%@ page import="java.net.URLEncoder" %>

<%
    request.setCharacterEncoding("UTF-8");
    String dataType = request.getParameter("dataType");
    String startDate = request.getParameter("startDate");
    String selectedCity = request.getParameter("selectedCity");
    String serviceKey = "pAR7xB7Uwyh4RcIMj1YNS9nYmjzzbIEm%2BTOpaJa1IxsC%2FB7J96c6jR5lABRfJjfLbB323p8xThlPinRbLSe6pw%3D%3D";
    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1352000/ODMS_COVID_04/callCovid04Api"); /*URL*/
    urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
    urlBuilder.append("&" + URLEncoder.encode("apiType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
    urlBuilder.append("&" + URLEncoder.encode("std_day","UTF-8") + "=" + URLEncoder.encode(startDate, "UTF-8")); /*기준일자*/
    urlBuilder.append("&" + URLEncoder.encode("gubun","UTF-8") + "=" + URLEncoder.encode(selectedCity, "UTF-8")); /*시도명*/

    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
    Document doc = dBuilder.parse(urlBuilder.toString());

    Element root = doc.getDocumentElement();
    NodeList item = root.getElementsByTagName("item");
    Node itemNode = item.item(0);
    if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
        Covid covid = new Covid();
        Element itemNodeElement = (Element) itemNode;

        switch (dataType) {
            case "defCnt" :
                NodeList defCntNodeList = itemNodeElement.getElementsByTagName("defCnt").item(0).getChildNodes();
                Node defCntNode = defCntNodeList.item(0);
                covid.setDefCnt(defCntNode.getNodeValue());
                out.print(covid.getDefCnt());
                break;
        }

//            NodeList deathCntNodeList = itemNodeElement.getElementsByTagName("deathCnt").item(0).getChildNodes();
//            Node deathCntNode = deathCntNodeList.item(0);
//            covid.setDeathCnt(deathCntNode.getNodeValue());
//
//            NodeList defCntNodeList = itemNodeElement.getElementsByTagName("defCnt").item(0).getChildNodes();
//            Node defCntNode = defCntNodeList.item(0);
//            covid.setDefCnt(defCntNode.getNodeValue());
//
//            NodeList gubunNodeList = itemNodeElement.getElementsByTagName("gubun").item(0).getChildNodes();
//            Node gubunNode = gubunNodeList.item(0);
//            covid.setGubun(gubunNode.getNodeValue());
//
//            NodeList gubunCnNodeList = itemNodeElement.getElementsByTagName("gubunCn").item(0).getChildNodes();
//            Node gubunCnNode = gubunCnNodeList.item(0);
//            covid.setGubunCn(gubunCnNode.getNodeValue());
//
//            NodeList gubunEnNodeList = itemNodeElement.getElementsByTagName("gubunEn").item(0).getChildNodes();
//            Node gubunEnNode = gubunEnNodeList.item(0);
//            covid.setGubunEn(gubunEnNode.getNodeValue());
//
//            NodeList incDecNodeList = itemNodeElement.getElementsByTagName("incDec").item(0).getChildNodes();
//            Node incDecNode = incDecNodeList.item(0);
//            System.out.println(incDecNode.getNodeValue());
//
//            NodeList isolClearCntNodeList = itemNodeElement.getElementsByTagName("isolClearCnt").item(0).getChildNodes();
//            Node solClearCntNode = isolClearCntNodeList.item(0);
//            System.out.println(solClearCntNode.getNodeValue());
//
//            NodeList isolIngCntNodeList = itemNodeElement.getElementsByTagName("isolIngCnt").item(0).getChildNodes();
//            Node isolIngCntNode = isolIngCntNodeList.item(0);
//            System.out.println(isolIngCntNode.getNodeValue());
//
//            NodeList localOccCntNodeList = itemNodeElement.getElementsByTagName("localOccCnt").item(0).getChildNodes();
//            Node localOccCntNode = localOccCntNodeList.item(0);
//            System.out.println(localOccCntNode.getNodeValue());
//
//            NodeList overFlowCntNodeList = itemNodeElement.getElementsByTagName("overFlowCnt").item(0).getChildNodes();
//            Node overFlowCntNode = overFlowCntNodeList.item(0);
//            System.out.println(overFlowCntNode.getNodeValue());
//
//            NodeList qurRateNodeList = itemNodeElement.getElementsByTagName("qurRate").item(0).getChildNodes();
//            Node qurRateNode = qurRateNodeList.item(0);
//            System.out.println(qurRateNode.getNodeValue());
//
//            NodeList stdDayNodeList = itemNodeElement.getElementsByTagName("stdDay").item(0).getChildNodes();
//            Node stdDayNode = stdDayNodeList.item(0);
//            System.out.println(stdDayNode.getNodeValue());
    } else {

    }
%>
