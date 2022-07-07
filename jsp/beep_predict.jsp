<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");


  
    String buid = request.getParameter("buser_buid"); 
    int hstart = Integer.parseInt(request.getParameter("hstart"));
    int htraffic1 =  Integer.parseInt(request.getParameter("htraffic1"));
    int htraffic2 =  Integer.parseInt(request.getParameter("htraffic2"));
    int hspop = Integer.parseInt(request.getParameter("hspop"));

    RConnection conn = new RConnection();

conn.voidEval("library(randomForest)");
conn.voidEval("rf <- readRDS(url('http://localhost:8080/Flutter/beep_model_rf_eng.rds','rb'))");

conn.voidEval("result <- as.numeric(predict(rf, (list(hstart=" + hstart + ", htraffic1=" + htraffic1 + ","
    + "htraffic2=" + htraffic2 + ", hspop=" + hspop + "))))");

  

String result1 = conn.eval("as.character(trunc(result-15.87))").asString();
String result2 = conn.eval("as.character(trunc(result+15.87))").asString();
String conResult = result1.toString() + "~" + result2.toString();
   
String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
String id_mysql="root";
String pw_mysql="qwer1234";

PreparedStatement ps =null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    String act1 ="insert into history(hdaytype, hpredict, hstart, hholiday, hweather, htraffic1, htraffic2, hspop, buser_buid";
    // String act2=") values (" + hdaytype + "," +conResult+ "," +hstart+ "," +htraffic1+ "," +htraffic2+ "," +hspop+ "," +buid+ ");";
    String act2=") values (2,?,?,0,0,?,?,?,?)";
    ps=conn_mysql.prepareStatement(act1+act2);

 
    ps.setString(1, conResult);
    ps.setInt(2, hstart);
    ps.setInt(3, htraffic1);
    ps.setInt(4, htraffic2);
    ps.setInt(5, hspop);
    ps.setString(6, buid);

    ps.executeUpdate();
    conn_mysql.close();
    
}catch(Exception e){
  e.printStackTrace();
}
%>
{"result":"<%=result1%>~<%=result2%>"}