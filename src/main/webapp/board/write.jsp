<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
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
            <form method="post" action="writeAction.jsp">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead> <!-- 테이블의 맨 윗부분(제목부분) -->
                    <tr> <!-- 테이블 한 행 -->
                        <th colspan="2" style="background-color: #eeeeee; text-align: center;">글쓰기</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="글 제목" name="BOARD_TITLE" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="글 제목" name="BOARD_CONTENT" maxlength="2048" style="height: 350px;"></textarea></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" href="write.jsp" class="btn btn-primary pull right" value="글쓰기">
            </form>
        </div>
    </div>
</body>
</html>