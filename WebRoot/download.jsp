<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>
<%
	String username = null;
	String email  = null;
	String level  = null;
	int uid = 0;
	String name = null;
%>
<% 
	if(session.getAttribute("TxtUserName")==null){
		out.print("<script>alert('     Please Login!    ');window.location.href='login.jsp'</script>");
	}
	else {
 		username= session.getAttribute("TxtUserName").toString(); 
 		email = session.getAttribute("EmailAddress").toString();
 		level = session.getAttribute("level").toString();
		uid = Integer.parseInt(session.getAttribute("uid").toString());

		Connection conn  = Connect.getconn();	
		Statement statement = conn.createStatement();
		String sql;
  		sql = "select * from member_info where uid='"+uid+"'";
 
  		ResultSet rs = statement.executeQuery(sql);
  		rs.next();
		name = rs.getString("lastname") + " " + rs.getString("firstname");
		
		session.setAttribute("name", name);
  	}	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FU (Formal Undertakings) Recognition System</TITLE>
    	<link href="css/frame.css" type="text/css" rel="Stylesheet" />
		<link href="css/main.css" type="text/css" rel="Stylesheet" />
    	<script type="text/javascript" src="js/jquery1.2.6.pack.js"></script>
    	<script  type="text/javascript" src="js/ui.core.packed.js" ></script>
   	 	<script type="text/javascript" src="js/ui.draggable.packed.js" ></script>
   		<script type="text/javascript" src="js/CutPic.js"></script>
   		<script type="text/javascript" src="js/Frame.js"></script>
   		<script type="text/javascript" src="js/Form.js"></script>
	</HEAD>

	<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 background="images/home_background.gif" onLoad="MM_preloadImages('images/home_button1_r.jpg','images/home_button2_r.jpg','images/home_button3_r.jpg','images/arrow_r.gif','images/contact_button2_r.jpg','images/contact_button1_r.jpg','images/contact_button3_r.jpg')">
		<TABLE WIDTH=740 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  			<TR> 
    			<TD COLSPAN=11> 
    				<IMG SRC="images/top_bar.gif" WIDTH=740 HEIGHT=23 ALT="">
    			</TD>
  			</TR>
  			<TR> 
    			<TD ROWSPAN=5 valign="top"> 
      				<table width="100%" border="0" cellspacing="0" cellpadding="0">
        				<tr> 
          					<td valign="top">
          						<a href="index.jsp">
          							<img src="images/1.jpg" width="206" height="107" border="0">
          						</a>
          					</td>
        				</tr>
        				<tr> 
          					<td valign="top"> 
            					<table width="100%" border="0" cellspacing="4" cellpadding="4">
             						<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="index.jsp">Home</A></DIV>
                  						</TD>
                  					</TR>
               						<%
               							if("Administrator".equals(level)){
                					%>
                					<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="admin.jsp">Administration</A></DIV>
                  						</TD>
                  					</TR>
                					<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="reading.jsp">Reading Attachments</A></DIV>
                  						</TD>
                  					</TR>
                 					<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="converting.jsp">Converting Files</A></DIV>
                  						</TD>
                  					</TR>
              						<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="capturing.jsp">Capturing Files</A></DIV>
                  						</TD>
                  					</TR>
              						<TR>
               							<TD vAlign=top>
                  							<DIV align=right><A href="sending.jsp">Sending Files</A></DIV>
                  						</TD>
                  					</TR>
                  					<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="view_admin.jsp">Signature View</A></DIV>
                  						</TD>
                  					</TR>
              						<%	} %>
               						<%
               							if("Client".equals(level)) { 
               						%> 
               						<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="download.jsp">Download</A></DIV>
                  						</TD>
                  					</TR>
                  					<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="usermodification.jsp">UserInfo Admin</A></DIV>
                  						</TD>
                  					</TR>
              						<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="view_client.jsp">Signature View</A></DIV>
                  						</TD>
                  					</TR>
                  					<%	} %>
              						<TR>
                						<TD vAlign=top>
                  							<DIV align=right><A href="about.jsp"  style=" color:#F00">About Us</A></DIV>
                  						</TD>
                  					</TR>
              						<TR>
                						<TD vAlign=top>
											<DIV align=right><A href="logout.jsp" style=" color:#F00">Log Out</A></DIV>
										</TD>
									</TR>
              						<TR>
                						<TD vAlign=top>&nbsp;</TD>
                					</TR>
              						<TR>
                						<TD vAlign=top>&nbsp;</TD>
                					</TR>
            					</table>
          					</td>
        				</tr>
      				</table>
    			</TD>
    			<TD COLSPAN=2 ROWSPAN=2> <IMG SRC="images/contact_image1.jpg" WIDTH=83 HEIGHT=177 ALT=""></TD>
    			<TD COLSPAN=2> <IMG SRC="images/contact_image2.jpg" WIDTH=165 HEIGHT=83 ALT=""></TD>
    			<TD COLSPAN=2> <a href="services.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/contact_button2_r.jpg',1)">
    				<IMG SRC="images/contact_button2.jpg" WIDTH=86 HEIGHT=83 ALT="" border="0" name="Image2"></a>
    			</TD>
    			<TD COLSPAN=3> <IMG SRC="images/contact_image4.jpg" WIDTH=165 HEIGHT=83 ALT=""></TD>
    			<TD ROWSPAN=6> <IMG SRC="images/home_side.gif" WIDTH=35 HEIGHT=517 ALT=""></TD>
  			</TR>
  			<TR> 
    			<TD> <a href="about.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','images/contact_button1_r.jpg',1)"><IMG SRC="images/contact_button1.jpg" WIDTH=83 HEIGHT=94 ALT="" border="0" name="Image1"></a></TD>
    			<TD COLSPAN=4> <IMG SRC="images/contact_image3.jpg" WIDTH=250 HEIGHT=94 ALT=""></TD>
    			<TD COLSPAN=2> <a href="contact.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','images/contact_button3_r.jpg',1)"><IMG SRC="images/contact_button3.jpg" WIDTH=83 HEIGHT=94 ALT="" border="0" name="Image3"></a></TD>
  			</TR>
  			<TR> 
    			<TD COLSPAN=9 bgcolor="EBEBEB" height="13"> 
      				<div align="center">
        				<table width="100%" border="0" cellspacing="2" cellpadding="2">
         					<tr>
            					<td>
              						<div align="left"><b><font color="#FF6600" size="2" face="Verdana, Arial, Helvetica, sans-serif">Document Download</font></b></div>
            					</td>
          					</tr>
        				</table>
        			</div>
    			</TD>
  			</TR>
  			<TR>
    			<TD background=images/line1.gif height=109><IMG height=238 alt="" src="images/line1.gif" width=2></TD>
    			<TD vAlign=top colSpan=7 height=109>
      				<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD vAlign=top>
            						<FORM name="form1" id="form1"  method="post">
            							<p style="font-size:14px;">Step1: download document</p>
            							<p style="font-size:14px;">Step2: sign your name on the document and scan the document</p>
            							<p style="font-size:14px;">Step3: sent the e-copy of the document to us by email</p>
            							<p style="font-size:12px;">* press the button to download document</p>
            							<P>
            								&nbsp;&nbsp;&nbsp; 
            								<INPUT id=button type=submit value=Download name=button onClick="document.form1.action='/FU_System/servlet/Download';document.form1.submit();">
            							</P>
            							<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</P>
            						</FORM>
            						<P>&nbsp;</P>
            					</TD>
            				</TR>
            			</TBODY>
            		</TABLE>
            	</TD>
    			<TD background=images/line3.gif height=109>
    				<IMG height=238 alt="" src="images/line3.gif" width=2>
    			</TD>
    		</TR>
  		<TR> 
    		<TD COLSPAN=9 bgcolor="#CCCCCC" height="2"> 
      			<table width="100%" border="0" cellspacing="0" cellpadding="0">
        			<tr> 
          				<td width="81%" height="4"> 
            				<div align="left"> 
              					<table width="100%" border="0" cellspacing="2" cellpadding="2">
                					<tr> 
                  						<td>Peter Mc Laughlin, Lin Nan, Ren Wei&nbsp;</td>
                					</tr>
              					</table>
            				</div>
          				</td>
          				<td width="19%" height="4"> 
            					<div align="right">
            						<a href="content2.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image32','','images/arrow_r.gif',1)">
            							<font size="1"><b>Support</b></font> 
              							<img name="Image32" border="0" src="images/arrow.gif" width="22" height="36" align="middle">
              						</a>
              					</div>
          					</td>
        				</tr>
      				</table>
    			</TD>
  			</TR>
  			<TR> 
    			<TD COLSPAN=10> <IMG SRC="images/home_bottom.gif" WIDTH=705 HEIGHT=34 ALT=""></TD>
  			</TR>
  			<TR> 
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=206 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=2 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=81 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=83 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=82 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=3 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=83 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=82 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=81 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=2 HEIGHT=1 ALT=""></TD>
    			<TD> <IMG SRC="images/spacer.gif" WIDTH=35 HEIGHT=1 ALT=""></TD>
  			</TR>
		</TABLE>
	</BODY>
</HTML>