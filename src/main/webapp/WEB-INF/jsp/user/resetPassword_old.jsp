<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<head>
<link rel="stylesheet" href="/resources/stylesheets/common.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
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
</head>
<body>
	<div class="container text-center">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-top:200px;">
				<form class="form-horizontal">
					<div class="amazon-messeage-box">
						<!-- <img alt="Brand" src="http://www.amazoncar.co.kr/home/images/main/toplogo_w.png" /> -->
						<img alt="Brand" src="http://www.amazoncar.co.kr/home/mobile/images/main/logo_1.png" width="200px" />	
						<h2>비밀번호 재설정</h2>
						<p>
							변경하실 비밀번호를 입력해주세요.<br/><br/>
							<div class="form-group">
								<label for="password" class="col-sm-4 control-label">비밀번호</label>
								<div class="col-sm-8">
									<input type="password" name="password" id="password" class="form-control" style="width:80%" />
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-4 control-label">비밀번호 확인</label>
								<div class="col-sm-8">
									<input type="password" name="confirmPwd" id="confirmPwd" class="form-control" style="width:80%"/>
									<input type="hidden" name="email" id="email" value="${email}" />
								</div>
							</div>
						</p><br/>
						<div class="form-group">
							<button type="submit" name="resetBtn" id="resetBtn" class="btn btn-lg btn-success">비밀번호 변경</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</HTML>
