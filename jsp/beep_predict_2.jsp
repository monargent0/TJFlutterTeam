<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

    String hdaytype = request.getParameter("hdaytype");
    String buid = request.getParameter("buser_buid"); 
    int hstart = Integer.parseInt(request.getParameter("hstart"));
    int htraffic1 =  Integer.parseInt(request.getParameter("htraffic1"));
    int htraffic2 =  Integer.parseInt(request.getParameter("htraffic2"));
    int hspop = Integer.parseInt(request.getParameter("hspop"));

    RConnection conn = new RConnection();

conn.voidEval("rf <- readRDS('C:\Program Files\Apache Software Foundation\Tomcat 8.5\webapps\ROOT\Flutterbeep_model_rf.rds')");

// RFE에서 나온 오차범위를 토대로 값 변경해줘야 함
conn.eval("result <- predict(rf, (list(출발시간=" + hstart + ", X1종.교통량=" + htraffic1 + ", X2종.교통량 = " htraffic2 ", 서울인구수=" hspop ")))")

// conn.eval("result1 <- as.character(trunc(dday[1,2]*" + hstart + 
//  "+ dday[1,3]*" + htraffic1 + "+ dday[1,4]*" + htraffic2 + "+ dday[1,5]*" + hspop + "+dday[1,6]-dday[1,7]))");

// conn.eval("result2 <- as.character(trunc(dday[1,2]*" + hstart + 
//  "+ dday[1,3]*" + htraffic1 + "+ dday[1,4]*" + htraffic2 + "+ dday[1,5]*" + hspop + "+dday[1,6]+dday[1,7]))");

String result1 = conn.eval("result").asString();
// String result2 = conn.eval("result2").asString();
//String conResult = result1.toString() + "~" + result2.toString();

// 컬럼, 예측값 DB history table에 저장
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

    ps.setString(1, result);
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