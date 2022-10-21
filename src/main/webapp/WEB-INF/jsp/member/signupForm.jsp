<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
	<c:choose>
		<c:when test="${null eq user}">
			<div class="ax-panel warning">
				<div class="ax-panel-heading">
					Error
				</div>
				<div class="ax-panel-body">
					예상치 못한 에러가 발생되었습니다. 로그를 확인해주세요.
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col-xs-4 col-xs-offset-4">
					<form name="test" action="/signup" method="POST" class="form-horizontal text-left">
						<h2 class="text-center">아마존카 회원가입</h2><br/><br/>
						<div class="from-group">
							<label for="inputEmail" class="col-sm-3 control-label">Email</label>
							<div class="col-sm-9">
								<input class="form-control" type="email" name="email" value="${user.email}"
								   required/><br/>
							</div>
						</div>
						<div class="from-group">
							<label for="inputName" class="col-sm-3 control-label">이름</label>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="Name"
								   value="${user.name}"/><br/>
							</div>
						</div>
						<div class="from-group">
							<label for="inputPassword" class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-9">
								<input class="form-control" type="password" name="password" value="" required/><br/>
							</div>
							<input type="hidden" name="provider" value="${providerId}"/>
						</div>
						<div class="from-group">
							<label for="inputPasswordConfirm" class="col-sm-3 control-label">비밀번호 확인</label>
							<div class="col-sm-9">
								<input class="form-control" type="password" name="password" value="" required/><br/>
							</div>					
						</div>
						<div class="form-group">
						    <div class="text-center">
							    <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
						    </div>
						</div>
					</form>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


</t:genericpage>