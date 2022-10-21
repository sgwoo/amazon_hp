<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
<link rel="stylesheet" href="/resources/stylesheets/login.css"/>
<!-- <link rel="stylesheet" href="/resources/stylesheets/login-new.css"/> -->

<script>
$(document).ready(function(){
	var email = $("#email").val();	
	var base64Rejex = /^(?:[A-Z0-9+\/]{4})*(?:[A-Z0-9+\/]{2}==|[A-Z0-9+\/]{3}=|[A-Z0-9+\/]{4})$/i;
	var isBase64Valid = base64Rejex.test(email);

	if (isBase64Valid) {
	    // base
	    $("#result_email").text(atob(email));
	} else {
	    // not base
	    $("#result_email").text(email);
	}
})
function fnSendAuthEmail(){	
	var email = $("#email").val();
	var data= {};
	
	var base64Rejex = /^(?:[A-Z0-9+\/]{4})*(?:[A-Z0-9+\/]{2}==|[A-Z0-9+\/]{3}=|[A-Z0-9+\/]{4})$/i;
	var isBase64Valid = base64Rejex.test(email);

	if (isBase64Valid) {
	    data["email"] = email;
	} else {
	    data["email"] = btoa(email);
	}
	
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		url:'/resendAuthEmail',
		type:'POST',
		data:JSON.stringify(data),
		success:function(response){	
			var email = response.email;
			$("#resend_btn").css("display", "none");
			$("#success_msg").css("display", "block");
			
		},
		error:function(request,status,error){
			alert("인증메일 재전송 중 오류발생! 관리자에게 문의하세요.");
		}
	}); 
}
</script>
	<div class="row">
		<div class="login-title col-md-10 col-md-offset-1">
			<span class="title">이메일 본인인증</span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1">
			<div class="form-group col-md-12" align="center">
				<h4 class="text-highlight">가입하신 메일주소로 발송된 메일을 통해 본인 인증절차를 진행해주세요</h4><br>			
				<h5>이메일을 확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.</h5>
				<div style="display: none;" id="success_msg">
					<br><h5><span id="result_email" style="color: red; font-weight: bold;"></span> 로 인증메일이 재전송되었습니다.</h5><br>
				</div>	
			</div>
            <div class="col-md-12 text-center" >
            	<input type="button" class="btn btn-success btn-lg" value="인증메일 재전송" onclick="fnSendAuthEmail()" id="resend_btn">				
				<input type="button" class="btn btn-default btn-lg" value="메인으로" onclick="location.href='/'">
			</div>

	  	</div>
	</div>	
	<input type="hidden" id="email" value="${param.email}">
</t:genericpage>