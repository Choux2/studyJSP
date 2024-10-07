<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="board.BoardDao" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.BoardVo" scope="page" />
<jsp:setProperty name="board" property="BOARD_TITLE" />
<jsp:setProperty name="board" property="BOARD_CONTENT" />
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
        } else {
            if(board.getBOARD_TITLE() == null || board.getBOARD_CONTENT() == null) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력되지 않은 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                BoardDao boardDao = new BoardDao();
                int result = boardDao.write(board.getBOARD_TITLE(), USER_ID, board.getBOARD_CONTENT());
                if (result == -1) { //글쓰기 오류
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기 실패!!')");
                    script.println("history.back()");
                    script.println("</script>");
                } else { //글쓰기 성공
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'board.jsp'");
                    script.println("alert('글 작성 완료!!')");
                    script.println("</script>");
                }
            }
        }
    %>
</body>
</html>
