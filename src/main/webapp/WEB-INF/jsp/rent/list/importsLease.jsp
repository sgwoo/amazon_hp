<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<c:set var="today"><fmt:formatDate value="${toDay}" pattern="yyyyMMdd" /></c:set>    
<t:genericpage>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.widgets.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
<script>
$(document).ready(function () {
	//Custom Sorting Rule 생성
	$.tablesorter.addParser({ 
	    id: 'price',
	    is: function(s) { 
	        return false; 
	    }, 
	    format: function(s) {
	        return s.replace('원','').replace(/,/g,'');
	    }, 
	    type: 'numeric' 
	}); 

	$(function() {
		 var $table = $('.rent-list').tablesorter({
		        widgets: ["filter"],
		        headers:{
		        	th:{sorter:false}
		        },
		        widgetOptions: {
		            filter_columnFilters: false,
		            filter_reset: '.reset'
		        }
		     });
		     
		     //$.tablesorter.filter.bindSelect( $table, $('.selectCarCompany'),0 );
		     //$.tablesorter.filter.bindSelect( $table, $('.selectCarName'),1 );
	});
	
	$('.rent-desc').click(function(){
		location.href="/lease/desc";
	})
	
	//모달 버튼 클릭 시 모달팝업 등장 , 정비포함 미포함
	$('.info-modal-btn').click(function(){
		var value = $(this).attr("value");
		$(".modal-table td").removeClass("current");
		$(".modal-table td[name='"+value+"']").addClass("current");
	})

	//수입신차는 이상하게 click function 이 안 먹어서 다음과 같이 대체함
	$(".modal-table td[name='"+$('#infoValue').val()+"']").addClass("current");
	
});
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
.custom-tab {
	margin-left: 0.5px;
	border: 1px solid #f98460 !important;
	background-color: #f98460;
	color: #ffffff !important;
}
.custom-tab.active {
    /* background-color: #f98460 !important;
    color: #ffffff !important; */
    background-color: #f6f6f6;
    color: #f98460 !important;
}
.custom-style {
	width: 150px;
    height: 40px;
    font: 18px Noto Sans KR,sans-serif;
    border: 1px solid #f98460;
    vertical-align: middle;
    display: table-cell;
}
</style>
<input type="hidden" name="infoValue" id="infoValue" value="4"/>
<input type="hidden" name="searchCondition" id="search_agreeDist" value="${param.agreeDist}"/>
<input type="hidden" name="searchCondition" id="search_carName" value="${carName}"/>
<input type="hidden" name="searchCondition" id="search_carCompId" value="${param.carCompId}" />
<!-- <div id="bck-car">
	<img src="/resources/images/img_visual_car_import3.png">
