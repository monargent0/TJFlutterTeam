<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    double sepalLength = Double.parseDouble(request.getParameter("sepalLength"));
    double sepalWidth = Double.parseDouble(request.getParameter("sepalWidth"));
    double petalLength = Double.parseDouble(request.getParameter("petalLength"));
    double petalWidth = Double.parseDouble(request.getParameter("petalWidth"));

    RConnection conn = new RConnection();

    conn.voidEval("library(randomForest)");
    conn.voidEval("rf <- readRDS(url('http://localhost:8080/Rserve/randomForest_Iris.rds','rb'))");

    conn.voidEval("result <- as.character(predict(rf, (list(Sepal.Length=" + sepalLength + ", Sepal.Width=" + sepalWidth + ","
    + "Petal.Length=" + petalLength + ", Petal.Width=" + petalWidth + "))))");

    String result = conn.eval("result").asString();
    // out.println(result);

%>
{"result":"<%=result%>"}