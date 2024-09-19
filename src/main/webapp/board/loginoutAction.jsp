<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="w idth-device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = 'main.jsp';
    </script>
</body>
</html>
