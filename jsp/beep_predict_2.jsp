<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

   //int hdaytype = Integer.parseInt(request.getParameter("hdaytype"));
    int hstart = Integer.parseInt(request.getParameter("hstart"));
    int htraffic1 =  Integer.parseInt(request.getParameter("htraffic1"));
    int htraffic2 =  Integer.parseInt(request.getParameter("htraffic2"));
    int hspop = Integer.parseInt(request.getParameter("hspop"));

    RConnection conn = new RConnection();

conn.voidEval("dday <- read.csv('/usr/local/Tomcat/webapps/ROOT/Flutter/dday2.csv')");




conn.eval("result1 <- as.character(trunc(dday[1,2]*" + hstart + 
 "+ dday[1,3]*" + htraffic1 + "+ dday[1,4]*" + htraffic2 + "+ dday[1,5]*" + hspop + "+dday[1,6]-dday[1,7]))");

conn.eval("result2 <- as.character(trunc(dday[1,2]*" + hstart + 
 "+ dday[1,3]*" + htraffic1 + "+ dday[1,4]*" + htraffic2 + "+ dday[1,5]*" + hspop + "+dday[1,6]+dday[1,7]))");

 
String result1 = conn.eval("result1").asString();
String result2 = conn.eval("result2").asString();
   
%>
{"result":"<%=result1%>~<%=result2%>"}