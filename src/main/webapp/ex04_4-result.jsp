<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.SQLOutput" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>전송완료</title>
</head>
<body>
<%-- ex04_4.jsp의 요청으로 전달받은 파라미터들을 콘솔에 출력하세요. --%>
<%
    
    //getParameter(), getParameterValues()
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String[] pets = request.getParameterValues("pet");

    System.out.println("name:" + name);
    System.out.println("address:" + address);
    for(String pet : pets){
        System.out.println("pet:" + pet);
    }

    /*
    //getParameterNames()
    Enumeration<String> enumData = request.getParameterNames();
    while(enumData.hasMoreElements()){
        String name = (String)enumData.nextElement();
        System.out.println("name" + name);
    } */

/*
    //getParameterMap()
    Map paramMap = request.getParameterMap();
    String[] paramName = (String[])paramMap.get("pet");
    for(String param : paramName){
        System.out.println("param:" + param);
    } */
%>
전송이 완료되었습니다.
</body>
</html>
