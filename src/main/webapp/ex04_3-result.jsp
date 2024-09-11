<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 3:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>덧셈결과</title>
</head>
<body>
<%
    String n1Str = request.getParameter("n1");
    String n2Str = request.getParameter("n2");
    int n1 = Integer.parseInt(n1Str);
    int n2 = Integer.parseInt(n2Str);
    int result = n1 + n2;
%>
<h2>덧셈 결과</h2>
<h3><%= n1 %> + <%= n2 %> = <%= result %></h3>
</body>
</html>
