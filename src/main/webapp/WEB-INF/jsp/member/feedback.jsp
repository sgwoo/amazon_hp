<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<link rel="stylesheet" href="/resources/stylesheets/mypage.css"/>
<style>
.errClass {
	padding-left: 10px;
}
label#agree-error {
	width: 350px !important;
	max-width: 350px !important;
}
</style>
<script>
$(function() {
	
	$('#fdbFrm').validate({
		onfocusout: function(element){
            this.element(element);
        },
        errorClass:"errClass",
		rules:{
			name:{required:true},
			tel:{required:true, number:true},
			email:{required:true, email:true},
			acar_use:{required:true},
			title:{required:true},
			content:{required:true},
			agree:{required:true}
		},
		messages:{
			name:{
				required:"이름은 필수 항목입니다"
			},
			tel:{
				required:"핸드폰 번호는 필수 항목입니다",
				number:"숫자만 입력해주세요"
			},
			email:{
				required:"이메일은 필수 항목입니다",
				email:"이메일 주소를 올바르게 입력해주세요"
			},
			acar_use:{
				required:"이용 여부를 선택해주세요"
			},
			title:{
				required:"제목을 입력해주세요"
			},
			content:{
				required:"내용을 입력해주세요"
			},
			agree:{
				required:"개인정보 수집 및 이용 약관에 동의 체크 해주세요"
			}
		},
		submitHandler:function(form){
			
			//특수문자 방지 밸리데이션
			var vali_chk = false;
			
			if (scriptValidation($('#name').val())==true && scriptValidation($('#tel').val())==true &&
			   scriptValidation($('#title').val())==true && scriptValidation($('#content').val())==true) {
				vali_chk = true;
			}
			
			if (vali_chk == true) {
				var data = {}
				data["name"] = $('#name').val();
				data["tel"] = $('#tel').val();
				data["email"] = $('#email').val();
				data["hpKey"] = $('#hpKey').val();
				data["title"] = $('#title').val();
				data["content"] = $('textarea#content').val();
				data["acar_use"] = $('input[name=acar_use]:checked','#fdbFrm').val();
				$.ajax({
					contentType:'application/json',
					dataType:'json',
					data:JSON.stringify(data),
					url:'/feedback/sendFeedback',
					type:'POST',
					success:function(response){
						alert(response.message);
						location.href="/mypage/feedback/list";
					},
					error:function(request,status,error){
						alert(response.message);
					}
				});
			}
		}
	});
	
	//내용 한글 1000자 제한
	$('#content').on('keyup', function() {
        if($(this).val().length > 3000) {
        	alert("본문 내용은 한글 3000자로 제한됩니다.");
            $(this).val($(this).val().substring(0, 3000));
        }
    });
	
});
</script>
<div class="amazon-detail">

	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/mypage/rent/list"><div class="amazon-tab">견적/상담/예약 이력</div></a>
			<a href="/mypage/info"><div class="amazon-tab">회원정보 변경</div></a>
			<a href="/mypage/feedback/list"><div class="amazon-tab active">불편합니다</div></a>
		</div>
	</div>

	<p class="mypage-feedback-restore">
		<a href="/mypage/feedback/list">나의 접수 내역</a>
	</p>

	<div class="amazon-tap-main">
		<p class="text-success">
			아마존카를 이용하면서 불편했던 점을 남겨주세요. 고객님의 따끔한 충고와 소중한 의견에 항상 귀기울이겠습니다.
		</p>
		<br/>
		<form class="feedback" id="fdbFrm" method="post">
			<table class="table">
				<%-- <tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="name" value="<c:out value="${userInfo['C_NAME']}"/>" />
					</td>
					<th>연락처</th>
					<td>
						<input type="text" name="tel" id="tel" value="<c:out value="${userInfo['TEL']}"/>" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="email" name="email" id="email" value="" />
						<input type="hidden" name="hpKey" id="hpKey" value="<c:out value="${userInfo['EMAIL']}"/>" />
					</td>
					<th>아마존카 이용여부</th>
					<td>
						<input type="radio" name="acar_use" id="acar_use" value="1" />이용중&nbsp;&nbsp;
						<input type="radio" name="acar_use" id="acar_use" value="2" />미이용중
					</td>
				</tr> --%>				
				<tr>
					<th style="vertical-align: middle;">이름</th>
					<td colspan="3">
						<input type="text" name="name" id="name" value="<c:out value="${userInfo['C_NAME']}"/>" style="width:50%;"/>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">연락처</th>
					<td colspan="3">
						<input type="text" name="tel" id="tel" value="<c:out value="${userInfo['TEL']}"/>" style="width:50%;"/>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">이메일</th>
					<td colspan="3">
						<input type="email" name="email" id="email" value="" style="width:50%;"/>
						<input type="hidden" name="hpKey" id="hpKey" value="<c:out value="${userInfo['EMAIL']}"/>" />
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">아마존카 이용여부</th>
					<td colspan="3">
						<input type="radio" name="acar_use" id="acar_use" value="1" checked/>&nbsp;이용중
						&nbsp;&nbsp;&nbsp;
						<input type="radio" name="acar_use" id="acar_use" value="2" />&nbsp;미이용중
					</td>
				</tr>				
				<tr>
					<th style="vertical-align: middle;">제목</th>
					<td colspan="3">
						<input type="text" name="title" id="title" style="width:50%;"/>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">불편사항</th>
					<td colspan="3">
						<textarea name="content" id="content" rows="10" style="width:100%; resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<th style="vertical-align: middle; width: 180px;">개인정보수집 및 이용동의</th>
					<td colspan="3">
						<div class="agree">
							<p><b>(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다.</b></p>
							<p><b>1. 개인정보의 수집 및 이용목적</b><br>
							&nbsp;&nbsp;&nbsp; 견적신청에 대한 상담 및 견적제시<br>
							&nbsp;&nbsp;&nbsp;* 상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.</p>
							<p><b>2. 수집하는 개인정보 항목</b><br>
							&nbsp;&nbsp;&nbsp; ① 필수항목 : 이름, 전화번호, 생년월일, 회사명, 사업자번호, 지역 &nbsp;② 선택항목 : 팩스번호, 이메일, 업종, 업력/근속기간</p>
							<p><b>3. 개인정보의 보유 및 이용기간</b><br>
							&nbsp;&nbsp;&nbsp; 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.<br>
							&nbsp;&nbsp;&nbsp; * 최대 보유기간 : 수집 후 6개월(수집 후 6개월 이후에는 무조건 파기)</p>
							<p><b>4. 동의 거부권 및 불이익</b><br>
							&nbsp;&nbsp; 개인정보 수집이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 스마트 견적 상담이 불가합니다.<br>
							&nbsp;&nbsp;&nbsp;(단, 필수항목만 입력하고 동의하여도 상담은 가능합니다.)</p><br>
							<p><b>위에 입력하신 내용은 전적으로 견적산출을 위해서만 이용하며, 다른 목적으로는 절대 이용하지 않습니다.</b></p>
							<p><b>(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다.</b></p>
							<p><b>1. 개인정보의 수집 및 이용목적</b><br>
							&nbsp;&nbsp;&nbsp; 견적신청에 대한 상담 및 견적제시<br>
							&nbsp;&nbsp;&nbsp;* 상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.</p>
							<p><b>2. 수집하는 개인정보 항목</b><br>
							&nbsp;&nbsp;&nbsp; ① 필수항목 : 이름, 전화번호, 생년월일, 회사명, 사업자번호, 지역 &nbsp;② 선택항목 : 팩스번호, 이메일, 업종, 업력/근속기간</p>
							<p><b>3. 개인정보의 보유 및 이용기간</b><br>
							&nbsp;&nbsp;&nbsp; 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.<br>
							&nbsp;&nbsp;&nbsp; * 최대 보유기간 : 수집 후 6개월(수집 후 6개월 이후에는 무조건 파기)</p>
							<p><b>4. 동의 거부권 및 불이익</b><br>
							&nbsp;&nbsp; 개인정보 수집이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 스마트 견적 상담이 불가합니다.<br>
							&nbsp;&nbsp;&nbsp;(단, 필수항목만 입력하고 동의하여도 상담은 가능합니다.)</p>
							<p><b>위에 입력하신 내용은 전적으로 견적산출을 위해서만 이용하며, 다른 목적으로는 절대 이용하지 않습니다.</b></p>
						</div>
						<div class="checkbox">
							<label>
								<input type="checkbox" name="agree" id="agree"/>위의 "개인정보수집"에 동의합니다.
							</label>
						</div>
					</td>
				</tr>
			</table>
			<div class="text-center">
				<input type="submit" name="submitBtn" id="submitBtn" class="btn btn-success btn-lg" value="접수요청"/>
			</div>
		</form>
	</div>
</div>
</t:genericpage>