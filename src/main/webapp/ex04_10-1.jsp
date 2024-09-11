<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //  기본 객체를 통해 데이터 저장
    pageContext.setAttribute("name", "page scope");
    request.setAttribute("name", "request scope");
    session.setAttribute("name", "session scope"); //브라우저 당 하나 - 서버 입장에서 어떤 브라우저인지 식별 용도
    application.setAttribute("name", "application scope");
    System.out.println("첫 번째 페이지");
    System.out.println("페이지 범위:" + pageContext.getAttribute("name"));
    System.out.println("요청범위:" + request.getAttribute("name"));
    System.out.println("세션범위:" + session.getAttribute("name"));
    System.out.println("애플리케이션 범위:" + application.getAttribute("name"));

    //현재요청(request)과 응답(response)을 다른 JSP로 전달
    request.getRequestDispatcher("ex04_10-2.jsp").forward(request, response);

%>