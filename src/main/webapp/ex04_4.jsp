<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 입력 폼</title>
</head>
<body>
폼에 데이터 입력 후 전송버튼 클릭.
<form action="ex04_4-result.jsp" method="post">
    <input type="text" name="name" placeholder="이름"><br>
    <input type="text" name="address" placeholder="주소"><br>
    좋아하는 동물<br>
    <input type="checkbox" name="pet" value="dog">강아지<br>
    <input type="checkbox" name="pet" value="cat">고양이<br>
    <input type="checkbox" name="pet" value="shark">상어<br>
    <input type="submit" value="전송">
</form>

</body>
</html>
