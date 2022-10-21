<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />   
<t:genericpage>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.widgets.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
<script>
//모바일 리다이렉트(2018.02.28)
/* if (navigator.userAgent.match(/iPhone/) || navigator.userAgent.match(/iPad/) || navigator.userAgent.match(/Android/)) {
	location.replace("https://www.amazoncar.co.kr/home/mobile/shcar_list.jsp");
} */
</script>
<script>
$(document).ready(function(){
	
	$('.rent-desc').click(function(){
		location.href="/rent/secondhand/desc";
	})
	
	//sorting 기능 여부
	$(function() {
	    $(".rent-list").tablesorter({
	        headers: {
	        	0:{sorter:false},
	        	1:{sorter:false},
	        	2:{sorter:false},
	        	3:{sorter:false},
	        	4:{sorter:false},
	        	5:{sorter:false},
	        	6:{sorter:true},
	        	7:{sorter:'dist'},
	        	8:{sorter:'price'},
	        	9:{sorter:'price'},
	        	10:{sorter:'price'}
	        //	4:{sorter:'date'},
	        //	5:{sorter:'dist'},
	        //	6:{sorter:'price'},
	       //   7:{sorter:'price'},
	        //    8:{sorter:'price'},
	        //    9:{sorter:'maxMon'},
	        //    10:{sorter:false}
	        }
	    });
	});
})
</script>
<style>
.sticky-header {
	z-index: 10 !important;
}
.amazon-tab-info-title {
	height: 40px;
    font-size: 15px;
    color: #767a9c;
    font-weight: 500;
}
.amazon-tab-info-content {
	font-size: 13px;
	line-height: 22px;
    height: 70px;
}
</style>
<input type="hidden" name="searchCondition" id="search_carGubun" value="${param.carGubun}"/>
<input type="hidden" name="searchCondition" id="search_resFlag" value="${param.resFlag}"/>
<input type="hidden" name="searchCondition" id="search_agreeDist" value="${param.agreeDist}"/>
<input type="hidden" name="searchCondition" id="search_priceStd" value="${param.priceStd}"/>
<input type="hidden" name="searchCondition" id="search_searchPrice" value="${param.searchPrice}"/>
<input type="hidden" name="searchCondition" id="search_brTo" value="${param.brTo}"/>

<!-- <div id="bck-car" style="top: 80px !important; opacity: 0.9 !important;">
	<img src="/resources/images/img_visual_car2_5.png" style="width: 350px;">
