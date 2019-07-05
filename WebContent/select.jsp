<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
<body>
<form name="form" method="post" >
<b>Select a country:</b>&nbsp;</td>
<select name="sel"><option value=""><---Select---></option>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
java.sql.Statement s = null;
java.sql.ResultSet rs = null;
 s = con.createStatement();
/* PreparedStatement psmnt = con.prepareStatement("select department from database_d ");
ResultSet results = psmnt.executeQuery(); */
rs = s.executeQuery("select department from database_d");

while(rs.next()){

String name = rs.getString(1);
%><option value="<%= name %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select><br>

 <select name="sel"><option value=""><---Select---></option>
<%
/* 
PreparedStatement psmnt2 = con.prepareStatement("select designation from database_d ");
ResultSet results2 = psmnt.executeQuery(); */
rs = s.executeQuery("select designation from database_d");

while(rs.next()){

String name = rs.getString(1);
%><option value="<%= name %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select><br> 
</form>

</body>
</html>