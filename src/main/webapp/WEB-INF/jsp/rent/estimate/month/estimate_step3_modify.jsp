<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script>
function validateInputField(){
	var driverCount = parseInt($("input[name='addDriver']:checked").val())+1;
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
			}
		})
	}
	
	return inputFlag;
}



$(document).ready(function(){
   var selectedValue = $("input[name='estGubun']").val();
   if(selectedValue.indexOf("3") >= 0){ //개인
		$('.personal').show();
		$('.business, .business2').hide();
   }else if(selectedValue.indexOf("2") >= 0){ //개인사업자
		$('.personal').hide();
		$(".business, .business2").show();
	}else{ //법인사업자
		$('.personal, .business2').hide();
		$('.business').show();
	}
   
   $(".submit-btn").click(function(){
	   if(confirm("변경 내용을 저장하시겠습니까?")){
		   var inputFlag = validateInputField();
			   if(inputFlag){
				   //운전자 정보 input 을 step3Form에 append 한다
				   $(".driver-info > input").each(function(){
					   if($(this).val() != null && $(this).val() != ""){
					 	 $(this).attr("type","hidden");
					 	 $("form").append($(this));
					   }
				   })
				   $("#etc").val($("textarea").val());
				   $("form").submit();
			   }else{
				   return false;
			   }
	   }
   })
   
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
	
   $(".selectBoxValue").each(function(){
	   var selectBox = $(this).attr("id");
	   var optionVal = $(this).val();
	   $("select[name='"+selectBox+"'] > option[value='"+optionVal+"']").prop("selected",true);
   })
})
</script>
<input type="hidden" name="estGubun" value="${custData.EST_ST}"/>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">월렌트 차량 예약</h2>
		<div class="process-item done" style="width: 47.8%;">STEP 1 : 차량 예약하기</div>
		<!-- <div class="process-item done">
			STEP 2:차량 예약하기<br/>
			<small>(추가정보 입력 및 구비서류 업로드)</small>
		</div> -->
		<div class="process-item done" style="width: 47.8%;">STEP 2 : 예약 결과보기</div>
	</div>
