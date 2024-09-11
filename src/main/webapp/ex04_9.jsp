<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>out</title>
</head>
<body>
<%
    int bufferSize = out.getBufferSize();
    int remainSize = out.getRemaining();
    int usedSize = bufferSize - remainSize;
    System.out.println("전체 버퍼의 크기:" + bufferSize + "byte");
    System.out.println("사용한 버퍼의 크기:" + usedSize + "byte");
    System.out.println("남은 버퍼의 크기:" + remainSize + "byte");
%>
버퍼예제<br>
남은 버퍼: <% out.println(remainSize); %>byte
</body>
</html>
