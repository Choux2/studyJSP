<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardVo" %>
<%@ page import="board.BoardDao" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>게시판</title>
</head>
<body>
    <%
        String USER_ID = null;
        if (session.getAttribute("USER_ID") != null) {
            USER_ID = (String) session.getAttribute("USER_ID");
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
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        <a class="navbar-brand text-secondary" href="main.jsp">메인</a>
        <a class="navbar-brand text-secondary" href="board.jsp">게시판</a>
        <%
            if(USER_ID == null) {
        %>
        <div class="dropdown">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <a href="login.jsp"> 로그인 </a>
                </button>
        </div>
        <%
            } else {
        %>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               <a href="loginoutAction.jsp">로그아웃</a>
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="join.jsp">회 원 가 입</a>
                <a class="dropdown-item" href="login.jsp">로 그 인</a>
            </div>
        </div>
        <%
            }
        %>
    </nav>
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead> <!-- 테이블의 맨 윗부분(제목부분) -->
                <tr> <!-- 테이블 한 행 -->
                    <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%">글 제목</td>
                        <td colspan="2"><%= board.getBOARD_TITLE().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= board.getUSER_ID() %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= board.getBOARD_DATE().substring(0, 11)
                            + board.getBOARD_DATE().substring(11, 13) + "시"
                            + board.getBOARD_DATE().substring(14, 16) + "분" %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBOARD_CONTENT().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                </tbody>
            </table>
            <a href="board.jsp" class="btn btn-primary">목록</a>
            <%
                if(USER_ID != null && USER_ID.equals(board.getUSER_ID())) {
            %>
                <a href="update.jsp?BOARD_NUM=<%= BOARD_NUM %>" class="btn btn-primary">수정</a>
                <a oneclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?BOARD_NUM=<%= BOARD_NUM %>" class="btn btn-primary">삭제</a>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>