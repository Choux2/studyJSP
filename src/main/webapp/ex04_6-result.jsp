
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userid = request.getParameter("userid");
    String userpw = request.getParameter("userpw");

    // Redirect: 처리 결과 페이지가 별도로 없을 때 다른 곳으로 요청
    if(userid.equals(userpw)) {
        System.out.println(userid + ":로그인 성공!");
        response.sendRedirect(request.getContextPath()); //최상위 요청으로 리다이렉트
    }
    else {
        System.out.println(userid + ":로그인 실패!");
        response.sendRedirect("ex04_6-loginForm.jsp"); //로그인 폼으로 리다이렉트
    }
%>
