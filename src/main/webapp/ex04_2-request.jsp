<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>요청을 받음</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    //parameter: 입력해서 전송된 값
    System.out.println("전송받은 값:" + name);

    if(name.equals("슈슈")){
%>
    <%= name %>님 환영합니다.
<%    }else {%>
      누구세요?
<%    } %>

</body>
</html>
