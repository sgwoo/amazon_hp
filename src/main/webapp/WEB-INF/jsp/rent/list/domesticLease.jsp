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
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
<script>
$(function () {

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
     
     //$.tablesorter.filter.bindSelect( $table, $('.selectCarName'),0 );
});
       
$(document).ready(function(){

	// 차명 우선 선택 후 제조사 전체 선택 시 차명 값 초기화 
	var companyAllChecked = $('#company-all').is(':checked');
	var tempCarName = "${tempCarName}";
	if(companyAllChecked && tempCarName == ""){
		$("#carName-search").val("");
	}
	
	$('.rent-desc').click(function(){
		location.href="/lease/desc";
	})
	
	//모달 버튼 클릭 시 모달팝업 등장 , 정비포함 미포함
	$('.info-modal-btn').click(function(){
		var value = $(this).attr("value");
		$(".modal-table td").removeClass("current");
		$(".modal-table td[name='"+value+"']").addClass("current");		
	})

	$(".van-modal-btn").on("click", function(){
				
		$("#van-modal").modal();
		
	});
	
	//화물차는 상세페이지이동 따로 명시(모달과 충돌) 
 	$("td.test").on("click", function(e){
 		
		var param = $(this).attr("param").split(":");
		
		openDetail_NEW(param[0],param[1]);
		
		e.stopPropagation(); //무한루프 방지
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
<!-- <div id="bck-car" style="top: 80px !important; opacity: 0.9 !important;">
	<img src="/resources/images/img_visual_car2_7.png" style="width: 400px; margin-top: 30px;">
</div> -->
	<input type="hidden" name="searchCondition" id="search_agreeDist" value="${param.agreeDist}"/>
	<input type="hidden" name="searchCondition" id="search_companyName" value="${param.companyName}"/>
	<input type="hidden" name="searchCondition" id="search_carGubun" value="${param.carGubun}"/>
	<input type="hidden" name="searchCondition" id="search_carName" value="${carName}" />
	<input type="hidden" name="searchCondition" id="search_priceStd" value="${param.priceStd}"/>
	<input type="hidden" name="searchCondition" id="search_priceSearch" value="${param.priceSearch}"/>
	<input type="hidden" name="searchCondition" id="search_fuelKd" value="${param.fuelKd}"/>
	
	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/lease/domestic"><div class="amazon-tab active">국산신차</div></a>
			<a href="/lease/imports"><div class="amazon-tab">수입신차</div></a>
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
	<form target="_self" method="get" id="searchForm" action="/lease/domestic">
		<input type="hidden" name="tempCompNm" value="${param.companyName}">
		<input type="hidden" name="tempFuelKd" value="${param.fuelKd}">
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
					<th>차종</th>
					<td>
						<input type="radio" name="carGubun" value="" checked id="gubun-all"/>
						<label for="gubun-all">전체</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="12" id="gubun-12"/>
						<label for="gubun-12">경/소형승용</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="3" id="gubun-3"/>
						<label for="gubun-3">중형승용</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="4" id="gubun-4"/>
						<label for="gubun-4">대형승용</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="8"  id="gubun-8"/>
						<label for="gubun-8">SUV/RV</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="9" id="gubun-9"/>
						<label for="gubun-9">
							<span style="color: #f7501c; font-weight: 500 !important;">화물</span><span style="font-weight: 500 !important;">/승합</span>	
						</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="green" id="gubun-green" />
						<label for="gubun-green" class="primary" style="font-weight:500 !important;">친환경차</label>
					</td>
				</tr>
				<tr>
					<th>연료</th>
					<td>
						<input type="radio" name="fuelKd" value="" checked id="fuelKd-all"/>
						<label for="fuelKd-all">전체</label>
					</td>
					<td>
						<input type="radio" name="fuelKd" value="1" id="fuelKd-1"/>
						<label for="fuelKd-1">가솔린</label>
					</td>
					<td>
						<input type="radio" name="fuelKd" value="Y" id="fuelKd-Y"/>
						<label for="fuelKd-Y">디젤</label>
					</td>
					<td>
						<input type="radio" name="fuelKd" value="2" id="fuelKd-2"/>
						<label for="fuelKd-2">LPG</label>
					</td>
					<td>
						<input type="radio" name="fuelKd" value="3"  id="fuelKd-3"/>
						<label for="fuelKd-3">하이브리드</label>
					</td>
					<td>
						<input type="radio" name="fuelKd" value="5" id="fuelKd-5"/>
						<label for="fuelKd-5">
							전기/수소
						</label><br/>
					</td>
				</tr>
				<tr>
					<th>제조사</th>
					<td>
						<input type="radio" name="companyName" value="" checked id="company-all"/>
						<label for="company-all">전체</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0001" id="company-0001" />
						<label for="company-0001">현대</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0002" id="company-0002"/>
						<label for="company-0002">기아</label>
					</td>
					<td colspan="2">
						<input type="radio" name="companyName" value="0004" id="company-0004"/>
						<label for="company-0004">한국GM(쉐보레)</label>
					</td>
					<td>
						<input type="radio" name="companyName" value="0005" id="company-0005"/>
						<label for="company-0005">쌍용</label>
					</td>	
					<td>
						<input type="radio" name="companyName" value="0003" id="company-0003"/>
						<label for="company-0003">르노삼성</label>
					</td>
					<%-- <td></td> --%>
					<td></td>
				</tr>
				<%-- <tr class="multiple-line">
					<th>차종</th>
					<td>
						<input type="radio" name="carGubun" value="" checked id="gubun-all"/>
						<label for="gubun-all">전체</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="3L" id="gubun-3L"/>
						<label for="gubun-3L">중형·소형승용(LPG)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="4L" id="gubun-4L"/>
						<label for="gubun-4L">대형승용(LPG)</label>
					</td>
					<td colspan="2">						
						<input type="radio" name="carGubun" value="30" id="gubun-30"/>
						<label for="gubun-30">중형승용(가솔린,디젤)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="40"  id="gubun-40"/>
						<label for="gubun-all">대형승용(가솔린,디젤)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="12" id="gubun-12"/>
						<label for="gubun-12">소형승용/경승용(가솔린,디젤)</label>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>					
				</tr>
				<tr class="multiple-line">
					<th></th>
					<td></td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="8"  id="gubun-8"/>
						<label for="gubun-8">RV</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="9" id="gubun-9"/>
						<label for="gubun-9">
							<span style="color: #f7501c; font-weight: 500 !important;">화물</span><span style="font-weight: 500 !important;">/승합</span>													
						</label><br/>
					</td>
					<td>
						<input type="radio" name="carGubun" value="green" id="gubun-green" />
						<label for="gubun-green" class="primary" style="font-weight:500 !important;">친환경차</label>
					</td>
					<td></td>
					<td></td>
				</tr> --%>
				<%-- <tr>
					<th>연간 약정운행거리</th>
					<td>
						<input type="radio" name="agreeDist" checked value="20000" id="dist-2"/>
						<label for="dist-2">20,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="30000" id="dist-3"/>
						<label for="dist-3">30,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="40000" id="dist-4" />
						<label for="dist-4">40,000km</label>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr> --%>
				<tr>
					<th>연간 약정운행거리</th>
					<td>
						<input type="radio" name="agreeDist" checked value="10000" id="dist-1"/>
						<label for="dist-1">10,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="15000" id="dist-2"/>
						<label for="dist-2">15,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="20000" id="dist-3"/>
						<label for="dist-3">20,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="25000" id="dist-4"/>
						<label for="dist-4">25,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="30000" id="dist-5"/>
						<label for="dist-5">30,000km</label>
					</td>
					<td>
						<input type="radio" name="agreeDist" value="40000" id="dist-6" />
						<label for="dist-6">40,000km</label>
					</td>
					<td>
						<div class="col-md-12 col-xs-12" style="cursor: pointer;">
			        		<div class="col-md-12 col-xs-12" style="width: 270px; float: right; padding: 0px;">
			        			<div style="border: 2px solid #f98460; background-color: #f98460; height: 30px; width: 220px; text-align: center; display: flex; justify-content: center; align-items: center;">
									<a class="minus_mileage" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');" style="color: #f98460; font-size: 14px; color: #ffffff">약정이하 운행 시 Km당  대여료 환급</a>
								</div>
			        		</div>
			        	</div>
					</td>
				</tr>
				<tr>
					<th>
						월대여료
					</th>
					<td colspan="8">
						<div class="filter-condition" style="float: left; padding-right: 30px;">
							<select name="priceSearch" style="width:130px;">
								<option value="">금액 전체</option>
							 	<option value="20">20만원대</option>
							 	<option value="30">30만원대</option>
							 	<option value="40">40만원대</option>
							 	<option value="50">50만원대</option>
							 	<option value="60">60만원대</option>
							 	<option value="70">70만원~100만원</option>
							 	<option value="100">100만 이상</option>
						 	</select>
							<select style="width:130px;" name="priceStd">
								<option value="36">36개월 견적기준</option>
								<option value="48" selected>48개월 견적기준</option>
								<option value="60">60개월 견적기준</option>
							</select>
						</div>
						<div class="filter-condition" style="float: left; padding-right: 30px;">
							<span class="bold" style="padding-right: 20px;">차명</span>
							<select class="selectCarName" name="carName" id="carName-search">
								<option value="">차명 전체</option>
								<c:forEach var="item" items="${searchList}" varStatus="status">
									<option value="${item.AB_NM}">[${item.COM_NM}] ${item.AB_NM}</option>
								</c:forEach>
							</select>
						</div>
						<%-- <div class="filter-condition" style="float: left;">
							<span class="bold" style="padding-right: 20px;">연료</span>
							<select class="selectFuelKd" name="fuelKd" id="fuelKd-search" style="width: 140px;">
								<option value="">연료 전체</option>
								<c:forEach var="fk_item" items="${searchFuelKdList}" varStatus="status">
									<option value="${fk_item.FUEL_KD}">${fk_item.FUEL_KD_NM}</option>
								</c:forEach>
								<!-- <option value="0">휘발유</option> -->
							</select>
						</div> --%>
					</td>
					<%-- <td class="bold">차명</td>
					<td colspan="2">
						<div class="filter-condition">
							<select class="selectCarName" name="carName" id="carName-search">
								<option value="">차명 전체</option>
								<c:forEach var="item" items="${searchList}" varStatus="status">
									<option value="${item.CAR_NM}">[${item.COM_NM}]${item.CAR_NM}</option>
								</c:forEach>
							</select>
						</div>
					</td> --%>
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
	<table class="rent-list tablesorter sticky-enabled main-list">
		<colgroup>
			<col width="13%"/>
			<col width="13%"/>
			<col width="6%"/>
			<col width="6%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="7%"/>
		</colgroup>
		<thead>
			<tr class="rent-list-title" style="background-color: #F6F6F6; border-top: 0px;" onmouseover="this.style.cursor='default'">
				<th colspan="15" class="rent-list-title">
					<div style="float:left;width:100%;">
						<!-- <span style="float:left;">※ 보증금 20% 기준 (단, 차가 4500만원 초과 시 25%)</span> -->
						<!-- <span style="float:left;">※ 보증금 20% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;<span class="label label-success label-green" onmouseover="this.style.cursor='default'">상세보기</span>&nbsp;&nbsp;참조 )</span> -->
						<span style="float:left;">※ 보증금 20% 기준 ( 보증금에 따라 대여요금이 변동됨,&nbsp;&nbsp;상세페이지&nbsp;참조 )</span>
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
				<th colspan="5" class="rent-list-rightest-item">차량 정보</th>
				<th colspan="11">리스 월대여료(원, VAT 별도)</th>
			</tr>
			<tr onmouseover="this.style.cursor='default'">
				<th rowspan="2">차명</th>
				<th rowspan="2">구분</th>
				<th rowspan="2">변속기</th>
				<th rowspan="2">연료</th>
				<th rowspan="2" class="rent-list-rightest-item">차량가격<br/>(만원)</th>
				<th colspan="3" class="rent-list-rightest-item">정비 미포함(기본식)&nbsp;&nbsp;
					<span data-toggle="modal" data-target="#info-modal" class="glyphicon glyphicon-question-sign info-modal-btn" value="4"></span>
				</th>
				<th colspan="3">정비 포함(일반식)&nbsp;&nbsp;
					<span data-toggle="modal" data-target="#info-modal" class="glyphicon glyphicon-question-sign info-modal-btn" value="3"></span>
				</th>
				<th></th>
			</tr>
			<tr onmouseover="this.style.cursor='default'">
				<th class="sorter-false">60개월</th>
				<th class="sorter-false">48개월</th>
				<th class="sorter-false rent-list-rightest-item">36개월</th>
				<th class="sorter-false">60개월</th>
				<th class="sorter-false">48개월</th>
				<th class="sorter-false">36개월</th>
				<th class="sorter-false"></th>
			</tr>
		</thead>
		<tbody>
			<%-- <c:if test="${(param.carGubun ne '3L') && (param.carGubun ne '4L')}"> --%>
			<c:if test="${fn:length(list) == 0}">
		        <tr style="height:80px;">
		        	<td colspan="12" style="text-align:center;">검색 결과가 없습니다.</td>
		        </tr>
		    </c:if>
			<c:forEach var="data" items="${list}" varStatus="status">
				<c:if test="${data.LB36_AMT != '-1'}">
					<tr>
						<td param="${data.SEQ}:${data.RB36_ID}" onmouseover="this.style.cursor='default'" onclick="event.cancelBubble=true">
							<%-- <c:if test="${data.JG_G_35 > 0}">
								<div style="padding-bottom: 10px;">
									<span class="label" style="background-color: #407ce8; letter-spacing: 1px;">인기차종</span>
								</div>
							</c:if> --%>
							<c:if test="${data.JG_G_35 eq 1}">
								<div style="padding-bottom: 10px;">
									<!-- <span class="label" style="background-color: #407ce8; letter-spacing: 1px;">인기차종</span> -->									
									<span style="font-size: 9px; font-style: italic; font-weight: bold;">
										<img src="/resources/images/medal_1.png" style="width: 20px; height: 20px;">
										&nbsp;인기
									</span>
								</div>
							</c:if>
							<c:if test="${data.JG_G_35 eq 2}">
								<div style="padding-bottom: 10px;">									
									<span style="font-size: 9px; font-style: italic; font-weight: bold;">
										<img src="/resources/images/new_2.png" style="width: 20px; height: 20px;">
										&nbsp;신규차종
									</span>
								</div>
							</c:if>
							<c:if test="${data.JG_G_35 eq 12}">
								<div style="padding-bottom: 10px;">									
									<span style="font-size: 9px; font-style: italic; font-weight: bold;">
										<img src="/resources/images/medal_1.png" style="width: 20px; height: 20px;">
										&nbsp;인기
									</span>
									&nbsp;
									<span style="font-size: 9px; font-style: italic; font-weight: bold;">
										<img src="/resources/images/new_2.png" style="width: 20px; height: 20px;">
										&nbsp;신규차종
									</span>
								</div>
							</c:if>
							${data.CAR_NM}
							<input type="hidden" class="list-comp-nm" value="${data.COM_NM}">
							<c:if test="${data.JG_G_7 <= 4 && data.JG_G_7 >= 1}">
								<br/>
								<a href="/rent/green/desc#tab_price" target="_self" style="text-decoration:none;">
									<span class="label label-success label-green" style="font-size:12px;">친환경차&nbsp;<img src="/resources/images/icon_green_desc.png" style="margin-top:-3px;"></span>
								</a>
							</c:if>
							<!-- 화물차 모달 추가 -->								
							<%-- <c:if test="${data.CAR_KIND == '화물' && data.CAR_NM != '코란도스포츠'}">
								<br/>
								<!-- <a class="van-modal-btn" id="van-modal-btn" data-toggle="modal" data-target="#van-modal"> -->
								<a class="van-modal-btn" id="van-modal-btn">		
									<span class="label label-green" style="font-size:12px; background-color: #f98460;" data-toggle="modal" data-target="#van-modal">화물차&nbsp;<img src="/resources/images/icon_orange_desc.png" style="margin-top:-3px;"></span>										
								</a>	
							</c:if> --%>
						</td>
						<c:if test="${data.CAR_KIND != '화물'}">
							<td>${data.CAR_NAME}</td>
							<td>${data.AUTO}</td>
							<td>${data.DIESEL}</td>
							<td class="rent-list-rightest-item-light">
								<fmt:formatNumber value="${data.O_1_2}" pattern="#,###" />
								<%-- <c:choose>
									<c:when test="${data.DUTY_FREE_OPT eq 0}">
										<c:choose>
											<c:when test="${data.CAR_COMP_ID eq 1}">
												<fmt:formatNumber value="${data.O_1_2}" pattern="#,###" />
												<br>
												<c:set var="TextValue" value="${data.L_HYUNDAI_DUTY_FREE_AMT}"/>
												<span style="font-size: 13px; font-weight: 500;">
													(면세가 <fmt:formatNumber value="${fn:substring(TextValue, 0, 4)}" pattern="#,###" />)
												</span>
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${data.O_1_2}" pattern="#,###" />
												<br>
												<c:set var="TextValue" value="${data.L_DUTY_FREE_AMT}"/>
												<span style="font-size: 13px; font-weight: 500;">
													(면세가 <fmt:formatNumber value="${fn:substring(TextValue, 0, 4)}" pattern="#,###" />)
												</span>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<fmt:formatNumber value="${data.O_1_2}" pattern="#,###" />
									</c:otherwise>
								</c:choose> --%>
							</td>
							<td id="${data.LB60_ID}" class="list-price" style="color: #16519c !important;"><fmt:formatNumber value="${data.LB60_AMT}" pattern="#,###" /></td>
							<td id="${data.LB48_ID}" class="list-price"><fmt:formatNumber value="${data.LB48_AMT}" pattern="#,###" /></td>
							<td id="${data.LB36_ID2}" class="list-price rent-list-rightest-item-light"><fmt:formatNumber value="${data.LB36_AMT}" pattern="#,###" /></td>
							
							<td id="${data.LS60_ID}" class="list-price" style="color: #16519c !important;">
								<c:choose>
									<c:when test="${data.LS60_AMT > 0}">
										<fmt:formatNumber value="${data.LS60_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>
							<td id="${data.LS48_ID}" class="list-price">
								<c:choose>
									<c:when test="${data.LS48_AMT > 0}">
										<fmt:formatNumber value="${data.LS48_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>								
							<td id="${data.LS36_ID}" class="list-price">
								<c:choose>
									<c:when test="${data.LS36_AMT > 0}">
										<fmt:formatNumber value="${data.LS36_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<span class="detail-span detail-new" param="${data.SEQ}:${data.RB36_ID}">
									<!-- <img src="/resources/images/right-arrow.png"  title="상세보기" /> -->
									<span class="label label-success label-green">상세보기</span>
								</span>
							</td>
						</c:if>
						<c:if test="${data.CAR_KIND == '화물'}">
							<td class="test" param="${data.SEQ}:${data.RB36_ID}">${data.CAR_NAME}</td>
							<td class="test" param="${data.SEQ}:${data.RB36_ID}">${data.AUTO}</td>
							<td class="test" param="${data.SEQ}:${data.RB36_ID}">${data.DIESEL}</td>
							<td class="rent-list-rightest-item-light test" param="${data.SEQ}:${data.RB36_ID}"><fmt:formatNumber value="${data.O_1_2}" pattern="#,###" /></td>
							<td id="${data.LB60_ID}" class="list-price test" param="${data.SEQ}:${data.RB36_ID}" style="color: #16519c !important;"><fmt:formatNumber value="${data.LB60_AMT}" pattern="#,###" /></td>
							<td id="${data.LB48_ID}" class="list-price test" param="${data.SEQ}:${data.RB36_ID}"><fmt:formatNumber value="${data.LB48_AMT}" pattern="#,###" /></td>
							<td id="${data.LB36_ID2}" class="list-price test rent-list-rightest-item-light" param="${data.SEQ}:${data.RB36_ID}"><fmt:formatNumber value="${data.LB36_AMT}" pattern="#,###" /></td>
							
							<td id="${data.LS60_ID}" class="list-price test" param="${data.SEQ}:${data.RB36_ID}" style="color: #16519c !important;">
								<c:choose>
									<c:when test="${data.LS60_AMT > 0}">
										<fmt:formatNumber value="${data.LS60_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>
							<td id="${data.LS48_ID}" class="list-price test" param="${data.SEQ}:${data.RB36_ID}">
								<c:choose>
									<c:when test="${data.LS48_AMT > 0}">
										<fmt:formatNumber value="${data.LS48_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>								
							<td id="${data.LS36_ID}" class="list-price test" param="${data.SEQ}:${data.RB36_ID}">
								<c:choose>
									<c:when test="${data.LS36_AMT > 0}">
										<fmt:formatNumber value="${data.LS36_AMT}" pattern="#,###" />
									</c:when>
									<c:otherwise>
										미운영
									</c:otherwise>
								</c:choose>
							</td>
							<td class="test">
								<span class="detail-span detail-new" param="${data.SEQ}:${data.RB36_ID}">
									<!-- <img src="/resources/images/right-arrow.png"  title="상세보기" /> -->
									<span class="label label-success label-green">상세보기</span>
								</span>
							</td>
						</c:if>
					</tr>
				</c:if>
			</c:forEach>
			<%-- </c:if> --%>
			<%-- <c:if test="${(param.carGubun eq '3L') || (param.carGubun eq '4L')}">
					<tr>
						<td colspan="12" style="text-align:center;">장기렌트로만 이용 가능한 차종입니다.</td>
					</tr>
			</c:if> --%>
		</tbody>
	</table>
	<%@include file="/WEB-INF/jsp/common/compareWindow.jsp"%> <!-- 비교견적 창 -->
	<input type="hidden" id="typeForCookie" value="국산신차" />
	<input type="hidden" id="urlForCookie" value="/lease/domestic/detail" />
	<!--  hidden form -->
	<form id="detailFrm" action="/lease/domestic/detail" method="get">
		<input type="hidden" id="seq" name="seq" />
		<input type="hidden" id="estimateId" name="estimateId" />
		<input type="hidden" id="agreeDist" name="agreeDist" value="20000" />
	</form>
	<%@include file="/WEB-INF/jsp/common/info-modal.jsp"%> <!-- 일반식/기본식 안내 팝업 -->
	<%@include file="/WEB-INF/jsp/common/van-modal.jsp"%> <!-- 화물차 리스 안내 모달 -->
</t:genericpage>