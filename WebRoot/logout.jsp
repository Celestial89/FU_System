<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%
	session.invalidate();
	out.print("<script>alert('Thanks for using our system!');window.location.href='login.jsp'</script>");
%>
