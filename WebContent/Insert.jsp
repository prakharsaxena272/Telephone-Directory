<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert values</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

function Myproject()								 
{ 
	var name = document.forms["RegForm"]["Name"];			 
	var what = document.forms["RegForm"]["Department"]; 
    var what = document.forms["RegForm"]["Designation"];
    var email = document.forms["RegForm"]["EMail"]; 
	var phone = document.forms["RegForm"]["Telephone_office"];
    var phone = document.forms["RegForm"]["Telephone_house"];
    var what = document.forms["RegForm"]["Office_no"]; 
	var address = document.forms["RegForm"]["House_no"]; 

	if (name.value == "")								 
	{ 
		window.alert("Please enter your name."); 
		name.focus(); 
		return false; 
	} 
    if (what.selectedIndex < 1)				 
	{ 
		alert("Please select your Department"); 
		what.focus(); 
		return false; 
	} 
    if (what.selectedIndex < 1)				 
	{ 
		alert("Please select your designation."); 
		what.focus(); 
		return false; 
	} 

	if (email.value == "")								 
	{ 
		window.alert("Please enter a valid e-mail address."); 
		email.focus(); 
		return false; 
	} 

	if (email.value.indexOf("@", 0) < 0)				 
	{ 
		window.alert("Please enter a valid e-mail address."); 
		email.focus(); 
		return false; 
	} 

	if (email.value.indexOf(".", 0) < 0)				 
	{ 
		window.alert("Please enter a valid e-mail address."); 
		email.focus(); 
		return false; 
	} 

	if (phone.value == "")						 
	{ 
		window.alert("Please enter your telephone number of Office."); 
		phone.focus(); 
		return false; 
	} 
    if (phone.value == "")						 
	{ 
		window.alert("Please enter your telephone number of house."); 
		phone.focus(); 
		return false; 
	} 

	if (what.selectedIndex < 1)				 
	{ 
		alert("Please select your office number."); 
		what.focus(); 
		return false; 
	} 
    if (House_no.value == "")								 
	{ 
		window.alert("Please enter your house number."); 
		House_no.focus(); 
		return false; 
	}

	return true; 
}</script> 

</script>
<style>
	.bs-example{
    	margin: 20px;
    }
</style>
</head>
<body>
<div class="bs-example">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a href="#home" class="nav-link active" data-toggle="tab">Form 1</a>
        </li>
        <li class="nav-item">
            <a href="#profile" class="nav-link" data-toggle="tab">Form 2</a>
        </li>
        <li class="nav-item">
            <a href="#messages" class="nav-link" data-toggle="tab">Form 3</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade show active" id="home">
            <h4 class="mt-2">Insert Departmental Values</h4>
            <form name="RegForm" action="Insert" onsubmit="return Myproject()" method="post" autocomplete="on"> 
	
	<p>Name: <input type="text" size=65 name="Name"> </p><br>
    
    <p>Department 
		<select type="text" name="department"><option value=""><---Select---></option>
<%
Class.forName("com.mysql.jdbc.Driver");
 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?autoReconnect=true&useSSL=false" ,"root","Prakhar123@");
java.sql.Statement s = null;
java.sql.ResultSet rs = null;
 s = conn.createStatement();
/* PreparedStatement psmnt = con.prepareStatement("select department from database_d ");
ResultSet results = psmnt.executeQuery(); */
rs = s.executeQuery("select name,abb from departments");
while(rs.next()){

	String name = rs.getString(1);
	String abb = rs.getString(2);
	out.println(name);
	out.println(abb);
	%><option value="<%=abb %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select></p><br><br> 
        
         <p>Designation
<!-- 		select type="text" value="" name="Designation"> 
 -->			<select type="text" name="designation"><option value=""><---Select---></option>
<%
/* 
PreparedStatement psmnt2 = con.prepareStatement("select designation from database_d ");
ResultSet results2 = psmnt.executeQuery(); */
rs = s.executeQuery("select name,abb from designations");

while(rs.next()){

String name = rs.getString(1);
String abb = rs.getString(2);
out.println(name);
out.println(abb);
%><option value="<%=abb %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select>  
</p><br><br> 
	
	<p>E-mail Address: <input type="email" size=65 name="EMail"> </p><br> 
	 
	<p>Telephone(office): <input type="tel" size=65 name="Telephone_office"> </p><br> 
    <p>Telephone(house): <input type="tel" size=65 name="Telephone_house"> </p><br>
		
        <p>Office_no
        
<select type="text" name="office_no"><option value=""><---Select---></option>
<%
/* 
PreparedStatement psmnt2 = con.prepareStatement("select designation from database_d ");
ResultSet results2 = psmnt.executeQuery(); */
rs = s.executeQuery("select office_no from database_b");

while(rs.next()){

String name = rs.getString(1);
%><option value="<%= name %>"><%=name%></option>
<%} rs.close(); /* psmnt.close(); */ %>
</select>  
</p><br><br> 
        
        <p>House_no: <input type="text" size=65 name="house"> </p><br>

	 
	<p><input type="submit" value="Submit" name="Submit">	 
		<input type="reset" value="Reset" name="Reset"> 
	</p>		 
</form> 
        </div>
        <div class="tab-pane fade" id="profile">
            <h4 class="mt-2">Profile tab content</h4>
<form name="RegForm" action="Insert" onsubmit="return Myproject()" method="post" autocomplete="on"> 
	
    <p>Office_N o: <input type="text" size=65 name="Office_no"> </p><br>
	<p>Name: <input type="text" size=65 name="Name"> </p><br>
    
    <p>Type: <input type="text" size=65 name="Type"> </p><br>
    
    
   
	<p>E-mail Address: <input type="email" size=65 name="EMail"> </p><br> 
	 
	<p>Telephone(office): <input type="tel" size=65 name="Telephone_office"> </p><br> 
    <p><input type="submit" value="Submit" name="Submit">	 
		<input type="reset" value="Reset" name="Reset"> 
	</p>
			 
</form>         </div>
       
    </div>
</div>
</body>
</html> 