<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="com.common.*" %>
<%@ page import="java.util.*" %>
<%
	String username = null;
	String email  = null;
	String level  = null;
	String firstname=null;
	String lastname = null;
	String cfName = null;
	String clName = null;
	String cEmail = null;
	String cid = null;
	int uid = 0;
	ArrayList<String> imagename = new ArrayList<String>();
%>
<% 
	if(session.getAttribute("TxtUserName")==null) {
		out.print("<script>alert('     Please Login!    ');window.location.href='login.jsp'</script>");
	}
	else {
 		username= session.getAttribute("TxtUserName").toString(); 
 		email = session.getAttribute("EmailAddress").toString();
 		level = session.getAttribute("level").toString();
 		firstname =  session.getAttribute("firstname").toString();
 		lastname =  session.getAttribute("lastname").toString();
 		uid = Integer.parseInt(session.getAttribute("uid").toString());
	}	
	if(session.getAttribute("cEmail") != null) {
		cEmail = session.getAttribute("cEmail").toString();
	}
	if(cEmail != null && cEmail.length() != 0) {
		//read image info
		Connection conn  = Connect.getconn();	
		Statement statement = conn.createStatement();
		String sql = "select * from member_info where email='" + cEmail + "'";
  		ResultSet rs = statement.executeQuery(sql);
  		rs.next();
  		cfName = rs.getString("firstname");
  		clName = rs.getString("lastname");
  		cid = rs.getString("uid");
  		
		sql = "select * from member_signature where member_id='" + cid + "'";
		rs = statement.executeQuery(sql);
		
  		while(rs.next()) {	
  			imagename.add(rs.getString("name"));
		}
	}
%>

<%
  	String picUrl = request.getParameter("Picurl"); 
  	String  step = request.getParameter("step"); 
  	String defaultPic = "images/signature.jpg";
  	if("3".equals(step))
    	defaultPic = "User/UserSignature/"+picUrl+".png";
