<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<link rel="stylesheet" href="/resources/stylesheets/common.css">
<!DOCTYPE HTML>
<head>
</head>
<body>
	<div class="container text-center">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-top:200px;">
				<div class="amazon-messeage-box" role="alert">
					<!-- <img alt="Brand" src="/resources/images/toplogo_w.png" /> -->
					<img alt="Brand" src="/resources/images/logo_1.png" style="margin-bottom: 20px;" width="200px">
					<!-- <h4 class="text-danger">${message}</h4>  -->
					<p>
						<span  class="text-danger">시스템 오류가 발생했습니다. 이용에 불편을 드려 죄송합니다</span><br/><br/><br/>
						<a href="http://www.amazoncar.co.kr">아마존카 메인 가기</a><br/>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</HTML>
