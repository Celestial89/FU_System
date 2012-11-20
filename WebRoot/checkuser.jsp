<%@ page contentType="text/html; charset=GBK" import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>
<%
	Connection conn  = Connect.getconn();	
	Statement statement = conn.createStatement();
	String sql;
  	sql = "select * from member_info where username='" + request.getParameter("TxtUserName") + "' and password='" + request.getParameter("TxtPassword") + "'";
  	try{
  		ResultSet rs = statement.executeQuery(sql);

  		if(rs.next()) {	
    		session.setAttribute("TxtUserName",request.getParameter("TxtUserName"));
    		session.setAttribute("EmailAddress",rs.getString("email"));
    		session.setAttribute("level",rs.getString("level"));
	    	session.setAttribute("firstname",rs.getString("firstname"));
		    session.setAttribute("lastname",rs.getString("lastname"));
		    session.setAttribute("uid",rs.getString("uid"));
    		response.sendRedirect("index.jsp");
  		}
  		else {
%>
<script language="javascript">
	alert("Wrong UserName or Password,Please login again!");
	window.location = "login.jsp";
	//window.history.go(-1);
</script>
<%
		}
		rs.close();
		conn.close();
	}catch(Exception e) {
  		System.out.println(e.getMessage());
	}
%>
