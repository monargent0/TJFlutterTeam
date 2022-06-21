<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String uname = request.getParameter("uname");
String uemail = request.getParameter("uemail");
String buid = request.getParameter("buid");

String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql = "root";
String pw_mysql = "qwer1234";

PreparedStatement ps = null;

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();


try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();
    
    String whereDefault = "select upw from buser where buid = ? and uname = ? and uemail = ?";

    ps=conn_mysql.prepareStatement(whereDefault);
    ps.setString(1,buid);
    ps.setString(2,uname);
    ps.setString(3,uemail);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        JSONObject tempJson = new JSONObject();
        tempJson.put("upw", rs.getString(1));
        itemList.add(tempJson);
    }else{
        itemList.add("ERROR");
    }
    jsonList.put("results",itemList);
    conn_mysql.close();
    out.print(jsonList);

    }catch(Exception e){

        e.printStackTrace();
    }
    %>