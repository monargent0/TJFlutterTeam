<%@ page import="org.rosuda.REngine.Rserve.RConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

   //int hdaytype = Integer.parseInt(request.getParameter("hdaytype"));
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
    
  
%>
{"result":"<%=result1%>~<%=result2%>"}