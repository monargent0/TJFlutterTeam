<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    String buid = request.getParameter("buid");
    String upw = request.getParameter("upw");

    String url_mysql = "jdbc:mysql://localhost/beep_user?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    
    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

<<<<<<< HEAD
        String whereDefault ="select buid , upw , uname, uemail from buser where buid = ? and upw = ? and utaltoedate is null ";
=======
        String whereDefault ="select buid , upw , uname, uemail from buser where buid = ? and upw = ? ";
>>>>>>> 3427b3eae17c91bbc7fca157b0edecaa2f063494

        ps = conn_mysql.prepareStatement(whereDefault);
        ps.setString(1, buid);
        ps.setString(2, upw);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("buid", rs.getString(1));
            tempJson.put("upw", rs.getString(2));
            tempJson.put("uname", rs.getString(3));
            tempJson.put("uemail", rs.getString(4));
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