%>
<HTML>
	<HEAD>
		<TITLE>FU (Formal Undertakings) Recognition System</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<META content="MSHTML 6.00.2900.3698" name=GENERATOR>
		<link href="css/frame.css" type="text/css" rel="Stylesheet" />
		<link href="css/main.css" type="text/css" rel="Stylesheet" />
		<link href="css/view.css" type="text/css" rel="Stylesheet" />
    	<script type="text/javascript" src="js/jquery1.2.6.pack.js"></script>
    	<script  type="text/javascript" src="js/ui.core.packed.js" ></script>
    	<script type="text/javascript" src="js/ui.draggable.packed.js" ></script>
    	<script type="text/javascript" src="js/CutPic.js"></script>
    	<script type="text/javascript" src="js/Frame.js"></script>
	</HEAD>
	<BODY bgColor=#ffffff leftMargin=0 background=images/home_background.gif topMargin=0 
		onload="MM_preloadImages('images/home_button1_r.jpg','images/home_button2_r.jpg','images/home_button3_r.jpg','images/arrow_r.gif')" 
		MARGINHEIGHT="0" MARGINWIDTH="0">
		<TABLE cellSpacing=0 cellPadding=0 width=740 align=center border=0>
  			<TBODY>
  				<TR>
    				<TD colSpan=11>&quot; <IMG height=23 alt="" src="images/top_bar.gif" width=740></TD>
    			</TR>
  				<TR>
    				<TD vAlign=top rowSpan=5>
      					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        					<TBODY>
        						<TR>
          							<TD vAlign=top><A href="index.jsp"><IMG height=107 src="images/1.jpg" width=206 border=0></A></TD>
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
              									<%	}	%>
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
                  								<%	}	%>
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
    				<TD colSpan=2 rowSpan=2><IMG height=177 alt="" src="images/content3_image1.jpg" width=83></TD>
    				<TD colSpan=2><IMG height=83 alt="" src="images/content3_image2.jpg" width=165></TD>
    				<TD colSpan=2>
    					<A onmouseover="MM_swapImage('Image2','','images/content3_button2_r.jpg',1)" 
      						onmouseout=MM_swapImgRestore() href="services.jsp"><IMG height=83 alt="" 
      						src="images/content3_button2.jpg" width=86 border=0 name=Image2></A>
      				</TD>
    				<TD colSpan=3><IMG height=83 alt="" src="images/content3_image4.jpg" width=165></TD>
    				<TD rowSpan=6><IMG height=517 alt="" src="images/home_side.gif" width=35></TD>
    			</TR>
  				<TR>
    			<TD>
    				<A onmouseover="MM_swapImage('Image1','','images/content3_button1_r.jpg',1)" 
      					onmouseout=MM_swapImgRestore() href="about.jsp"><IMG height=94 alt="" 
      					src="images/content3_button1.jpg" width=83 border=0 name=Image1></A>
      			</TD>
    			<TD colSpan=4><IMG height=94 alt="" src="images/content3_image3.jpg" width=250></TD>
    			<TD colSpan=2>
    				<A onmouseover="MM_swapImage('Image3','','images/content3_button3_r.jpg',1)" 
      					onmouseout=MM_swapImgRestore() href="contact.jsp"><IMG height=94 alt="" 
      					src="images/content3_button3.jpg" width=83 border=0 name=Image3></A>
      			</TD>
      		</TR>
  			<TR>
    			<TD bgColor=#ebebeb colSpan=9 height=13>
      				<DIV align=center>
      					<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
        					<TBODY>
        						<TR>
          							<TD>
            							<b><font color="#ff6600" size="2" face="Verdana, Arial, Helvetica, sans-serif">Uploaded Image Files and Relevant Signatures.</font></b>
            						</TD>
            					</TR>
            				</TBODY>
            			</TABLE>
            		</DIV>
            	</TD>
            </TR>
            <TR>
            	<TD background=images/line1.gif height=50><IMG height=25 alt="" src="images/line1.gif" width=2></TD>
            	<TD colSpan=7 height=50>
            	<form name="search" id="search" method = "post" action = "servlet/Search">
            		<DIV align=center>
      					<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        					<TBODY>
        						<TR>
          							<TD>
            							<b><font size="2" face="Verdana, Arial, Helvetica, sans-serif">Please input client's email:</font></b>
            						</TD>
            						<TD>
            							<input type = "text" name = "semail" id = "semail">
            						</TD>
            						<TD>
            							<input type = "submit" name = "search" value = "search" id = "search">
            						</TD>
            					</TR>
            				</TBODY>
            			</TABLE>
            		</DIV>
            	</form>
            	</TD>
            	<TD background=images/line3.gif height=50><IMG height=25 alt="" src="images/line3.gif" width=2></TD>
            </TR>
  			<TR>
    			<TD background=images/line1.gif height=382><IMG height=238 alt="" src="images/line1.gif" width=2></TD>
    			<TD vAlign=top colSpan=7 height=382>
    				<form name="form1" id="form1" method = "post">
    					<hr color="#cccccc" width="100%" size="3" />
      					<TABLE  cellSpacing=2 cellPadding=2 width="100%" border=0>
        					<TBODY>
        						<TR>
          							<TD vAlign=top width="47%">
            							<TABLE width=228 border=0 >
              								<TBODY>
              									<TR>
                									<TD height=22 style="font-size:14px;">File Name <br>*Customer's Relevant Documents</TD>
                								</TR>
             									<%
			 										int j=1;
			 										for(String n : imagename){ 
			 									%>
              									<TR>
                									<TD  style="font-size:14px;">
                										<%
                											String path = "servlet/ChangeImage?filename=" + n + "&type=1";
                										%>
														&nbsp;&nbsp;&nbsp;&nbsp;(<%=j%>)&nbsp;
														<a class=a2 href="<%=path%>"> <%=n %>.PNG </a>
                									</TD>
                								</TR>
            									<% 
            											j++;
            										} 
            									%>
            								</TBODY>
            							</TABLE>
            							<P>&nbsp;</P>
            						</TD>
          							<TD vAlign=top width="53%" height=170>
            							<TABLE width=228>
              								<TBODY>
              									<TR vAlign=top height=100>
              									<%
              										if(cEmail != null && cEmail.length() != 0) {
              									%>
                									<TD>Name: <%=cfName %>&nbsp;&nbsp;<%=clName %><BR>Email: <%= cEmail %><BR></TD>
                								<%	}	%>
                								</TR>
              									<TR vAlign=top height=150>
                									<TD>
                										<div id="CurruntPicContainer">
                											<div class="photocontainer">
                												<img id="imgphoto" src="<%=defaultPic%>" style="border-width:0px;" width="120"  height="120"/>
                											</div>
                										</div>
            										</TD>
            									</TR>
              								</TBODY>
              							</TABLE>
              						</TD>
              					</TR>
              				</TBODY>
              			</TABLE>
           			</form>
          		</TD>
    			<TD background=images/line3.gif height=382>
    				<IMG height=238 alt="" src="images/line3.gif" width=2>
    			</TD>
    		</TR>
  			<TR>
    			<TD bgColor=#cccccc colSpan=9 height=2>
      				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD width="81%" height=36>
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
          						<TD width="19%" height=36>
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
    			<TD colSpan=10>
    				<IMG height=34 alt="" src="images/home_bottom.gif" width=705>
    			</TD>
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
