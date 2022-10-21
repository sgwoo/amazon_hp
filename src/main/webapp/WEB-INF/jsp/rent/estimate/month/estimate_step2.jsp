<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<!-- http >> https 로 서버 바꾸면서 다음우편번호 검색 api js주소도 변경 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script> -->
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script>
<script>
function validateInputField(){
	var driverCount = parseInt($("input[name='addDriver']:checked").val())+1;
	if(driverCount > 2){ driverCount = 2; } //최대 2명임
	var inputFlag = true;
	var inputNameArr = ['driverName','driverNumber','driverCell'];

	for(var i=0; i<driverCount; i++){
		$.each(inputNameArr,function(idx,inputNm){
			var name = "input[name='"+inputNm+(i+1)+"']";
			var value = $(name).val();
			if($(name).length && value == null || value == ""){
				alert("운전자 정보를 모두 입력해주세요");
				inputFlag = false;
				$(name).focus();
				return false;
			}else{
				if(inputNm == 'driverNumber'){
					var validationTarget = $(name).val().replace(/-/g,'');
					if(validationTarget.length != 12){
						alert("운전면허번호를 정확히 입력해주세요");
						inputFlag = false;
						$(name).focus();
						return false;
					};
				}
			}
		})
	}
	
	if($("#account-input").val() == null || $("#account-input").val() == ""){
		alert("계좌번호를 입력해주세요");
		$("#account-input").focus();
		inputFlag = false;
	}
	
	return inputFlag;
}


$(document).ready(function(){
  
  var fileTarget = $('.upload-hidden');
  fileTarget.on('change', function(){  // 값이 변경되면
    if(window.FileReader){  // modern browser
      var filename = $(this)[0].files[0].name;
    } 
    else {  // old IE
      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
    }
    // 추출한 파일명 삽입
    $(this).siblings('.upload-name').val(filename);
  });
  
  //계약자 외 추가 운전자 있으면
  $("input[name='addDriver']").change(function(){
	  var checkedVal = $("input[name='addDriver']:checked").val();
	  if(checkedVal == "1"){
		  $('.extra-driver').show();
		  $(".employee-1").hide();
		  $("#driverCount").val("2");
	  }else if(checkedVal == "2"){	
		  $(".employee-1").show();
		  $(".extra-driver").hide();
		  $("#driverCount").val("2");
	  }else{
		  $('.extra-driver').hide();
		  $(".employee-1").hide();
		  $("#driverCount").val("1");
	  }
  })
  
  //마지막 행에 스타일 부여
  $('.secondhand-info-table tr:last-child').addClass("last-row");
  
  //파일 업로드 버튼 클릭시
  $("#upload-btn").click(function(){
	  var count = 0;
	  $(".file-upload").each(function(){
		  if($(this).val() == ''){
			  count ++;
		  }
	  })
	  
	  var message = "파일을 업로드하시겠습니까?"
	  if(count > 0){ //하나라도 첨부파일 빈게 있으면
	  	  message = "첨부하지 않은 파일은 방문 시 지참하셔야 합니다.\n 파일을 업로드하시겠습니까?";
	  }
	  if(confirm(message)){
		  //파일 확장자 명 체크 
		  var flag = true;
		  
		  $("input[name='file']").each(function(){
			  var ext = $(this).val().split('.').pop().toLowerCase();
			  //var ext2 = $(this).val();
			  //var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;		  
			  
			  if(ext != '' && $.inArray(ext, ['gif','png','jpg','jpeg','pdf']) == -1) {
				  flag = false;
			  }
		  })
		  
		  if(!flag){
			  alert('gif,png,jpg,jpeg,pdf 파일만 업로드 할수 있습니다.');
		  }else{
			  var agent = navigator.userAgent.toLowerCase();//브라우져 체크			  
   	  		  if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
   	  			  alert("일부 브라우져에서는 파일업로드가 제한될 수 있습니다\n\n직접제출 또는 다른 브라우저를 이용해 주세요");
   	  			  //익스플로러일 경우 파일선택을 default값으로(문제시 삭제!)
   	  			  $("input[name='file']").val("");
   	  			  return false;   	  			  			  
			  } 
			  document.charset = "EUC-KR";
   	  	  	  var objPopup = window.open('','uploadWindow','width=100,height=100'); //팝업을 연다
			  var url = $('#uploadForm').attr("action");
			  $('#uploadForm').attr("action", url);
			  $('#uploadForm').submit();  // <--파일업로드 제한시 주석처리
				
			  if (document.charset) {
					document.charset = "UTF-8";
			  }
			  $("#uploadClickBtn").val("1");
		  }
	  }
  })
  
  $('.submit-btn').click(function(){
	  var message = "차량을 예약하시겠습니까?";
	  //필드 검사
	  var inputFlag = validateInputField();
	  var uploadFlag = true;
	  if($("#uploadClickBtn").val() == 0){
		  $("input[name='file']").each(function(){
			  if($(this).val() != null || $(this).val != ""){ //파일이 있는데 업로드 버튼은 안 누른 경우
				  alert("파일 업로드 버튼을 눌러 먼저 파일을 업로드해주세요");
			  	  uploadFlag = false;
			  	  return uploadFlag;
			  }
		  })
	  }
	  if(!uploadFlag){
		  return false;
	  }
	  
	  if(inputFlag == true && confirm(message)){
		  //운전자 정보 input 을 step3Form에 append 한다
		  $(".driver-info > input").each(function(){
			  if($(this).val() != null && $(this).val() != ""){
				 $(this).attr("type","hidden");
				 $("#step3Form").append($(this));
			  }
		  })
		  
	  	  $("#bank").val($("#bankSelectBox option:selected").val());
	  	  $("#account").val($("#account-input").val());
	  	  $('#step3Form').submit(); //예약확인 페이지로 넘어간다.
	  	 
	   }else{
		   return false;
	   }
   })
})

