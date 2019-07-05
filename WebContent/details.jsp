
<%@page language="java" import="java.util.*" %>
<html>
<head>
<title>Data Page</title>
</head>
<body> 
<table border="1" width="303">
<tr bgcolor="#A52A2A">
<td><b>S no</b></td>
<td><b>name</b></td>
<td><b>Department</b></td>
<td><b>Designation</b></td>
<td><b>Email</b></td>
<td><b>Phone office</b></td>
<td><b>Phone Home</b></td>
<td><b>Office number</b></td>
</tr>
<%Iterator itr;%>
<% List data= (List)request.getAttribute("data");
for (itr=data.iterator(); itr.hasNext(); )
{
%>

<tr bgcolor="#DEB887">
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		<td><%=itr.next() %></td>
		
		
		</tr>
<%}%>
</table>
</body>
</html>