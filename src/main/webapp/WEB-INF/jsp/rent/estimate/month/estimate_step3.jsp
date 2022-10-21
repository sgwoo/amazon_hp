<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page import="java.util.Date" %>
<c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<t:blankpage>
<script src="/resources/js/library/printThis.js"></script>
<script type="text/javascript" src="https://t1.daumcdn.net/cssjs/common/cts/vr200/dcts.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script>
var _CONVERSION_CPCGUARD = 1; //cpcguard
$(document).ready(function(){
	estimateAnalytics();
	if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
		DaumConversionDctSv="type=W,orderID=,amount=";
		DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
		var DaumConversionScriptLoaded=true;
		(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
	}
	 
	$(".car-option-table tr[class='option-info']").css("display","none");
	
	$("span[name='folding-control']").click(function(){
		$(".car-option-table tr[class='option-info']").toggle();
		$("span[name='folding-control']").toggle();
	})
    
   	var selectedValue = $("input[name='estGubun']").val();
	if(selectedValue == 3){ //개인
		$('.personal').show();
		$('.business, .business2').hide();
	}else if(selectedValue == 2){ //개인사업자
		$('.personal').hide();
		$(".business, .business2").show();
	}else{ //법인사업자
		$('.personal, .business2').hide();
		$('.business').show();
	}   	
	
	//수정하기 눌렀을때
	/* $("#modifyBtn").click(function(){
		$('#modifyFrm').submit();
	}) */
	
	//인쇄하기 눌렀을 때
	$("#printBtn").click(function(){
		$('.estimate-body').printThis({
			pageTitle: "장기렌트의 기준-아마존카 월렌트" 
		});
		printAnalytics();
	})

	//예약 취소 눌렀을 때 
	$("#cancelBtn").click(function(){
		if(confirm("차량 예약을 취소하시겠습니까?\n취소하실 경우 입력하신 정보가 모두 삭제됩니다")){
			var seq = $("#reserveSeq").val();
			var carManagedId = $("#carManagedId").val();
			var obj = {'carManagedId':carManagedId,'reserveSeq':seq};
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(obj),
				url:'/cancel/month',
				type:'POST',
				success:function(response){
					alert("예약 취소가 완료되었습니다");
					window.close();
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});
		}
	})
})
</script>
<input type="hidden" name="estGubun" value="${custData.EST_ST}"/>
<input type="hidden" name="reserveSeq" id="reserveSeq" value="${reserveSeq}"/>
<form id="modifyFrm" action="/reserve/month/step3/modify" method="post">
	<input type="hidden" name="carManagedId" id="carManagedId" value="${param.carManagedId}"/>
	<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${param.rentLocationCode}"/>
	<input type="hidden" name="rentManagedId" id="rentManagedId" value="${param.rentManagedId}"/>
	<input type="hidden" name="estimateId" id="estimateId" value="${param.estimateId}"/>
