<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<t:blankpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$('#emailRegisterFrm').validate({
		rules:{
			email:{required:true,email:true},
			name:{required:true},
			password:{required:true,minlength:7,maxlength:10},
			confirmPwd:{required:true,equalTo:"#password"}
		},
		errorClass:"errClass",
		messages:{
			email:{
				required:"이메일을 입력해주세요",
				email:"이메일 형식에 맞지 않습니다"
			},
			name:{
				required:"이름을 입력해주세요"
			},
			password:{
				required:"비밀번호를 입력해주세요",
				minlength:"비밀번호는 7자 이상 10자 이하여야 합니다",
				maxlength:"비밀번호는 7자 이상 10자 이하여야 합니다"
			},
			confirmPwd:{
				required:"비밀번호를 한번 더 입력해주세요",
				equalTo:"입력한 비밀번호와 다릅니다"
			}
		}
	});
})
</script>
<!-- <a href="/"><img id="amazoncarLogo" src="/resources/images/gray_logo.png" alt="Logo" style="margin:26px 29px;" /></a> -->
<a href="/"><img id="amazoncarLogo" src="/resources/images/logo_1.png" alt="Logo" style="margin:26px 29px;"  width="200px" /></a>
<link href="<c:url value='/resources/stylesheets/login.css'/>" rel="stylesheet">
<div class="login-box">
	<div class="header">
		<span class="title">회원가입</span>
	</div>
	<form action="/signup" method="post" name="emailRegisterFrm" id="emailRegisterFrm">
		<div class="form-box">
			<div class="form-group">
				<label class="form-label">이메일 주소</label>
				<input type="email" class="form-control" name="email" id="email" placeholder="IT@amazoncar.co.kr" />
			</div>
			<div class="form-group">
				<label class="form-label">이름</label>
				<input type="text" class="form-control" name="name" id="name"/>
			</div>
			<div class="form-group">
				<label class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="password" id="password" />
			</div>
			<div class="form-group">
				<label class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" name="confirmPwd" id="confirmPwd" />
			</div>
			<button type="submit" class="btn submit-btn">회원가입</button>
		</div>
	</form>
	<div class="login-footer">
		<span class="title">SNS 계정으로 가입하기</span><br/>
		<div class="social-btn-area">
			<a class="icon-sns_facebook ic-social-btn" onclick="document.facebook.submit();"></a>
			<a class="icon-sns_google ic-social-btn" onclick="document.google.submit();"></a>
			<a class="icon-sns_kakao ic-social-btn"onclick="document.kakao.submit();"></a>
		</div>
		<!--  hidden scope-->
		<form action="/auth/facebook" name="facebook">
			<input type="hidden" name="scope" value="email,user_friends"/>
		</form>
		<form action="/auth/google" name="google">
			<input type="hidden" name="scope" value="https://www.googleapis.com/auth/plus.login" />
		</form>
		<form action="/auth/kakao" name="kakao"></form>
	</div>
</div>

</t:blankpage>