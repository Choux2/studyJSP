<%--
  Created by IntelliJ IDEA.
  User: yerim
  Date: 2024. 9. 9.
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pageContext</title>
</head>
<body>
<%
    HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
                                                        //pageContext: 기본객체에 접근 가능하게 참조 반환 
    if(request == httpRequest){
        System.out.println("같음");
    }
    pageContext.getOut().println("브라우저로 내보내는 데이터~");
%>
</body>
</html>
