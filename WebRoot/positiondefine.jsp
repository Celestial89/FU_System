<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = null;
	String email  = null;
	String level  = null;
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
%>
<%
  	String picUrl = request.getParameter("Picurl"); 
  	String  step = request.getParameter("step"); 
  	String defaultPic ="image/man.GIF";
  	if("3".equals(step))
    	defaultPic = "temp/"+picUrl;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>FU (Formal Undertakings) Recognition System</TITLE>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
		<link href="css/main.css" type="text/css" rel="Stylesheet" />
		<link href="css/frame.css" type="text/css" rel="Stylesheet" />
    	<script type="text/javascript" src="js/jquery1.2.6.pack.js"></script>
    	<script  type="text/javascript" src="js/ui.core.packed.js" ></script>
   		<script type="text/javascript" src="js/ui.draggable.packed.js" ></script>
   		<script type="text/javascript" src="js/CutPic.js"></script>
		<script type="text/javascript" src="js/Frame.js"></script>
		<script type="text/javascript" src="js/Form.js"></script>
	</HEAD>
	<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 background="images/home_background.gif" onLoad="MM_preloadImages('images/home_button1_r.jpg','images/home_button2_r.jpg','images/home_button3_r.jpg','images/arrow_r.gif')">
		<TABLE WIDTH=740 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  			<TR> 
    			<TD COLSPAN=11> <IMG SRC="images/top_bar.gif" WIDTH=740 HEIGHT=23 ALT=""></TD>
  			</TR>
  			<TR> 
    			<TD ROWSPAN=5 valign="top"> 
      				<table width="100%" border="0" cellspacing="0" cellpadding="0">
        			<tr> 
          				<td valign="top"><a href="index.jsp"><img src="images/1.jpg" width="206" height="107" border="0"></a></td>
        			</tr>
       				<tr> 
          				<td valign="top"> 
            				<table width="100%" border="0" cellspacing="4" cellpadding="4">
              					<tr> 
                					<td valign="top"> 
                  						<div align="right"><a href="index.jsp">Home</a></div>
                					</td>
              					</tr>
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
                  						<DIV align=right>
                  							<A href="download.jsp">Download</A>
                  						</DIV>
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
                  						<DIV align=right>
                  							<A href="about.jsp"  style=" color:#F00">About Us</A>
                  						</DIV>
                  					</TD>
                  				</TR>
              					<TR>
                					<TD vAlign=top>
										<DIV align=right><A href="logout.jsp" style=" color:#F00">Log Out</A></DIV>
									</TD>
								</TR>
              					<tr> 
                					<td valign="top">&nbsp;</td>
              					</tr>
              					<tr> 
                					<td valign="top">&nbsp;</td>
              					</tr>
            				</table>
          				</td>
        			</tr>
      			</table>
    		</TD>
    		<TD COLSPAN=2 ROWSPAN=2> <IMG SRC="images/about_image1.jpg" WIDTH=83 HEIGHT=177 ALT=""></TD>
    		<TD COLSPAN=2> <IMG SRC="images/about_image2.jpg" WIDTH=165 HEIGHT=83 ALT=""></TD>
    		<TD COLSPAN=2> <a href="services.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','images/about_button2_r.jpg',1)"><IMG SRC="images/about_button2.jpg" WIDTH=86 HEIGHT=83 ALT="" border="0" name="Image2"></a></TD>
    		<TD COLSPAN=3> <IMG SRC="images/about_image4.jpg" WIDTH=165 HEIGHT=83 ALT=""></TD>
    		<TD ROWSPAN=6> <IMG SRC="images/home_side.gif" WIDTH=35 HEIGHT=517 ALT=""></TD>
  		</TR>
  		<TR> 
    		<TD> <a href="about.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','images/about_button1_r.jpg',1)"><IMG SRC="images/about_button1.jpg" WIDTH=83 HEIGHT=94 ALT="" border="0" name="Image1"></a></TD>
    		<TD COLSPAN=4> <IMG SRC="images/about_image3.jpg" WIDTH=250 HEIGHT=94 ALT=""></TD>
    		<TD COLSPAN=2> <a href="contact.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','images/about_button3_r.jpg',1)"><IMG SRC="images/about_button3.jpg" WIDTH=83 HEIGHT=94 ALT="" border="0" name="Image3"></a></TD>
  		</TR>
  		<TR> 
    	<TD COLSPAN=9 bgcolor="EBEBEB" height="13"> 
      		<div align="center">
        		<table width="100%" border="0" cellspacing="2" cellpadding="2">
          			<tr>
            			<td>
              				<div align="left"><b><font color="#FF6600" size="2" face="Verdana, Arial, Helvetica, sans-serif">You can define the location of signature here</font></b></div>
            			</td>
          			</tr>
        		</table>
        	</div>
    	</TD>
  		</TR>
  		<TR> 
    		<TD background="images/line1.gif" height="109"> <IMG SRC="images/line1.gif" WIDTH=2 HEIGHT=238 ALT=""></TD>
   			<TD COLSPAN=7 valign="top" height="109"> 
      			<table width="100%" border="0" cellspacing="2" cellpadding="2">
       				<tr> 
          				<td valign="top"> 
       						<div>
     							<div class="left">
         							<!--当前照片-->
         							<div id="CurruntPicContainer">
            							<div class="title"><b>Current Photo</b></div>
            							<div class="photocontainer">
                							<img id="imgphoto" src="<%=defaultPic%>" style="border-width:0px;" width = "120" height = "120"/>
            							</div>
         							</div>
         							<!--Step 2-->
        							<div id="Step2Container">
           								<div class="title"><b> Define the location of signature</b></div>
           								<div class="uploadtooltip">You can drag the picture with mouse</div>                              
                   						<div id="Canvas" class="uploaddiv">
                   							<div id="ImageDragContainer">                               
                               					<img id="ImageDrag" class="imagePhoto" src="temp/<%=picUrl %>" style="border-width:0px;" />                                                        
                            				</div>
                            				<div id="IconContainer">                               
                               					<img id="ImageIcon" class="imagePhoto" src="temp/<%=picUrl%>" style="border-width:0px;" />                                                        
                            				</div>                          
                    					</div>
                    					<div class="uploaddiv">
                       						<table>
                            					<tr>
                                					<td id="Min">
                                        				<img alt="Zoom out" src="image/_c.gif" onmouseover="this.src='image/_c.gif';" onmouseout="this.src='image/_h.gif';" id="moresmall" class="smallbig" />
                                					</td>
                                					<td>
                                    					<div id="bar">
                                        					<div class="child">
                                        					</div>
                                    					</div>
                                					</td>
                                					<td id="Max">
                                        				<img alt="Zoom in" src="image/c.gif" onmouseover="this.src='image/c.gif';" onmouseout="this.src='image/h.gif';" id="morebig" class="smallbig" />
                                					</td>
                            					</tr>
                        					</table>
                    					</div>
                    					<form action="/FU_System/servlet/PositionSave" method="post">
                    						<input type="hidden" name="picture" value="<%=picUrl%>"/>
                    						<div class="uploaddiv">
                        						<input type="submit" name="btn_Image" value="Save" id="btn_Image" />
                        						<SELECT name="select" id="select">
													<OPTION value='signature' selected>Signature</OPTION>
													<OPTION value='barcode'>Barcode</OPTION>
												</SELECT>
                    						</div>           
                    						<div>
                      							<input name="txt_width" type="hidden" value="1" id="txt_width" /><br />
                    							<input name="txt_height" type="hidden" value="1" id="txt_height" /><br />
                    							<input name="txt_top" type="hidden" value="82" id="txt_top" /><br />
                   								<input name="txt_left" type="hidden" value="73" id="txt_left" /><br />
                   								<input name="txt_DropWidth" type="hidden" value="120" id="txt_DropWidth" /><br />
                     							<input name="txt_DropHeight" type="hidden" value="120" id="txt_DropHeight" /><br />
                  								<input name="txt_Zoom" type="hidden" id="txt_Zoom" />
                   							</div>  
                   						</form>
         							</div>
     							</div>
      							<form name="form1" method="post" action="/FU_System/servlet/UpLoadImage" id="form1" enctype="multipart/form-data">
     								<div class="right">
         								<!--Step 1-->
         								<div id="Step1Container">
            								<div class="title"><b>Change Photo</b></div>
            								<div id="uploadcontainer">
                								<div class="uploadtooltip">Choose new photo，file less than 2.5MB.</div>
                								<div class="uploaddiv"><input type="file" name="fuPhoto" id="fuPhoto" title="Browser" /></div>
                								<div class="uploaddiv">
                									<input type="submit" name="btnUpload" value="Upload" id="btnUpload" />
                								</div>
           									</div>
         								</div>
     								</div>
     							</form>
     						</div>
    						<% 
      							if(null==picUrl||"".equals(picUrl)) {
      						%>
          							<script type='text/javascript'>Step1();</script>
      						<%
      							} else if(!"".equals(picUrl)&& "2".equals(step)) {
      						%>
      								<script type='text/javascript'>Step2();</script>
      						<%
      							} else if(!"".equals(picUrl)&& "3".equals(step)) {
      						%>
      								<script type='text/javascript'>Step3();</script>
     						<%	}	%>
      						<p>&nbsp;</p>
      					</td>
        			</tr>
      			</table>
      		</TD>
    		<TD background="images/line3.gif" height="109"> <IMG SRC="images/line3.gif" WIDTH=2 HEIGHT=238 ALT=""></TD>
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
            				<div align="right"><a href="content2.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image32','','images/arrow_r.gif',1)"><font size="1"><b>Support</b></font> 
              					<img name="Image32" border="0" src="images/arrow.gif" width="22" height="36" align="middle"></a>
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
