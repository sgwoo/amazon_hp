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
	var kakao_id = $("#kakao_id").val();	
	data["email"] = btoa(email);
	data["kakaoId"] = kakao_id;
	$("#checkNo_msg").css("display", "none");
	
	if(email==null || email == ''){
		alert("인증메일을 수신 할 이메일을 입력해주세요.");
		return false;
	}else if(email.indexOf('@')=='-1' || email.indexOf('.')=='-1'){
		alert("이메일 형식으로 입력해주세요.")
		return false;
	}else{
		//먼저 해당 이메일의 회원가입여부 체크
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
					//회원가입 된 이메일이 아니면 인증메일보내기
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
							alert("인증메일 전송 중 오류발생! 관리자에게 문의하세요.");
						}
					});
				}			
			},
			error:function(request,status,error){
				alert("오류발생! 관리자에게 문의하세요.");
			}
		}); 
	}
}
</script>
	<div class="row">
		<div class="login-title col-md-10 col-md-offset-1">
			<span class="title">이메일 인증</span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1">
			<div class="form-group col-md-12" align="center">
				<!-- <h4 class="text-highlight">KK소셜로그인을 통해 이메일 정보를 가져오지 못했습니다.</h4><br> -->
				<h4 class="text-highlight">이메일 인증 후 이용해 주세요.</h4><br>
				<h5>아마존카의 서비스를 이용하시기 위해서는 <span style="color: red; font-weight: bold;">이메일 정보</span>가 <span style="color: red; font-weight: bold;">필수사항</span>입니다.</h5>
				<!-- <h5>소셜로그인시 이메일정보 대신 <span style="color: red; font-variant: small-caps;">휴대전화번호 등 다른 정보로 로그인 하신 경우 </span>또는</h5>
				<h5><span style="color: red; font-variant: small-caps;">소셜측 이메일 정보제공 동의가 이루어지지 않은 경우</span></h5> -->
				<h5>한 번, 인증메일 수신 > 인증을 통해 계속해서 쉽게 로그인 하실 수 있습니다.</h5><br>
				<h4 class="text-highlight">(한 번 설정된 이메일은 다음 소셜로그인 시에도 그대로 반영됩니다.)</h4><br>
				<div style="width: 400px;">
					<input type="email" class="form-control" id="sendEmail" placeholder="amazoncar@amazoncar.co.kr">
					<input type="hidden" id="kakao_id" value="${param.kakao_id}">
				</div>
				<div style="display: none;" id="success_msg">
					<br><h5><span style="color: red; font-weight: bold;" id="emailTxt"></span> 로 인증메일이 전송되었습니다.</h5>
					<br><h5>인증 메일을 확인해 인증절차를 진행해주세요.</h5>
					<br>
					<!-- <input class="btn btn-success btn-lg" type="button" value="메일 재전송" onclick="fnSendRegEmail()"> -->
				</div>
				<div style="display: none;" id="checkNo_msg">
					<br><h5><span style="color: red; font-weight: bold;" id="emailTxt">이미 사용중인 이메일입니다. 다시 확인해주세요.</span></h5><br>
				</div>
			</div>
            <div class="col-md-12 text-center" style="padding-top: 10px;">
            	<input type="button" class="btn btn-success btn-lg" value="인증메일 전송" onclick="fnSendRegEmail()" id="resend_btn">	
			</div>			
	  	</div>
	</div>
</t:genericpage>