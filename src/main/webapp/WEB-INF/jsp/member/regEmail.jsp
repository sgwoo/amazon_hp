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
	
});

function fnSendRegEmail(){	
	
	var data= {};
	var email = $("#sendEmail").val();
	var fbId = $("#fb_id").val();	
	data["email"] = btoa(email);
	data["fbId"] = fbId;
	$("#checkNo_msg").css("display", "none");
	
	if(email==null || email == ''){
		alert("���������� ���� �� �̸����� �Է����ּ���.");
		return false;
	}else if(email.indexOf('@')=='-1' || email.indexOf('.')=='-1'){
		alert("�̸��� �������� �Է����ּ���.")
		return false;
	}else{
		//���� �ش� �̸����� ȸ�����Կ��� üũ
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			url:'/checkUseEmail',
			type:'POST',
			data:JSON.stringify(data),
			success:function(response){
				
				if(response==0){
					$("#checkNo_msg").css("display", "block");
					return false;
				}else if(response==1){
					//ȸ������ �� �̸����� �ƴϸ� �������Ϻ�����
					$.ajax({
						contentType:'application/json',
						dataType:'json',
						url:'/resendAuthEmail',
						type:'POST',
						data:JSON.stringify(data),
						success:function(response){
							
							var email = response.email;
							
							$("#emailTxt").html(email);
							$("#resend_btn").css("display", "none");
							$("#success_msg").css("display", "block");
						},
						error:function(request,status,error){
							alert("�������� ���� �� �����߻�! �����ڿ��� �����ϼ���.");
						}
					});
				}			
			},
			error:function(request,status,error){
				alert("�����߻�! �����ڿ��� �����ϼ���.");
			}
		}); 
	}
}
</script>
	<div class="row">
		<div class="login-title col-md-10 col-md-offset-1">
			<span class="title">�̸��� ����</span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1">
			<div class="form-group col-md-12" align="center">
				<h4 class="text-highlight">�Ҽȷα����� ���� �̸��� ������ �������� ���߽��ϴ�.</h4><br>
				<h4 class="text-highlight">�̸��� ���� �� �̿��� �ּ���.</h4><br>							
				<h5>�Ƹ���ī�� ���񽺸� �̿��Ͻñ� ���ؼ��� <span style="color: red; font-weight: bold;">�̸��� ����</span>�� <span style="color: red; font-weight: bold;">�ʼ�����</span>�Դϴ�.</h5>
				<h5>�Ҽȷα��ν� �̸������� ��� <span style="color: red; font-variant: small-caps;">�޴���ȭ��ȣ �� �ٸ� ������ �α��� �Ͻ� ��� </span>�Ǵ�</h5>
				<h5><span style="color: red; font-variant: small-caps;">�Ҽ��� �̸��� �������� ���ǰ� �̷������ ���� ���</span></h5>
				<h5>�� ��, �������� ���� > ������ ���� ����ؼ� ���� �α��� �Ͻ� �� �ֽ��ϴ�.</h5><br>
				<h4 class="text-highlight">(�� �� ������ �̸����� ���� �Ҽȷα��� �ÿ��� �״�� �ݿ��˴ϴ�.)</h4><br>
				<div style="width: 400px;">
					<input type="email" class="form-control" id="sendEmail" placeholder="amazoncar@amazoncar.co.kr">
					<input type="hidden" id="fb_id" value="${param.fb_id}">				
				</div>
				<div style="display: none;" id="success_msg">
					<br><h5><span style="color: red; font-weight: bold;" id="emailTxt"></span> �� ���������� ���۵Ǿ����ϴ�.</h5>
					<br><h5>���� ������ Ȯ���� ���������� �������ּ���.</h5>
					<br>
					<!-- <input class="btn btn-success btn-lg" type="button" value="���� ������" onclick="fnSendRegEmail()"> -->
				</div>
				<div style="display: none;" id="checkNo_msg">
					<br><h5><span style="color: red; font-weight: bold;" id="emailTxt">�̹� ������� �̸����Դϴ�. �ٽ� Ȯ�����ּ���.</span></h5><br>
				</div>	
			</div>
            <div class="col-md-12 text-center" >
            	<input type="button" class="btn btn-success btn-lg" value="�������� ����" onclick="fnSendRegEmail()" id="resend_btn">	
			</div>			
	  	</div>
	</div>
</t:genericpage>