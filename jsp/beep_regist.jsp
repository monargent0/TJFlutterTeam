<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%

request.setCharacterEncoding("utf-8");
String buid = request.getParameter("buid");
String upw = request.getParameter("upw");
String uname = request.getParameter("uname");
String uemail = request.getParameter("uemail");




String url_mysql = "jdbc:mysql://192.168.5.83:8080/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";

String id_mysql = "root";
String pw_mysql = "qwer1234";

PreparedStatement ps = null;

  JSONObject jsonList = new JSONObject();

try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
  Statement stmt_mysql = conn_mysql.createStatement();

  String act1 = "insert into buser (buid, upw, uname, uemail";
  String act2 = ") values (?,?,?,?)";

  ps = conn_mysql.prepareStatement(act1+act2);
  ps.setString(1, buid);
  ps.setString(2, upw);
  ps.setString(3, uname);
  ps.setString(4, uemail);

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