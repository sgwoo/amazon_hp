<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/login.css"/>
<script>
$(document).ready(function(){	
	var username = $("#username").val();
	$('#emailRegisterFrm').validate({
		rules:{
            //username:{required:true, email:true},
            email:{required:true, email:true},
//			name:{required:true},
			password:{required:true,minlength:1},
			confirmPwd:{required:true,equalTo:"#password"}
		},
		errorClass:"errClass",
		messages:{
            /* username:{
				required:"이메일을 입력해주세요",
                email:"아이디는 이메일 형식입니다"
            }, */
            email:{
				required:"이메일을 입력해주세요",
                email:"아이디는 이메일 형식입니다"
            },
//			name:{
//				required:"이름을 입력해주세요"
//			},
			password:{
				required:"비밀번호를 입력해주세요",
				/* minlength:"비밀번호는 최소 4자 이상이어야 합니다" */
				minlength:"비밀번호를 입력해주세요"
			},
			confirmPwd:{
				required:"비밀번호를 한번 더 입력해주세요",
				equalTo:"입력한 비밀번호와 다릅니다"
			}
		}

	});
	
	$("#agreeChk").on("click", function(){
		var check_use = $("#agreeChk").is(":checked");
		if (check_use == true) {
			$("#agree_error").css("display", "none");
		};
	});
	
	$("#regMemberBtn").on("click", function(){
		var username = $("#username").val();
		var password = $("#password").val();
		var confirmPwd = $("#confirmPwd").val();
		//$('#emailRegisterFrm').validate();
		var check_use = $("#agreeChk").is(":checked");
		if (username == null || username == "") {
			alert("이메일을 입력해주세요.");
			return;
		}
		
		if (password == null || password == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if (confirmPwd == null || confirmPwd == "") {
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}
		
		if (check_use == false) {
			//alert("개인정보 수집·이용 동의 미체크시 이메일 계정 등록이 불가합니다.");
			$("#agree_error").css("display", "");
			return;
		};
		//회원가입여부 체크 Ajax
		var data= {};
		data["email"] = btoa(username);
		
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			url:'/checkRegEmail',
			type:'POST',
			data:JSON.stringify(data),
			success:function(response){	
				
				if(response == '0'){//회원가입 계속 진행(중복된 아이디가 없는경우)
					//$("#submit_btn").click();
					$("#username2").val(btoa($("#username").val()));
					$("#password2").val(btoa($("#password").val()));
					$("#emailRegisterFrm2").submit();
				}else if(response == '1'){//가입된 이메일이 있는 경우										
					$("#checkEmail-error").css("display", "block");
				}else{
					alert("회원가입 중 오류발생! 관리자에게 문의하세요.");
				} 
			},
			error:function(request,status,error){
				alert("회원가입 중 오류발생! 관리자에게 문의하세요.");
			}
		});
		
		
	});
})

</script>
	<div class="row">
		<div class="login-title col-md-8 col-md-offset-2">
			<span class="title" style="font-weight: bold;">실시간 견적 및 월렌트 예약을 위한 이메일 계정등록</span>
		</div>
		<div class="login-box col-md-8 col-md-offset-2">
			<form class="form-horizontal" action="/signup" method="post" name="emailRegisterFrm" id="emailRegisterFrm">
				<div class="col-md-9">
					<div class="form-group">
						<label for="username" class="col-md-3 control-label" style="text-align: center;">Email</label>
						<div class="col-md-9">
							<input type="email" name="email" id="username" class="form-control" placeholder="amazoncar@amazoncar.co.kr" />
						</div>
					</div>					
					<div class="form-group">
						<label for="password" class="col-md-3 control-label" style="text-align: center;">비밀번호</label>
						<div class="col-md-9">
							<input type="password" name="password" id="password" class="col-md-9 form-control"/><br/>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-3 control-label" style="text-align: center;">비밀번호 확인</label>
						<div class="col-md-9">
							<input type="password" name="confirmPwd" id="confirmPwd" class="col-md-9 form-control"/>
						</div>
					</div>
				</div>				
				<div class="form-group col-md-3">
					<div class="text-center">
						<!-- <button type="submit" class="btn btn-success register-button" id="submit_btn" style="display: none;">이메일 계정등록</button> -->
						<button type="button" class="btn btn-success register-button" id="regMemberBtn" style="margin-top: 35px; width: 140px; height: 60px;">이메일 계정등록</button>
					</div>
				</div>
				<div class="form-group col-md-12" style="padding-top: 30px;">
					<div class="col-md-12" style="padding-left: 20px;">
						<div style="text-align: left;">
							<div class="checkbox">
					        	<label>
					          		<input type="checkbox" id="agreeChk" name="agreeChk"> <span style="font-weight: bold;">개인정보 수집·이용 동의</span>
					        	</label>
				       		</div>
				       		<span id="agree_error" style="padding-left: 20px; font-weight: bold; color: red; display: none;">개인정보 수집·이용에 대한 안내를 동의해주세요.</span>
						</div>
					</div>					
				</div>
				<div class="col-md-12">
					<div style="overflow: auto; height: 150px; border: 1px solid #eee">
						<div class="container-fluid">
							<div class="row" style="padding-top: 10px;">
			            		<div class="col-md-12">(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다.</div>
			            	</div>
							<div class="row" style="padding-top: 10px;">
			            		<div class="col-md-12">1. 개인정보의 수집 및 이용목적</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;실시간 견적 및 월렌트 예약을 위한 이메일 계정등록</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;* 상기 목적외의 용도로 사용하지 않으며, 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.</div>
			            	</div>
							<div class="row" style="padding-top: 10px;">
			            		<div class="col-md-12">2. 수집하는 개인정보 항목</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;필수항목 : 이메일, 비밀번호</div>
			            	</div>
							<div class="row" style="padding-top: 10px;">
			            		<div class="col-md-12">3. 개인정보의 보유 및 이용기간</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;[실시간 견적 및 월렌트 예약을 위한 이메일 계정] 탈퇴시 해당 정보를 지체 없이 파기합니다.</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;실시간 견적 및 월렌트 예약이력은 견적 및 예약일로부터 6개월 이후 무조건 파기</div>
			            	</div>
							<div class="row" style="padding-top: 10px;">
			            		<div class="col-md-12">4. 동의 거부권 및 불이익</div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;개인정보 수집 · 이용에 관한 동의를 거부할 권리가 있습니다.<br></div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;동의 거부시 홈페이지를 통한 실시간 견적 및 월렌트 예약이 불가합니다.<br></div>
			            		<div class="col-md-12" style="padding-top: 5px;">&nbsp;&nbsp;단, 홈페이지 내 다른 메뉴는 이용이 가능합니다.</div>
			            	</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<h4 style="display: none; color: green;" id="checkEmail-error" align="center">이미 등록된 이메일 입니다. &nbsp;&nbsp;&nbsp;로그인 해주세요.</h4>				
				</div>
			</form>
			<form class="form-horizontal" action="/signup" method="post" name="emailRegisterFrm2" id="emailRegisterFrm2" style="display: none;">
				<input type="hidden" name="email" id="username2" value=""/>
				<input type="hidden" name="password" id="password2" value=""/>
			</form>
		</div>
	</div>	
</t:genericpage>