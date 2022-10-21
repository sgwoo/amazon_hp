<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#signinfrm > input').click(function(){		
		var target = '/signup/'+ this.id;
		$('#signinfrm').attr('action',target);
		$('#signinfrm').submit();
	});
	$('#loginfrm > input').click(function(){
		var target = '/connect/'+ this.id;
		$('#loginfrm').attr('action',target);
		$('#loginfrm').submit();
	});	
	
});	
</script>
<body>
	
	 ${profile.name} Hi?
	 
	 <form id="signinfrm" method="post">
		 <input type="button" id="facebook" value="Facebook SignIn" /><br/>
		 <input type="button" id="google" value="Google SignIn" />
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
		 <!--  <input type="hidden" name="scope" value="https://www.googleapis.com/auth/plus.login" /> -->
	 
	 <form id="loginfrm">
		 <input type="button" id="facebook" value="Facebook Login" /><br/>
		 <input type="button" id="google" value="Google Login" />
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	 	
	 </form>
</body>
</html>