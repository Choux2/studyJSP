<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>요청 헤더 정보</title>
</head>
<body>
<%
    Enumeration enumData = request.getHeaderNames();
    while(enumData.hasMoreElements()){
        String headerName = (String)enumData.nextElement();
        String headerValue = request.getHeader(headerName);
        System.out.println(headerName + ":" + headerValue);
    }
%>
</body>
</html>
