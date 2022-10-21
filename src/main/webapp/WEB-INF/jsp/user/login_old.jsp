<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
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

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h2>로그인</h2>		
			


 	
			<a class="btn btn-block btn-social btn-facebook"  onclick="document.facebook.submit();">
		    	<span class="fa fa-facebook""></span>Facebook 계정으로 로그인하기
		  	</a>
		  	<a class="btn btn-block btn-social btn-google"  onclick="document.google.submit();">
		    	<span class="fa fa-google"></span> Google 계정으로 로그인하기
		  	</a>
		  	<a class="btn btn-block btn-social btn-kakao"  onclick="document.kakao.submit();">
		    	<span class="fa fa-google"></span> 카카오 계정으로 로그인하기
		  	</a>

		  	<br/>

			<!--  hidden scope-->
			<form action="/auth/facebook" name="facebook">
				<input type="hidden" name="scope" value="email,user_friends"/>
			</form>
			<form action="/auth/google" name="google">
				<input type="hidden" name="scope" value="https://www.googleapis.com/auth/plus.login" />
			</form>
			<form action="/auth/kakao" name="kakao"></form>

			<div class="text-center">또는</div><br/>

			<div class="form-group">
				<form class="form-horizontal" action="/login/authenticate" method="post" id="loginFrm" name="loginFrm">
					<div class="form-group">
						<label for="email" class="col-md-3 control-label">Email</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="username" placeholder="amazoncar@amazoncar.co.kr" />
				 		</div>
			 		</div>
			 		<div class="form-group">
					<label for="password" class="col-md-3 control-label">비밀번호</label>
					<div class="col-sm-9">
			 			<input type="password" name="password" class="col-md-9 form-control"/>
			 		</div>
			 		</div>
			 		<div class="form-group">
					    <div class="text-center">
						    <button type="submit" class="btn btn-success btn-default">이메일로 로그인하기</button>
					    </div>
				    </div>
			 	</form>
				<c:if test="${message ne null}">
					<p class="bg-danger login-error">
						아이디나 비밀번호가 맞지 않습니다
					</p>
				</c:if>			 	
			</div>

			<div class="text-center" style="margin-top:50px;">
				<h4><a href="/register" class="text-highlight">간편하게 회원가입하기</a></h4>
				<h6>비밀번호를 잊으셨나요?&nbsp;&nbsp;<a href="#" data-toggle="modal" data-target="#findPassword" class="text-highlight">비밀번호 찾기</a></h6>
			</div>

	  	</div>
	</div>
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
</t:genericpage>