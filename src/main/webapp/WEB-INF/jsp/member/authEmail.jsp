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
			alert("�������� ������ �� �����߻�! �����ڿ��� �����ϼ���.");
		}
	}); 
}
</script>
	<div class="row">
		<div class="login-title col-md-10 col-md-offset-1">
			<span class="title">�̸��� ��������</span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1">
			<div class="form-group col-md-12" align="center">
				<h4 class="text-highlight">�����Ͻ� �����ּҷ� �߼۵� ������ ���� ���� ���������� �������ּ���</h4><br>			
				<h5>�̸����� Ȯ���ϰ� �̸��� �� ���Ե� ���� ��ũ�� Ŭ���Ͻø� ������ �Ϸ�˴ϴ�.</h5>
				<div style="display: none;" id="success_msg">
					<br><h5><span id="result_email" style="color: red; font-weight: bold;"></span> �� ���������� �����۵Ǿ����ϴ�.</h5><br>
				</div>	
			</div>
            <div class="col-md-12 text-center" >
            	<input type="button" class="btn btn-success btn-lg" value="�������� ������" onclick="fnSendAuthEmail()" id="resend_btn">				
				<input type="button" class="btn btn-default btn-lg" value="��������" onclick="location.href='/'">
			</div>

	  	</div>
	</div>	
	<input type="hidden" id="email" value="${param.email}">
</t:genericpage>