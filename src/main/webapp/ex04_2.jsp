<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 입력 폼</title>
</head>
<body>
<form action="ex04_2-request.jsp">
    <input type="text" name="name" placeholder="문자열입력">
    <input type="submit" value="전송">
    <!-- submit: form에 있는 모든 데이터들을 묶어서 지정된 것을 요청
    기본값은 현재 위치, action 속성으로 지정해주면 지정된 위치로 요청하면서 데이터 전달-->
</form>
</body>
</html>
