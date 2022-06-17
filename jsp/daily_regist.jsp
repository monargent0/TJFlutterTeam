<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%

request.setCharacterEncoding("utf-8");
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");
String uname = request.getParameter("uname");




String url_mysql = "jdbc:mysql://localhost/team2?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";

String id_mysql = "root";
String pw_mysql = "qwer1234";

PreparedStatement ps = null;

  JSONObject jsonList = new JSONObject();

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
  Statement stmt_mysql = conn_mysql.createStatement();

  String act1 = "insert into users (uid, upw, uname";
  String act2 = ") values (?,?,?)";

  ps = conn_mysql.prepareStatement(act1+act2);
  ps.setString(1, uid);
  ps.setString(2, upw);
  ps.setString(3, uname);

  ps.executeUpdate();

  conn_mysql.close();
  
  jsonList.put("results", true);
  out.print(jsonList);
} catch(Exception e){
    jsonList.put("results", false);

  out.print(jsonList);
  e.printStackTrace();
}

%>