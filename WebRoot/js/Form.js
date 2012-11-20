function form2_onsubmit() {
	if(form2.pwd.value!=form2.conpwd.value){
   		alert('Please Confirm Your Password!');
   		form2.conpwd.focus();
   		return false;
 	}
	else {
 		return true;
	}
}

function Step1() {
	$("#Step2Container").hide();           
}

function Step2() {
	$("#CurruntPicContainer").hide();
}
        
function Step3() {
	$("#Step2Container").hide();          
}

function form1_onsubmit() {
	if(form1.TxtUserName.value=='')	{
   		alert('Please Input UserName！');
   		form1.TxtUserName.focus();
   		return false;
 	}
	if(form1.TxtPassword.value=='')	{
   		alert('Please Input Password！');
   		form1.TxtPassword.focus();
   		return false;
	}
	return true;
}

function form3_onsubmit() {
	if(form1.firstname.value==''||form1.lastname.value==''||form1.username.value==''||form1.password.value==''||form1.email.value==''||form1.confirmemail.value==''){
   		alert('Please Fill in All Information！');
   		form1.firstname.focus();
		return false;
 	}
	else {
		if(form1.email.value!=form1.confirmemail.value){
   			alert('Please Confirm Your Email Address！');
   			orm1.confirmemail.focus();
   			return false;
		}
		else {
			return true;
		}
 	}
}

function form4_onsubmit() {
	if(form2.pwd.value!=form2.conpwd.value){
   		alert('Please Confirm Your Password!');
   		form2.conpwd.focus();
   		return false;
	}
	else{
 		return true;
	}
}