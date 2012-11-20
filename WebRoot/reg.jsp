<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Formal Undertakings Recognition System(FURS)-----User Registration</TITLE>
		<LINK href="images/Default.css" type=text/css rel=stylesheet>
		<LINK href="images/xtree.css" type=text/css rel=stylesheet>
		<LINK href="images/User_Login.css" type=text/css rel=stylesheet>
		<script type="text/javascript" src="js/Form.js"></script>
	</HEAD>
	<BODY id=userlogin_body>
		<FORM name="form1" onSubmit="return form3_onsubmit();" action="saveinfo.jsp" method=post>
			<DIV style="width:400px; height:400px; background-color:#999; float: left; margin-left:25%;">
        		<div style="width:90%; height:380px; margin-left:5%; margin-top:10px; font-family: Arial, 'ËÎÌו', Helvetica, sans-serif;">
        			<h3 style="color:#063">Registration Page (FU Recognition System)</h3>
        			<table width="330" height="309" border="0">
          				<tr>
            				<td width="176">&nbsp;&nbsp;First name:</td>
            				<td width="144">
            					<input type="text" name="firstname" id="firstname" height="18px">
            				</td>
          				</tr>
          				<tr>
            				<td>&nbsp;&nbsp;Last name:</td>
            				<td>
            					<input type="text" name="lastname" id="lastname"  height="18px">
            				</td>
          				</tr>
          				<tr>
            				<td>&nbsp;&nbsp;Create your UserName:</td>
            				<td>
            					<input type="text" name="username" id="username"  height="18px">
            				</td>
          				</tr>
          				<tr>
            				<td>&nbsp;&nbsp;Create your password:</td>
            				<td>
            					<input  type="password"name="password" id="password"  height="18px">
            				</td>
          				</tr>
          				<tr>
            				<td>&nbsp;&nbsp;Email Address:</td>
            				<td><input type="text" name="email" id="email"  height="18px"></td>
          				</tr>
            			<tr>
            				<td>&nbsp;&nbsp;Confirm Email Address:</td>
            				<td><input type="text" name="text" id="confirmemail"  height="18px"></td>
          				</tr>
           				<tr>
            				<td  style="color:#009;">&nbsp;&nbsp;&nbsp;&nbsp;* Please fill in all</td>
           				</tr>
          				<tr>
            				<td height="90">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            					<input  type="submit"name="submit" id="submit" value="submit" style=" width:70px;height:25px; text-align:center;" >
               				</td>
            				<td>
              					<input  type="button"name="return" id="return" value="return" style=" width:70px;height:25px; text-align:center;" onClick="window.location.href='login.jsp'">
            				</td>
          				</tr>
        			</table>
        			<p>&nbsp;</p>
        		</div>
    		</DIV>
			<SPAN id=ValrUserName style="DISPLAY: none; COLOR: red"></SPAN>
			<SPAN id=ValrPassword style="DISPLAY: none; COLOR: red"></SPAN>
			<SPAN id=ValrValidateCode style="DISPLAY: none; COLOR: red"></SPAN>
			<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>
		</FORM>
	</BODY>
</HTML>

