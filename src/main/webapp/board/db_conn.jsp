<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Connection con = null;

    String url = "jdbc:mysql://localhost:3306/board_db?characterEncoding=UTF-8";
    String userName = "root";
    String password = "yerim486";

    // 1.드라이버 로딩
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        System.err.println(" !! <JDBC 오류> Driver load 오류: " + e.getMessage());
        e.printStackTrace();
    }

    // 2.연결
    try {
        con = DriverManager.getConnection(url, userName, password);
        System.out.println("정상적으로 연결되었습니다.");
    } catch(SQLException e) {
        System.err.println("con 오류:" + e.getMessage());
        e.printStackTrace();
    }

    // 3.해제
    try {
        if(con != null)
            con.close();
    } catch (SQLException e) {
    }

%>
