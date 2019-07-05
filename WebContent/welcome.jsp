<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.none {
    display:none;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("input[name$='department']").click(function() {
        var test = $(this).val();
		console.log(test);
        $("div.none").hide();
        $("#department" + test).show();
    });
});
</script>
</head>
<body>
<center><h3>Login to access to telephone directory </h3>
<a href="login.jsp"> Login </a>
<center><img src="IIT_logo.png"  width="70" height="70"><font size=6 color=#005B00><b>IIT Kanpur Telephone Directory Service</b></font></td></tr></table></center>
<h5><b>NOTE:</b> Search by Name, Phone, House, email & PFNo. supports substring search</h5>
<hr>
<h4><b>Display/Order by:</b></h4>
<form action="/action_page.php">
 <table border="0"> 
	
	<h4><b>Search by:</b></h4>
	<tr>
	<td>
	
            <input type="radio" name="department" value= "1" data-id="name"/> 
			<label>Name</label></td>
			
         <td>   <input type="radio" name="department" value = "2" data-id="phone"/> 
			<label>Phone</label>
            
	</td></tr>
	
 <tr>
	<td>
	
            <input type="radio" name="department" value = "3" data-id="designation"/> 
			<label>Post</label></td>
			<td>
            <input type="radio"	name="department" value="4" data-id="designation"/> 
			<label >Designation</label>
            
	</td></tr>

	<tr>
	<td>
	
            <input type="radio"	name="department" value="5" data-id="department_s"/> 
			<label >Department/Section/Unit(By Code)</label>
			</td>
			<td>
            <input type="radio" name="department" value="6" data-id="department_b"/> 
			<label for ="id8">Department/Section/Unit(By Name)</label>
            
	</td></tr>
	
	<tr>
	<td>
	
            <input type="radio"	name="department" value="7" data-id="house_no"/> 
			<label>House</label>
			</td>
			<td>
           
			
            
	</td></tr>
	<tr>
	<td>
	
            <input type="radio" name="department" value="12" data-id="office_no"/> 
			<label >Offices</label>
		</td>
			<td>	
			
            <input type="radio" name="department" value="8" /> 
			<label >Complaints(IWD)</label>
			
            
	</td></tr>
	<tr>
	<td>
	
            <input type="radio" name="department" value="9" data-id="email"/>
            <label >Email</label>			
			
		</td>
			<td>	
            <input type="radio" name="department" value="10" />
			<label >BUilding</label>
            
	</td></tr>
	<!-- <tr>
	<td >
	
            <input type="radio" 
			name="department"
            id = "id15"  			
			checked="checked" /> 
			<label for ="id15">Amenities & Services</label>
		</td>
			<td>	
            <input type="radio" 
			name="department"
            id = "id16"			
			value="checked" /> 
			<label for ="id16">Emergency Services</label>
            
	</td>
	</tr>
-->
	<tr>
	<td>
	
            <input type="radio"	name="department" value="11" />
			<label>Directory(Complete)</label>
           
            
	</td>
	<br>
	<br></tr>
	<tr>
	<td >
	<!-- 
        <input type="radio" 
			name="department" 
			id = "id20"
			value="checked" /> 
			<label for = "id20">Kanpur City</label>
		</td>
			<td>	
        <input type="radio" 
			name="department" 
			id = "id21"
			value="checked" /> 
			<label for ="id21">Hospital/Pathology</label>
            
	</td>
	</tr> --></table>
</form>










<div id="department6" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="dept_name" class="none" >
<select name="sel"><option value=""><---Select---></option>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
java.sql.Statement s = null;
java.sql.ResultSet rs = null;
 s = con.createStatement();
/* PreparedStatement psmnt = con.prepareStatement("select department from database_d ");
ResultSet results = psmnt.executeQuery(); */
rs = s.executeQuery("select name from departments");

while(rs.next()){

String name = rs.getString(1);
%><option value="<%= name %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select>
<input type="submit">
</form>
</div>



<div id="department1" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="p_name" class="none" >
<input type="text" name="name"  />
<input type="submit">
</form>
</div>
<div id="department2" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="p_no" class="none" >
<input type="text" name="name"  />
<input type="submit">
</form>
</div>

<div id="department9" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="email" class="none" >
<input type="text" name="email"  />
<input type="submit">
</form>
</div>

<div id="department11" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="complete" class="none" >

<input type="submit">
</form>
</div>

<div id="department4" class="none">
<form action="Fetch" method="post">
<input type="text" name="type" value="post_name" class="none" >
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
</select>
</form>
</div>


<!-- <form action="action">

</form> -->
</center>
<br>
	<br>
	<br>
	<br>
	1. <Font color=Blue>Use email :<b>oahelp@iitk.ac.in</b> or call <b>6556</b> for any suggestion/request/modification in</font>   <font color=RED><b> Online Telephone Directory</b></font>.<br>
	2. <Font color=Blue>Use email :<b>sanchar@iitk.ac.in</b> or call <b>7544</b> for  name/data modification in </font>  <font color=RED><b> IP-Phone</b></font>
	
	<br><hr></hr>
	
	<a href=./PDF/EPABX-UsersGuide.pdf target=_blank>EPABX-Users Guide</a>
	<br>
	<a href=./PDF/IPPhone-UsersGuide.pdf target=_blank>IPPhone-Users Guide</a>
	<br>
	<a href=./old_dir.pdf target=_blank><b>  Telephone Directory (Older Version)</b></a>
	<br>
	<a href=./Directory_IITK_18.pdf target=_blank><b>  <font color='green'>Current Telephone Directory (2018 Version) </font></b></a>
	<br>
	<a href=./Polycom-VVX-411-full-user-guide-v1.0.pdf target=_blank><b>  <font color='green'>Polycom Telephone Manual </font></b></a>
	
</body>
</html>