</div> -->
	<div class="amazon-tab-container">
	<div class="detail-title">
		<h1 style="float: none !important;">재렌트/재리스</h1>
	</div>	
		<div class="amazon-tab-info" style="margin-top: 20px;">
			<div class="amazon-tab-info-title">아마존카의 재렌트/재리스는?</div>
    		<div class="amazon-tab-info-content">
    			기존에 아마존카가 소유하고 있는 차량 중, 차량 관리 상태가 우수한 차량을 재렌트/재리스 차량으로 제공합니다.<br/>
				사고유무, 주행거리, 정비상태 등 정보를 상세히 공개하고 실시간 견적 서비스를 함께 제공합니다.
				<span class="label label-warning rent-desc">상세보기</span>
    		</div>
			<!-- <div class="rent-info">아마존카의 재렌트/재리스는?</div>
			<div class="rent-info-coll-div">
				<div class="rent-info-coll">
					기존에 아마존카가 소유하고 있는 차량 중, 차량 관리 상태가 우수한 차량을 재렌트/재리스 차량으로 제공합니다.<br/>
					사고유무, 주행거리, 정비상태 등 정보를 상세히 공개하고 실시간 견적 서비스를 함께 제공합니다.
					<span class="label label-warning rent-desc">상세보기</span>
				</div>
			</div> -->
			<div class="rent-required" style="display:none;">
				<span class="glyphicon glyphicon-check"></span>&nbsp;<span>만 26세 이상 / 운전면허 취득 3년 이상 / 본인 명의 신용카드 소지자</span>만 월 렌트 가능합니다.
			</div>
		</div>
	</div>
	
	<!-- 검색존 -->
	<form target="_self" method="get" id="searchForm">
		<div class="rent-filter-container">
			<table class="search-table">
				<colgroup>
					<col width="20%"/>
					<col width="16%"/>
					<col width="16%"/>
					<col width="16%"/>
					<col width="16%"/>
					<col width="16%"/>					
				</colgroup>
				<tr class="multiple-line">
					<th>차종</th>
					<td>
						<input type="radio" name="carGubun" value="" checked id="gubun-all">
						<label for="gubun-all">전체</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="8" id="gubun-8">
						<label for="gubun-8">소형승용(LPG)</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="5" id="gubun-5">
						<label for="gubun-5">중형승용(LPG)</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="4" id="gubun-4">
						<label for="gubun-4">대형승용(LPG)</label>
					</td>
					<td></td>
				</tr>
				<tr class="multiple-line">
					<th></th>
					<td></td>
					<td>
						<input type="radio" name="carGubun" value="3" id="gubun-3">
						<label for="gubun-3">소형승용(가솔린,디젤)</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="2" id="gubun-2">
						<label for="gubun-2">중형승용(가솔린,디젤)</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="1" id="gubun-1">
						<label for="gubun-1">대형승용(가솔린,디젤)</label>
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr class="multiple-line">
					<th></th>
					<td></td>
					<td>
						<input type="radio" name="carGubun" value="6" id="gubun-6">
						<label for="gubun-6">RV</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="9" id="gubun-9">
						<label for="gubun-9">화물/승합</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="7" id="gubun-7">
						<label for="gubun-7">수입차</label>
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>
						<div class="filter-condition">
							<input type="checkbox" name="resFlag" value="Y" id="checkFlag">
							<label for="checkFlag">상담 중 제외</label>
						</div>
					</td>
				</tr>
				<tr class="filter-condition">
					<th>연간 약정운행거리</th>
					<td>
						<input type="radio" name="agreeDist" id="10000-dist" value="10000" checked>
						<label for="10000-dist">10,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" id="20000-dist" value="20000">
						<label for="20000-dist">20,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" id="30000-dist" value="30000">
						<label for="30000-dist">30,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" id="40000-dist" value="40000">
						<label for="40000-dist">40,000km</label>
					</td>
				</tr>
				<tr>
					<th class="filter-condition">
						월대여료<br/>
						<select style="width:180px;" name="priceStd">
							<option value="12">12개월 견적기준</option>
							<option value="24">24개월 견적기준</option>
							<option value="36">36개월 견적기준</option>
							<option value="max" selected>최대계약개월수 견적기준</option>
						</select>
					</th>
					<td colspan="5" class="filter-condition">
						<input type="radio" name="searchPrice" id="srch-pr-total" value="">
						<label for="srch-pr-total">금액 전체</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-25" value="25">
						<label for="srch-pr-25">25만원이하</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-30" value="30">
						<label for="srch-pr-30">25만원 ~ 30만원</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-35" value="35">
						<label for="srch-pr-35">30만원 ~ 35만원</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-40" value="40">
						<label for="srch-pr-40">35만원 ~ 40만원</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-49" value="49">
						<label for="srch-pr-49">40만원 ~ 50만원</label>
						&nbsp;&nbsp;
						<input type="radio" name="searchPrice" id="srch-pr-50" value="50">
						<label for="srch-pr-50">50만원이상</label>
					</td>
				</tr>
				<%-- <tr style="height: 20px !important;">
					<td colspan="5"></td>
				</tr>
				<tr>
					<th>고객주소지&nbsp;&nbsp;&nbsp;<br>(차량인도지역)</th>
					<td class="filter-condition">
						<select style="width:150px;" name="brTo">
							<option value="" selected>고객주소지 선택</option>
							<option value="0">수도권</option>
							<option value="1">대전</option>
							<option value="2">대구</option>
							<option value="3">광주</option>
							<option value="4">부산</option>
						</select>
					</td>
					<td colspan="3">
						<c:choose>
							<c:when test="${empty param.brTo}">
								※ 고객주소지(차량인도지역)를 선택하시면 재랜트/재리스 차량 월대여료를 볼 수 있습니다.
							</c:when>
							<c:otherwise>
								※ 고객주소지(차량인도지역) 기준 월대여료 입니다. (지역간 이동 탁송료가 반영된 요금입니다.)
							</c:otherwise>
						</c:choose>
					</td>
				</tr> --%>
			</table>
		</div>
	</form>
	<!-- 리스트 안내 -->
	<div style="float:left;width:100%;">
		<span style="float:right;"><fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /> 현재 </span>
	</div>
	<!-- 리스트 -->
	<table class="rent-list tablesorter sticky-enabled" id="secondhand-list">
		<colgroup>
			<col width="3%"/>
			<col width="24%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="9%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="7%"/>
		</colgroup>
		<thead>
			<tr class="rent-list-sub-head rent-list-title">
				<th colspan="6" class="rent-list-rightest-item">차량 정보</th>
				<th colspan="5">월대여료(원, VAT 별도)
				</th>
			</tr>
			<tr>
				<th></th>
				<th>차량 정보</th>
				<th class="fuel filter-select" data-placeholder="전체">연료</th>
				<th>색상</th>
				<th class="price-sort">신차등록일&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span><br/><small>(모델연도)</small></th>
				<th class="price-sort rent-list-rightest-item">주행거리&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span></th>
				<th class="price-sort">최대계약<br/>개월수&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span></th>
				<th class="price-sort">36개월&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span></th>
				<th class="price-sort">24개월&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span></th>
				<th class="price-sort">12개월&nbsp;<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span><span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="data" items="${list}" varStatus="status">
				<tr style="height:80px;">
					<td>${status.index+1}</td>
					<td param="${data.RENT_MNG_ID}:${data.RENT_L_CD}:${data.CAR_MNG_ID}">
						${data.CAR_JNM}&nbsp;${data.CAR_NM}&nbsp;<small>(${data.AB_CAR_NO})</small><br/>
						<c:if test="${data.SITUATION eq '상담중'}">
							<span class="label label-default">상담 1명</span>
						</c:if>
						<c:if test="${data.RES_CNT > 0}">
							<span class="label label-primary">대기 ${data.RES_CNT}명</span>
						</c:if>
						<c:if test="${data.SITUATION eq '예약가능'}">
							<span class="label label-warning">${data.SITUATION}</span>
						</c:if>
						<c:if test="${data.RENT_ST eq '사고대차'}">
							<span class="label label-success">대차중</span>
						</c:if>
						<c:if test="${data.RENT_ST eq '지연대차'}">
							<span class="label label-success">대차중</span>
						</c:if>
						<c:if test="${data.RENT_ST eq '정비대차'}">
							<span class="label label-success">대차중</span>
						</c:if>
					</td>
					<td>${data.FUEL_KD}</td>
					<td>${data.COLO}</td>
					<td>
						${data.INIT_REG_DT}<br/>
						<small>(${data.CAR_Y_FORM}년형)</small>
					</td>
					<td class="rent-list-rightest-item-light"><fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km</td>
					<td class="list-price" style="color: #16519c !important;">							
						<fmt:formatNumber value="${data.MAX_AMT}" pattern="#,###" />
						<br/>
						<span class="max-month">(${data.MAX_USE_MON}개월)</span>
					</td>
					<td class="list-price">
						<c:choose>
							<c:when test="${data.RB36 eq '-' && data.LB36 > 0 && 36 < data.MAX_USE_MON}">
								<fmt:formatNumber value="${data.LB36}" pattern="#,###"/>
							</c:when>
							<c:otherwise>
								${data.RB36}<input type="hidden" value="other ${data.RB36}">
							</c:otherwise>
						</c:choose>
					</td>
					<td class="list-price">
						<c:choose>
							<c:when test="${data.RB24 eq '-' && data.LB24 > 0 && 24 < data.MAX_USE_MON}">
								<fmt:formatNumber value="${data.LB24}" pattern="#,###"/>
							</c:when>
							<c:otherwise>
								${data.RB24}
							</c:otherwise>
						</c:choose>
					</td>
					<td class="list-price">
						<c:choose>
							<c:when test="${data.RB12 eq '-' && data.LB12 > 0 && 12 < data.MAX_USE_MON}">
								<fmt:formatNumber value="${data.LB12}" pattern="#,###"/>
							</c:when>
							<c:otherwise>
								${data.RB12}
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<span class="detail-span detail-sh" param="${data.RENT_MNG_ID}:${data.RENT_L_CD}:${data.CAR_MNG_ID}:${param.carGubun}">
						<!-- <img src="/resources/images/right-arrow.png"  title="상세보기" /> -->
						<span class="label label-success label-green">상세보기</span>
						</span>
					</td>
				</tr>
			</c:forEach>
			
			<%-- <c:choose>
				<c:when test="${empty param.brTo}">
					<tr style="height:110px;">
						<td colspan="11">※ 고객주소지(차량인도지역)를 선택하시면 재랜트/재리스 차량 월대여료를 볼 수 있습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="data" items="${list}" varStatus="status">				
						
						<tr style="height:80px;">
							<td>${status.index+1}</td>
							<td param="${data.RENT_MNG_ID}:${data.RENT_L_CD}:${data.CAR_MNG_ID}">
								${data.CAR_JNM}&nbsp;${data.CAR_NM}&nbsp;<small>(${data.AB_CAR_NO})</small><br/>
								<c:if test="${data.SITUATION eq '상담중'}">
									<span class="label label-default">상담 1명</span>
								</c:if>
								<c:if test="${data.RES_CNT > 0}">
									<span class="label label-primary">대기 ${data.RES_CNT}명</span>
								</c:if>
								<c:if test="${data.SITUATION eq '예약가능'}">
									<span class="label label-warning">${data.SITUATION}</span>
								</c:if>
								<c:if test="${data.RENT_ST eq '사고대차'}">
									<span class="label label-success">대차중</span>
								</c:if>
								<c:if test="${data.RENT_ST eq '지연대차'}">
									<span class="label label-success">대차중</span>
								</c:if>
								<c:if test="${data.RENT_ST eq '정비대차'}">
									<span class="label label-success">대차중</span>
								</c:if>
							</td>
							<td>${data.FUEL_KD}</td>
							<td>${data.COLO}</td>
							<td>
								${data.INIT_REG_DT}<br/>
								<small>(${data.CAR_Y_FORM}년형)</small>
							</td>
							<td class="rent-list-rightest-item-light"><fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km</td>
							<td class="list-price" style="color: #16519c !important;">
								<fmt:formatNumber value="${data.TO_MAX_AMT}" pattern="#,###" />
								<br/>
								<span class="max-month">(${data.MAX_USE_MON}개월)</span>
							</td>
							<td class="list-price">
								<c:choose>
									<c:when test="${data.TO_RB36 eq '-' && data.TO_LB36 > 0 && 36 < data.MAX_USE_MON}">
										<fmt:formatNumber value="${data.TO_LB36}" pattern="#,###"/>
									</c:when>
									<c:otherwise>									
										${data.TO_RB36}<input type="hidden" value="other ${data.TO_RB36}">
									</c:otherwise>
								</c:choose>
							</td>
							<td class="list-price">
								<c:choose>
									<c:when test="${data.TO_RB24 eq '-' && data.TO_LB24 > 0 && 24 < data.MAX_USE_MON}">
										<fmt:formatNumber value="${data.TO_LB24}" pattern="#,###"/>
									</c:when>
									<c:otherwise>									
										${data.TO_RB24}
									</c:otherwise>
								</c:choose>
							</td>
							<td class="list-price">
								<c:choose>								
									<c:when test="${data.TO_RB12 eq '-' && data.TO_LB12 > 0 && 12 < data.MAX_USE_MON}">
										<fmt:formatNumber value="${data.TO_LB12}" pattern="#,###"/>
									</c:when>
									<c:otherwise>									
										${data.TO_RB12}
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<span class="detail-span detail-sh" param="${data.RENT_MNG_ID}:${data.RENT_L_CD}:${data.CAR_MNG_ID}:${param.carGubun}">
								<span class="label label-success label-green">상세보기</span>
								</span>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose> --%>
		</tbody>
	</table>
	<%@include file="/WEB-INF/jsp/common/compareWindow.jsp"%> <!-- 비교견적 창 -->
	<input type="hidden" id="typeForCookie" value="재렌트/재리스" />
	<input type="hidden" id="urlForCookie" value="/rent/secondhand/detail" />
	<!--  hidden form -->
	<form id="detailFrm" method="get" target="_self">
		<input type="hidden" id="carManagedId" name="carManagedId" />
		<input type="hidden" id="rentManagedId" name="rentManagedId" />
		<input type="hidden" id="rentLocationCode" name="rentLocationCode"/>
	</form>
</t:genericpage>