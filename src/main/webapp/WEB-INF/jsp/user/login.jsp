<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<t:blankpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link href="<c:url value='/resources/stylesheets/login.css'/>" rel="stylesheet">
<script>
$(document).ready(function(){
	$('#resetFrm').validate({
		rules:{
			resetEmail:{required:true, email:true}
		},
		errorClass:"errClass",
		messages:{
			resetEmail:{
				required:"이메일을 입력해주세요",
				email:"이메일 형식에 맞지 않습니다"
			}
		},
		submitHandler:function(){
			var data= {};
			data["email"] = $('#resetEmail').val();
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				url:'/find/password',
				type:'POST',
				data:JSON.stringify(data),
				success:function(response){
					if(response.message == "success"){
						$('#afterSubmit').removeClass('hidden');
						$('#beforeSubmit').addClass('hidden');
						$('#submitEmail').html(data["email"]);
					}
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});
		}
	});
	
	$('#loginFrm').validate({
		rules:{
			username:{required:true,email:true}
		},
		errorClass:"errClass",
		messages:{
			username:{
				required:"아이디를 입력해주세요",
				email:"아이디는 이메일 형식입니다"
			}
		},
		submitHandler:function(){
			$('#loginFrm').submit();
		}
	});
})
</script>
<!-- <a href="/"><img id="amazoncarLogo" src="/resources/images/gray_logo.png" alt="Logo" style="margin:26px 29px;" /></a> -->
<a href="/"><img id="amazoncarLogo" src="/resources/images/logo_1.png" alt="Logo" style="margin:26px 29px;"  width="200px"/></a>
<div class="login-box">
	<a href="#"><span class="form-label fms-login">FMS 로그인</span></a>
	<div class="header">
		<span class="title">이메일 로그인</span>
	</div>
	<!-- <form id="loginFrm" name="loginFrm" action="/login/authenticate" method="post"> -->
	<form id="loginFrm" name="loginFrm" action="/login/authenticate" method="get">
		<div class="form-box">
			<div class="form-group">
				<label class="form-label">이메일 주소</label>
				<input type="email" class="form-control" name="username" id="username" placeholder="IT@amazoncar.co.kr" />
			</div>
			<div class="form-group">
				<label class="form-label">비밀번호</label>
				<input type="password" class="form-control" name="password" id=""password"" />
			</div>
			<div class="form-group">
				<input type="checkbox" /><label class="form-label">로그인 정보 기억</label>
			</div>
			<button type="submit" class="btn submit-btn">로그인</button>
			<c:if test="${message ne null}">
				<p class="login-error">
					아이디나 비밀번호가 맞지 않습니다
				</p>
			</c:if>	
			<a href="#" data-toggle="modal" data-target="#findPassword" ><span class="link-label" style="float:left;">비밀번호찾기</span></a>
			<a href="/register"><span class="link-label" style="float:right;">회원가입</span></a>
					
		</div>
	</form>
	<div class="login-footer">
		<span class="title">SNS 로그인</span><br/>
		<div class="social-btn-area">
			<a class="icon-sns_facebook ic-social-btn" onclick="document.facebook.submit();"></a>
			<a class="icon-sns_google ic-social-btn" onclick="document.google.submit();"></a>
			<a  class="icon-sns_kakao ic-social-btn" onclick="document.kakao.submit();"></a>
		</div>
	</div>
</div>
<!--  hidden scope-->
		<form action="/auth/facebook" name="facebook">
			<input type="hidden" name="scope" value="email"/>
		</form>
		<form action="/auth/google" name="google">
			<input type="hidden" name="scope" value="https://www.googleapis.com/auth/userinfo.profile" />
		</form>
		<form action="/auto/kakao" name="kakao"></form>	
<form name="resetFrm" id="resetFrm" method="post">
	<div class="modal fade" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">비밀번호 찾기</h4>
				</div>
				<div class="modal-body pwd-modal" id="beforeSubmit">
					<span class="text-highlight">회원 가입 시 등록하신 이메일 주소</span>를 입력하시면 비밀번호 변경 안내 메일을 발송합니다<br/><br/>
					<div class="form-group">
						<input type="email" name="resetEmail" id="resetEmail" class="form-control" placeholder="amazoncar@amazoncar.co.kr"/>
					</div>
					<div class="text-center">
						<button type="submit" id="resetBtn" class="btn btn-success btn-lg">이메일 발송</button>
					</div>
				</div>
				<div class="modal-body hidden text-center pwd-modal" id="afterSubmit">
					<h4><span class="text-highlight glyphicon glyphicon-ok" id="submitEmail"></span>으로<br/>비밀번호 재설정 안내 메일이 발송되었습니다</h3>
				</div>
			</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</form>
</t:blankpage>