</form>
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
<div class="estimate-body">
<br/>
	<div class="alert alert-warning" role="alert" style="width:1018px;">
		<ul>
			<li>예약이 완료되었습니다.</li>
			<li>예약 기한은 <span class="primary-orange"><fmt:formatDate value="${tomorrow}" pattern="yyyy년 MM월 dd일 " /> 16시</span>까지 입니다.</li>
			<li><span style="font-weight:bold; color: red; font-size: 15px;">아마존카 직원과 유선상담을 통해 나머지 계약과정이 진행됩니다.</span>(빠른 시간내에 아마존카 직원이 연락드리도록 하겠습니다.)</li>
			<li style="list-style: none; list-style-type: none;"><div style="margin-left: 15px;">※해당 지점(${branch.BR_NM}:${branch.TEL})으로 직접 전화주시면 더 빠른 진행이 가능합니다. [상담 가능시간: 평일 오전 9:00 ~ 오후 5:00]</div></li>
			<li style="list-style: none; list-style-type: none;"><div style="margin-left: 15px;"><span class="primary-orange">※해당 차고지는 본사에 있지 않으므로, 예약확인안내를 받으신 후 지정장소에서 인수하실 수 있습니다.</span></div></li>
			<li><span class="primary" style="font-weight:bold;">예약취소는 마이페이지 > 견적/상담/예약 이력 메뉴에서 하실 수 있습니다.</span></li>
		</ul>
	</div>
	<div class="car-info">
		<table class="secondhand-info-table">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="4">선택차량 기본정보</th>
				</tr>
				<tr>
					<td class="option-title">제조사</td>
					<td>${data.CAR_COMP_NM}</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="option-title">차명</td>
					<td>${data.CAR_JNM}&nbsp;${data.CAR_NM}</td>
					<td></td>
					<td></td>
				</tr>
				<c:if test="${data.OPT ne null && data.OPT ne ''}">
					<tr>
						<td class="option-title">선택사양</td>
						<td colspan="3">
							${data.OPT}
						</td>
					</tr>
				</c:if>
				<tr>
					<td class="option-title">연료</td>
					<td>${data.FUEL_KD}</td>
					<td class="option-title">배기량</td>
					<td>${data.DPM}cc</td>
				</tr>
				<tr>
					<td class="option-title">신차등록일</td>
					<td>${data.INIT_REG_DT}</td>
					<td class="option-title">모델연도</td>
					<td>${data.CAR_Y_FORM}</td>
				</tr>
				<tr>
					<td class="option-title">주행거리</td>
					<td><fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km</td>
					<td class="option-title">색상</td>
					<td>${data.COLO}</td>
				</tr>
				<tr>
					<td class="option-title">차량번호</td>
					<td>${data.CAR_NO}</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="option-title" >공급가</td>
					<td class="bold text-right" style="padding-right:230px;"><fmt:formatNumber value="${data.RM1}" pattern="#,###" />원</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="option-title">부가세</td>
					<td class="bold text-right" style="padding-right:230px;"><fmt:formatNumber value="${data.RM1*0.1}" pattern="#,###" />원</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="last-row" style="padding-right:230px;">
					<td class="option-title">월대여료</td>
					<td class="estimate-price text-right" style="padding-right:230px;">
						<fmt:formatNumber value="${data.RM1 + (data.RM1*0.1)}" pattern="#,###" />원
					</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<table class="customer-info-table step3">
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
					<td class="option-title">업종</td>
					<td>${custData.EST_BUS}</td>
					<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">
						<td class="option-title business">업력</td>
						<td class="business">${custData.EST_YEAR}</td>
					</c:if>
					<c:if test="${fn:contains(custData.EST_ST,3)}">
						<td class="option-title personal">운전경력</td>
						<td class="personal">${custData.DRIVER_YEAR}</td>					
					</c:if>
				</tr>
				<tr class="business">
					<td class="option-title">
						<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">상호</c:if>
						<c:if test="${fn:contains(custData.EST_ST,3)}">이름</c:if>
					</td>
					<td>${custData.EST_NM}</td>
					<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">
						<td class="option-title">대표자 성명</td>
						<td>${custData.EST_COMP_CEO}</td>
					</c:if>
					<c:if test="${fn:contains(custData.EST_ST,3)}">
						<td></td>
						<td></td>
					</c:if>
				</tr>
				<tr class="business">
					<td class="option-title">
						<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">사업자 번호</c:if>
						<c:if test="${fn:contains(custData.EST_ST,3)}">생년월일</c:if>
					</td>
					<td>${custData.EST_SSN}</td>
					<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">
						<td class="option-title">회사 전화번호</td>
						<td>${custData.EST_COMP_TEL}</td>
					</c:if>
					<c:if test="${fn:contains(custData.EST_ST,3)}">
						<td></td>
						<td></td>
					</c:if>
				</tr>
				<tr class="business2">
					<td></td>
					<td></td>
					<td class="option-title">대표자 휴대폰번호</td>
					<td>${custData.EST_COMP_CEL}</td>	
				</tr>
				<tr class="personal">
					<td class="option-title">이름</td>
					<td>${custData.EST_NM}</td>
					<td class="option-title">생년월일</td>
					<td>${custData.EST_SSN}</td>
				</tr>
				<tr class="business">
					<td class="option-title">
						<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">사업장 소재지</c:if>
						<c:if test="${fn:contains(custData.EST_ST,3)}">주소</c:if>
					</td>
					<td colspan="3">
						[${custData.ZIPCODE}] ${custData.ADDR1} ${custData.ADDR2}
					</td>
				</tr>
				<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">
					<tr class="business">
						<td class="option-title">담당자 이름</td>
						<td>
							${custData.EST_AGNT}
						</td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
				<tr>
					<td class="option-title">전화번호</td>
					<td>
						${custData.EST_TEL}
					</td>
					<c:if test="${fn:contains(custData.EST_ST,3)}">
						<td class="option-title">유선번호</td>
						<td>
							${custData.URGEN_TEL}
						</td>
					</c:if>
					<c:if test="${fn:contains(custData.EST_ST,2)||fn:contains(custData.EST_ST,1)}">
						<td></td>
						<td></td>
					</c:if>
				</tr>
				<tr class="personal">
					<td class="option-title">주소</td>
					<td colspan="3">
						[${custData.ZIPCODE}] ${custData.ADDR1} ${custData.ADDR2}
					</td>
				</tr>
				<tr>
					<td class="option-title">이메일주소</td>
					<td>
						${custData.EST_EMAIL}
					</td>
					<td></td>
					<td></td>
				</tr>
				<%-- <tr>
					<td class="option-title">계좌정보</td>
					<td colspan="3">[${custData.BANK}] ${custData.ACCOUNT}</td>
				</tr> --%>
				<tr class="last-row">
					<td class="option-title">기타 문의사항</td>
					<td colspan="3">
						${custData.ETC}
					</td>
				</tr>
			</tbody>
		</table>
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
				<c:forEach var="data" items="${driverList}" varStatus="status">
					<tr<c:if test="${status.last}"> class="last-row"</c:if>> <!-- 마지막 행이면 tr에 last-row 클래스 추가 -->
						<td class="option-title">운전면허번호</td>
						<td>${data.DRIVER_NUM}</td>
						<c:choose>
							<c:when test="${data.DRIVER_CELL ne null}">
								<td class="option-title">운전자 이름</td>
								<td>${data.DRIVER_NM}</td>
								<td class="option-title">운전자 전화번호</td>
								<td>${data.DRIVER_CELL}</td>
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
			</tbody>
		</table>
	</div>
	<div class="estimate-footer">
		<!-- <input type="button" class="btn btn-default" value="가계약서 보기"> -->&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btn-default" value="인쇄하기" id="printBtn">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btn-default" value="필요 서류" data-toggle="modal" data-target="#monthrent-modal" >&nbsp;&nbsp;&nbsp;&nbsp;
		<!-- <input type="button" class="btn btn-default" value="고객정보 수정" id="modifyBtn">&nbsp;&nbsp;&nbsp;&nbsp; -->
		<!-- <input type="button" class="btn btn-default" value="차량예약 취소" id="cancelBtn">  -->
	</div>
</div>
<%@include file="/WEB-INF/jsp/common/monthRent-modal.jsp"%>
</t:blankpage>