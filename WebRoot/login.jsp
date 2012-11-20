<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>
			Formal Undertakings Recognition System(FURS)-----User Login
		</TITLE>
		<LINK href="images/Default.css" type=text/css rel=stylesheet>
		<LINK href="images/xtree.css" type=text/css rel=stylesheet>
		<LINK href="images/User_Login.css" type=text/css rel=stylesheet>
		<script type="text/javascript" src="js/Form.js"></script>
	</HEAD>
	<BODY id=userlogin_body>
		<FORM name=form1 onSubmit="return form1_onsubmit()" action="checkuser.jsp" method=post>
			<DIV id=user_login>
				<DL>
  					<DD id=user_top>
  						<UL>
   				 			<LI class=user_top_l></LI>
    						<LI class=user_top_c></LI>
    						<LI class=user_top_r></LI>
    					</UL>
    				</DD>
  					<DD id=user_main>
  						<UL>
    						<LI class=user_main_l></LI>
   							<LI class=user_main_c>
    							<DIV class=user_main_box>
    								<UL>
      									<LI class=user_main_text>UserName£º </LI>
      									<LI class=user_main_input><INPUT class=TxtUserNameCssClass id=TxtUserName maxLength=20 name=TxtUserName> </LI>
      								</UL>
    								<UL>
      									<LI class=user_main_text>Password£º </LI>
      									<LI class=user_main_input>
      										<INPUT class=TxtPasswordCssClass id=TxtPassword type=password name=TxtPassword> 
      									</LI>
      								</UL>
    								<UL>
     				 					<LI class=user_main_text style=" color:red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* </LI>
      									<LI class=user_main_input> want an account?Please <a href="reg.jsp">Click Here</a></LI>
      								</UL>
      							</DIV>
      						</LI>
    						<LI class=user_main_r>
    							<!--
									<INPUT class=IbtnEnterCssClass id=IbtnEnter 
   				 					style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
   				 					onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("IbtnEnter", "", true, "", "", false, false))' 
   				 					type=image src="images/user_botton.gif" name=IbtnEnter>
								-->
        						<INPUT style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" 
   									type=image src="images/user_botton.gif" name=submit> 
   							</LI>
   						</UL>
   					</DD>
  					<DD id=user_bottom>
  						<UL>
    						<LI class=user_bottom_l></LI>
    						<LI class=user_bottom_c>(FURS)&copy;By Peter Mc Laughlin,Lin Nan,Ren Wei. </LI>
   							<LI class=user_bottom_r></LI>
   						</UL>
   					</DD>
   				</DL>
   			</DIV>
   			<SPAN id=ValrUserName style="DISPLAY: none; COLOR: red"></SPAN>
   			<SPAN id=ValrPassword style="DISPLAY: none; COLOR: red"></SPAN>
   			<SPAN id=ValrValidateCode style="DISPLAY: none; COLOR: red"></SPAN>
			<DIV id=ValidationSummary1 style="DISPLAY: none; COLOR: red"></DIV>
		</FORM>
	</BODY>
</HTML>

