<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardVo" %>
<%@ page import="board.BoardDao" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>글쓰기</title>
</head>
<body>
    <%
        String USER_ID = null;
        if (session.getAttribute("USER_ID") != null) {
            USER_ID = (String) session.getAttribute("USER_ID");
        }
        if (USER_ID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인이 필요햡니다.')");
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
        }
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        <a class="navbar-brand text-secondary" href="main.jsp">메인</a>
        <a class="navbar-brand text-secondary" href="board.jsp">게시판</a>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               <a href="loginoutAction.jsp">로그아웃</a>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="join.jsp">회 원 가 입</a>
                <a class="dropdown-item" href="login.jsp">로 그 인</a>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <form method="post" action="updateAction.jsp?BOARD_NUM=<%= BOARD_NUM %>">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead> <!-- 테이블의 맨 윗부분(제목부분) -->
                    <tr> <!-- 테이블 한 행 -->
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정하기</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="글 제목" name="BOARD_TITLE" maxlength="50" value="<%= board.getBOARD_TITLE() %>"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="글 제목" name="BOARD_CONTENT" maxlength="2048" style="height: 350px;"><%= board.getBOARD_CONTENT() %>"></textarea></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" href="write.jsp" class="btn btn-primary pull right" value="글수정">
            </form>
        </div>
    </div>
</body>
</html>