</div>
<input type="hidden" id="estBusiness" class="selectBoxValue" value="${custData.EST_BUS}"/>
<input type="hidden" id="estBusinessYear" class="selectBoxValue" value="${custData.EST_YEAR}"/>
<input type="hidden" id="driverYear" class="selectBoxValue" value="${custData.DRIVER_YEAR}"/>
<form action="/modify/month/step3" method="post">
	<input type="hidden" name="carManagedId" id="carManagedId" value="${param.carManagedId}"/>
	<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${param.rentLocationCode}"/>
	<input type="hidden" name="rentManagedId" id="rentManagedId" value="${param.rentManagedId}"/>
	<input type="hidden" name="estimateId" id="estimateId" value="${param.estimateId}"/>
	<input type="hidden" name="driverCount" id="driverCount" value="<c:out value="${fn:length(driverList)}"/>"/>
	<input type="hidden" name="etc" id="etc" value="" />
	<div class="estimate-body">
	<br/>
		<div class="car-info">
			<table class="customer-info-table">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="17%"/>
					<col width="33%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">
							고객 정보
						</th>
					</tr>
					<tr>
						<td class="option-title">
							구분
						</td>
						<td>
							<c:if test="${fn:contains(custData.EST_ST,1)}">법인사업자</c:if>
							<c:if test="${fn:contains(custData.EST_ST,2)}">개인사업자</c:if>
							<c:if test="${fn:contains(custData.EST_ST,3)}">개인</c:if>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">
							업종
						</td>
						<td>
							<select name="estBusiness">
								<option selected disabled>선택하세요</option>
								<option value="전문직">전문직</option>
								<option value="공공기관">공공기관</option>
								<option value="제조업">제조업</option>
								<option value="금융업">금융업</option>
								<option value="판매유통업">판매유통업</option>
								<option value="건설업">건설업</option>
								<option value="언론기관">언론기관</option>
								<option value="서비스업">서비스업</option>
								<option value="벤처">벤처</option>
								<option value="기타일반">기타일반</option>
							</select>
						</td>
						<td class="option-title business">
							업력
						</td>
						<td class="business">
							<select name="estBusinessYear">
								<option selected disabled>선택하세요</option>
								<option value="2년 미만">2년 미만</option>
								<option value="2~5년">2~5년</option>
								<option value="5~10년">5~10년</option>
								<option value="10~15년">10~15년</option>
								<option value="15~20년">15~20년</option>
								<option value="20년 이상">20년 이상</option>
							</select>
						</td>
						<td class="option-title personal" style="display:none;">
							운전경력
						</td>
						<td style="display:none;" class="personal">
							<select name="driverYear">
								<option selected disabled>선택하세요</option>
								<option value="3~5년">3~5년</option>
								<option value="5~10년">5~10년</option>
								<option value="10~15년">10~15년</option>
								<option value="15~20년">15~20년</option>
								<option value="20년 이상">20년 이상</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="option-title business">
							상호
						</td>
						<td class="business">
							<input type="text" name="estName" class="business-customer" value="${custData.EST_NM}"/>
						</td>
						<td class="option-title business">
							대표자 성명
						</td>
						<td class="business">
							<input type="text" name="estCEO" id="estCEO" class="business-customer" value="${custData.EST_COMP_CEO}">
						</td>
					</tr>
					<tr class="business">
						<td class="option-title">
							사업자 번호
						</td>
						<td>
							<input type="text" name="estSSN" id="estSSN" value="${custData.EST_SSN}"/>
						</td>
						<td class="option-title">
							회사 전화번호
						</td>
						<td>
							<input type="text" name="estCompTel" id="estCompTel" value="${custData.EST_COMP_TEL}" />
						</td>
					</tr>
					<tr class="business2" style="display:none;">
						<td></td>
						<td></td>
						<td class="option-title">대표자 휴대폰번호</td>
						<td>
							<input type="text" name="estCompCel" id="estCompCel" value="${custData.EST_COMP_CEL}" />
						</td>
					</tr>
					<tr class="business">
						<td class="option-title" rowspan="2">사업장 소재지</td>
						<td>
							<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" style="width:160px;" readonly value="${custData.ZIPCODE}"/>
							<button type="button" class="btn-default btn" name="zipcodeBtn" id="zipcodeBtn" style="float:right;height:40px;">우편번호 찾기</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="business">
						<td><input type="text" name="addr1" id="addr1" placeholder="기본 주소" value="${custData.ADDR1}"/></td>
						<td colspan="2"><input type="text" name="addr2" id="addr2" placeholder="상세 주소" value="${custData.ADDR2}"/></td>
					</tr>
					<tr>
						<td colspan="4" >
							<hr/>
						</td>
					</tr>
					<tr class="business">
						<td class="option-title">담당자 이름</td>
						<td>
							<input type="text" name="estAgent" id="estAgent" value="${custData.EST_AGNT}" />
						</td>
						<td class="option-title">휴대폰번호</td>
						<td>
							<input type="text" name="estTel" id="estTel" value="${custData.EST_TEL}" />
						</td>
					</tr>
					<tr class="personal" style="display:none;">
						<td class="option-title">이름</td>
						<td>
							<input type="text" name="estName" value="${custData.EST_NM}" />
						</td>
						<td class="option-title">생년월일</td>
						<td><input type="text" name="estSSN" id="estSSN"  placeholder="ex)570101" value="${custData.EST_SSN}" /></td>
					</tr>
					<tr class="personal" style="display:none;">
						<td class="option-title">휴대폰번호</td>
						<td>
							<input type="text" name="estTel" id="estTel" value="${custData.EST_TEL}"/>
						</td>
						<td class="option-title">유선번호<br/>(직장/집)</td>
						<td>
							<input type="text" name="estUrgen" id="estUrgen"  value="${custData.URGEN_TEL}" />
							<span class="foreign-info label label-warning"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;핸드폰 연결이 되지 않으실 때,연락 가능한 번호를 입력해주세요</span>
						</td>
					</tr>
					<tr class="personal" style="display:none;">
						<td class="option-title" rowspan="2">실거주지 주소<br/>(우편물 수령주소)</td>
						<td>
							<input type="text" name="zipcode" id="zipcode_personal" placeholder="우편번호" style="width:160px;" readonly value="${custData.ZIPCODE}" />
							<button type="button" class="btn-default btn" name="zipcodeBtn" id="zipcodeBtn_personal" style="float:right;height:40px;">우편번호 찾기</button>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="personal" style="display:none;">
						<td><input type="text" name="addr1" id="addr1_personal" placeholder="기본 주소" value="${custData.ADDR1}"/></td>
						<td colspan="2"><input type="text" name="addr2" id="addr2_personal" placeholder="상세 주소" value="${custData.ADDR2}" /></td>
					</tr>
					<tr>
						<td class="option-title">이메일주소</td>
						<td>
							<input type="text" name="estEmail" id="estEmail" value="${custData.EST_EMAIL}" />
							<span class="foreign-info label label-warning"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;계약서 발송을 위해 정확한 이메일 주소를 입력해주세요</span>
						</td>
						<td colspan="2">
							
						</td>
					</tr>
					<tr>
					<td class="option-title">계좌정보</td>
						<td colspan="3">
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
							<input type="text" name="account" value="${custData.ACCOUNT}" style="width:250px;"/>
						</td>
					</tr>
					<tr>
						<td class="option-title">기타 문의사항</td>
						<td colspan="3">
							<textarea cols="130" rows="5">${custData.ETC}</textarea>
						</td>
					</tr>
				</tbody>
			</table>	
			<br/>
			<table class="customer-info-table step3">
			<colgroup>
				<col width="16%"/>
				<col width="16%"/>
				<col width="16%"/>
				<col width="16%"/>
				<col width="16%"/>
				<col width="16%"/>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="6">
						운전자 정보
					</th>
				</tr>
				<!-- 
				<tr>
					<td class="option-title">운전자 선택</td>
					<td colspan="5">
						<c:choose>
							<c:when test="${fn:contains(custData.EST_ST,1)}">
								<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
								<label for="extra-driver-0">1명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
								<label for="extra-driver-1">2명</label>
							</c:when>
							<c:when test="${fn:contains(custData.EST_ST,2)}">
								<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
								<label for="extra-driver-0">1명[계약자(개인사업자)]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="2" id="extra-driver-2" />
								<label for="extra-driver-2">1명[직원]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
								<label for="extra-driver-1">2명[계약자(개인사업자)+직원]</label>
							</c:when>
							<c:when test="${fn:contains(custData.EST_ST,3)}">
								<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
								<label for="extra-driver-0">1명(계약자)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
								<label for="extra-driver-1">2명(계약자+배우자)</label>
							</c:when>
						</c:choose>
					</td>
				</tr>
				 -->
				<c:if test="${fn:length(driverList) > 0}">
					<c:forEach var="data" items="${driverList}" varStatus="status">
						<tr<c:if test="${status.last}"> class="last-row"</c:if>>
							<td class="option-title">운전면허번호</td>
							<td><input type="text" name="driverNumber${status.index+1}" value="${data.DRIVER_NUM}"></td>
							<c:choose>
								<c:when test="${data.DRIVER_CELL ne null}">
									<td class="option-title">운전자 이름</td>
									<td><input type="text" name="driverName${status.index+1}" value="${data.DRIVER_NM}"></td>
									<td class="option-title">운전자 전화번호</td>
									<td><input type="text" name="driverCell${status.index+1}" value="${data.DRIVER_CELL}"></td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 
				<c:if test="${fn:length(driverList) eq 0}">
					<c:choose>
						<c:when test="${fn:contains(custData.EST_ST,1)}"> 
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
						</c:when>
						<c:when test="${fn:contains(custData.EST_ST,2)}">
							<tr class="option-title">
								<td class="option-title">계약자(개인운전자)</td>
								<td colspan="5" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverNumber1" />
									<span class="info"><br/>※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</span>
									<span class="info employee-1"><br/>※과태료 납부자 변경을 위해서는 계약자(개인사업자)의 예약 차량 운전 여부와 관계 없이 운전면허번호를 받아야합니다.</span>
								</td>
							</tr>
							<tr class="option-title employee-1" style="display:none;">
								<td class="option-title">운전자 정보</td>
								<td colspan="5" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
							<tr class="option-title extra-driver" style="display:none;">
								<td class="option-title">추가운전자 정보</td>
								<td colspan="5" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2"/>
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
						</c:when>
						<c:when test="${fn:contains(custData.EST_ST,3)}">
							<tr class="option-title">
								<td class="option-title" rowspan="2">계약자 정보</td>
								<td style="border-bottom:0px;" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverNumber1" />
								</td>
								<td style="border-bottom:0px;"></td>
							</tr>
							<tr>
								<td class="info" colspan="5" style="height:12px;">
									- 운전면허번호를 사전에 입력하더라도 차고지 현장 방문 시 계약자는 본인 확인을 위해 운전면허증을 반드시 지참해주셔야 합니다.
								</td>
							</tr>
							<tr class="option-title extra-driver" style="display:none;">
								<td class="option-title">추가운전자(배우자) 정보</td>
								<td colspan="5" class="driver-info">
									운전면허번호&nbsp;&nbsp;<input type="text" style="width:180px;margin-right:20px;" name="driverNumber2" />
									성명&nbsp;&nbsp;<input type="text" style="width:100px;margin-right:20px;" name="driverName2" />
									휴대폰번호&nbsp;&nbsp;<input type="text" style="width:180px;" name="driverCell2"/>
								</td>
							</tr>
						</c:when>
					</c:choose>
				</c:if>
				 -->
			</tbody>
		</table>
		</div>
		<div class="estimate-footer">
			<button type="submit" class="submit-btn">변경 내용 저장</button>
		</div>
	</div>
</form>
</t:blankpage>