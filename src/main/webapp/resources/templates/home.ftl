<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org" layout:decorator="layout/base">
<section layout:fragment="content">
		<div class="ax-panel good">
			<div class="ax-panel-heading">
				Hi ${name}
			</div>
			<div class="ax-panel-body">
				Email : ${email} <br/>
			</div>
		</div>

		<div style="padding:10px;text-align: right;">
			<button class="ax-btn lg" onclick="location.href = '/logout';"><i class="axi axi-sign-out"></i> Logout</button>
		</div>
</section>
</html>