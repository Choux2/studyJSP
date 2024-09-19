<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% //request.setCharacterEncoing("UTF-8"); %>
<jsp:useBean id="user" class="User.UserVo" scope="page" />
<jsp:setProperty name="user" property="USER_ID" />
<jsp:setProperty name="user" property="USER_PW" />
<!DOCTYPE html>
<head>
    <meta name="viewport" content="w idth-device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>로그인 페이지</title>
</head>
<body>
    <%
        String USER_ID = null;
        if (session.getAttribute("USER_ID") != null) {
            //변수에 할당된 세션아이디 담기
            USER_ID = (String) session.getAttribute("USER_ID");
        }
        if (USER_ID != null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인되어 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }

        UserDao userDao = new UserDao();
        int result = userDao.login(user.getUSER_ID(), user.getUSER_PW());
        if (result == 1) { //로그인 성공
            session.setAttribute("USER_ID", user.getUSER_ID()); //세션아이디 부여
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
        } else if (result == 0) { //로그인 실패 - 비밀번호 오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -1) { //로그인 실패 - 아이디 오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else if (result == -2) { //로그인 실패 - 데이터베이스 오류
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert(데이터베이스 오류입니다.)");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>
