<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk" %>
<%
	String username = null;
	String email  = null;
	String level  = null;
%>
<% 
	if(session.getAttribute("TxtUserName")==null){
		out.print("<script>alert('     Please Login!    ');window.location.href='login.jsp'</script>");
	}
	else {
 		username= session.getAttribute("TxtUserName").toString(); 
 		email = session.getAttribute("EmailAddress").toString();
 		level = session.getAttribute("level").toString();
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<TITLE>
			FU (Formal Undertakings) Recognition System
		</TITLE>
		
		<link href="css/frame.css" type="text/css" rel="Stylesheet" />
		<script type="text/javascript" src="js/Frame.js"></script>
	</head>

	<BODY onload="MM_preloadImages('images/home_button1_r.jpg','images/home_button2_r.jpg','images/home_button3_r.jpg','images/arrow_r.gif')" 
		bgColor=#ffffff leftMargin=0 background=images/home_background.gif topMargin=0 MARGINHEIGHT="0" MARGINWIDTH="0">
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
                  										<DIV align=right>
                  											<A href="index.jsp">Home</A>
                  										</DIV>
                  									</TD>
                  								</TR>
               									<%
               									   if("Administrator".equals(level)){
                								%>
                								<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="admin.jsp">Administration</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                 								<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="positiondefine.jsp">Position Define</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                								<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="reading.jsp">Reading Attachments</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                 								<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="converting.jsp">Converting Files</A>
                  										</DIV>
                  									</TD>
                  								</TR>
              									<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="capturing.jsp">Capturing Files</A>
                  										</DIV>
                  									</TD>
                  								</TR>
             		 							<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="sending.jsp">Sending Files</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                  								<TR>
                									<TD vAlign=top>
                  										<DIV align=right><A href="view_admin.jsp">Signature View</A></DIV>
                  									</TD>
                  								</TR>
             									<%	}	%>
               									<%
               										if("Client".equals(level)){ 
               									%> 
               									<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="download.jsp">Download</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                  								<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="usermodification.jsp">UserInfo Admin</A>
                  										</DIV>
                  									</TD>
                  								</TR>
              									<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="view_client.jsp">Signature View</A>
                  										</DIV>
                  									</TD>
                  								</TR>
                  								<%	}	%>
              									<TR>
                									<TD vAlign=top>
                  										<DIV align=right>
                  											<A href="about.jsp"  style=" color:#F00">About Us</A>
                  										</DIV>
                  									</TD>
                  								</TR>
              									<TR>
                									<TD vAlign=top>
														<DIV align=right>
															<A href="logout.jsp" style=" color:#F00">Log Out</A>
														</DIV>
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
    				<TD colSpan=2 rowSpan=2><IMG height=177 alt="" src="images/image1.jpg" width=83></TD>
    				<TD colSpan=2><IMG height=83 alt="" src="images/image2.jpg" width=165></TD>
    				<TD colSpan=2>
    					<A onmouseover="MM_swapImage('Image2','','images/home_button2_r.jpg',1)" onmouseout=MM_swapImgRestore() href="services.jsp">
    						<IMG height=83 alt="" src="images/home_button2.jpg" width=86 border=0 name=Image2>
    					</A>
    				</TD>
    				<TD colSpan=3>
    					<IMG height=83 alt="" src="images/image4.jpg" width=165>
    				</TD>
    				<TD rowSpan=6><IMG height=517 alt="" src="images/home_side.gif" width=35></TD>
    			</TR>
  				<TR>
    				<TD>
    					<A onmouseover="MM_swapImage('Image1','','images/home_button1_r.jpg',1)" 
      						onmouseout=MM_swapImgRestore() href="about.jsp"><IMG height=94 alt="" 
      						src="images/home_button1.jpg" width=83 border=0 name=Image1>
      					</A>
      				</TD>
    				<TD colSpan=4><IMG height=94 alt="" src="images/image3.jpg" width=250></TD>
    				<TD colSpan=2>
    					<A onmouseover="MM_swapImage('Image3','','images/home_button3_r.jpg',1)" 
      						onmouseout=MM_swapImgRestore() href="contact.jsp"><IMG height=94 alt="" 
      						src="images/home_button3.jpg" width=83 border=0 name=Image3>
      					</A>
      				</TD>
      			</TR>
  				<TR>
    				<TD bgColor=#ebebeb colSpan=9 height=32>
      					<DIV  align="center">
      						<FONT face="Verdana, Arial, Helvetica, sans-serif" size=1>Welcome to use </FONT>FU (Formal Undertakings) Recognition System
      						<div align="left" style="color:#F63; font-size:12px">
      							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your UserName:&nbsp;
      							<a  style="font-size:14px;"><%=username+"           " %></a>  
      							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      							Your EmailAddress: <a style="font-size:14px;"><%= email%></a>
      							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      							Level:<a style="font-size:14px;"><%= level%></a>
      						</div>
           				</DIV>
           			</TD>
           		</TR>
  				<TR>
    				<TD background=images/line1.gif height=209>
    					<IMG height=238 alt="" src="images/line1.gif" width=2>
    				</TD>
    				<TD vAlign=top bgColor=#cfe1f4 colSpan=3 height=209>
      					<TABLE cellSpacing=2 cellPadding=2 width="100%" border=0>
        					<TBODY>
       							<TR>
          							<TD vAlign=top>
            							<P>
            								<FONT face="Verdana, Arial, Helvetica, sans-serif" color=#ff6600 size=1>
            									<B>
            										<FONT size=2>About FU Recognition System:</FONT>
            									</B>
            								</FONT>
            							</P>
            							<P class=MsoNormal style="MARGIN: 0pt; tab-stops: 162.0pt; mso-layout-grid-align: none">
            							<font size="1" face="Verdana, Arial, Helvetica, sans-serif">
            								<SPAN lang=EN-US style="FONT-SIZE: 9pt; FONT-FAMILY: Arial">
            									FURS is a challenging and original system which can help the company to 
            								</SPAN>
            								<SPAN lang=EN-US style="FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: Arial; mso-font-kerning: 0pt align='center'">
            									capture the signature on the Formal Undertakings (FUs) from customers. Users 
            									can use their browser to enter the system and FUs are received 
            									either from the attachment of e-mail or are scanned or faxed. If 
            									faxed they will still arrive in an email due to a fax to email 
            									service used by Tradecert. After handling different document types 
            									and capturing the necessary information, FURS will upload them to 
            									the customer profile system automatically for a further 
            									evolution.
            								</SPAN>
            								<SPAN lang=EN-US style="FONT-SIZE: 9pt; FONT-FAMILY: Arial"> 
            									In order to facilitate the company
            								</SPAN>
            							</font>
            							<SPAN lang=EN-US style="FONT-SIZE: 9pt; FONT-FAMILY: Arial">
            								's 
            							</SPAN>
            							<font size="1" face="Verdana, Arial, Helvetica, sans-serif">
            								<SPAN lang=EN-US style="FONT-SIZE: 9pt; FONT-FAMILY: Arial">
            									 needs, improve efficiency and reduce the burden from 
            									server and labor cost, the system will be required to check the 
           										inbox in a nightly job and process the emails within 
            									it.
            								</SPAN>
            							</font>
            						</P>
            					</TD>
            				</TR>
            			</TBODY>
            		</TABLE>
            	</TD>
   				<TD background=images/line2.gif height=209><IMG height=238 alt="" src="images/line2.gif" width=3></TD>
    			<TD vAlign=top colSpan=3 height=209>
      				<TABLE height=68 cellSpacing=2 cellPadding=2 width="100%" border=0>
        				<TBODY>
        					<TR>
          						<TD vAlign=top width="7%"><IMG height=13 src="images/3dots.gif" width=10></TD>
          						<TD vAlign=top width="93%">
            						<P>
            							<FONT face="Verdana, Arial, Helvetica, sans-serif" size=1>
            								<A href="content.jsp">
            									<B>Any Message One can go here </B>
            								</A>
            								This is where you type your news message. Any Message One can go here. This 
            								is where you type your news message.
            								<BR><BR>
            							</FONT>
            							<IMG height=7 src="images/h_dots.gif" width=198>
            						</P>
            					</TD>
            				</TR>
        					<TR>
          						<TD vAlign=top width="7%" height=41><IMG height=13 src="images/3dots.gif" width=10></TD>
          						<TD vAlign=top width="93%" height=41>
            						<P>
            							<FONT face="Verdana, Arial, Helvetica, sans-serif" size=1>
            								<A href="content.jsp"><B>Any Message One can go here</B> 
            								</A>This is where you type your news message. Any Message One can go here.<BR><BR>
            							</FONT>
            							<IMG height=7 src="images/h_dots.gif" width=198>
            						</P>
            					</TD>
            				</TR>
        					<TR>
          						<TD vAlign=top width="7%"><IMG height=13 src="images/3dots.gif" width=10></TD>
          						<TD vAlign=top width="93%">
            						<P>
            							<FONT face="Verdana, Arial, Helvetica, sans-serif" size=1>
            								<A href="content.jsp"><B>Any Message One can go here</B> </A>
            								This is where you type your news message. Any Message One can go here. This 
            								is where you type your news message. Any Message One can go here. 
            								This is where you type your news message. <BR><BR>
            							</FONT>
            							<IMG height=7 src="images/h_dots.gif" width=198>
            						</P>
            					</TD>
            				</TR>
            			</TBODY>
            		</TABLE>
            	</TD>
    			<TD background=images/line3.gif height=209><IMG height=238 alt="" src="images/line3.gif" width=2></TD>
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
                							<TD>
                  								<P>
                  									Peter Mc Laughlin, Lin Nan, Ren Wei&nbsp; 
            									</P>
            								</TD>
            							</TR>
            						</TBODY>
            					</TABLE>
            				</DIV>
            			</TD>
          				<TD width="19%" height=4>
            				<DIV align=right>
            					<A onmouseover="MM_swapImage('Image32','','images/arrow_r.gif',1)" 
            						onmouseout=MM_swapImgRestore() href="content2.jsp">
            					<FONT size=1>
            						<B>Support</B>
            					</FONT> 
            					<IMG height=36 src="images/arrow.gif" width=22 align="Middle" border=0 name=Image32>
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