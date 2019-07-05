<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Indian Institute of Technology , Kanpur</h2>
<%
	
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select *from database_d");
	%>
		
			
			<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>name</b></td>
<td><b>Designation</b></td>
<td><b>Email</b></td>
<td><b>Phone office</b></td>
<td><b>Phone Home</b></td>
<td><b>Office number</b></td>
</tr>
<%
while(rs.next()) 
		{ 
			%>
		<tr bgcolor="#DEB887">
		<td><%=rs.getString("person") %></td>
		<td><%=rs.getString("designation") %></td>
		<td><%=rs.getString("email") %></td>
		<td><%=rs.getString("phone_o") %></td>
		<td><%=rs.getString("phone_h") %></td>
		<td><%=rs.getString("office_no") %></td>
		
		</tr>
		
		
		
<% } %>
			
	</table>
	
	
</body>
</html>