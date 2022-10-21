<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script>
var _CONVERSION_CPCGUARD = 1; //cpcguard
$(document).ready(function(){
	estimateAnalytics(); //접속 통계
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
		<h2 class="primary">실시간 견적내기 및 상담 요청</h2>
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
		<table class="car-info-table">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">차량 선택</th>
					</tr>
					<tr>
						<td class="option-title">차량모델명</td>
						<td>
							${paramData.carName}
							<c:if test="${paramData.carName ne paramData.carDetailName}">
								${paramData.carDetailName}
							</c:if>
						</td>
						<td class="text-right">
							<fmt:formatNumber value="${data.O_1 - data.OPT_AMT - data.COL_AMT}" pattern="#,###"/>원
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">옵션</td>
						<td>${fn:replace(data.OPT,'+',' ')}</td>
						<td class="text-right">
							<fmt:formatNumber value="${data.OPT_AMT}" pattern="#,###"/>원
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">색상</td>
						<td>
							${fn:replace(data.COL,'+',' ')}
						</td>
						<td class="text-right"><fmt:formatNumber value="${data.COL_AMT}" pattern="#,###"/>원</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">차량가격</td>
						<td></td>
						<td class="text-right primary">
							<fmt:formatNumber value="${data.O_1}" pattern="#,###"/>원
						</td>
						<td></td>
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
							대여조건 선택
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
						<td colspan="3">
							<c:if test="${data.A_A eq 21}">	장기렌트 일반식 (정비 포함)	</c:if>
							<c:if test="${data.A_A eq 22}">	장기렌트 기본식 (정비 미포함)</c:if>
							<c:if test="${data.A_A eq 11}">	자동차리스 일반식 (정비 포함) </c:if>
							<c:if test="${data.A_A eq 12}">	자동차리스 기본식 (정비 미포함)</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">매입옵션</td>
						<td colspan="3">
							<c:if test="${data.OPT_CHK == 1}">있음</c:if>
							<c:if test="${data.OPT_CHK == 0}">없음</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">연간약정운행거리</td>
						<td colspan="3">
							<fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" />km
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">보증금</td>
						<td colspan="3">
							[${data.RG_8}%] <fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">선납금</td>
						<td colspan="3">
							[${data.PP_PER}%] <fmt:formatNumber value="${data.PP_AMT}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">운전자 연령</td>
						<td colspan="3">
							만
							<c:if test="${data.INS_AGE == 1}">26</c:if>
							<c:if test="${data.INS_AGE == 2}">21</c:if>
							<c:if test="${data.INS_AGE == 3}">24</c:if>
							세 이상
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">대물</td>
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
						<td colspan="3">
							<fmt:formatNumber value="${data.CAR_JA}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">차량용품</td>
						<td colspan="3">
							<c:if test="${data.TINT_S_YN == 'Y'}">전면 선팅</c:if>
							<c:if test="${data.TINT_N_YN == 'Y'}">거치형 내비게이션</c:if>
							<c:if test="${data.TINT_EB_YN == 'Y'}">이동형 충전기</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">차량 인도지역</td>
						<td colspan="3">
							<c:if test="${data.LOC_ST == 1}">서울</c:if>
							<c:if test="${data.LOC_ST == 2}">인천/경기</c:if>
							<c:if test="${data.LOC_ST == 3}">강원</c:if>
							<c:if test="${data.LOC_ST == 4}">충청</c:if>
							<c:if test="${data.LOC_ST == 5}">전라</c:if>
							<c:if test="${data.LOC_ST == 6}">대구/경북</c:if>
							<c:if test="${data.LOC_ST == 7}">부산/울산/경남</c:if>
						</td>
					</tr>
					<tr class="step2-price">
						<td>대여기간</td>
						<td><span>${data.A_B}개월</span></td>
						<td>월대여료</td>
						<td>
							<div style="width:255px">
								공급가 
								<span style="float:right"><fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" />원</span>
							</div>
						</td>
					</tr>
					<tr class="step2-price">
						<td></td>
						<td></td>
						<td></td>
						<td>
							<div style="width:255px">
								부가세 
								<span style="float:right"><fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" />원</span>
							</div>
						</td>
					</tr>
					<tr class="step2-price">
						<td></td>
						<td></td>
						<td>합계</td>
						<td>
							<div class="total-price">${data.totalPrice}원</div>
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
					<c:if test="${fn:contains(paramData.estGubun,3)}">
						<td>
							${paramData.estBusiness}
						</td>
						<td class="option-title">
							운전경력
						</td>
						<td>
							${paramData.driverYear}
						</td>
					</c:if>
					<c:if test="${fn:contains(paramData.estGubun,1)||fn:contains(paramData.estGubun,2)}">
						<td>
							${paramData.estBusiness}
						</td>
						<td class="option-title">
							업력
						</td>
						<td>
							${paramData.estBusinessYear}
						</td>
					</c:if>
				</tr> --%>
				<tr>
					<td class="option-title">
						<c:if test="${fn:contains(paramData.estGubun,1)||fn:contains(paramData.estGubun,2)}">상호</c:if>
						<c:if test="${fn:contains(paramData.estGubun,3)}">이름</c:if>
					</td>
					<td>
						${paramData.estName}
					</td>
					<td class="option-title">
						<c:if test="${fn:contains(paramData.estGubun,1)||fn:contains(paramData.estGubun,2)}">사업자 번호</c:if>
						<c:if test="${fn:contains(paramData.estGubun,3)}">생년월일</c:if>
					</td>
					<td>
						${paramData.estSSN}
					</td>
				</tr>
				<c:if test="${fn:contains(paramData.estGubun,1)||fn:contains(paramData.estGubun,2)}">
					<tr>
						<td class="option-title">담당자 이름</td>
						<td>
							${paramData.estAgent}
						</td>
						<td></td>
						<td></td>
					</tr>
				</c:if>
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
						${paramData.estSido}&nbsp;${paramData.estGugun}
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="last-row">
					<td class="option-title">이메일주소</td>
					<td>
						${paramData.estEmail}
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
		
		<br/><br/><br/><br/><br/>
	</div>
</div>
</t:blankpage>