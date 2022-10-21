<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:blankpage>
<link href="<c:url value='/resources/stylesheets/login.css'/>" rel="stylesheet"> 
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$('#registerFrm').validate({
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
				equalTo:"입력하신 비밀번호와 맞지 않습니다"
			}
		},
		submitHandler:function(){
			$('#registerFrm').submit();
		}
	});
})
</script>
	<c:choose>
		<c:when test="${null eq user}">
			<div class="ax-panel warning">
				<div class="ax-panel-heading">
					Error
				</div>
				<div class="ax-panel-body">
					예상치 못한 에러가 발생되었습니다.
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<!-- <a href="/"><img id="amazoncarLogo" src="/resources/images/gray_logo.png" alt="Logo" style="margin:26px 29px;" /></a> -->
			<a href="/"><img id="amazoncarLogo" src="/resources/images/logo_1.png" alt="Logo" style="margin:26px 29px;" width="200px" /></a>
			<div class="login-box" style="height:400px;">
				<div class="header">
					<span class="title">회원가입</span>
				</div>
				<form id="registerFrm" name="registerFrm" action="/signup" method="post">
					<div class="form-box" style="border-bottom:0px;">
						<div class="form-group">
							<label class="form-label">이메일 주소</label>
							<input type="email" class="form-control" name="email" id="email" value="${user.email}" />
						</div>
						<div class="form-group">
							<label class="form-label">이름</label>
							<input type="name" class="form-control" name="name" id="name" value="${user.name}" />
						</div>
						<input type="hidden" name="provider" value="${providerId}"/>
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
			</div>
		</c:otherwise>
	</c:choose>
</t:blankpage>