</script>
<input type="hidden" id="uploadClickBtn" value="0"/>
<form id="step3Form" action="/reserve/month/step3" method="post">
	<input type="hidden" name="estimateId" id="estimateId" value="${estimateId}"/>
	<input type="hidden" name="carManagedId" id="carManagedId" value="${carManagedId}"/>
	<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${rentLocationCode}"/>
	<input type="hidden" name="rentManagedId" id="rentManagedId" value="${rentManagedId}"/>
	<input type="hidden" name="rank" id="rank" value="${rank}"/>
	<input type="hidden" name="driverCount" id="driverCount" value="1"/>
	<input type="hidden" name="bank" id="bank" value=""/>
	<input type="hidden" name="account" id="account" value=""/>
</form>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">월렌트 차량 예약</h2>
		<div class="process-item done">STEP 1:예약정보 입력</div>
		<div class="process-item done">
			STEP 2:차량 예약하기<br/>
			<small>(추가정보 입력 및 구비서류 업로드)</small>
		</div>
		<div class="process-item">STEP 3:예약 결과 보기</div>
	</div>
</div>
<form id="uploadForm" enctype="multipart/form-data" action="https://fms3.amazoncar.co.kr/fms2/attach/fileuploadact.jsp?contentCode=ESTI_SPE" method="post" target="uploadWindow" accept-charset="EUC-KR">
	<div class="estimate-body">
		<div>
			<h4>
				<!-- <span class="primary" style="font-weight:bold;">1단계 예약정보가 입력되었습니다.</span><br/> -->
				<span class="primary" style="font-weight:bold;">1단계 예약정보 입력 및 차량예약 되었습니다.</span><br/>
				<!-- 2단계 추가 정보를 입력하고 차량을 예약하시기 바랍니다.<br/> -->
				2단계 추가 정보를 입력하고 차량예약을 완료하시기 바랍니다.<br/>
				※ &nbsp;예약취소는 마이페이지 > 견적/상담/예약 이력 메뉴에서 하실 수 있습니다.<br/>
			</h4>
		</div>
		<div class="car-info">
			<c:choose>
				<c:when test="${fn:contains(data.EST_ST,'2')}"> <!-- 개인 사업자 -->
					<table class="secondhand-info-table">
						<colgroup>
							<col width="25%"/>
							<col width="45%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="option-title">운전자 선택</td>
								<td colspan="2">
									<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
									<label for="extra-driver-0">1명[계약자(개인사업자)]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="addDriver" value="2" id="extra-driver-2" />
									<label for="extra-driver-2">1명[직원]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
									<label for="extra-driver-1">2명[계약자(개인사업자)+직원]</label>
								</td>
							</tr>
							<tr class="option-title">
								<td class="option-title">계약자(개인운전자)</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverNumber1" />
									<span class="info"><br/>※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</span>
									<span class="info employee-1"><br/>※과태료 납부자 변경을 위해서는 계약자(개인사업자)의 예약 차량 운전 여부와 관계 없이 운전면허번호를 받아야합니다.</span>
								</td>
							</tr>
							<tr class="option-title employee-1" style="display:none;">
								<td class="option-title">운전자 정보</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
							<tr class="option-title extra-driver" style="display:none;">
								<td class="option-title">추가운전자 정보</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
							<tr>
								<td class="option-title" rowspan="2">자동이체 계좌번호</td>
								<td colspan="2" style="border-bottom:0px !important;">
									<select name="bank" id="bankSelectBox" style="width:150px;">
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="하나은행">KEB하나은행</option>
										<option value="기업은행">기업은행</option>
										<option value="국민은행">국민은행</option>
										<option value="SC은행">SC은행</option>
										<option value="씨티은행">한국씨티은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="농협">농협</option>
										<option value="우체국">우체국</option>
										<option value="전북은행">전북은행</option>
										<option value="경남은행">경남은행</option>
										<option value="광주은행">광주은행</option>
										<option value="제주은행">제주은행</option>
									</select>
									<input type="text" name="account" id="account-input" style="width:400px;"/>
			                    </td>
							</tr>
							<tr>
								<td colspan="2" class="info">
									- 2회차 연장 시 대여 요금은 위 입력하신 계좌에서 자동이체로 진행됩니다.<br/>
									- 차량을 중도반납하시더라도 사용료 환불을 위하여 계좌번호는 반드시 필요합니다.<br/>
									- 차량이 반납되고 정산이 완료되면 자동이체 계좌번호는 자동 소멸됩니다.							
								</td>
							</tr>
							<tr>
								<td class="option-title" style="border-bottom:0px;" rowspan="2">필요서류 파일 선택 (사업자)</td>
								<td colspan="2" class="info" style="height:12px;border-bottom:0px;">
									<span class="info"><i class="glyphicon glyphicon-paperclip"></i>&nbsp;사업자등록증 사본</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="upload-name" value="파일 선택" disabled="disabled" style="width:300px;">
			                        <label for="ex-business" class="upload-label">파일 선택</label> 
			                        <input type="file" id="ex-business" name="file" class="upload-hidden">
			                        <input type="hidden" name="contentSeq" value="${estimateId}-003"/> <!-- estId -->
									<input type="hidden" name="contentCode" value="ESTI_SPE"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="info" style="height:12px;">
									<span class="info"><i class="glyphicon glyphicon-paperclip"></i>&nbsp;자동이체 통장사본</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="upload-name" value="파일 선택" disabled="disabled" style="width:300px;">
			                        <label for="ex-bank" class="upload-label">파일 선택</label> 
			                        <input type="file" name="file" id="ex-bank" class="upload-hidden file-upload"> 
			                        <input type="hidden" name="contentSeq" value="${estimateId}-002"/>
									<input type="hidden" name="contentCode" value="ESTI_SPE"/>
								</td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:when test="${fn:contains(data.EST_ST,'1')}"> <!-- 법인 사업자 -->
					<table class="secondhand-info-table">
						<colgroup>
							<col width="25%"/>
							<col width="45%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="option-title">운전자 선택</td>
								<td colspan="2">
									<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
									<label for="extra-driver-0">1명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
									<label for="extra-driver-1">2명</label>
								</td>
							</tr>
							<tr class="option-title">
								<td class="option-title">운전자1</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber1"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName1"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell1"/>
									<br/>
									<span class="info">※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</span>
								</td>
							</tr>
							<tr class="option-title extra-driver" style="display:none;">
								<td class="option-title">운전자2</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2" />
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2" />
								</td>
							</tr>
							<tr>
								<td class="option-title" rowspan="2">자동이체 계좌번호</td>
								<td colspan="2" style="border-bottom:0px !important;">
									<select name="bank" id="bankSelectBox" style="width:150px;">
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="하나은행">KEB하나은행</option>
										<option value="기업은행">기업은행</option>
										<option value="국민은행">국민은행</option>
										<option value="SC은행">SC은행</option>
										<option value="씨티은행">한국씨티은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="농협">농협</option>
										<option value="우체국">우체국</option>
										<option value="전북은행">전북은행</option>
										<option value="경남은행">경남은행</option>
										<option value="광주은행">광주은행</option>
										<option value="제주은행">제주은행</option>
										<option value="bankDirectInput" id="bankDirectInput">:::::직접 입력하기:::::</option>
									</select>
									<input type="text" name="bank" style="display:none;"/>
									<input type="text" name="account" id="account-input" style="width:400px;"/>
			                    </td>
							</tr>
							<tr>
								<td colspan="2" class="info">
									- 2회차 연장 시 대여 요금은 위 입력하신 계좌에서 자동이체로 진행됩니다.<br/>
									- 차량을 중도반납하시더라도 사용료 환불을 위하여 계좌번호는 반드시 필요합니다.<br/>
									- 차량이 반납되고 정산이 완료되면 자동이체 계좌번호는 자동 소멸됩니다.							
								</td>
							</tr>
							<tr>
								<td class="option-title" style="border-bottom:0px;" rowspan="2">필요서류 파일 선택 (사업자)</td>
								<td colspan="2" class="info" style="height:12px;border-bottom:0px;">
									<span class="info"><i class="glyphicon glyphicon-paperclip"></i>&nbsp;사업자등록증 사본</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="upload-name" value="파일 선택" disabled="disabled" style="width:300px;">
			                        <label for="ex-business" class="upload-label">파일 선택</label> 
			                        <input type="file" id="ex-business" name="file" class="upload-hidden">
			                        <input type="hidden" name="contentSeq" value="${estimateId}-003"/> <!-- estId -->
									<input type="hidden" name="contentCode" value="ESTI_SPE"/>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="info" style="height:12px;">
									<span class="info"><i class="glyphicon glyphicon-paperclip"></i>&nbsp;자동이체 통장사본</span>&nbsp;&nbsp;&nbsp;&nbsp;
									<input class="upload-name" value="파일 선택" disabled="disabled" style="width:300px;">
			                        <label for="ex-bank" class="upload-label">파일 선택</label> 
			                        <input type="file" name="file" id="ex-bank" class="upload-hidden file-upload"> 
			                        <input type="hidden" name="contentSeq" value="${estimateId}-002"/>
									<input type="hidden" name="contentCode" value="ESTI_SPE"/>
								</td>
							</tr>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<!-- 개인고객일 때 -->
					<table class="secondhand-info-table">
						<colgroup>
							<col width="25%"/>
							<col width="45%"/>
							<col width="30%"/>
						</colgroup>
						<tbody>
							<tr>
								<td class="option-title">운전자 선택</td>
								<td colspan="2">
									<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
									<label for="extra-driver-0">1명(계약자)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
									<label for="extra-driver-1">2명(계약자+배우자)</label>
									<BR/>
									<div class="info extra-driver" style="display:none;">
										※일반 개인의 경우 계약자 본인만 운전 가능(단, 배우자에 한하여 사전 심사 후 추가 운전자 지정 가능)<br/>
										&nbsp;&nbsp;&nbsp;&nbsp;배우자 추가운전자 지정시 배우자 운전면허증 사본 및 가족관계 증명 서류를 현장에서 제출합니다. 
									</div>
								</td>
							</tr>
							<tr class="option-title">
								<td class="option-title" rowspan="2">계약자 정보</td>
								<td style="border-bottom:0px;" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverNumber1" />
								</td>
								<td style="border-bottom:0px;"></td>
							</tr>
							<tr>
								<td class="info" colspan="2" style="height:12px;">
									- 운전면허번호를 사전에 입력하더라도 차고지 현장 방문 시 계약자는 본인 확인을 위해 운전면허증을 반드시 지참해주셔야 합니다.
								</td>
							</tr>
							<tr class="option-title extra-driver" style="display:none;">
								<td class="option-title">추가운전자(배우자) 정보</td>
								<td colspan="2" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2" />
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2" />
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
							<tr class="last-row">
								<td class="option-title" rowspan="2">자동이체 계좌번호</td>
								<td colspan="2" style="border-bottom:0px !important;">
									<select name="bank" id="bankSelectBox" style="width:150px;">
										<option value="신한은행">신한은행</option>
										<option value="우리은행">우리은행</option>
										<option value="하나은행">KEB하나은행</option>
										<option value="기업은행">기업은행</option>
										<option value="국민은행">국민은행</option>
										<option value="SC은행">SC은행</option>
										<option value="씨티은행">한국씨티은행</option>
										<option value="새마을금고">새마을금고</option>
										<option value="농협">농협</option>
										<option value="우체국">우체국</option>
										<option value="전북은행">전북은행</option>
										<option value="경남은행">경남은행</option>
										<option value="광주은행">광주은행</option>
										<option value="제주은행">제주은행</option>
										<option value="bankDirectInput" id="bankDirectInput">:::::직접 입력하기:::::</option>
									</select>
									<input type="text" name="bank" style="display:none;"/>
									<input type="text" name="account" id="account-input" style="width:400px;"/>
			                    </td>
							</tr>
							<tr>
								<td colspan="2" class="info">
									- 2회차 연장 시 대여 요금은 위 입력하신 계좌에서 자동이체로 진행됩니다.<br/>
									- 차량을 중도반납하시더라도 사용료 환불을 위하여 계좌번호는 반드시 필요합니다.<br/>
									- 차량이 반납되고 정산이 완료되면 자동이체 계좌번호는 자동 소멸됩니다.							
								</td>
							</tr>
		<!-- 					<tr>
								<td class="option-title" rowspan="2" style="border-bottom:0px;">필요서류 파일 선택 (개인)</td>
								<td style="border-bottom:0px;">
									<input class="upload-name" value="파일 선택" disabled="disabled">
			                        <label for="ex-driver" class="upload-label">파일 선택</label> 
			                        <input type="file" name="uploadfile" id="ex-driver" class="upload-hidden file-upload"> 
			                        <input type="hidden" name="contentSeq" value="${estimateId}-001"/>
									<input type="hidden" name="contentCode" value="ESTI_SPE"/>
								</td>
								<td style="border-bottom:0px;"></td>
							</tr>
						<tr>
								<td class="option-title" style="border-bottom:0px;">필요서류 파일 선택 (개인)</td>
								<td colspan="2" class="info" style="height:12px;">
									- 일반 개인의 경우 차고지 현장 방문 시 현장에서 계약자 본인의 운전면허증을 스캔하여 파일 선택합니다.
									<span class="extra-driver" style="display:none;"><br/>(단, 배우자에 한하여 사전 심사 후 추가운전자로 지정이 가능하며, 배우자 추가운전자 지정 시<br/>배우자 운전면허증 사본 및 가족관계 증명 서류를 현장에서 제출합니다.)</span>
								</td>
							</tr>
		-->	
							<c:if test="${fn:contains(data.EST_ST,'1')}">
								<tr>
									<td class="option-title">사업자등록증 사본</td>
									<td>
										<input class="upload-name" value="파일 선택" disabled="disabled">
				                        <label for="ex-licensee" class="upload-label">파일 선택</label> 
				                        <input type="file" id="ex-licensee" name="file" class="upload-hidden">
				                        <input type="hidden" name="contentSeq" value="${estimateId}-003"/> <!-- estId -->
										<input type="hidden" name="contentCode" value="ESTI_SPE"/>
									</td>
									<td></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="estimate-footer">
		<c:if test="${fn:contains(data.EST_ST,'2') || fn:contains(data.EST_ST,'1')}">
			<button type="button" class="print-btn" id="upload-btn">파일 업로드</button>
		</c:if>
		<button type="button" class="submit-btn">차량 예약하기</button>
	</div>
</form>
</t:blankpage>