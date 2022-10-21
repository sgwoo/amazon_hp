<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ page contentType = "text/html;charset=EUC-KR" %> --%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/webjars/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="/resources/stylesheets/mypage.css"/>

<script>
$(document).ready(function(){
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* $(".no-changeSubmitBtn").on("click", function(){
		alert("현재, 서버 정비작업으로 인해 회원정보 변경 및 회원탈퇴가 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */ 
	
	$('.datepicker').datepicker();
	
	$('#changeFrm').validate({
		rules:{
			toEmail:{required:true, email:true},
			name:{required:true,maxlength:20},
			tel:{number:true}
		},
		errorClass:"errClass",
		messages:{
			toEmail:{
				required:"이메일은 필수 항목입니다",
				email:"이메일 주소를 올바르게 입력해주세요"
			},
			name:{
				required:"이름은 필수항목입니다",
				maxlength:"이름은 최대 20자로 입력해주세요"
			},
			tel:{
				number:"숫자만 입력해주세요"
			}
		},
		submitHandler:function(){
			//특수문자 방지 밸리데이션
			var vali_chk = false;
			if(scriptValidation($('#name').val())==true && scriptValidation($('#tel').val())==true && scriptEmailValidation($('#toEmail').val())==true){
				vali_chk = true;
			}
			if(vali_chk == true){
				var data = {};
				data["name"] = $('#name').val();
				data["tel"] = $('#tel').val();
				data["email"] = $('#email').val();
				data["toEmail"] = $('#toEmail').val();
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
		}
	})
	
	$("#confirmBtn").on("click", function(){
		$('#withdraw-modal').modal({backdrop: 'static', keyboard: false});		
	});
	
	$("#withdrawBtn").on("click", function(){
		//회원탈퇴 Ajax
		var w_email = $('#w_email').val();		
		$.ajax({
			//contentType:'application/json',
			//dataType : 'json',
			url : '/withdrawMember?w_email='+w_email,
			data : w_email,			
			success : function(response){
				
				alert("탈퇴하였습니다.\n\n이용해 주셔서 감사합니다.")
				location.href="/logout";
			},
			error : function(request,status,error){
				alert("회원탈퇴 중 오류발생! 관리자에게 문의하세요.");
			}
		});
	});
})


</script>
<div class="amazon-detail">

	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/mypage/rent/list"><div class="amazon-tab">견적/상담/예약 이력</div></a>
			<a href="/mypage/info"><div class="amazon-tab active">회원정보 변경</div></a>
			<a href="/mypage/feedback/list"><div class="amazon-tab">불편합니다</div></a>
		</div>
	</div>

	<div class="amazon-tap-main">
		<form class="form-horizontal col-sm-8 col-sm-offset-2" id="changeFrm">
			<div class="form-group">
				<label for="emailReadOnly" class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
		  			<%-- <input type="email" disabled="disabled" class="form-control" id="emailReadOnly" name="emailReadOnly" placeholder="Email" value="${userInfo['EMAIL']}"> --%>
		  			<input type="text" class="form-control" id="toEmail" name="toEmail" placeholder="Email" value="${userInfo['TO_EMAIL']}">
		  			<input type="hidden" name="email" id="email" value="${userInfo['EMAIL']}"/>
		  		</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">이름</label>
				<c:choose>
					<c:when test="${userInfo['PROVIDER'] eq null}"> <!-- 이메일 로그인한 사람만 이름 수정 가능 -->
						<div class="col-sm-10">
		  					<input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${userInfo['C_NAME']}">
		  				</div>
					</c:when>
					<c:when  test="${userInfo['PROVIDER'] ne null}"> <!-- 소셜로그인 사용자는 이름 수정 불가 -->
						<div class="col-sm-10">
		  					<input type="text" disabled="disabled"  class="form-control" id="nameReadOnly" name="nameReadOnly" placeholder="Name" value="${userInfo['C_NAME']}">
		  					<input type="hidden" name="name" id="name" value="${userInfo['C_NAME']}"/>
		  				</div>
					</c:when>
				</c:choose>
			</div>
			<div class="form-group">
				<label for="tel" class="col-sm-2 control-label">핸드폰번호</label>
				<div class="col-sm-10">
		  			<input type="text" class="form-control" id="tel" name="tel" placeholder="ex) 01011220011" value="${userInfo['TEL']}">
		  		</div>
			</div>
			<fmt:parseDate value="${userInfo['BIRTH']}" var="birthDate" pattern="yyyymmdd" scope="page" />
			<div class="form-group">
				<label for="birth" class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-4">
					<div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd">
					    <input type="text" id="birth" name="birth" class="form-control" placeholder='ex) YYYY-MM-DD' value="<fmt:formatDate value="${birthDate}" pattern="yyyy-mm-dd"/>" />
					    <div class="input-group-addon">
					        <span class="glyphicon glyphicon-th"></span>
					    </div>
					</div>
				</div>
			</div>
			
			<div class="form-group text-center mypage-info-submit">

				<%--<div class="col-sm-offset-2 col-sm-8">--%>
				<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
			    	<button type="submit" id="changeSubmitBtn" class="btn btn-success btn-lg">회원정보 변경</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<button type="button" id="confirmBtn" class="btn btn-danger btn-lg">회원탈퇴</button>
			    	<!-- <button type="submit" class="btn btn-success btn-lg no-changeSubmitBtn">회원정보 변경</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    	<button type="button" class="btn btn-danger btn-lg no-changeSubmitBtn">회원탈퇴</button> -->
			  	<%--</div>--%>
			</div>
		</form>
	</div>
	
	<!-- 회원탈퇴 모달 -->
	<!-- <form name="resetFrm" id="resetFrm" method="post"> -->
		<div class="modal fade" id="withdraw-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">회원탈퇴</h4>
					</div>
					<div class="modal-body">
						<!-- <div class="form-group">
						</div> -->
						<input type="hidden" id="w_email" class="form-control" value="${userInfo.EMAIL}" readonly="readonly"/>
						<h5>정말 탈퇴 하시겠습니까?</h5>
						<br />
						<div class="text-center">
							<button type="button" id="cancelBtn" class="btn btn-success btn-lg" data-dismiss="modal" aria-label="Close">취소</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<button type="submit" id="withdrawBtn" class="btn btn-danger btn-lg">회원탈퇴</button>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	<!-- </form> -->
	
	
</div>
</t:genericpage>