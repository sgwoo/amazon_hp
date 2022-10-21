<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	//로그인시 사용자 본인인증을 한 계정인지 먼저 체크
	//$("#login_btn").on("click", function(){
	function loginCheck(){	
		
		$("#checkId-error").css("display", "none");
		
		var email = $("#username").val();
		var password = $("#password").val();
		
		if(password == "" || password == null){			
			$("#password-error").css("display", "block");	
		}else{			
			$("#password-error").css("display", "none");
						
			//이메일인증여부 체크 Ajax
			var data= {};
			data["email"] = $('#username').val();
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				url:'/checkUseYn',
				type:'POST',
				data:JSON.stringify(data),
				success:function(response){					
					if(response.checkCnt2 == '0'){	//회원가입여부 체크	
						$("#checkId-error").css("display", "block");
					}else if(response.checkCnt2 == '1'){
						
						if(response.checkCnt == '1'){	//이메일인증여부 체크
							$("#submit_btn").click();
						}else{
							var email = $("#username").val();
							location.href="/authEmail?email="+email;
						}
					}else{
						alert("로그인 중 오류발생! 관리자에게 문의하세요.");
					}
					
				},
				error:function(request,status,error){
					alert("로그인 중 오류발생! 관리자에게 문의하세요.");
				}
			});
		}			
	} 
	
	$("#resetBtn").on("click", function(){
		/* var data= {};
		data["email"] = $('#resetEmail').val(); */
		email = $('#resetEmail').val();
		
		$.ajax({
			//contentType:'application/json',
			//dataType:'json',
			url:'/find/password?email='+email,
			//type:'POST',
			data:email,/* JSON.stringify(data), */
			success:function(response){
				
				if(response.message != "" && response.message != null){
					$('#beforeSubmit').addClass('hidden');
					if(response.message == "1"){
						//$('#submitEmail').html(data["email"]);
						$('#submitEmail').html(email);
						$('#afterSubmit').removeClass('hidden');
					}else if(response.message == "2"){			
						/* $('#submitEmail').html(data["email"]); */
						alert("이메일 발송 중 오류발생! 관리자에게 문의하세요.")						
					}
				}
			},
			error:function(request,status,error){
				alert(response.message);
			}
		});
		
	});
	
	$("#closeModal").on("click", function(){
		var cancel = $(this).closest('#findPassword');
		   $(cancel).modal('hide');
	});
	
	$("#cancelBtn").on("click", function(){
		$("#closeModal").click();		
	});
	
	
	// 현재 페이지 주소(URL)을 가져올 함수 생성
    var sHref = location.href;
    
	$("#sHref").val(sHref);
	
	if(sHref.indexOf("month") != -1){
		$("#estimate_btn").css("display", "none");	
		$("#reserve_btn").css("display", "block");
	}else{
		$("#estimate_btn").css("display", "block");
		$("#reserve_btn").css("display", "none");
	}
	
	$("#estimate_btn").on("click", function(){
		loginCheck();	
	});
	
	$("#reserve_btn").on("click", function(){
		loginCheck();	
	});
})

