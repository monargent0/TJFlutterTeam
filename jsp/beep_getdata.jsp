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

        String query = "";
        
        if(queryType.equals("pop")){
            query ="select distinct(cspop), substr(cdate,1,4) cyear from cdata order by substr(cdate,1,4)";
        }else if(queryType.equals("traffic1")){
            query = "select round(avg(ctraffic1),0) traffic1 , cstart from cdata group by cstart";
        }else if(queryType.equals("traffic2")){
            query = "select round(avg(ctraffic2),0) traffic2 , cstart from cdata group by cstart";
        }else if(queryType.equals("D-2")){
            query = "select round(avg(cdriving),0) D2 , cstart from cdata group by cstart";
        }
        
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(query);

        while(rs.next()){
            JSONObject tempJson = new JSONObject();
            tempJson.put("y", rs.getInt(1));
            tempJson.put("x", rs.getInt(2));
            itemList.add(tempJson);
        }
        jsonList.put("results", itemList);
        conn_mysql.close();
        out.print(jsonList);
    }catch(Exception e){
        e.printStackTrace();
    }
    %>