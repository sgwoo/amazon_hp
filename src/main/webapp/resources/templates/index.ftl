<!DOCTYPE HTML>
<html xmlns:th="https://www.thymeleaf.org" layout:decorator="layout/base">
<div layout:fragment="content">
		<div class="ax-panel good">
			<div class="ax-panel-heading">
				Login
			</div>
			<div class="ax-panel-body">
				<form action="/login/authenticate" method="POST">
					<input type="text" name="username" value="" class="ax-inp lg" />
					<div style="height:5px"></div>
					<input type="password" name="password" value="" class="ax-inp lg" />
					<input type="submit" value="Login" class="ax-btn lg good" />
				</form>
			</div>
		</div>

		<br/>

		<h3>Sign in with</h3>

		<ul class="ax-item-group">
			<a class="ax-item" onclick="document.google.submit();"><i class="axi axi-google-square"></i> Google</a>
			<a class="ax-item" onclick="document.facebook.submit();"><i class="axi axi-facebook-square"></i> Facebook</a>

			<a class="ax-item" onclick="document.kakao.submit();"><i class="axi axi-ion-chatbubble"></i> Kakao</a>

		</ul>


		<!-- /.container -->
		<form action="/auth/facebook" name="facebook">
			<input type="hidden" name="scope" value="email,user_friends"/>
		</form>
		<form action="/auth/google" name="google">
			<input type="hidden" name="scope" value="https://www.googleapis.com/auth/plus.login" />
		</form>
		<form action="/auth/twitter" name="twitter">
			<input type="hidden" name="scope" value="email"/>
		</form>
		<form action="/auth/kakao" name="kakao">
		</form>
		<form action="/auth/github" name="github">
			<input type="hidden" name="scope" value="email"/>
		</form>
</div>
</html>
