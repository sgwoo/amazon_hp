<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:blankpage>
<div class="container text-center">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-top:200px;">
				<div class="amazon-messeage-box" role="alert">
					<!-- <img alt="Brand" src="https://www.amazoncar.co.kr/home/images/main/toplogo_w.png" /> -->
					<img alt="Brand" src="https://www.amazoncar.co.kr/home/mobile/images/main/logo_1.png" width="200px"/>
					<h4 class="text-danger">${message}</h4>
					<p>
						<a href="https://www.amazoncar.co.kr">아마존카 메인 가기</a><br/>
					</p>
				</div>
			</div>
		</div>
	</div>
</t:blankpage>