<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
<meta name="viewport" content="width-device-width", initial-scale="1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <title>로그인 페이지</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
    <a class="navbar-brand text-secondary" href="main.jsp">메인</a>
    <a class="navbar-brand text-secondary" href="board.jsp">게시판</a>
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <a href="login.jsp"> 로그인 </a>
        </button>
    </div>
</nav>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 50px;margin-top: 50px;">
            <form method="post" action="joinAction.jsp">
                <h3 style="text-align: center;">회원가입 화면</h3>
                <br>
                <div class="form-row">
                    <input type="text" class="form-control" id="USER_ID" name="USER_ID" placeholder="아 이 디" maxlength="20">
                </div>
                <br>
                <div class="form-row">
                    <input type="password" class="form-control" id="USER_PW" name="USER_PW" placeholder="비 밀 번 호" maxlength="20">
                </div>
                <br>
                <div class="form-group">
                    <input type="text" class="form-control" id="USER_NAME" name="USER_NAME" placeholder="이 름" maxlength="20">
                </div>
                <div class="form-group" style="text-align: center;">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="radio-box" for="GENDER_M">
                            <input type="radio" id="GENDER_M" name="USER_GENDER" autocomplete="off" value="M" checked> 남자
                        </label>
                        <label class="radio-box" for="GENDER_F">
                            <input type="radio" id="GENDER_F" name="USER_GENDER" autocomplete="off" value="F" checked> 여자
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" id="USER_EMAIL" name="USER_EMAIL" placeholder="이메일" maxlength="20">
                </div>
                <input type="submit" class="btn btn-info form-control" value="회원가입">
            </form>
        </div>
    </div>
</div>
</body>
</html>
