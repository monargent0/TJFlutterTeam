<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%

    request.setCharacterEncoding("utf-8");

    String buid =request.getParameter("buid");
    String upw =request.getParameter("upw");
    String uname =request.getParameter("uname");
    String uemail =request.getParameter("uemail");

    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String act1 ="update buser set upw = ?, uname = ?, uemail = ?";
        String act2 ="where buid = ?";

        ps=conn_mysql.prepareStatement(act1+act2);
        ps.setString(1,upw);
        ps.setString(2,uname);
        ps.setString(3,uemail);
        ps.setString(4,buid);

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