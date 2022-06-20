<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

   String buid=request.getParameter("buser_buid");
  String  hdaytype = request.getParameter("hdaytype");
    int hstart = Integer.parseInt(request.getParameter("hstart"));
    int hholiday =  Integer.parseInt(request.getParameter("hholiday"));
    int hweather =  Integer.parseInt(request.getParameter("hweather"));
    int htraffic1 =  Integer.parseInt(request.getParameter("htraffic1"));
    int htraffic2 =  Integer.parseInt(request.getParameter("htraffic2"));
    int hspop = Integer.parseInt(request.getParameter("hspop"));

    RConnection conn = new RConnection();

    //R 소스코드
    conn.voidEval("dday <- read.csv('/usr/local/Tomcat/webapps/ROOT/Flutter/dday.csv')");

    if (hstart<19 ){
    

    conn.eval("result1 <- as.character(trunc(dday[1,2]*" + hstart + "+ dday[1,3]*" + hholiday + 
    "+ dday[1,4]*" + hweather + "+ dday[1,5]*" + htraffic1 + "+ dday[1,6]*" + htraffic2 + "+ dday[1,7]*" + hspop + "+dday[1,8]-dday[1,9]))");

    conn.eval("result2 <- as.character(trunc(dday[1,2]*" + hstart + "+ dday[1,3]*" + hholiday + 
    "+ dday[1,4]*" + hweather + "+ dday[1,5]*" + htraffic1 + "+ dday[1,6]*" + htraffic2 + "+ dday[1,7]*" + hspop + "+dday[1,8]+dday[1,9]))");

    
    }
    else{
      conn.eval("result1 <- as.character(trunc(dday[2,2]*" + hstart + "+ dday[2,3]*" + hholiday + 
      "+ dday[2,4]*" + hweather + "+ dday[2,5]*" + htraffic1 + "+ dday[2,6]*" + htraffic2 + "+ dday[2,7]*" + hspop + "+dday[2,8]-dday[2,9]))");
      
      conn.eval("result2 <- as.character(trunc(dday[2,2]*" + hstart + "+ dday[2,3]*" + hholiday + 
      "+ dday[2,4]*" + hweather + "+ dday[2,5]*" + htraffic1 + "+ dday[2,6]*" + htraffic2 + "+ dday[2,7]*" + hspop + "+dday[2,8]+dday[2,9]))");
      
    }
    String result1 = conn.eval("result1").asString();
    String result2 = conn.eval("result2").asString();
String conResult = result1.toString() + "~" + result2.toString();

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
        String act2=") values (?,?,?,?,?,?,?,?,?)";

        ps=conn_mysql.prepareStatement(act1+act2);
        ps.setString(1,hdaytype);
        ps.setString(2,conResult);
        ps.setInt(3,hstart);
        ps.setInt(4,hholiday);
        ps.setInt(5,hweather);
        ps.setInt(6,htraffic1);
        ps.setInt(7,htraffic2);
        ps.setInt(8,hspop);
        ps.setString(9,buid);

        ps.executeUpdate();
        conn_mysql.close(); 
    }catch(Exception e){
      e.printStackTrace();
    }
%>
{"result":"<%=result1%>~<%=result2%>"}