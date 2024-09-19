<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="User.UserDao" %>
<%@ page import="java.io.PrintWriter" %>
<% //request.setCharacterEncoing("UTF-8"); %>
<jsp:useBean id="user" class="User.UserVo" scope="page" />
<jsp:setProperty name="user" property="USER_ID" />
<jsp:setProperty name="user" property="USER_PW" />
<jsp:setProperty name="user" property="USER_NAME" />
<jsp:setProperty name="user" property="USER_GENDER" />
<jsp:setProperty name="user" property="USER_EMAIL" />
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

        if(user.getUSER_ID() == null || user.getUSER_PW() == null || user.getUSER_NAME() == null
                || user.getUSER_GENDER() == null || user.getUSER_EMAIL() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력되지 않은 사항이 있습니다.')");
            script.println("history.back()");
            script.println("</script>");
        } else {
            UserDao userDao = new UserDao();
            int result = userDao.join(user);
            if (result == -1) { //아이디 중복
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else { //회원가입 성공
                session.setAttribute("USER_ID", user.getUSER_ID());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('회원가입이 정상적으로 처리되었습니다.')");
                script.println("location.href = 'main.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>
