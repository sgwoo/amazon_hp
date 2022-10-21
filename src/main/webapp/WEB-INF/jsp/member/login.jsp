<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script src="/resources/js/common.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
<link rel="stylesheet" href="/resources/stylesheets/login.css"/>
<!-- 구글 소셜로그인 연동 -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="87064886185-9k4to29khedjjpa71638ombcphn2754c.apps.googleusercontent.com"></meta>                                              
<script src="https://apis.google.com/js/client:platform.js"></script>
<!-- <script src="https://apis.google.com/js/client.js"></script> -->
<script src="https://apis.google.com/js/api:client.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init("4419b2a3a6bac750d7b19ffd37d7b995");
function loginWithKakao() {
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({ //loginForm, login
		throughTalk: true,
		success: function(authObj) {
			Kakao.API.request({	
				url: '/v2/user/me',		
				success: function(res) {		
					//alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
					//alert(res.id);
					var kakao_email = btoa(res.id);
					var kakao_id = res.id;	
					
					var data= {};		
					data["kakao_id"] = kakao_id;
					/* if(kakao_email == '' || kakao_email == null){
						kakao_email = 'undefined';
					} */
					//data["kakao_email"] = kakao_email;
					data["kakao_email"] = "undefined";
					
					//먼저 해당 정보를 가지고 이미 회원가입한 계정인지 처음가입인지를 체크
					$.ajax({
						contentType:'application/json',
						dataType:'json',
						url:'/checkKakaoLoginMember',
						type:'POST',
						data:JSON.stringify(data),
						success:function(response){	
							
							var resultNum = response;
							
							if(resultNum == 0){	//처음회원가입하는 경우 --> 회원가입시킨다
								
								location.href = '/signup?kakao_email=' + kakao_email + "&kakao_id=" + kakao_id;
							
							}else{	//회원가입이 되어있는 경우
								
								$.ajax({
									contentType:'application/json',
									dataType:'json',
									url:'/checkEmailForKakao',
									type:'POST',
									data:JSON.stringify(data),
									success:function(res){
										var resultYn = res.USE_YN;
										var resultEmail = res.EMAIL;
										
										/* if (resultYn == "H") {	//아직 인증절차를 끝까지 진행하지 않은 회원 --> 인증절차 진행시킨다
											location.href = '/regEmailKakaoForm?kakao_id='+kakao_id
										} else { 	//회원가입이 잘된 경우 --> 로그인 시킨다
											location.href = '/signup?kakao_email=' + btoa(resultEmail) + "&kakao_id=" + kakao_id;
										} */
										location.href = '/signup?kakao_email=' + btoa(resultEmail) + "&kakao_id=" + kakao_id;
									},
									error:function(request,status,error){
										alert("로그인 중 오류 발생! 관리자에게 문의하세요.");
									}
								});			
							
							}					
						},
						error:function(request,status,error){
							alert("로그인 중 오류 발생! 관리자에게 문의하세요.");
						}
					});
					
				},
				fail: function(err) {
					alert("정보제공에 동의 설정후 다시 요청부탁드립니다.");
				}				
			})
		},
		fail: function(err) {
		  alert("관리자에게 문의해주세요.");
		}
	});
};    
</script>