//비밀번호 찾기 모달 폼 초기화
function resetModalForm(){
		
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* alert("현재, 서버 정비작업으로 인해 비밀번호 찾기가 불가능 합니다.\n\n소셜로그인을 이용해주세요.\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
	return false; */
	
	$('#beforeSubmit').removeClass('hidden');
	$('#afterSubmit').addClass('hidden');
	$("#emailNotFound").addClass("hidden");
}

</script>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modal" aria-hidden="true" >
	<div class="pre-check-content">
		<form class="form-horizontal" action="/login/authenticate" method="post" id="loginFrm" name="loginFrm">
			<div class="pre-check-opening">
				<div class="col-md-4">
					<br>
					<input type="email" id="username" name="username" class="col-md-4 form-control" value="" readonly="readonly"/>
				</div>
				<!-- <h4 class="col-md-1" style="margin-top: 25px;">님은</h4> -->
				<div class="col-md-7"></div>
				<!-- <h4 class="col-md-12"><br>아마존카 기존회원 이십니다. &nbsp;&nbsp;&nbsp;로그인 하시겠습니까?<br></h4> -->
				<h4 class="col-md-12"><br>아마존카 기존회원 이십니다. &nbsp;&nbsp;&nbsp;비밀번호를 입력해 주세요.<br></h4>				
				<!-- <p style="margin: 50px; text-align: center;">
					<button class="btn btn-success" onclick="location.href='/login'">로그인 / 회원가입</button>
				</p> -->
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
								<input type="password" id="password" name="password" class="form-control"/>
								<div style="display: none;" id="password-error">
									<label class="errClass" for="password">비밀번호를 입력해주세요</label>
								</div>
							</td>
							<td rowspan="2" align="center">
								<button type="submit" class="btn btn-success login-button" style="display: none;" id="submit_btn">견적내기</button>
								<button type="button" class="btn btn-success login-button" id="estimate_btn" style="width:80px; height:80px;">견적내기</button>
								<!-- 20180515_예약하기에서 로그인으로 문구 수정 -->		
								<button type="button" class="btn btn-success login-button" id="reserve_btn" style="width:80px; height:80px;">로그인</button>		
							</td>							
							<td rowspan="2" align="center">
								<table>
									<tr>
										<td colspan="3">
											<div class="text-center">소셜로그인</div>
										</td>
									</tr>
									<tr>
										<td width="47%">
											<div class="text-center" style="float: left; margin-left: 75px;">					
												<a onclick="FB_login();" style="cursor: pointer;">					
													<img class="login-social-image"	src="/resources/images/login_facebook.png" width="48" />
												</a> 
											</div>
										</td >
										<td width="6%"></td>
										<td width="47%">
											<div id="GG_login">
												<a onclick="GG_login()" style="cursor: pointer;">					
													<img class="login-social-image"	src="/resources/images/login_google.png" width="48" />
												</a>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<h5>
									비밀번호를 잊으셨나요?&nbsp;&nbsp;
									<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
									<a href="#" data-toggle="modal"	data-target="#findPassword" class="text-highlight" onclick="resetModalForm()">비밀번호 찾기</a>
									<!-- <a href="#" class="text-highlight" onclick="resetModalForm()">비밀번호 찾기</a> -->
								</h5>
							</td>
						</tr>
					</table>
				</div>							
				<!-- 로그인 방식 변경  끝-->
							
			</div>
		</form>
		<div class="pre-auth-info" style="display:none;">
			<hr/>
			인증 메일이 <span class="text-bold auth-email"></span>(으)로 전송되었습니다. 이메일을 확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.
		</div>
		<form name="resetFrm" id="resetFrm" method="post">
			<div class="modal fade" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
							<button type="button" class="close" id="closeModal">
								<span aria-hidden="true">&times;</span>
							</button>							
						</div>
						<div class="modal-body pwd-modal" id="beforeSubmit" align="center">
							<span class="text-highlight">입력하신 아래의 이메일 주소</span>로 비밀번호 변경 안내 메일을 발송합니다<br />
							<br />
							<div class="form-group" >
								<input type="email" name="resetEmail" id="resetEmail" class="form-control" style="width: 350px;" readonly="readonly"/>
							</div>
							<div class="text-center">
								<button type="submit" id="resetBtn"	class="btn btn-success btn-lg">이메일 발송</button>
								<!-- <button type="button" id="resetBtn"	class="btn btn-success btn-lg">이메일 발송</button> -->
							</div>
						</div>
						<div class="modal-body hidden text-center pwd-modal" id="afterSubmit">
							<h4>
								<span class="text-highlight glyphicon glyphicon-ok" id="submitEmail"></span>
								으로<br/><br>비밀번호 재설정 안내 메일이 발송되었습니다<br><br>
							</h4>
							<div>이메일 수신에 문제가 있을시 스팸메일설정 등을 확인해주세요.</div><br>
							<input type="button" id="cancelBtn" class="btn btn-default btn-lg" value="닫기"/>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		</form>
	</div>
</div>