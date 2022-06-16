<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");
    String dcontent = request.getParameter("dcontent");
    String eid = request.getParameter("eid");
    String did = request.getParameter("did");


    String url_mysql = "jdbc:mysql://localhost/team2?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 = "update diary set dcontent = ?, eid= ?";
        String act2 = "where did = ?";

        ps = conn_mysql.prepareStatement(act1+act2);
        ps.setString(1, dcontent);
        ps.setString(2, eid);
        ps.setString(3, did);

        ps.executeUpdate();
        conn_mysql.close();
%>
    {"result":"OK"}

<%
    }catch(Exception e){
%>
    {"result":"ERROR"}
<%
    }
%>