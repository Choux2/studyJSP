<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 8. 30.
  Time: 오후 5:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP 기본문법</title>
</head>
<body>
<h2>JSP 기본 문법 예제</h2>
<%
    //Scriptlet: 자바코드를 작성할 수 있는 영역(연산, 처리 기능 정의) / EL(Expression languge)
    String str = "스크립틀릿 입니다.";
    String comment = "주석";
%>

선언문: <%= declration %> <br> <!-- 표현식: 값을 출력(연산, 처리코드x 바로 출력 가능한 값만! -->
스크립틀릿: <%= str %> <br>
<!-- <%= comment %> -->
<%-- <%= comment %> --%>

<%! //선언문(멤버필드, 멤버 메서드 정의)
    String declration = "선언문";
%>
</body>
</html>
