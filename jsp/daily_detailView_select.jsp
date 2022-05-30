<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String url_mysql = "jdbc:mysql://localhost/team2?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    String dcontent = request.getParameter("dcontent");
    String epath = request.getParameter("epath");
    String ename = request.getParameter("ename");
    String did = request.getParameter("did");
    String eid = request.getParameter("eid");

    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);

        String qeury ="select d.dcontent, e.epath, e.ename, d.did, d.eid from diary d, emotion e where d.eid = e.eid and did = " + did;

        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(qeury);

        if(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("dcontent", rs.getString(1));
            tempJson.put("epath", rs.getString(2));
            tempJson.put("ename", rs.getString(3));
            tempJson.put("did", Integer.parseInt(rs.getInt(4)));
            tempJson.put("eid", Integer.parseInt(rs.getInt(5)));
            itemList.add(tempJson);
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);

    }catch(Exception e){
        e.printStackTrace();

    }
    %>