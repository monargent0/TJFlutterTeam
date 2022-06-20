<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    String queryType = request.getParameter("queryType");

    String url_mysql = "jdbc:mysql://localhost/beep_data?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
    String id_mysql="root";
    String pw_mysql="qwer1234";

    PreparedStatement ps = null;

    JSONObject jsonList = new JSONObject();
    JSONArray itemList = new JSONArray();

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);

        String query = "select * from cdata";
        
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(query);

        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("cdaytype", rs.getString(2));
            tempJson.put("cdriving", rs.getInt(3));
            tempJson.put("cstart", rs.getInt(4));
            tempJson.put("choliday", rs.getInt(5));
            tempJson.put("cdate", rs.getString(6));
            tempJson.put("cweather", rs.getInt(7));
            tempJson.put("ctraffic1", rs.getInt(8));
            tempJson.put("ctraffic2", rs.getInt(9));
            tempJson.put("cspop", rs.getInt(10));
            itemList.add(tempJson);
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);
    }catch(Exception e){
        e.printStackTrace();
    }
    %>