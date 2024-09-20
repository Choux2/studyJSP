<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDao" %>
<%@ page import="board.BoardVo" %>
<%@ page import="java.io.PrintWriter" %>
<% //request.setCharacterEncoing("UTF-8"); %>
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
        if (USER_ID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인이 필요합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }
        int BOARD_NUM = 0;
        if(request.getParameter("BOARD_NUM") != null) {
            BOARD_NUM = Integer.parseInt(request.getParameter("BOARD_NUM"));
        }
        if (BOARD_NUM == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.'");
            script.println("location.href = 'board.jsp'");
            script.println("</script>");
        }
        BoardVo board = new BoardDao().getBoard(BOARD_NUM);
        if (!USER_ID.equals(board.getUSER_ID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else {
            BoardDao boardDao = new BoardDao();
            int result = boardDao.delete(BOARD_NUM);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('삭제 실패!!')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'board.jsp'");
                script.println("alert('삭제 완료!!')");
                script.println("</script>");
            }
        }
    %>
</body>
</html>
