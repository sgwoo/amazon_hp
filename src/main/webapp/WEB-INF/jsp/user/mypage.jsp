<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/webjars/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />
<script>
$(document).ready(function(){
	$('.datepicker').datepicker();
	
	$('#changeFrm').validate({
		rules:{
			name:{required:true},
			tel:{number:true}
		},
		errorClass:"errClass",
		messages:{
			name:{
				required:"이름은 필수항목입니다"
			},
			tel:{
				number:"숫자만 입력해주세요"
			}
		},
		submitHandler:function(){
			var data = {};
			data["name"] = $('#name').val();
			data["tel"] = $('#tel').val();
			data["email"] = $('#email').val();
			var birth = $('#birth').val();
			data["birth"] = birth.replace(/-/g,''); // 2015-09-24 => 20150924 로 변경 (- 제거)
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(data),
				url:'/mypage/updateUser',
				type:'POST',
				success:function(response){
					alert(response.message);
					location.reload();
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});			
		}
	})
})


</script>
<div class="amazon-detail">
	<ul class="nav nav-pills">
		<li role="presentation" class="active"><a href="#">회원정보 변경</a></li>
		<li role="presentation"><a href="/feedback">불편합니다</a></li>
	</ul>
	<div class="amazon-tap-main">
		<form class="form-horizontal" id="changeFrm">
			<div class="form-group">
				<label for="inputEmail" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
		  			<input type="email" disabled="disabled" class="form-control" id="emailReadOnly" name="emailReadOnly" placeholder="Email" value="<c:out value="${userInfo['EMAIL']}"/>">
		  			<input type="hidden" name="email" id="email" value="<c:out value="${userInfo['EMAIL']}"/>"/>
		  		</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-sm-2 control-label">이름</label>
				<c:choose>
					<c:when test="${userInfo['PROVIDER'] eq null}"> <!-- 이메일 로그인한 사람만 이름 수정 가능 -->
						<div class="col-sm-10">
		  					<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="<c:out value="${userInfo['C_NAME']}"/>">
		  				</div>
					</c:when>
					<c:when  test="${userInfo['PROVIDER'] ne null}"> <!-- 소셜로그인 사용자는 이름 수정 불가 -->
						<div class="col-sm-10">
		  					<input type="text" disabled="disabled"  class="form-control" id="nameReadOnly" name="nameReadOnly" placeholder="Name" value="<c:out value="${userInfo['C_NAME']}"/>">
		  					<input type="hidden" name="name" id="name" value="<c:out value="${userInfo['C_NAME']}"/>"/>
		  				</div>
					</c:when>
				</c:choose>
			</div>
			<div class="form-group">
				<label for="inputPhone" class="col-sm-2 control-label">핸드폰번호</label>
				<div class="col-sm-10">
		  			<input type="text" class="form-control" id="tel" name="tel" placeholder="ex) 01011220011" value="<c:out value="${userInfo['TEL']}" />">
		  		</div>
			</div>
			<fmt:parseDate value="${userInfo['BIRTH']}" var="birthDate" pattern="yyyymmdd" scope="page" />
			<div class="form-group">
				<label for="inputPhone" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd">
					    <input type="text" id="birth" name="birth" class="form-control" value="<fmt:formatDate value="${birthDate}" pattern="yyyy-mm-dd"/>" />
					    <div class="input-group-addon">
					        <span class="glyphicon glyphicon-th"></span>
					    </div>
					</div>
				</div>
			</div>
			
			<div class="form-group text-center">
				<div class="col-sm-offset-2 col-sm-10">
			    	<button type="submit" id="changeSubmitBtn" class="btn btn-success btn-lg">회원정보 변경</button>
			  	</div>
			</div>
		</form>
	</div>
</div>
</t:genericpage>