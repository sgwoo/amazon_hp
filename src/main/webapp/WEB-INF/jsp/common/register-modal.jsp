<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){

	$("#reg_btn").on("click", function(){
		
		//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
		/* alert("현재, 서버 정비작업으로 인해 신규 회원가입이 불가능 합니다.\n\n(회원가입을 원하시는 경우 소셜로그인을 이용해주세요)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false; */ 
		
		$("#password2-error").css("display", "none");
		$("#password2-error2").css("display", "none");
		$("#confirmPwd-error").css("display", "none");
		$("#confirmPwd-error2").css("display", "none");
		
		var password2 = $("#password2").val();
		var confirmPwd = $("#confirmPwd").val();
		
		if(password2 == "" || password2 == null){
			$("#password2-error").css("display", "block");
			$("#password2").focus();
		}else if(password2.length < 1){
			$("#password2-error2").css("display", "block");
			$("#password2").focus();
		}else if(confirmPwd == "" || confirmPwd == null){
			$("#confirmPwd-error").css("display", "block");
			$("#confirmPwd").focus();
		}else if(confirmPwd != password2){
			$("#confirmPwd-error2").css("display", "block");
			$("#confirmPwd").focus();
		}else{
			$("#emailRegisterFrm").submit();
		} 
	});
	
})
</script>

<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="register-modal" aria-hidden="true">
	<div class="pre-check-content">
		<form class="form-horizontal" action="/signup" method="post" name="emailRegisterFrm" id="emailRegisterFrm">	
			<div class="pre-check-opening">
				<div class="col-md-4">
					<br>
					<input type="email" id="username2" name="email" class="col-md-4 form-control" value="" readonly="readonly"/>
				</div>
				<!-- <h4 class="col-md-1" style="margin-top: 25px;">님은</h4> -->
				<div class="col-md-7"></div>
				<!-- <h4 class="col-md-12"><br>아마존카 회원이 아니십니다. &nbsp;&nbsp;&nbsp;회원 가입은 이메일 또는 소셜로그인으로 이용이 가능합니다.<br></h4> -->
				<!-- <h4 class="col-md-12"><br>견적 결과를 My Page에서 다시 보기 위해서 비밀번호 설정이 필요합니다.<br></h4> -->				
				<div class="col-md-12" style="margin-top: 20px;">
					<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;
					위 메일주소로 견적결과를 받으실 수 있으며, 이후 MyPage를 통하여 <span style="font-weight: bold;">견적결과 확인, 변경, 삭제도 가능</span>합니다.
				</div>
				<div class="col-md-12" style="margin-top: 15px;">
					<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;
					이를 위하여 아래의 비밀번호 설정이 필요합니다.
				</div>
				
				<div class="col-md-12" style="height: 25px;"></div>
				<div class="col-md-12">
					<table style="width: 70%;">
						<colgroup>
							<col width="60px;">
							<col width="200px;">
							<col width="100px;">
							<col width="100px;">
						</colgroup>
						<tr>
							<td>
								<label for="password" class="control-label" style="margin-top: 7px;">비밀번호</label>
							</td>
							<td>
								<input type="password" id="password2" name="password" class="form-control"/>
								<div style="display: none;" id="password2-error">
									<label class="errClass" for="password2">비밀번호를 입력해주세요</label>
								</div>
								<div style="display: none;" id="password2-error2">
									<!-- <label class="errClass" for="password2">비밀번호는 최소 4자 이상이어야 합니다</label> -->
									<label class="errClass" for="password2">비밀번호를 입력해주세요</label>
								</div>								
							</td>
							<td rowspan="2" align="center">
								<!-- 20180515_견적내기 에서 이메일 인증으로 문구 수정 -->
								<button type="button" class="btn btn-success register-button" style="margin-top: -4px;" id="reg_btn">이메일 인증</button>										
							</td>
							<td rowspan="2" align="center">
								<div class="text-center">소셜로그인</div>			
								<div class="text-center">
									<a onclick="FB_login();" style="cursor: pointer;">
										<img class="login-social-image"	src="/resources/images/login_facebook.png" width="48" />
									</a> 
									<a onclick="GG_login();" style="cursor: pointer;">
										<img class="login-social-image" src="/resources/images/login_google.png" width="48" />
									</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="password" class="control-label" style="margin-top: 7px;">비밀번호 확인</label>
							</td>
							<td>								
								<input type="password" id="confirmPwd" class="form-control"/>
								<div style="display: none;" id="confirmPwd-error">
									<label class="errClass" for="confirmPwd">비밀번호를 한번 더 입력해주세요</label>
								</div>
								<div style="display: none;" id="confirmPwd-error2">
									<label class="errClass" for="confirmPwd">입력한 비밀번호와 다릅니다</label>
								</div>
							</td>
						</tr>
					</table>
				</div>							
				<!-- 회원가입 방식 변경  끝-->			
			</div>
		</form>
	</div>
</div>