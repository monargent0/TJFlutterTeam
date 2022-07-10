<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");

    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    // AI 인 hid를 파라미터로 받아옴
    String hid = request.getParameter("hid");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        // 저장된 예측값 측정 내역 기록 지워주는 Query
        String act1 = "delete from history where hid = ?";

        ps=conn_mysql.prepareStatement(act1);
        ps.setString(1,hid);

        ps.executeUpdate();
        conn_mysql.close();
        // 정상적으로 삭제시 웹페이지에서는  OK 화면 출력
%>
        {"result":"OK"}
    
<%
    }catch(Exception e){
        // 정상적으로 삭제가 되지 않았을 때 ERROR 페이지 출력
%>
    {"result":"ERROR"}
<%
    }
%>