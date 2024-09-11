<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 6.
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP 라이프사이클</title>
</head>
<body>
<%! //선언문
    private int num1 = 0; // 객체의 멤버변수 > 메모리 상에 계속 유지

    public void jspInit(){ //오버라이딩
        System.out.println("jspInit() 호출됨");
    }
    public void jspDestroy(){ //오버라이딩
        System.out.println("jspDestroy() 호출됨");
    }
%>
<% //스크립틀릿
  int num2 = 0; //서비스 함수 안의 지역변수 > 호출 할 때 마다 새로고침
  num1++;
  num2++;
%>
<ul>
    <li>num1: <%= num1 %></li>
    <li>num2: <%= num2 %></li>
</ul>
</body>
</html>