<script>
function onSignIn(googleUser) {
	// Useful data for your client-side scripts:
	var profile = googleUser.getBasicProfile();
	//console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	//console.log('Full Name: ' + profile.getName());
	//console.log('Given Name: ' + profile.getGivenName());
	//console.log('Family Name: ' + profile.getFamilyName());
	//console.log("Image URL: " + profile.getImageUrl());
	//console.log("Email: " + profile.getEmail());
	
	// The ID token you need to pass to your backend:
	var id_token = googleUser.getAuthResponse().id_token;
	//console.log("ID Token: " + id_token);
	
	$(".abcRioButtonIcon").css("padding-left", "25px");
	$(".abcRioButtonIcon").css("padding-right", "0px");	
	
	$(".abcRioButtonContents").text("Google 로그인");
	$(".abcRioButtonContents").css("margin-left", "0px");
	$(".abcRioButtonContents").css("font-weight", "500");
	
	$(".abcRioButton").css("border-radius", "5px");
	$(".abcRioButton").css("width", "100%");
	$(".abcRioButton").css("max-width", "300px");
}
</script>
<script>
$(document).ready(function(){	
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* $(".no-register").on("click", function(){
		alert("현재, 서버 정비작업으로 인해 회원가입 및 비밀번호 찾기가 불가능 합니다.\n\n(로그인은 정상 이용 가능하며, 신규 회원가입의 경우 소셜로그인을 이용해주세요)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */
	
	//이미 로그인된 상태에서는 바로 메인화면으로 이동 
	if($("#loginEmail").val() != null && $("#loginEmail").val() != ""){
		//opener.location.reload();
		location.href="/";
	}
	
	//페이지 로드시 구글로그인 체크값 리셋
	$("#GG_login_yn").val("0");
	
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
			//email = $('#resetEmail').val();	
			email = btoa($('#resetEmail').val());
			$.ajax({				
				url:'/find/password?email='+email,				
				data:email,
				success:function(response){
					
					if(response.message != "" && response.message != null){
						$('#beforeSubmit').addClass('hidden');
						if(response.message == "1"){							
							$('#submitEmail').html(atob(email));
							$('#afterSubmit').removeClass('hidden');
						}else if(response.message == "2"){							
							$('#notFoundEmail').html(atob(email));
							$("#emailNotFound").removeClass("hidden");
						}
					}
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});
		}
	});
	
	//로그인시 사용자 본인인증을 한 계정인지 먼저 체크
	$("#login_btn").on("click", function(){
		
		$("#checkId-error").css("display", "none");
		
		var email = $("#username").val();
		var password = $("#password").val();		
		
		if(email == "" || email == null){
			$("#username-error2").css("display", "none");
			$("#username-error").css("display", "block");			
		}else{
			if(emailValidation(email)==true){
				if(email.indexOf('@')=='-1' || email.indexOf('.')=='-1'){			
					$("#username-error2").css("display", "block");
					$("#username-error").css("display", "none"); 		
				}else if(email.indexOf('@')!='-1' && email.indexOf('.')!='-1'){	
					
					if(password == "" || password == null){	
						$("#username-error").css("display", "none");
						$("#username-error2").css("display", "none");
						$("#password-error").css("display", "block");	
					}else{
						$("#username-error").css("display", "none");
						$("#username-error2").css("display", "none");
						$("#password-error").css("display", "none");
									
						//이메일인증여부 체크 Ajax
						var data= {};
						//data["email"] = $('#username').val();
						data["email"] = btoa($('#username').val());
						
						$.ajax({
							contentType:'application/json',
							dataType:'json',
							url:'/checkUseYn',
							type:'POST',
							data:JSON.stringify(data),
							success:function(response){	
								
								var email = $("#username").val();
								if(response.checkCnt2 == '0'){	//회원가입여부 체크
									$("#checkId-error").css("display", "block");
								}else if(response.checkCnt2 == '1'){
									
									if(response.checkCnt == '1'){	//이메일인증여부 체크
										//$("#submit_btn").click();
										$("#sec_email").val(btoa(email));
										$("#sec_pwd").val(btoa($("#password").val()));
										$("#loginFrm").submit();
									}else{
										var email = $("#username").val();
										//location.href="/authEmail?email="+email;
										location.href="/authEmail?email="+ btoa(email);
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
			}
		}
	});
	
	//비밀번호 변경 안내 confirm
	$("#resetBtn").on("click", function(){		
		if ($("#resetEmail").val() == "") {
			alert("비밀번호 변경 안내를 받으실 이메일 주소를 입력해 주세요.");
		} else {			
			if(!confirm("입력하신 이메일주소로 비밀번호 변경 안내를 받으시겠습니까?")){
				return;
			} else {
				$("#resetFrm").submit();
			}
		}		
	});	
	
});

//비밀번호 찾기 모달 폼 초기화
function resetModalForm(){
	$('#beforeSubmit').removeClass('hidden');
	$('#afterSubmit').addClass('hidden');
	$("#emailNotFound").addClass("hidden");
}

//고객FMS 바로가기
function go_client_fms(){
// 	window.open('https://fms.amazoncar.co.kr/service/index.jsp');
	window.open('https://client.amazoncar.co.kr');
}

</script>
	<div class="row">
		<!-- 홈페이지 로그인 창 -->
		<div class="login-title col-md-10 col-md-offset-1" style="margin-top: 40px;">
			<!-- <span class="title"><b>실시간 견적 및 월렌트 예약을 위한 로그인</b></span> -->
			<span class="title" style="font-size: 20px !important;"><b>이메일 로그인</b></span><br>
			<span>본인 견적이력 확인 / 상담요청 내역 확인 / 월렌트 예약용</span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1" style="padding-top:70px; padding-bottom:45px;">
			<%-- <div class="form-group col-md-12" id="msg_div" align="center">
				${param.message}</div> --%>
			<div class="form-group col-md-8" style="margin-top: 30px;"> 
				<div>
					<form class="form-horizontal" action="/login/authenticate" method="post" id="loginFrm" name="loginFrm">
						<input type="hidden" name="sec_email" id="sec_email"value="">
						<input type="hidden" name="sec_pwd" id="sec_pwd" value="">
						<div class="col-md-9">
							<div class="form-group">
								<label for="username" class="col-md-3 control-label">Email</label>
								<div class="col-md-9">
									<input type="email" class="form-control" id="username"
										name="username" placeholder="amazoncar@amazoncar.co.kr" style="IME-MODE: disabled;"/>
									<div style="display: none;" id="username-error">
										<label class="errClass" for="username">아이디를 입력해주세요</label>
									</div>
									<div style="display: none;" id="username-error2">
										<label class="errClass" for="username">아이디는 이메일 형식입니다</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-md-3 control-label">비밀번호</label>
								<div class="col-md-9">
									<input type="password" id="password" name="password"
										class="col-md-9 form-control" />
									<div style="display: none;" id="password-error">
										<label class="errClass" for="password">비밀번호를 입력해주세요</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group col-md-3">
							<div class="text-center">
								<!-- <button type="submit" class="btn btn-success login-button" style="display: none;" id="submit_btn">로그인</button> -->
								<input type="hidden" name="from_page" value="${param.from_page}">
								<button type="button" class="btn btn-success login-button" id="login_btn">로그인</button>
							</div>
						</div>
					</form>
				</div>
				<c:if test="${message ne null}">
					<p class="bg-danger login-error" style="clear: both">아이디나 비밀번호가 일치하지 않습니다</p>
				</c:if>
				<div id="checkId-error" style="display: none;">
					<p class="bg-danger login-error" style="clear: both">아이디나 비밀번호가 일치하지 않습니다</p>
				</div>
			</div>
			<div class="col-md-4" align="center" style="margin-top: -18px;">
				<table>
					<%-- <tr>
						<td colspan="3">
							<div class="text-center">소셜로그인</div>
						</td>
					</tr> --%>
					<%-- 
					<tr>
						<td width="33%">
							<div id="text-center">
								<a onclick="loginWithKakao();" style="cursor: pointer;">					
									<img class="login-social-image" src="/resources/images/kakaolink_btn_medium.png" width="48"/>
								</a>
							</div>
						</td>
						<td width="33%">
							<div class="text-center" style="float: left;">
								<a onclick="FB_login();" style="cursor: pointer;">
									<img class="login-social-image" src="/resources/images/login_facebook.png" width="48"/>
								</a>
							</div>
						</td >
						<td width="33%">
							<div id="GG_login">
								<a onclick="GG_login();" style="cursor: pointer;">
									<img class="login-social-image" src="/resources/images/login_google.png" width="48"/>
								</a>
							</div>
						</td>
					</tr> 
					--%>
					<tr>
						<td>
							<div id="text-center">
								<a onclick="loginWithKakao();" style="cursor: pointer;">
									<img src="/resources/images/kakao_account_login_btn_medium_wide.png"/>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="text-center" style="margin-top: 15px;">
								<a onclick="FB_login();" style="cursor: pointer;">
									<img src="/resources/images/login_with_facebook.png" width="300" height="49"/>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="text-center" style="margin-top: 15px;">
								<div class="g-signin2" data-onsuccess="onSignIn" data-width="300" data-height="49" data-longtitle="true" data-theme="" onclick="GG_login();"></div>
							</div>
						</td>
					</tr>
				</table>				
			</div>
			<div class="col-md-12 text-center" style="margin-top: 30px;">
				<h4>
					<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
					<!-- <a href="/register" class="text-highlight">간편하게 회원가입하기</a> -->
					<a href="/register" class="text-highlight">간편하게 이메일 계정등록하기</a>
					<!-- <a class="text-highlight no-register">간편하게 회원가입하기</a> -->
				</h4>
				<h6>
					비밀번호를 잊으셨나요?&nbsp;&nbsp;
					<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
					<a href="#" data-toggle="modal"	data-target="#findPassword" class="text-highlight" onclick="resetModalForm()">비밀번호 찾기</a>
					<!-- <a href="#" class="text-highlight no-register" >비밀번호 찾기</a> -->
				</h6>
			</div>
		</div>		
	
		<!-- 고객지원 FMS 안내창 -->
		<c:if test="${param.param=='Y'}">
		<div class="login-title col-md-10 col-md-offset-1" style="margin-top: -50px;">
			<!-- <span class="title" style="color: #00BFFF;"><b>고객지원 서비스(FMS) 로그인 [아마존카 이용 고객]</b></span> -->
			<span class="title" style="color: rgb(94,177,187);"><b>고객지원 서비스(FMS) 로그인 [아마존카 이용 고객]</b></span>
		</div>
		<div class="login-box col-md-10 col-md-offset-1" style="margin-top : -10px; margin-bottom: -30px; padding-bottom: 0;">
			<div class="form-group col-md-8">
				<div style="margin-top: -40px;">
					<div class="col-md-1"> </div>
					<div class="col-md-11" style="margin-left: -35px; margin-bottom: 10px;">이용하고 계신 차량에 관련된 정보를 확인 하실 수 있습니다.</div>
					<div class="col-md-9">
						<!-- <div style="border:2px solid #999933; border-radius: 5px; background-color: ; width: 100%; padding-top:5px; padding-bottom:-5px;"> -->
						<!-- <div style="border:1.5px solid #00BFFF; border-radius: 5px; background-color:; width: 100%; padding-top:5px; padding-bottom:-5px;"> -->
						<div style="border:1.5px solid rgb(94,177,187); border-radius: 5px; background-color:; width: 100%; padding-top:5px; padding-bottom:-5px;">
							<ul style="line-height: 15px;">
								<li>계약정보</li>
								<li>대여료 스케줄, 세금계산서</li>
								<li>보험정보, 사고처리</li>
								<li>정비이력, 과태료관련</li>
							</ul>
						</div>
					</div>
					<div class="form-group col-md-3" style="margin-left: -10px;">
						<div class="text-center">
							<button type="button" class="btn login-button" onclick="javascript:go_client_fms();" style="background-color:rgb(94,177,187); color: white;">고객FMS<br>로그인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		</c:if>		
	</div>
	
	<!-- 비밀번호 찾기 모달 -->
	<form name="resetFrm" id="resetFrm" method="post">
		<div class="modal fade" id="findPassword" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<!-- 						<h4 class="modal-title">비밀번호 찾기</h4> -->
					</div>
					<div class="modal-body pwd-modal" id="beforeSubmit">
						<span class="text-highlight">회원가입 시 등록하신 이메일 주소</span>를 입력하시면 비밀번호 변경 안내 메일을 발송합니다<br>
						<!-- <span class="text-highlight">소셜로그인으로 이메일 주소를 등록하신</span> 고객님 께서는 비밀번호 변경시<br>
						<span class="text-highlight">소셜로그인 및 아마존카 로그인 이용</span>이 가능합니다.<br> -->
						<span class="text-highlight" style="color: red;">비밀번호 변경은 소셜 비밀번호 변경이 아닌 아마존카 비밀번호 변경입니다.</span><br><br>
						<span class="text-highlight" style="color: red;">소셜로그인으로 등록하신 고객님 께서는 소셜측에서 비밀번호 변경 부탁드립니다.</span><br>
						<br />
						<div class="form-group">
							<input type="email" name="resetEmail" id="resetEmail" class="form-control" placeholder="amazoncar@amazoncar.co.kr" />
						</div>
						<div class="text-center">
							<button type="button" id="resetBtn" class="btn btn-success btn-lg">이메일 발송</button>
						</div>
					</div>
					<div class="modal-body hidden text-center pwd-modal" id="afterSubmit">
						<h4>
							<span class="text-highlight glyphicon glyphicon-ok" id="submitEmail"></span>
							으로<br><br>비밀번호 재설정 안내 메일이 발송되었습니다<br><br>
						</h4>
						<div>이메일 수신에 문제가 있을시 스팸메일설정 등을 확인해주세요.</div><br>
					</div>
					<div class="modal-body hidden text-center pwd-modal" id="emailNotFound">
						<h4>
							<span class="text-highlight glyphicon glyphicon-ok"
								id="notFoundEmail"></span>은<br />아마존카에 가입된 이메일이 아닙니다. 다시 확인해주세요.
							</h4>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</form>
	
	<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="" />
	</sec:authorize>	
	
</t:genericpage>