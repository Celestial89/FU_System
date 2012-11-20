<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>
<%
	String username =null;
	String password =null;
	String firstname = null;
	String lastname = null;
	String email = null;
	String uid=null;
	String level = "Client";
%>
<%
	lastname = request.getParameter("lastname");
	password = request.getParameter("password");
	firstname = request.getParameter("firstname");
	username = request.getParameter("username");
	email = request.getParameter("email");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'saveinfo.jsp' starting page</title>
    
<%
	Connection conn  = Connect.getconn();
	Statement statement = conn.createStatement();
	String sql;
	sql = "select * from member_info where email ='"+email+"'";

	ResultSet rs = statement.executeQuery(sql);

  	if(rs.next()) {	
  		uid = rs.getString("uid");
  	}
  	if(uid==null) {
 		sql = "insert into member_info(username,password,firstname,lastname,level,email)values('"+username+"','"+password+"','"+firstname+"','"+lastname+"','"+level+"','"+email+"')";
  		statement.execute(sql);
%>
	<script language="javascript">
		alert("Thanks for your registration,please login.");
		window.location = "login.jsp";
		//window.history.go(-1);
	</script>
<%
 	}
	else {
		//conn.close();
%>
	<script language="javascript">
		alert("Email has been registed, please change one!");
		//window.location = "reg.jsp";
		window.history.go(-1);
	</script>
<%	} %>

  </head>
</html>
