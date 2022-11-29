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
<%@ page import="java.util.Calendar" %>

<%
    StringBuilder result = new StringBuilder();

    request.setCharacterEncoding("UTF-8");
    String dataType = request.getParameter("dataType");
    String startDate = request.getParameter("startDate");
    String addDays = request.getParameter("addDays");
    String selectedCity = request.getParameter("selectedCity");
    String serviceKey = "pAR7xB7Uwyh4RcIMj1YNS9nYmjzzbIEm%2BTOpaJa1IxsC%2FB7J96c6jR5lABRfJjfLbB323p8xThlPinRbLSe6pw%3D%3D";

    String[] tempDate = startDate.split("-");
    Calendar date = Calendar.getInstance();
    date.set(Integer.parseInt(tempDate[0]), Integer.parseInt(tempDate[1]), Integer.parseInt(tempDate[2]));

    for(int i = 0; i <= Integer.parseInt(addDays); ++i) {
        String standardDate = String.format("%04d-%02d-%02d", date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DATE));
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1352000/ODMS_COVID_04/callCovid04Api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("apiType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*결과형식(xml/json)*/
        urlBuilder.append("&" + URLEncoder.encode("std_day","UTF-8") + "=" + URLEncoder.encode(standardDate, "UTF-8")); /*기준일자*/
        urlBuilder.append("&" + URLEncoder.encode("gubun","UTF-8") + "=" + URLEncoder.encode(selectedCity, "UTF-8")); /*시도명*/

        String url = urlBuilder.toString();

        DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
        Document doc = dBuilder.parse(url);

        Element root = doc.getDocumentElement();
        NodeList item = root.getElementsByTagName("item");
        Node itemNode = item.item(0);
        if(itemNode.getNodeType() == Node.ELEMENT_NODE) {
            Element itemNodeElement = (Element) itemNode;

            switch (dataType) {
                case "defCnt" :
                    NodeList defCntNodeList = itemNodeElement.getElementsByTagName("defCnt").item(0).getChildNodes();
                    Node defCntNode = defCntNodeList.item(0);
                    result.append(defCntNode.getNodeValue() + ",");
                    break;
            }
        } else {

        }

        date.add(Calendar.DATE, 1);
    }

    out.print(result.toString());
%>
