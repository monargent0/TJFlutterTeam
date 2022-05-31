<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    String uId = request.getParameter("uid");
    String uPw = request.getParameter("upw");

    String url_mysql = "jdbc:mysql://localhost/team2?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    
    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String whereDefault ="select uid , upw , uname from users where uid = ? and upw = ? ";

        ps = conn_mysql.prepareStatement(whereDefault);
        ps.setString(1, uId);
        ps.setString(2, uPw);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("uid", rs.getString(1));
            tempJson.put("upw", rs.getString(2));
            tempJson.put("uname", rs.getString(3));
            itemList.add(tempJson);
            
        }else{
            itemList.add("ERROR");
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);

    }catch(Exception e){

        e.printStackTrace();

    }
    %>