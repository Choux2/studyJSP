<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardVo" %>
<%@ page import="board.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>게시판</title>
    <style type="text/css">
        a, a:hover {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%
        String USER_ID = null;
        if (session.getAttribute("USER_ID") != null) {
            USER_ID = (String) session.getAttribute("USER_ID");
        }
        int pageNumber = 1; //기본페이지
        if(request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
             <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead> <!-- 테이블의 맨 윗부분(제목부분) -->
                    <tr> <!-- 테이블 한 행 -->
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    BoardDao boardDao = new BoardDao();
                    ArrayList<BoardVo> list = boardDao.getList(pageNumber);
                    for (int i = 0; i < list.size(); i++) {
                %>

                <tr>
                    <td><%= list.get(i).getBOARD_NUM()%></td>
                    <td><a href="view.jsp?BOARD_NUM=<%= list.get(i).getBOARD_NUM() %>"><%= list.get(i).getBOARD_TITLE() %></a></td> <!-- 제목 클릭했을 때 게시글로 넘어가기 -->
                    <td><%= list.get(i).getUSER_ID() %></td>
                    <td><%= list.get(i).getBOARD_DATE().substring(0, 11)
                            + list.get(i).getBOARD_DATE().substring(11, 13) + "시"
                            + list.get(i).getBOARD_DATE().substring(14, 16) + "분" %></td> <!-- 날짜 출력 형식 바꾸기 -->
                </tr>
                <%
                    }
                %>
                </tbody>
             </table>
            <%
                if(pageNumber != 1) {
            %>
                <a href="board.jsp?pageNumber=<%=pageNumber - 1%>" class="btn butn-success btn-arrow-left">이전</a>
            <%
                } if(boardDao.nextPage(pageNumber + 1)) {
            %>
                <a href="board.jsp?pageNumber=<%=pageNumber + 1%>" class="btn butn-success btn-arrow-left">다음</a>
            <%
            }
            %>
            <a href="write.jsp" class="btn btn-primary pull right">글쓰기</a>
        </div>
    </div>
</body>
</html>