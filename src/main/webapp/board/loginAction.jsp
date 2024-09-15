<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% //request.setCharacterEncoing("UTF-8"); %>
<jsp:useBean id="user" class="User.UserVo" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<!DOCTYPE html>
<head>
    <meta name="viewport" content="w idth-device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>로그인 페이지</title>
</head>
<body>
    <%
        UserDao userDao = new UserDao();
        int result = userDao.login(user.getUserID(), user.getUserPW());
        if (result == 1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if (result == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alret(비밀번호가 틀립니다.)");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alret(존재하지 않는 아이디입니다.)");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -2) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alret(데이터베이스 오류입니다.)");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>
