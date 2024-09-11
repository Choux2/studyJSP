<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>application</title>
</head>
<body>
<%
    //초기화 파라미터
    Enumeration enumData = application.getInitParameterNames();
    while(enumData.hasMoreElements()) {
        String initParaName = (String)enumData.nextElement();
        String initparaValue = application.getInitParameter(initParaName);
        System.out.println(initParaName + ":" + initparaValue);
    }
%>

<!-- 프로젝트를 톰캣을 통해 실행했을 때 최초로 생성되는 기본 객체 application 객체
  서버가 실행될 때 만들어져서 종료될 때 까지 남아있는 서비스하고자 하는 사이트 자체!!
  초기에 필요한 데이터가 있다면 미리 web.xml에서 톰캣 설정 -->
appliction 객체 예제<br>
초기화 파라미터 확인<br>
서버정보:<%= application.getServerInfo() %><br>
서블릿 메이저 버전: <%= application.getMajorVersion() %><br>
서블릿 마이너 버전: <%= application.getMinorVersion() %><br>
</body>
</html>
