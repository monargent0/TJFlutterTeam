<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

//int hdaytype = Integer.parseInt(request.getParameter("hdaytype"));
 int hstart = Integer.parseInt(request.getParameter("hstart"));
 int hholiday =  Integer.parseInt(request.getParameter("hholiday"));
 int hspop = Integer.parseInt(request.getParameter("hspop"));

 RConnection conn = new RConnection();

 //R 소스코드
 conn.voidEval("dday <- read.csv('/usr/local/Tomcat/webapps/ROOT/Flutter/dday1.csv')");

 if (hstart<=12 ){
 

 conn.eval("result1 <- as.character(trunc(dday[1,2]*" + hstart + "+ dday[1,3]*" + hholiday + 
 "+ dday[1,4]*" + hspop + "+dday[1,5]-dday[1,6]))");

 conn.eval("result2 <- as.character(trunc(dday[1,2]*" + hstart + "+ dday[1,3]*" + hholiday + 
  "+ dday[1,4]*" + hspop + "+dday[1,5]+dday[1,6]))");

 
 }
 else{
  conn.eval("result1 <- as.character(trunc(dday[2,2]*" + hstart + "+ dday[2,3]*" + hholiday + 
 "+ dday[2,4]*" + hspop + "+dday[2,5]-dday[2,6]))");

 conn.eval("result2 <- as.character(trunc(dday[2,2]*" + hstart + "+ dday[2,3]*" + hholiday + 
  "+ dday[2,4]*" + hspop + "+dday[2,5]+dday[2,6]))");

   
 }
 String result1 = conn.eval("result1").asString();
 String result2 = conn.eval("result2").asString();
    
    
%>
{"result":"<%=result1%>~<%=result2%>"}