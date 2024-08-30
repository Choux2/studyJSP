<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 8. 30.
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP예제</title>
</head>
<body>
<%
    java.util.Random ran = new java.util.Random();
    int total = 0;
    for(int i = 1; i <= ran.nextInt(10); i++) {
        total += i;
    }
    System.out.println("처리함");
%>
1부터 10까지의 합: <%= total %>
</body>
</html>