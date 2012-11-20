<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>
<%
	String username = null;
	String email  = null;
	String level  = null;
	int enable = 0;
	String hostname = null;
	String emailuser = null;
	String emailpwd = null;
%>
<% 
	if(session.getAttribute("TxtUserName")==null) {
		out.print("<script>alert('     Please Login!    ');window.location.href='login.jsp'</script>");
	}
	else {
 		username= session.getAttribute("TxtUserName").toString(); 
 		email = session.getAttribute("EmailAddress").toString();
 		level = session.getAttribute("level").toString();
	}	
	if(level.equals("Client")){
		out.print("<script>alert('     Your Level is Limited!    ');window.location.href='index.jsp'</script>");
	}
%>
<%
	Connection conn  = Connect.getconn();	
	Statement statement = conn.createStatement();
	String sql;
  	sql = "select * from control where id='1'";
  	try {
  		ResultSet rs = statement.executeQuery(sql);
  		if(rs.next()) {	
  			enable = Integer.parseInt(rs.getString("sending"));
  		}
    	sql = "select * from email_info where id='2'";
 
  		rs = statement.executeQuery(sql);

  		if(rs.next()) {	
  			emailuser = rs.getString("username");
  			emailpwd = rs.getString("password");
  			hostname = rs.getString("host");
  		}
	}catch(Exception e) {
  		System.out.println(e.getMessage());
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FU (Formal Undertakings) Recognition System</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META content="MSHTML 6.00.2900.3698" name=GENERATOR>
		<link href="css/frame.css" type="text/css" rel="Stylesheet" />
		<script type="text/javascript" src="js/Frame.js"></script>
	</HEAD>
	<BODY bgColor=#ffffff leftMargin=0 background=images/home_background.gif topMargin=0 
		onload="MM_preloadImages('images/home_button1_r.jpg','images/home_button2_r.jpg','images/home_button3_r.jpg','images/arrow_r.gif')" 
		MARGINHEIGHT="0" MARGINWIDTH="0">
		<TABLE cellSpacing=0 cellPadding=0 width=740 align=center border=0>
  			<TBODY>
  				<TR>
    				<TD colSpan=11><IMG height=23 alt="" src="images/top_bar.gif" width=740></TD>
    			</TR>
  				<TR>
    			<TD vAlign=top rowSpan=5>
      				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD vAlign=top>
          							<A href="index.jsp">
          								<IMG height=107 src="images/1.jpg" width=206 border=0>
          							</A>
          						</TD>
          					</TR>
        					<TR>
          						<TD vAlign=top>
            						<TABLE cellSpacing=4 cellPadding=4 width="100%" border=0>
              							<TBODY>
            								<TR>
                								<TD vAlign=top>
                  									<DIV align=right><A href="index.jsp">Home</A></DIV>
                  								</TD>
                  							</TR>
               								<%
               									if("Administrator".equals(level)) {
                							%>
                							<TR>
                								<TD vAlign=top>
                  									<DIV align=right><A href="admin.jsp">Administration</A></DIV>
                  								</TD>
                  							</TR>
                  							<TR>
                								<TD vAlign=top>
                  									<DIV align=right><A href="positiondefine.jsp">Position Define</A></DIV>
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
                						</TBODY>
                					</TABLE>
                				</TD>
                			</TR>
                		</TBODY>
                	</TABLE>
                </TD>
    			<TD colSpan=2 rowSpan=2>
    				<IMG height=177 alt="" src="images/content2_image1.jpg" width=83>
    			</TD>
    			<TD colSpan=2>
    				<IMG height=83 alt="" src="images/content2_image2.jpg" width=165>
    			</TD>
    			<TD colSpan=2>
    				<A onmouseover="MM_swapImage('Image2','','images/content2_button2_r.jpg',1)" 
      					onmouseout=MM_swapImgRestore() href="services.jsp"><IMG height=83 alt="" 
      					src="images/content2_button2.jpg" width=86 border=0 name=Image2></A>
      			</TD>
    			<TD colSpan=3>
    				<IMG height=83 alt="" src="images/content2_image4.jpg" width=165>
    			</TD>
    			<TD rowSpan=6>
    				<IMG height=517 alt="" src="images/home_side.gif" width=35>
    			</TD>
    		</TR>
  			<TR>
    			<TD>
    				<A onmouseover="MM_swapImage('Image1','','images/content2_button1_r.jpg',1)" 
      					onmouseout=MM_swapImgRestore() href="about.jsp"><IMG height=94 alt="" 
      					src="images/content2_button1.jpg" width=83 border=0 name=Image1></A>
      			</TD>
    			<TD colSpan=4>
    				<IMG height=94 alt="" src="images/content2_image3.jpg" width=250>
    			</TD>
    			<TD colSpan=2>
    				<A onmouseover="MM_swapImage('Image3','','images/content2_button3_r.jpg',1)" 
      					onmouseout=MM_swapImgRestore() href="contact.jsp"><IMG height=94 alt="" 
      					src="images/content2_button3.jpg" width=83 border=0 name=Image3></A>
      			</TD>
      		</TR>
  			<TR>
    			<TD bgColor=#ebebeb colSpan=9 height=13>
      				<DIV align=center>
      					<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
        					<TBODY>
        						<TR>
          							<TD>
            							<DIV align=left>
            								<FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ff6600 size=1>
            									<B>
            										<FONT size=2>Sending Files--Choose the signature you&nbsp; want to send&nbsp;</FONT>
            									</B>
            								</FONT>
            							</DIV>
            						</TD>
            					</TR>
            				</TBODY>
            			</TABLE>
            		</DIV>
            	</TD>
            </TR>
  			<TR>
    			<TD background=images/line1.gif height=109><IMG height=238 alt="" src="images/line1.gif" width=2></TD>
    			<TD vAlign=top colSpan=7 height=109>
      				<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD vAlign=top>
          							<form name="form2" method="post" action="/FU_System/servlet/ModifyEmail">
           								<P>Current Email :&nbsp;&nbsp;&nbsp;</P>
            								<TABLE  width=484 height="68" border=1>
            									<TBODY>
              										<TR>
                										<TD width="48%" height=31>
                  											<label for="host">HostName</label>
                  											<input type="text" name="host" id="host" value=<%=hostname%>>
               											</TD>
                										<TD width="52%"><label for="username">Username:</label>
                  											<input type="text" name="username" id="username" value=<%=emailuser%>>
                  										</TD>
                  									</TR>
              										<TR>
                										<TD>
                											<label for="password">Password:</label>
                  											<input type="text" name="password" id="password" value=<%=emailpwd%>>
                  										</TD>
                										<TD>
                											<input type="submit" name="change" id="change" value="Modify"> 
                											<input type="hidden" name="type" id="type" value="sending">
                											*Change those Info?Click  Button
                										</TD>
                									</TR>
              								</TBODY> 
              							</TABLE>
              						</form>
            						<FORM name="form1" id="form1"  method="post" >
                						<table width="434" border="0">
                  							<tr>
                    							<td width="95" align="center">
                    								<input id=button3 type=submit value=Start name=button3     onClick="document.form1.action='/FU_System/servlet/SendMail';document.form1.submit();" style=" display:  
                    								<%
                    									if(enable==1){
                 									%>
                										none
                									<%	}	%>">
                								</td>
                    							<td width="329" style=" font-size:14px;color:red;" >
                    								<input id=button4 type=submit value=Stop name=button4 onClick="document.form1.action='/FU_System/servlet/StopSendMail';document.form1.submit();" style=" display:  
                    								<%
                    									if(enable==0){
                									%>
                										none
                									<%	}	%>"> 
                									<%
                										if(enable==1){
                 									%>
                    									Sending Function has been started!
                      								<%	}	%>
                      							</td>
                  							</tr>
                						</table>    
                					</FORM>             
                					&nbsp;&nbsp;&nbsp;&nbsp;* Start/Stop Sending the image attachments from mail server.&nbsp;&nbsp;&nbsp;
 									<form name="form3" method="post" action="/FU_System/servlet/Change2Start">
               							<p>
               								<a style="color:#F00; size:13px;">Emergency Button</a> 
                    						<input type="submit" name="subbtn" id="subbtn" value="Clear">
                    						<input type="hidden" name="type" id="type" value="sending">
                						</p>
                  						<p>* This Button can help you to change the running modle to &quot;Start&quot;  If you forgot to Stop the service before shutting down the webservice.</p>
                					</form>
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
    			<TD bgColor=#cccccc colSpan=9 height=2>
      				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD width="81%" height=4>
            						<DIV align=left>
            							<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
              								<TBODY>
              									<TR>
                									<TD>Peter Mc Laughlin, Lin Nan, Ren Wei&nbsp;</TD>
                								</TR>
                							</TBODY>
                						</TABLE>
                					</DIV>
                				</TD>
          						<TD width="19%" height=4>
            						<DIV align=right>
            							<A onmouseover="MM_swapImage('Image32','','images/arrow_r.gif',1)" 
            								onmouseout=MM_swapImgRestore() href="content2.jsp">
            								<FONT size=1><B>Support</B></FONT> 
            								<IMG height=36 src="images/arrow.gif" width=22 align=Middle border=0 name=Image32>
            							</A>
            						</DIV>
            					</TD>
            				</TR>
            			</TBODY>
            		</TABLE>
            	</TD>
            </TR>
  			<TR>
    			<TD colSpan=10><IMG height=34 alt="" src="images/home_bottom.gif" width=705></TD>
    		</TR>
  			<TR>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=206></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=2></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=81></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=83></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=82></TD>
   				<TD><IMG height=1 alt="" src="images/spacer.gif" width=3></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=83></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=82></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=81></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=2></TD>
    			<TD><IMG height=1 alt="" src="images/spacer.gif" width=35></TD>
    		</TR>
    	</TBODY>
    </TABLE>
  </BODY>
</HTML>