</div> -->
	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/lease/domestic"><div class="amazon-tab">국산신차</div></a>
			<a href="/lease/imports"><div class="amazon-tab active">수입신차</div></a>
			<c:if test="${discount > 0}">
			<a href="/lease/discount"><div class="amazon-tab custom-tab">특별할인차량</div></a>
			</c:if>
		</div>
		<div class="amazon-tab-info" style="margin-top: 20px;">
			<div class="amazon-tab-info-title">아마존카의  리스는?</div>
    		<div class="amazon-tab-info-content">
    			고객이 원하는 차량을 구매하여 고객이 약정한 기간동안 대여해드리는 서비스이며,<br/>
				금융권 전산상의 대출로 기록되지 않으며, 심사기준도 간결합니다. 국내에선 유일하게 모든 차량 100% 가격공개 및 실시간 견적서비스도 함께 제공합니다.
				<span class="label label-warning rent-desc">상세보기</span>
    		</div>
			<!-- <div class="rent-info">아마존카의 리스는?</div>
			<div class="rent-info-coll-div">
				<div class="rent-info-coll">
					고객이 원하는 차량을 구매하여 고객이 약정한 기간동안 대여해드리는 서비스이며,<br/>
					금융권 전산상의 대출로 기록되지 않으며, 심사기준도 간결합니다. 국내에선 유일하게 모든 차량 100% 가격공개 및 실시간 견적서비스도 함께 제공합니다.
					<span class="label label-warning rent-desc">상세보기</span>
				</div>
			</div> -->
			<div class="rent-required" style="display:none;">
				<span class="glyphicon glyphicon-check"></span>&nbsp;<span>만 26세 이상 / 운전면허 취득 3년 이상 / 본인 명의 신용카드 소지자</span>만 월 렌트 가능합니다.
			</div>
		</div>
	</div>
	<!-- 검색존 -->
	<form target="_self" method="post" id="searchForm">
		<input type="hidden" name="tempCompNm" value="${param.carCompId}">
		<div class="rent-filter-container">
			<table class="search-table">
				<colgroup>
					<col width="20%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>					
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<tr>
					<th colspan="">제조사 및 차명</th>
					<td colspan="3">
						<div class="filter-condition">
							<select class="selectCarCompany" name="carCompId">
								<option value="">제조사 전체</option>
								<c:forEach var='item' items='${carCompany}'>
									<c:if test="${item.CODE > 5 }">
										<option value='${item.CODE}'>${item.NM}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<td colspan="3">
						<div class="filter-condition">
							<select class="selectCarName" name="carName" id="carName-search">
								<option value="">차명 전체</option>
								<c:forEach var="item" items="${searchList}" varStatus="status">
									<option value="${item.CAR_NM}">[${item.COM_NM}]${item.CAR_NM}</option>
								</c:forEach>
							</select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<th colspan="">악정주행거리</th>
					<td>
						<input type="radio" value="10000" name="agreeDist" checked id="dist-2"/>
						<label for="dist-2">10,000km</label>
					</td>
					<td>
						<input type="radio" value="15000" name="agreeDist" id="dist-3"/>
						<label for="dist-3">15,000km</label>
					</td>
					<td>
						<input type="radio" value="20000" name="agreeDist" id="dist-4"/>
						<label for="dist-4">20,000km</label>
					</td>
					<td>
						<input type="radio" value="25000" name="agreeDist" id="dist-5"/>
						<label for="dist-5">25,000km</label>
					</td>
					<td>
						<input type="radio" value="30000" name="agreeDist" id="dist-6"/>
						<label for="dist-6">30,000km</label>
					</td>
					<td>
						<input type="radio" value="40000" name="agreeDist" id="dist-7"/>
						<label for="dist-7">40,000km</label>
					</td>
					<td colspan='2'>
						<div style="cursor: pointer; margin-left: 20px;">
				      		<div style="border: 2px solid #f98460; background-color: #f98460; height: 30px; width: 220px; text-align: center; display: flex; justify-content: center; align-items: center;">
								<a class="minus_mileage" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');" style="color: #f98460; font-size: 13px; color: #ffffff">약정이하 운행 시 Km당  대여료 환급</a>
							</div>
				       	</div>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 리스트 안내 -->
	<div style="float:left;width:100%;">
		<!-- <span style="float:left;">※ 보증금 20% 기준 (단, 차가 4500만원 초과 시 25%)</span> -->
		
		<span style="float:right;"><fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 " /> 현재 </span>
		
		<%-- <c:choose>
			<c:when test="${today >= 20200601 && today <= 20200731}">
				<span style="float:right;">2020년 06월 현재 </span>
			</c:when>
			<c:otherwise>
				<span style="float:right;"><fmt:formatDate value="${toDay}" pattern="yyyy년 MM월" /> 현재 </span>
			</c:otherwise>
		</c:choose> --%>
		
	</div>
	<!-- 리스트 -->
	<table class="rent-list tablesorter sticky-enabled main-list" id="myTable">
		<colgroup>
			<col width="8%"/>
			<col width="13%"/>
			<col width="13%"/>
			<col width="10%"/>
			<col width="8%"/>
			<col width="10%"/>
			<col width="8%"/>
			<col width="11%"/>
			<col width="11%"/>
			<col width="11%"/>
			<col width="8%"/>
		</colgroup>
		<thead>
			<tr class="rent-list-title" style="background-color: #F6F6F6; border-top: 0px;" onmouseover="this.style.cursor='default'">
				<th colspan="10" class="rent-list-title">
					<div style="float:left;width:100%;">
						<!-- <span style="float:left;">※ 보증금 25% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;<span class="label label-success label-green" onmouseover="this.style.cursor='default'">상세보기</span>&nbsp;&nbsp;참조 )</span> -->
						<span style="float:left;">※ 보증금 25% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;상세페이지&nbsp;참조 )</span>
						<c:choose>
							<c:when test="${param.agreeDist eq null}"><span style="float:right;">※ 연간 약정운행거리 : 10,000km 기준 ( 1,000km 단위로 조정 가능 )</span></c:when>
							<c:otherwise><span style="float:right;">※ 연간 약정운행거리 : <fmt:formatNumber value="${param.agreeDist}" pattern="#,###" />km 기준 ( 1,000km 단위로 조정 가능 )</span></c:otherwise>
						</c:choose>
						<%-- <span style="float:left; padding-left: 20%;">※ 연간 약정운행거리 : <fmt:formatNumber value="${param.agreeDist}" pattern="#,###" />km 기준</span> --%>
						<%-- <span style="float:right;"><fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 " /> 현재 </span> --%>
					</div>
				</th>
			</tr>
			<tr class="rent-list-sub-head" onmouseover="this.style.cursor='default'">
				<th colspan="6" class="rent-list-rightest-item">차량 정보</th>
				<th colspan="4">리스 월대여료(원, VAT 별도)</th>
			</tr>
			<tr onmouseover="this.style.cursor='default'">
				<th rowspan="2">제조사</th>
				<th rowspan="2">차종</th>
				<th rowspan="2">구분</th>
				<th rowspan="2">변속기</th>
				<th rowspan="2">연료</th>
				<th rowspan="2" class="rent-list-rightest-item">차량가격<br/>(만원)</th>
				<th colspan="3">정비미포함(기본식)&nbsp;&nbsp;
					<span data-toggle="modal" data-target="#info-modal" class="glyphicon glyphicon-question-sign info-modal-btn" value="4"></span>
				</th>
				<th></th>
			</tr>
			<tr onmouseover="this.style.cursor='default'">
				<th class="sorter-false">60개월</th>
				<th class="sorter-false">48개월</th>
				<th class="sorter-false">36개월</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(list) == 0}">
		        <tr style="height: 80px;">
		        	<td colspan="10" style="text-align: center;">검색결과가 없습니다.</td>
		        </tr>
		    </c:if>
			<c:forEach var="data" items="${list}" varStatus="status">
				<tr>
					<td param="${data.SEQ}:${data.RB36_ID}" onmouseover="this.style.cursor='default'" onclick="event.cancelBubble=true">
						${data.NM}
						<c:if test="${data.JG_G_7 <= 4 && data.JG_G_7 >= 1}">
							<br/>
							<a href="/rent/green/desc#tab_price" target="_self" style="text-decoration:none;">
								<span class="label label-success label-green" style="font-size:12px;">친환경차&nbsp;<img src="/resources/images/icon_green_desc.png" style="margin-top:-3px;"></span>
							</a>
						</c:if>
					</td>
					<td>
						<c:if test="${data.JG_G_35 eq 1}">
							<div style="padding-bottom: 2px;">
								<!-- <span class="label" style="background-color: #407ce8; letter-spacing: 1px;">인기차종</span> -->									
								<span style="font-size: 9px; font-style: italic; font-weight: bold; color: #4D4D4D;">
									<img src="/resources/images/medal_1.png" style="width: 20px; height: 20px;">
									&nbsp;인기
								</span>
							</div>
						</c:if>
						<c:if test="${data.JG_G_35 eq 2}">
							<div style="padding-bottom: 2px;">									
								<span style="font-size: 9px; font-style: italic; font-weight: bold; color: #4D4D4D;">
									<img src="/resources/images/new_2.png" style="width: 20px; height: 20px;">
									&nbsp;신규차종
								</span>
							</div>
						</c:if>
						<c:if test="${data.JG_G_35 eq 12}">
							<div style="padding-bottom: 2px;">									
								<span style="font-size: 9px; font-style: italic; font-weight: bold; color: #4D4D4D;">
									<img src="/resources/images/medal_1.png" style="width: 20px; height: 20px;">
									&nbsp;인기
								</span>
								&nbsp;
								<span style="font-size: 9px; font-style: italic; font-weight: bold; color: #4D4D4D;">
									<img src="/resources/images/new_2.png" style="width: 20px; height: 20px;">
									&nbsp;신규차종
								</span>
							</div>
						</c:if>
						${data.CAR_NM}
						<input type="hidden" class="list-comp-nm" value="${data.COM_NM}">
					</td>
					<td>${data.CAR_NAME}</td>
					<td>${data.AUTO}</td>
					<td>${data.DIESEL}</td>
					<td class="rent-list-rightest-item-light"><fmt:formatNumber value="${data.O_1_2}" pattern="#,###" /></td>
					
					<c:choose>
						<c:when test="${data.CAR_COMP_ID ne '0056'}">
							<td id="${data.LB60_ID}" class="list-price" style="color: #16519c !important;">
								<c:choose>
									<c:when test="${data.LB60_AMT eq 0}">미운영</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${data.LB60_AMT}" pattern="#,###" />
									</c:otherwise>
								</c:choose>
							</td>
							<td id="${data.LB48_ID}" class="list-price">
								<c:choose>
									<c:when test="${data.LB48_AMT eq 0}">미운영</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${data.LB48_AMT}" pattern="#,###" />
									</c:otherwise>
								</c:choose>
							</td>
							<td id="${data.LB36_ID}" class="list-price">
								<c:choose>
									<c:when test="${data.LB36_AMT eq 0}">미운영</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${data.LB36_AMT}" pattern="#,###" />
									</c:otherwise>
								</c:choose>
							</td>
						</c:when>
						<c:when test="${data.CAR_COMP_ID eq '0056'}">
							<c:choose>
								<c:when test="${data.AGREE_DIST > 30000}">
									<td id="${data.LB60_ID}" class="list-price" style="color: #16519c !important;">미운영</td>
									<td id="${data.LB48_ID}" class="list-price">미운영</td>
									<td id="${data.LB36_ID}" class="list-price">미운영</td>
								</c:when>
								<c:otherwise>
									<td id="${data.LB60_ID}" class="list-price" style="color: #16519c !important;"><fmt:formatNumber value="${data.LB60_AMT}" pattern="#,###" /></td>
									<%-- <td id="${data.LB60_ID}" class="list-price" style="color: #16519c !important;">미운영</td> --%>
									<td id="${data.LB48_ID}" class="list-price"><fmt:formatNumber value="${data.LB48_AMT}" pattern="#,###" /></td>
									<td id="${data.LB36_ID}" class="list-price"><fmt:formatNumber value="${data.LB36_AMT}" pattern="#,###" /></td>
								</c:otherwise>
							</c:choose>
						</c:when>
					</c:choose>
					<%-- 
					<td id="${data.LB60_ID2}" class="list-price" style="color: #16519c !important;">
						<c:choose>
							<c:when test="${data.LB60_AMT2 eq 0}">미운영</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${data.LB60_AMT2}" pattern="#,###" />
							</c:otherwise>
						</c:choose>
					</td>
					<td id="${data.LB48_ID2}" class="list-price">
						<c:choose>
							<c:when test="${data.LB48_AMT2 eq 0}">미운영</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${data.LB48_AMT2}" pattern="#,###" />
							</c:otherwise>
						</c:choose>
					</td>
					<td id="${data.LB36_ID2}" class="list-price">
						<c:choose>
							<c:when test="${data.LB36_AMT2 eq 0}">미운영</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${data.LB36_AMT2}" pattern="#,###" />
							</c:otherwise>
						</c:choose>
					</td> 
					--%>
					<td>
						<span class="detail-span detail-new" param="${data.SEQ}:${data.LB36_ID}">
								<!-- <img src="/resources/images/right-arrow.png"  title="상세보기" /> -->
								<span class="label label-success label-green">상세보기</span>
						</span>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@include file="/WEB-INF/jsp/common/compareWindow.jsp"%> <!-- 비교견적 창 -->
	<input type="hidden" id="typeForCookie" value="수입신차" />
	<input type="hidden" id="urlForCookie" value="/lease/domestic/detail" />
	<!--  hidden form -->
	<form id="detailFrm" action="/lease/imports/detail" method="get">
		<input type="hidden" id="carManagedId" name="carManagedId" />
		<input type="hidden" id="rentManagedId" name="rentManagedId" />
		<input type="hidden" id="rentLocaleCode" name="rentLocationCode"/>
		<input type="hidden" id="locationId" name="locationId"/>
		<input type="hidden" id="seq" name="seq" />
		<input type="hidden" id="estimateId" name="estimateId" />
		<input type="hidden" id="agreeDist" name="agreeDist" value="20000" />
	</form>
	<%@include file="/WEB-INF/jsp/common/info-modal.jsp"%>
</t:genericpage>