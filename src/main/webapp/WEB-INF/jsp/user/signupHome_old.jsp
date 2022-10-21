<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
	$('#emailRegisterFrm').validate({
		rules:{
			email:{required:true},
			name:{required:true},
			password:{required:true,minlength:4},
			confirmPwd:{required:true,equalTo:"#password"}
		},
		errorClass:"errClass",
		messages:{
			email:{
				required:"이메일을 입력해주세요"
			},
			name:{
				required:"이름을 입력해주세요"
			},
			password:{
				required:"비밀번호를 입력해주세요",
				minlength:"비밀번호는 최소 4자 이상이어야 합니다"
			},
			confirmPwd:{
				required:"비밀번호를 한번 더 입력해주세요",
				equalTo:"입력한 비밀번호와 다릅니다"
			}
		}
	});
})
</script>
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<h2>회원가입</h2>

			<a class="btn btn-block btn-social btn-facebook"  onclick="document.facebook.submit();">
		    	<span class="fa fa-facebook""></span>Facebook 계정으로 회원 가입하기
		  	</a>
		  	<a class="btn btn-block btn-social btn-google"  onclick="document.google.submit();">
		    	<span class="fa fa-google"></span> Google 계정으로 회원 가입하기
		  	</a>
		  	<a class="btn btn-block btn-social btn-kakao"  onclick="document.kakao.submit();">
		    	<span class="fa fa-google"></span> 카카오 계정으로 회원 가입하기
		  	</a>
		  	<br/>
		  	<div class="text-center">또는, 이메일로 간단 가입하기</div><br/>
		  	<form action="/signup" method="post" class="form-horizontal" name="emailRegisterFrm" id="emailRegisterFrm">
		  		<div class="form-group">
		  			<label for="email" class="col-md-3 control-label">Email</label>
		  			<div class="col-md-9">
			  			<input type="email" name="email" id="email" class="form-control" placeholder="amazoncar@amazoncar.co.kr" />
			  		</div>
		  		</div>
		  		<div class="form-group">
		  			<label for="email" class="col-md-3 control-label">이름</label>
		  			<div class="col-md-9">
			  			<input type="text" name="name" id="name" class="form-control" />
			  		</div>
		  		</div>
		  		<div class="form-group">
		  			<label for="password" class="col-md-3 control-label">비밀번호</label>
			  		<div class="col-md-9">
			  			<input type="password" name="password" id="password" class="col-md-9 form-control"/><br/>
			  		</div>
			  	</div>
			  	<div class="form-group">
			  		<label for="password" class="col-md-3 control-label">비밀번호<br/>확인</label>
			  		<div class="col-md-9">
			  			<input type="password" name="confirmPwd" id="confirmPwd" class="col-md-9 form-control"/>
			  		</div>
		  		</div>
		  		<div class="form-group">
				    <div class="text-center">
					    <button type="submit" class="btn btn-success btn-default">이메일로 회원 가입하기</button>
				    </div>
			    </div>
		  	</form>
		  	
		  	
		  	<!-- hidden scope -->
			<form action="/auth/facebook" name="facebook">
				<input type="hidden" name="scope" value="email,user_friends"/>
			</form>
			<form action="/auth/google" name="google">
				<input type="hidden" name="scope" value="https://www.googleapis.com/auth/plus.login" />
				<input type="hidden" name="redirect_uri" value="http://dev.amazoncar.com:8080/signup" />
			</form>
			<form action="/auth/kakao" name="kakao"></form>
		</div>
	</div>
</t:genericpage>