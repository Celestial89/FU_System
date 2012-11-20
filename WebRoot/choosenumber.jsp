<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>

<%
	int count = Integer.parseInt(request.getParameter("option_number"));
	int uid = Integer.parseInt(session.getAttribute("uid").toString());
	String imagename = null;
	int uploaded = 0;

	Connection conn  = Connect.getconn();	
	Statement statement = conn.createStatement();
	String sql;
	for(int i=0;i<count;i++){
		imagename = CreateFileName.createtFileName();
  		sql = "insert into member_image(uid,imagename,uploaded)values('"+uid+"','"+imagename+"','"+uploaded+"')";
  		Thread.sleep(100);
  		statement.execute(sql);
  	}
  	conn.close();
%>
<script language="javascript">
	window.location = "imagedetail.jsp";
	//window.history.go(-1);
</script>
