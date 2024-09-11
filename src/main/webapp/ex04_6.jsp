
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>리다이렉트(Redirect)</title>
</head>
<body>
구글로 이동
<%
    response.sendRedirect("https://www.google.com/");
%>
</body>
</html>
