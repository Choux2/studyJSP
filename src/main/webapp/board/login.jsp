<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
<meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <title>로그인 페이지</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
    <a class="navbar-brand text-secondary" href="main.jsp">메뉴</a>
    <a class="navbar-brand text-secondary" href="bbs.jsp">게시판</a>
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            접 속 하 기
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="join.jsp">회 원 가 입</a>
            <a class="dropdown-item" href="login.jsp">로 그 인</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
            <form method="post" action="loginAction.jsp">
                <h3 style="text-align: center;">로 그 인 화 면</h3>
                <br>
                <div class="form-row">
                    <input type="text" class="form-control" id="userID" name="userID" placeholder="아 이 디" maxlength="20">
                </div>
                <br>
                <div class="form-row">
                    <input type="password" class="form-control" id="userPassword" name="userPassword"  placeholder="비 밀 번 호" maxlength="20">
                </div>
                <br>
                <input type="submit" class="btn btn-info form-control" value="로 그 인">
            </form>
        </div>
    </div>
</div>
</body>
</html>
