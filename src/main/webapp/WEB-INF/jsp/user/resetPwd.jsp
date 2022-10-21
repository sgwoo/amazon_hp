<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<t:blankpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$('form').validate({
		rules:{
			password:{required:true,minlength:4},
			confirmPwd:{required:true, equalTo:"#password"}
		},
		errorClass:"errClass",
		messages:{
			password:{
				required:"변경하실 비밀번호를 입력해주세요",
				minlength:"비밀번호는 최소 4자 이상이어야 합니다"
			},
			confirmPwd:{
				required:"비밀번호를 한번 더 입력해주세요",
				equalTo:"입력한 비밀번호와 다릅니다"
			}
		},
		submitHandler:function(){
			var data = {};
			data["password"] = $('#password').val();
			data["email"] = $('#email').val();
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(data),
				url:'/reset/password',
				type:'POST',
				success:function(response){
					alert("비밀번호가 정상적으로 변경되었습니다");
					location.href = "/login";
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});	
		}
	})
})
</script>
<!-- <a href="/"><img id="amazoncarLogo" src="/resources/images/gray_logo.png" alt="Logo" style="margin:26px 29px;" /></a> -->
<a href="/"><img id="amazoncarLogo" src="/resources/images/logo_1.png" alt="Logo" style="margin:26px 29px;" width="200px" /></a>
<link href="<c:url value='/resources/stylesheets/login.css'/>" rel="stylesheet">
<div class="login-box" style="min-height:0px;">
	<div class="header">
		<span class="title">비밀번호 변경</span>
	</div>
	<form>
		<div class="form-box" >
			<div><span class="link-label">변경하실 비밀번호를 입력해주세요</span></div><br>
			<div class="form-group">
				<label class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="password" id="password" />
			</div>
			<div class="form-group">
				<label class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" name="confirmPwd" id="confirmPwd" />
			</div>
			<input type="hidden" name="email" id="email" value="${email}" />
			<button type="submit" class="btn submit-btn">변경하기</button>
		</div>
	</form>
</div>

</t:blankpage>