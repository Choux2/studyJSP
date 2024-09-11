<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>요청 정보</title>
</head>
<body>
<!-- request: 브라우저에서 서버로 정보 리퀘스트 시
 브라우저에서 만들어낸 여러가지 정보들이 http 라는 프로토콜에 맞춰서 전달
 서버 쪽에서 전달받은 내용들을 저장해두기 위한 기본 내장 객체-->

클라이언트 IP: <%= request.getRemoteAddr() %><br>
요청정보 길이: <%= request.getContentLength() %><br>
요청정보 인코딩: <%= request.getCharacterEncoding() %><br>
요청정보 문서 타입: <%= request.getContentType() %><br>
요청정보 전송 방식: <%= request.getMethod() %><br>
요청 URL: <%= request.getRequestURL() %><br>
요청 URI: <%= request.getRequestURI() %><br>
컨텍스트 경로: <%= request.getContextPath() %><br>
서버이름: <%= request.getServerName() %><br>
서버포트: <%= request.getServerPort() %><br>
</body>
</html>
