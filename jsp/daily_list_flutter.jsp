<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    String uId = request.getParameter("uid");

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

        String whereDefault ="select d.did, d.ddate, d.dcontent, d.eid, d.uid , e.epath ,e.ename from diary d , emotion e where d.eid = e.eid and d.uid = ? order by ddate desc";

        ps = conn_mysql.prepareStatement(whereDefault);
        ps.setString(1, uId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("did", rs.getInt(1));
            tempJson.put("ddate", rs.getString(2));
            tempJson.put("dcontent", rs.getString(3));
            tempJson.put("eid", rs.getInt(4));
            tempJson.put("uid", rs.getString(5));
            tempJson.put("epath", rs.getString(6));
            tempJson.put("ename", rs.getString(7));
            itemList.add(tempJson);
            
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);

    }catch(Exception e){
        e.printStackTrace();

    }
    %>