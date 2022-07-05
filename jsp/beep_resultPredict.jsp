<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    request.setCharacterEncoding("utf-8");

    String hpredict = request.getParameter("hpredict");

    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);

        String qeury ="select * from history where hpredict = " + hpredict;

        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(qeury);

        if(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("hid", rs.getInt(1));
            tempJson.put("hdaytype", rs.getString(2));
            tempJson.put("hpredict", rs.getString(3));
            tempJson.put("hstart", rs.getInt(4));
            tempJson.put("hholiday", rs.getInt(5));
            tempJson.put("hweather", rs.getInt(6));
            tempJson.put("htraffic1", rs.getInt(7));
            tempJson.put("htraffic2", rs.getInt(8));
            tempJson.put("hspop", rs.getInt(9));
            itemList.add(tempJson);
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);

    }catch(Exception e){
        e.printStackTrace();
    }
    %>
    