<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script type="text/javascript" src="http://t1.daumcdn.net/cssjs/common/cts/vr200/dcts.js"></script>
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
	
   	if(selectedValue == 3){
   		$('.business-customer').hide();
   		$('.customer-birth').show();
   		$('.customer-name:first').html("이름");
   		$('.customer-name > input').attr("name","estName");
   	}else{
   		$('.business-customer').show();
   		$('.customer-birth').hide();
   		$('.customer-name:first').html("담당자 이름");
   		$('.customer-name > input').attr("name","estAgent");
   	}
   	
 	//견적서보기 클릭시
    $("#step3_print").click(function(){
    	var url = $("#printUrl").val();
		window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");
    })

})
</script>
<input type="hidden" name="estGubun" value="${paramData.estGubun}"/>
<input type="hidden" name="printUrl" id="printUrl" value="${paramData.printUrl}"/>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">실시간 견적 문의</h2>
		<div class="process-item done">STEP 1:실시간 견적</div>
		<div class="process-item done">STEP 2:상담 요청</div>
		<div class="process-item done">STEP 3:상담 정보 확인</div>
	</div>
</div>
<div class="estimate-body">
	<div>
		<h4>
			아래와 같이 차량 견적 상담 요청이 완료되었습니다<br/>빠른 시간 내에 연락드리도록 하겠습니다<br/>
		</h4>
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
					<th colspan="4">차량기본정보</th>
				</tr>
				<tr>
					<td class="option-title">제조사</td>
					<td>${paramData.companyName}</td>
					<td class="option-title">차명</td>
					<td>${paramData.carName}&nbsp;${paramData.carDetailName}</td>
				</tr>
				<tr>
					<td class="option-title">신차등록일</td>
					<td>${paramData.carRegDate}</td>
					<td class="option-title">배기량</td>
					<td><fmt:formatNumber value="${paramData.carDPM}" pattern="#,###" />cc</td>
				</tr>
				<tr>
					<td class="option-title">연료</td>
					<td>${paramData.fuelKind}</td>
					<td class="option-title">색상</td>
					<td>${paramData.carColor}</td>
				</tr>
				<tr>
					<td class="option-title">모델 연도</td>
					<td>${paramData.carYear}년 형</td>
					<td class="option-title">주행거리</td>
					<td><fmt:formatNumber value="${paramData.carRealKM}" pattern="#,###" />km</td>
				</tr>
				<tr class="last-row">
					<td class="option-title">옵션</td>
					<td colspan="3">${paramData.carOption}</td>
				</tr>
			</tbody>
		</table>
		<table class="car-option-table step2">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="4">
						선택 항목 확인
						<span name="folding-control" class="th-text-small"  style="display:none;">
							접기
						</span>
						<span name="folding-control" class="th-text-small">
							펼치기
						</span>
						<span id="step3_print" style="margin-right: 30px; float: right; line-height: 22px; background-color: #22B500; color: #FFF; padding: 0px 10px 2px 10px; font-size: 13px; cursor: pointer;">
							견적서 보기
						</span>
					</th>
				</tr>
				<tr class="option-info">
					<td class="option-title">대여상품</td>
					<td>
						<c:if test="${data.A_A eq 21}"> 장기렌트 일반식 (정비 포함)  </c:if>
						<c:if test="${data.A_A eq 22}">	장기렌트 기본식 (정비 미포함) </c:if>
						<c:if test="${data.A_A eq 11}">	자동차리스 기본식 (정비 미포함) </c:if>
						<c:if test="${data.A_A eq 12}">	자동차리스 일반식 (정비 미포함) </c:if>
					</td>
					<td class="option-title">대여기간</td>
					<td>
						${data.A_B}개월
					</td>
				</tr>
				<tr class="option-info">
					<td class="option-title">표준약정운행거리</td>
					<td>
						<fmt:formatNumber value="${data.B_AGREE_DIST}" pattern="#,###" />km
					</td>
					<td class="option-title">적용약정운행거리</td>
					<td>
						<fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" />km
					</td>
				</tr>
				<tr class="option-info">
					<td class="option-title">보증금</td>
					<td>
						[${data.RG_8}%] <fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" />원
					</td>
					<td class="option-title">선납금</td>
					<td>
						[${data.PP_PER}%] <fmt:formatNumber value="${data.PP_AMT}" pattern="#,###" />원
					</td>
				</tr>
				<tr class="option-info">
					<td class="option-title">보증보험</td>
					<td>
						[${data.GI_PER}%] <fmt:formatNumber value="${data.GI_AMT}" pattern="#,###" />원
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="option-info">
					<td class="option-title">운전자 연령</td>
					<td>
						만
						<c:if test="${data.INS_AGE == 1}">26</c:if>
						<c:if test="${data.INS_AGE == 2}">21</c:if>
						<c:if test="${data.INS_AGE == 3}">24</c:if>
						세 이상
					</td>
					<td class="option-title">대물/자손</td>
					<td>
						<c:if test="${data.INS_DJ == 1}">5천만원/5천만원</c:if>
						<c:if test="${data.INS_DJ == 2}">1억원/1억원</c:if>
						<c:if test="${data.INS_DJ == 3}">5억원/1억원</c:if>
						<c:if test="${data.INS_DJ == 4}">2억원/1억원</c:if>
						<c:if test="${data.INS_DJ == 8}">3억원/1억원</c:if>
					</td>
				</tr>
				<tr class="option-info">
					<td class="option-title">자차 면책금</td>
					<td>
						<fmt:formatNumber value="${data.CAR_JA}" pattern="#,###" />원
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="option-info">
					<td class="option-title">차량용품</td>
					<td>
						<c:if test="${data.TINT_S_YN == 'Y'}">전면 선팅</c:if>
						<c:if test="${data.TINT_N_YN == 'Y'}">거치형 내비게이션</c:if>
						<c:if test="${data.TINT_EB_YN == 'Y'}">이동형 충전기</c:if>
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="step2-price">
					<td>대여기간</td>
					<td><span>${data.A_B}개월</span></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="step2-price">
					<td>공급가</td>
					<td><span><fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" />원</span></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="step2-price">
					<td>부가세</td>
					<td><span><fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" />원</span></td>
					<td>합계</td>
					<td>
						<div class="total-price"><fmt:formatNumber value="${data.FEE_S_AMT + data.FEE_V_AMT}" pattern="#,###"/>원</div>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="customer-info-table step3">
			<thead>
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="17%"/>
					<col width="33%"/>
				</colgroup>
			</thead>
			<tbody>
				<tr>
					<th colspan="4">고객 정보</th>
				</tr>
				<tr>
					<td class="option-title">
						구분
					</td>
					<td>
						<c:if test="${fn:contains(paramData.estGubun,1)}">법인사업자</c:if>
						<c:if test="${fn:contains(paramData.estGubun,2)}">개인사업자</c:if>
						<c:if test="${fn:contains(paramData.estGubun,3)}">개인</c:if>
					</td>
					<td></td>
					<td></td>
				</tr>
				<%-- <tr>
					<td class="option-title">
						업종
					</td>
					<td>
						${paramData.estBusiness}
					</td>
					<c:choose>
						<c:when test="${fn:contains(paramData.estGubun,3)}">
							<td class="option-title">
								운전경력
							</td>
							<td>
								${paramData.driverYear}
							</td>
						</c:when>
						<c:otherwise>
							<td class="option-title">
								업력
							</td>
							<td>
								${paramData.estBusinessYear}
							</td>
						</c:otherwise>
					</c:choose>
				</tr> --%>
				<!-- 사업자인 경우 -->
				<c:choose>
					<c:when test="${fn:contains(paramData.estGubun,3)}">					
						<!-- 개인인 경우 -->
						<tr>
							<td class="option-title">이름</td>
							<td>${paramData.estName}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="option-title">
								상호
							</td>
							<td>
								${paramData.estName}
							</td>
							<td class="option-title">
								사업자 번호
							</td>
							<td>
								${paramData.estSSN}
							</td>
						</tr>
						<tr>
							<td class="option-title">담당자 이름</td>
							<td>
								${paramData.estAgent}
							</td>
							<td></td>
							<td></td>
						</tr>
					</c:otherwise>
				</c:choose>

				<tr>
					<td class="option-title">연락처</td>
					<td colspan="3">
						${paramData.estTel}
					</td>
					<%-- <td class="option-title">팩스번호</td>
					<td>
						${paramData.estFax}
					</td> --%>
				</tr>
				<tr>
					<td class="option-title">소재지</td>
					<td>
						${paramData.estSido}/${paramData.estGugun}
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="option-title">이메일주소</td>
					<td>
						${paramData.estEmail}
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="option-title last-row">
					<td>기타 문의사항</td>
					<td colspan="3">
						${paramData.etc}
					</td>
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
						<div style="padding: 15px 0px 15px 0px;">
							<span style="font-weight: bold; font-size: 14px; letter-spacing: 0.5px;">
								※ 고객님께서 내신 견적을 저장하여 다시 보고싶거나 상담요청한 내역을 확인하고 싶으면 홈페이지 우측 상단의 로그인 화면에서 간편하게
							</span><br>
							<span style="font-weight: bold; font-size: 14px; letter-spacing: 0.5px; padding-left: 18px;">
								이메일 계정만 등록하시고 사용하시면 됩니다.
							</span>
						</div>
					</th>
				</tr>				
			</tbody>
		</table>
		
		<br/><br/>
	</div>
</div>
</t:blankpage>