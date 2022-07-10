<%@page import="org.rosuda.REngine.Rserve.RConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("utf-8");
  
    // 받아온 파라미터 : user id, 출발시간, 1종교통량, 2종교통량, 서울인구수
    String buid = request.getParameter("buser_buid"); 
    int hstart = Integer.parseInt(request.getParameter("hstart"));
    int htraffic1 =  Integer.parseInt(request.getParameter("htraffic1"));
    int htraffic2 =  Integer.parseInt(request.getParameter("htraffic2"));
    int hspop = Integer.parseInt(request.getParameter("hspop"));

    RConnection conn = new RConnection();

    // 최종 선정된 랜덤 포레스트 머신러닝 패키지 사용
    conn.voidEval("library(randomForest)");

    // beep_model_rf_eng.rds rds 파일 불러오기
    conn.voidEval("rf <- readRDS(url('http://localhost:8080/Flutter/beep_model_rf_eng.rds','rb'))");

    // flutter에서 입력받아온 파라미터(예측값)를(을) 토대로 예측값 계산 
    conn.voidEval("result <- as.numeric(predict(rf, (list(hstart=" + hstart + ", htraffic1=" + htraffic1 + ","
        + "htraffic2=" + htraffic2 + ", hspop=" + hspop + "))))");

    // rfe 기법으로 얻어낸 표준오차값(15.87)으로 오차 예측값의 오차범위를 알려줌
    String result1 = conn.eval("as.character(trunc(result-15.87))").asString();
    String result2 = conn.eval("as.character(trunc(result+15.87))").asString();
    String conResult = result1.toString() + "~" + result2.toString();

    // -------------------------------------------------------------------------------------
    // 예측값을 구한 후 MySQL DB 테이블에 입력받은 정보와 얻어낸 예측값 범위를 저장
    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps =null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

                    // Flutter d2.dart페이지로부터 입력받은 피처컬럼과 예측값 범위 Insert Query문
        String act1 ="insert into history(hpredict, hstart, htraffic1, htraffic2, hspop, buser_buid";
        String act2=") values (?,?,?,?,?,?)";
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

<%--예측값 잘 나오는지 확인용 %>
{"result":"<%=result1%>~<%=result2%>"}