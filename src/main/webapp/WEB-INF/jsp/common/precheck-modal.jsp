<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="pre-check-modal" style="display:none;">
	<div class="pre-check-content">
		<div class="pre-check-opening">
			<h4>실시간 견적내기</h4>
			<div class="pre-check-box">

				<%-- jjlim --%>
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">이메일 주소</span>만으로 실시간 견적이 가능합니다.<br/>
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">소셜 로그인</span>을 이용하시면 더욱 편리합니다.<br/>
				<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>이메일 주소 입력이나 소셜로그인으로 실시간견적 가능합니다.</span><br/> -->
				<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>회원가입 후 누구나 모든 차종의 실시간 견적 및 월렌트 예약이 가능합니다.</span> -->
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>인증 받으신 분은 기존에 인증 받으신 이메일을 입력하시고 이용하시면 됩니다.</span><br/>--%>
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>처음 이용하시는 분은 아래의 <span class="text-bold">이메일 본인인증</span>을 눌러 간단한 인증절차만으로 이용하실 수 있습니다.</span>--%>

			</div>
						
			<!-- 로그인 방식 변경  2017.05.26-->
			<br><br>
			<div>
				<div class="form-group">
					<label for="username" class="col-md-1 control-label" style="margin-top: 7px;">Email</label>
					<div class="col-md-4">
						<input type="password" id="password" name="password" class="col-md-9 form-control" placeholder="amazoncar@amazoncar.co.kr"/>
						<div style="display: none;" id="password-error">
							<label class="errClass" for="password">비밀번호를 입력해주세요</label>
						</div>
					</div>
					<div class="col-md-2" align="center">
						<button class="btn btn-success" onclick="location.href='/login'">견적내기</button>
					</div>
					<div class="login-social col-md-2" style="margin-top: -30px;">
						<table>
							<tr>
								<td colspan="3">
									<div class="text-center">소셜로그인</div>
								</td>
							</tr>
							<tr>
								<td width="47%" align="left">
									<div class="text-center">					
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
					</div>
					<div class="col-md-3">
					</div>						
				</div>
			</div>
			<!-- 로그인 방식 변경  끝-->

			<%--<table style="width:630px" class="text-center" class="auth-table">--%>
				<%--<colgroup>--%>
					<%--<col width="20%"/>--%>
					<%--<col width="30%"/>--%>
					<%--<col width="25%"/>--%>
					<%--<col width="25%"/>--%>
				<%--</colgroup>--%>
				<%--<tr>--%>
					<%--<td>이메일</td>--%>
					<%--<td><input type="text" id="authEmail" name="authEmail" class="form-control" style="width:300px;"></td>--%>
					<%--<td><button type="button" class="btn btn-default-reverse pre-esti-btn">실시간 견적</button></td>--%>
					<%--<td><button type="button" class="btn btn-default pre-auth-btn">이메일 본인인증</button></td>--%>
				<%--</tr>				--%>
			<%--</table>--%>
		</div>
		<div class="pre-auth-info" style="display:none;">
			<hr/>
			인증 메일이 <span class="text-bold auth-email"></span>(으)로 전송되었습니다. 이메일을 확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.
		</div>
	</div>
</div>