<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<jsp:useBean id="toDay" class="java.util.Date" />
<t:genericpage>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.widgets.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<style>
.map {
	width: 870px !important;
}
.print-btn{
	display: none !important;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4419b2a3a6bac750d7b19ffd37d7b995"></script>
<script>
//지도 생성 공통 function
function createMap(mapId) {
	
	var lat = $("#"+mapId).attr("param").split(":")[0];
	var lng = $("#"+mapId).attr("param").split(":")[1];
  	
  	var container = document.getElementById(mapId);
	var options = {
		center: new daum.maps.LatLng(lat, lng),
		level: 2
	};

	var map = new daum.maps.Map(container, options);
	
	var markerPosition  = new daum.maps.LatLng(lat, lng); 
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);  	
}

$(document).ready(function () {
	
	$("[role='tab']").click(function(){
		$('.map').css("visibility", "hidden");

		var target = $(this).attr("aria-controls");
		var targetMap = $(this).attr("aria-controls") + "-map";

		$("#"+targetMap).css("visibility", "visible");
		$("#"+targetMap).css("height", "400px");
		
		createMap(targetMap);
	});
	
	$('#rent_desc').click(function(){
		location.href = "/rent/month/desc";
	});
	
	$('#branch_detail').click(function(){
		location.href = "/company/branch";
	});
	
	$('#branch-modal').on('shown.bs.modal', function(){
		$('.map').css("visibility", "hidden");
		$('.branch-tab a:first').tab('show');
		
		var target = $('.branch-tab a:first').attr("aria-controls");
		var targetMap = $('.branch-tab a:first').attr("aria-controls") + "-map";

		$("#"+targetMap).css("visibility", "visible");
		$("#"+targetMap).css("height", "400px");
		
		createMap("yeoido-map");
	});
	
	$('#garage-modal').on('shown.bs.modal', function(){
		$('.map').css("visibility", "hidden");
		$('.garage-tab a:first').tab('show');
		
		var target = $('.garage-tab a:first').attr("aria-controls");
		var targetMap = $('.garage-tab a:first').attr("aria-controls") + "-map";

		$("#"+targetMap).css("visibility", "visible");
		$("#"+targetMap).css("height", "400px");
		
		createMap("yeongnam2-map");
	});

	$(function() {		
		$(".rent-list").tablesorter({
	        headers: {
	        	0:{sorter:false},
	        	1:{sorter:false},
	        	2:{sorter:false},
	        	3:{sorter:false},
	        	4:{sorter:'date'},
	        	5:{sorter:'dist'},
	        	6:{sorter:true},
	            7:{sorter:'price'},
	            8:{sorter:false}
	        }
	    });
	});
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
}
.cutom-button {
	background-color: #6C7382 !important;
	color: #FFF !important;
	border-color: #6C7382 !important;
    padding: 6px !important;
    font-size: 75% !important;
    font-weight: bold !important;
    line-height: 1 !important;
    color: #FFF !important;
    text-align: center !important;
    white-space: nowrap !important;
    vertical-align: baseline !important;
    border-radius: .25em !important;
}
.cutom-button:hover {
    color: #FFF !important;
    background-color: #6C7382 !important;
    border-color: #6C7382 !important;
}
.cutom-button:hover, .cutom-button:focus, .cutom-button.focus {
    color: #FFF !important;
    background-color: #6C7382 !important;
    border-color: #6C7382 !important;
    text-decoration: none !important;
}
.cutom-button:focus {
    color: #FFF !important;
    background-color: #6C7382 !important;
    border-color: #6C7382 !important;
}
</style>
<input type="hidden" name="searchCondition" id="search_carGubun" value="${param.carGubun}"/>
<input type="hidden" name="searchCondition" id="search_region" value="${param.region}"/>
<input type="hidden" name="searchCondition" id="search_carStatus" value="${param.carStatus}"/>
<!-- <input type="hidden" name="searchCondition" id="search_carStatus" value="1"/> -->

<!--
<div id="bck-car" style="opacity: 0.9 !important;">
	<img src="/resources/images/img_visual_car_month3.png" style="width: 430px;">
</div>
-->
	<div class="amazon-tab-container">
		<div class="detail-title">
			<h1 style="float: none !important;">월렌트&nbsp;&nbsp;<small id="rowsCnt"></small></h1>
		</div>
		<div class="amazon-tab-info" style="margin-top: 20px;">
			<div class="amazon-tab-info-title">아마존카의 월렌트는?</div>
    		<div class="amazon-tab-info-content" style="height: 30px;">
    			1개월 단위로 이용할 수 있는 렌트 상품입니다.&nbsp;&nbsp; 
				<span class="label label-warning rent-desc" id="rent_desc">상세 보기</span>
    		</div>
    		<div class="amazon-tab-info-content" style="height: 30px;">
    			아마존카의 수도권 및 지역별 월렌트 차량수령 방문위치를 안내드립니다.
    			&nbsp;&nbsp;
   				<!-- <input type="button" class="btn btn-default cutom-button" value="지점 안내" data-toggle="modal" data-target="#branch-modal">
    			&nbsp;&nbsp;&nbsp; -->
   				<input type="button" class="btn btn-default cutom-button" value="월렌트 차량수령 방문위치 안내" data-toggle="modal" data-target="#garage-modal">
    		</div>
    		<div class="amazon-tab-info-content" style="height: 50px;">
    			계약 준비 시 필요한 서류와 계약서 작성 시 필요한 준비물 입니다.&nbsp;&nbsp;
    			<input type="button" class="btn btn-default cutom-button" value="필요서류 안내" data-toggle="modal" data-target="#monthrent-modal">
    		</div>
    		
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
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
				</colgroup>
				<tr class="multiple-line">
					<th>차종</th>
					<td>
						<input type="radio" name="carGubun" value="" checked id="gubun-all">
						<label for="gubun-all">전체</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="5" id="gubun-5">
						<label for="gubun-5">중형·소형승용(LPG)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="4" id="gubun-4">
						<label for="gubun-4">대형승용(LPG)</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="3" id="gubun-3">
						<label for="gubun-3">소형·경승용(가솔린,디젤)</label>
					</td>
				</tr>
				<tr class="multiple-line">
					<th></th>
					<td></td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="2" id="gubun-2">
						<label for="gubun-2">중형승용(가솔린,디젤)</label> 
					</td>
					<td colspan="2">
						<input type="radio" name="carGubun" value="1" id="gubun-1">
						<label for="gubun-1">대형승용(가솔린,디젤)</label> 
					</td>
					<td>
						<input type="radio" name="carGubun" value="6" id="gubun-6">
						<label for="gubun-6">RV</label>
					</td>
					<td>
						<input type="radio" name="carGubun" value="green" id="gubun-green">
						<label for="gubun-green" class="primary" style="font-weight: 500 !important;">친환경차</label>
					</td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<input type="radio" name="region" value="All" id="region-all"/>
						<label for="region-all">전체</label>
					</td>
					<td>
						<input type="radio" name="region" value="S1" checked id="region-S1"/>
						<label for="region-S1">수도권</label>
					</td>
					<td>
						<input type="radio" name="region" value="D1" id="region-D1"/>
						<label for="region-D1">대전</label>
					</td>
					<td>
						<input type="radio" name="region" value="G1" id="region-G1"/>
						<label for="region-G1">대구</label>
					</td>
					<td>
						<input type="radio" name="region" value="J1" id="region-J1"/>
						<label for="region-J1">광주</label>
					</td>
					<td>
						<input type="radio" name="region" value="B1" id="region-B1"/>
						<label for="region-B1">부산</label>
					</td>					
				</tr>
				<tr>
					<th>대기상황</th>
					<td>
						<input type="radio" name="carStatus" value="1" checked id="status-1"/>
						<label for="status-1">예약가능차량</label>
					</td>
					<td colspan="2">
						<input type="radio" name="carStatus" value="2"  id="status-2"/>
						<label for="status-2">입고예정차량</label>
					</td>
				</tr>
			</table>
		</div>
	</form>
	<!-- 리스트 안내 -->
	<div style="float:left; width:100%;">
		<!-- <span class="bold">※ 상세페이지에서 차량예약이 가능합니다.</span> -->
		<c:choose>
			<c:when test="${param.carStatus eq 2}">
				<span class="bold">※ 입고예정차량은 차량예약이 불가능합니다.</span>
			</c:when>
			<c:otherwise>
				<span class="bold">※ 상세페이지에서 차량예약이 가능합니다.</span>
			</c:otherwise>
		</c:choose>
		<br />
		<span style="float:right;">
			<fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일 " /> 현재
		</span>
	</div>	
	<!-- 리스트 -->
	<table class="rent-list tablesorter sticky-enabled" id="month-list">
		<colgroup>
			<col width="3%"/>
			<col width="22%"/>
			<col width="9%"/>
			<col width="20%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="9%"/>
			<col width="10%"/>
			<col width="7%"/>
		</colgroup>
		<thead>
			<tr>
				<th></th>
				<th>차량 정보</th>
				<th class="fuel filter-select" data-placeholder="전체">연료</th>
				<th>색상</th>
				<th class="price-sort">
					신차등록일&nbsp;
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span>
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span>
				</th>
				<th class="price-sort">
					주행거리&nbsp;
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span>
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span>
				</th>
				<th class="region filter-select price-sort"" data-placeholder="전체">
					지역&nbsp;
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span>
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span>
				</th>
				<th id="price" class="price-sort">월 대여료&nbsp;
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-down"></span>
					<span name="sorting-arrow" class="glyphicon glyphicon-chevron-up" style="display:none"></span>
					<br/><small>(VAT 별도)</small>
				</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(list) == 0}">
		        <tr style="height:80px;">
		        	<td colspan="9" style="text-align: center;">검색결과가 없습니다.</td>
		        </tr>
		    </c:if>
			<c:forEach var="data" items="${list}" varStatus="status">
				<tr style="height:80px;">
					<td>${status.index+1}</td>
					<td>
						${data.CAR_NAME}&nbsp;<small>(${data.AB_CAR_NO})</small><br/>
						<%-- <c:if test="${data.ST1 == '즉시가능'}">		<span class="label label-warning">${data.ST1}</span>	</c:if> --%>
						<c:if test="${data.ST1 == '즉시가능'}"><span class="label label-warning">예약가능</span></c:if>
						<c:if test="${data.ST1 == '3일이내'}"><span class="label label-default">${data.ST1}</span></c:if>
						<span class="label label-success">${data.ST2}</span>
						<span class="label label-primary">${data.ST3}</span>
						<span class="label label-primary">${data.ST4}</span>
						<span class="label label-primary">${data.ST5}</span>
					</td>
					<td>${data.FUEL_KD}</td>
					<td>
						<c:choose>
							<c:when test="${fn:contains(data.COL,'(')}">
								${fn:substringBefore(data.COL,"(")}
							</c:when>
							<c:otherwise>
								${data.COL}
							</c:otherwise>
						</c:choose>
					</td>
					<td>${data.INIT_REG_DT}</td>
					<td><fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km</td>
					<td>
						<c:choose>
							<c:when test="${empty data.BR_NM}">수도권</c:when>
							<c:otherwise>${data.BR_NM}</c:otherwise>
						</c:choose>
					</td>
					<td class="price list-price">
						<fmt:formatNumber value="${data.RM1}" pattern="#,###" />
					</td>
					<td>
						<span class="detail-span detail-month" param="${data.RENT_MNG_ID}:${data.RENT_L_CD}:${data.CAR_MNG_ID}:${data.BR_ID}:${param.carStatus}"><!-- onclick="javascript:openDetail(<c:out value="${data.detailLink}"/>)" -->
							<!-- <img src="/resources/images/right-arrow.png"  title="상세보기" /> -->
							<span class="label label-success label-green">상세보기</span>
						</span>
						<input type="hidden" class="carId" value="${data.CAR_MNG_ID}">
						<input type="hidden" class="carId" value="${data.RENT_L_CD}">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="hidden" id="typeForCookie" value="월렌트" />
	<!--  hidden form -->
	<form id="detailFrm" action="/rent/month/detail" method="get">
		<input type="hidden" id="carManagedId" name="carManagedId" />
		<input type="hidden" id="rentManagedId" name="rentManagedId" />
		<input type="hidden" id="rentLocationCode" name="rentLocationCode"/>
		<input type="hidden" id="locationId" name="locationId"/>
		<input type="hidden" id="carStat" name="carStat"/>
	</form>
	
	<%@include file="/WEB-INF/jsp/common/monthRent-modal.jsp"%>
	
	<!-- 지점 Modal -->
	<div class="modal fade" id="branch-modal" tabindex="-1" role="dialog" aria-labelledby="branch-modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
		   	<div class="modal-content">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h2 class="primary">아마존카 지점 위치 및 연락처</h2>
		     	</div>
		     	<div class="modal-body" id="document-body">			
				아마존카는 여의도 본사와 각 지역별 지점을 통해 신속하고 편리한 서비스를 제공하고 있습니다.			
				<div role="tabpanel" style="margin-top:30px;">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs branch-tab" role="tablist">
						<li role="presentation" class="active"><a href="#yeoido" aria-controls="yeoido" role="tab" data-toggle="tab">여의도</a></li>
						<li role="presentation"><a href="#kangbuk" aria-controls="kangbuk" role="tab" data-toggle="tab">광화문</a></li>
						<li role="presentation"><a href="#kangnam" aria-controls="kangnam" role="tab" data-toggle="tab">강남</a></li>
						<li role="presentation"><a href="#songpa" aria-controls="songpa" role="tab" data-toggle="tab">송파</a></li>
						<li role="presentation"><a href="#incheon" aria-controls="incheon" role="tab" data-toggle="tab">인천</a></li>
						<li role="presentation"><a href="#suwon" aria-controls="suwon" role="tab" data-toggle="tab">수원</a></li>
						<li role="presentation"><a href="#daejeon" aria-controls="daejeon" role="tab" data-toggle="tab">대전</a></li>
						<li role="presentation"><a href="#daegu" aria-controls="daegu" role="tab" data-toggle="tab">대구</a></li>
						<li role="presentation"><a href="#kwangju" aria-controls="kwangju" role="tab" data-toggle="tab">광주</a></li>
						<li role="presentation"><a href="#busan" aria-controls="busan" role="tab" data-toggle="tab">부산</a></li>
						<!-- <li role="presentation"><a href="#mokdong" aria-controls="mokdong" role="tab" data-toggle="tab">목동주차장</a></li> -->
						<li role="presentation"><a href="#yeongdeungpo" aria-controls="yeongdeungpo" role="tab" data-toggle="tab">영등포주차장</a></li>
					</ul>
				  
					<div id="yeoido-map" class="map" param="37.5279638089915:126.91684811693078" style="visibility:visible !important;"></div>
					<div id="kangbuk-map" class="map" param="37.57273813999365:126.97326227387964"></div>
					<!-- <div id="kangnam-map" class="map" param="37.505249:126.999975"></div> -->
					<div id="kangnam-map" class="map" param="37.509101286325034:127.00141096429779"></div>
					<div id="songpa-map" class="map" param="37.487616028234825:127.1312018471967"></div>
					<div id="incheon-map" class="map" param="37.53878665573568:126.7358218881052"></div>
					<div id="suwon-map" class="map" param="37.25883152133832:126.96264473627446"></div>
					<div id="daejeon-map" class="map" param="36.43027720558101:127.42325831421981"></div>
					<div id="daegu-map" class="map" param="35.84301135490591:128.48752119713163"></div>
					<div id="kwangju-map" class="map" param="35.15743978186667:126.84906381169614"></div>
					<div id="busan-map" class="map" param="35.19056627952396:129.08704238480132"></div>
					<!-- <div id="mokdong-map" class="map" param="37.530639:126.878489"></div> -->
					<div id="yeongdeungpo-map" class="map" param="37.519501502723806:126.9025818892609"></div>
				  	
					<!-- Tab panes -->
					<div class="tab-content">
						<!-- 여의도 -->
					   	<div role="tabpanel" class="tab-pane active" id="yeoido">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (07236) 서울특별시 영등포구 의사당대로 8, 802 (여의도동, 태흥빌딩)</dd>
								<dd>지번 : (07236) 서울특별시 영등포구 여의도동 17-3 태흥빌딩 8층</dd>
								<dt>TEL</dt>
								<dd>대여이용안내 / 견적신청문의 / 계약문의 : 02-757-0802</dd>
								<dd>차량정비 / 정비서비스 / 사고처리 / 대차서비스 : 02-392-4242</dd>
								<dd>대여료 납입 / 세무, 회계처리 / 직원채용 : 02-392-4243</dd>
								<dt>FAX</dt>
								<dd>02-757-0803</dd>
							</dl>
					   	</div>
					   	<!-- 강북 -->
					   	<div role="tabpanel" class="tab-pane" id="kangbuk">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (03173) 서울특별시 종로구 새문안로 3길 30, 910호 (세종로대우빌딩)</dd>
								<dd>지번 : (03173) 서울특별시 종로구 내수동 167 세종로대우빌딩 910호</dd>
								<dt>TEL</dt>
								<dd>02-2038-8661</dd>
								<dt>FAX</dt>
								<dd>02-2038-8540</dd>
							</dl>
					   	</div>
					
					   	<div role="tabpanel" class="tab-pane" id="kangnam">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<!-- <dd>도로명: (06506) 서울 서초구 신반포로 137, 13호 (반포동, 반포경남쇼핑센타 5층)</dd>
								<dd>지번 : (06506) 서울 서초구 반포동 1-8 3번지 반포경남쇼핑센타 5층 13호</dd> -->
								<dd>도로명: (06509) 서울 서초구 신반포로23길 41 (잠원동,  잠원쇼핑센타 305호)</dd>
								<dd>지번 : (06509) 서울 서초구 잠원동 73번지 잠원쇼핑센타 305호</dd>
								<dt>TEL</dt>
								<dd>02-537-5877</dd>
								<dt>FAX</dt>
								<dd>02-537-5977</dd>
							</dl>    
						</div>
						
						<div role="tabpanel" class="tab-pane" id="songpa">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (05800) 서울특별시 송파구 새말로19길 20, 301호(문정동, 일청빌딩)</dd>
								<dd>지번 : (05800) 서울특별시 송파구 문정동 115-6번지 일청빌딩 3층 301호</dd>
								<dt>TEL</dt>
								<dd>02-2038-2492</dd>
								<dt>FAX</dt>
								<dd>02-2038-6786</dd>
							</dl>    
					   	</div>
					   
					   	<div role="tabpanel" class="tab-pane" id="incheon">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (21060) 인천광역시 계양구 계산새로 71, C동 712-1호(하이베라스빌딩)</dd>
								<dd>지번 : (21060) 인천광역시 계양구 계산동 1062번지 하이베라스 C동 7층</dd>
								<dt>TEL</dt>
								<dd>032-554-8820</dd>
								<dt>FAX</dt>
								<dd>032-719-8765</dd>
							</dl>      
					   	</div>
					   
					   	<div role="tabpanel" class="tab-pane" id="suwon">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (16630) 경기도 수원시 권선구 호매실로 104번길 24-61, 607호(호매실동, 금호프라자 제1동)</dd>
								<dd>지번 : (16630) 경기 수원시 권선구 호매실동 1400-2 금호프라자 제1동 607호</dd>
								<dt>TEL</dt>
								<dd>031-546-8858</dd>
								<dt>FAX</dt>
								<dd>031-546-8838</dd>
							</dl>      
					   	</div>
					   	
					   	<div role="tabpanel" class="tab-pane" id="daejeon">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (34344) 대전 대덕구 벚꽃길 100, 2층 (상서동, 현대카독크)</dd>
								<dd>지번 : (34344) 대전 대덕구 상서동 290번지 현대카독크 2층</dd>
								<dt>TEL</dt>
								<dd>042-824-1770</dd>
								<dt>FAX</dt>
								<dd>042-824-1870</dd>
							</dl>      
					   	</div>  
					   	
					   	<div role="tabpanel" class="tab-pane" id="daegu">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (42713) 대구광역시 달서구 호산동로 90-16, 303호(호산동, 유일빌딩)</dd>
								<dd>지번 : (42713) 대구광역시 달서구 호산동 708-5번지 유일빌딩 3층</dd>
								<dt>TEL</dt>
								<dd>053-582-2998</dd>
								<dt>FAX</dt>
								<dd>053-582-2999</dd>
							</dl>      
					   	</div> 
					   	
					   	<div role="tabpanel" class="tab-pane" id="kwangju">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (61947) 광주광역시 서구 상무중앙로 114, 207호 (랜드피아오피스텔)</dd>
								<dd>지번 : (61947) 광주광역시 서구 치평동 1202-2번지 랜드피아오피스텔 2층</dd>
								<dt>TEL</dt>
								<dd>062-385-0133</dd>
								<dt>FAX</dt>
								<dd>062-385-0775</dd>
							</dl>      
					   	</div>   
					   	
						<div role="tabpanel" class="tab-pane" id="busan">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (51418) 부산광역시 연제구 반송로 69, 3층 (연산동, 하이트빌딩)</dd>
								<dd>지번 : (51418) 부산광역시 연제구 연산1동 582-7번지 하이트빌딩 3층</dd>
								<dt>TEL</dt>
								<dd>051-851-0606</dd>
								<dt>FAX</dt>
								<dd>051-851-1036</dd>
							</dl>      
					   	</div> 
					   	
					   	<div role="tabpanel" class="tab-pane" id="mokdong">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (07990) 서울특별시 양천구 안양천로 939</dd>
								<dd>지번 : (07990) 서울특별시 양천구 목동 914-5</dd>
								<dt>TEL</dt>
								<!-- <dd>070-7500-5936</dd> -->
								<dd>02-6263-6378</dd>
								<dt>오시는 방법</dt>
								<dd>지하철 : 5호선 오목교역 하차 후, 3번출구 도보 10분 거리</dd>
								<dd>지선버스(초록) : 640, 650, 5012, 5616, 6628, 6629, 6619 오목교역에서 하차</dd>
								<dd>간선버스(파랑) : 163, 571, 603, 6620, 6621, 6624, 6627 목동운동장에서 하차</dd>
								<dd>마을버스 : 양천01, 양천 02 목동운동장에서 하차</dd>
							</dl>      
					   	</div>
					   	
					   	<div role="tabpanel" class="tab-pane" id="yeongdeungpo">
							<dl class="dl-horizontal company-dl">
								<dt>주소</dt>
								<dd>도로명: (07301)서울시 영등포구 영등포로 34길 9 영남주차장</dd>
								<dd>지번 : (07301)서울시 영등포구 영등포동4가 123 영남주차장</dd>
								<dt>TEL</dt>
								<!-- <dd>070-7500-5936</dd> -->
								<dd>02-6263-6378</dd>
								<dt>FAX</dt>		  
								<dd>02-6263-6399</dd>
								<dt>오시는 방법</dt>
								<dd>지하철 : 5호선 영등포시장역 4번출구, 1호선 영등포역 6번출구, 2호선 문래역 4번출구,</dd>
								<dd style="margin-left: 228px;">2호선·5호선 영등포구청역 6번출구</dd>
								<dd>지선버스(초록) : 5012, 5616, 5620, 6516, 6628, 6629, 6630, 6631 김안과병원에서 하차</dd>
								<dd>간선버스(파랑) : 640, 641, 650, 670, N65(심야) 김안과병원에서 하차</dd>
								<dd>일반버스 : 70-3 김안과병원에서 하차</dd>
							</dl>      
					   	</div>
					</div>
				</div>	        
		   		</div>
		    	<div class="modal-footer">
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	
	<!-- 차고지 Modal -->
	<div class="modal fade" id="garage-modal" tabindex="-1" role="dialog" aria-labelledby="garage-modal" aria-hidden="true">	
		<div class="modal-dialog modal-lg">
		   	<div class="modal-content">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h2 class="primary">월렌트 차량수령 방문위치 안내</h2>
		     	</div>
		     	<div class="modal-body" id="document-body">
				아마존카의 수도권 및 지역별 월렌트 차량수령 방문위치를 안내 드립니다.
				<div role="tabpanel" style="margin-top:30px;">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs garage-tab" role="tablist">
						<li role="presentation" class="active"><a href="#yeongnam2" aria-controls="yeongnam2" role="tab" data-toggle="tab">수도권</a></li>
						<li role="presentation"><a href="#daejeon2" aria-controls="daejeon2" role="tab" data-toggle="tab">대전</a></li>
						<li role="presentation"><a href="#daegu2" aria-controls="daegu2" role="tab" data-toggle="tab">대구</a></li>
						<li role="presentation"><a href="#kwangju2" aria-controls="kwangju2" role="tab" data-toggle="tab">광주</a></li>
						<li role="presentation"><a href="#busan2" aria-controls="busan2" role="tab" data-toggle="tab">부산</a></li>
					</ul>
				  
					<div id="yeongnam2-map" class="map" param="37.51948348268702:126.90258191268818" style="visibility: visible !important;"></div>
					<div id="daejeon2-map" class="map" param="36.43027720558101:127.42325831421981"></div>
					<div id="daegu2-map" class="map" param="35.84301135490591:128.48752119713163"></div>
					<div id="kwangju2-map" class="map" param="35.1546499498498:126.83848083588877"></div>
					<div id="busan2-map" class="map" param="35.19056627952396:129.08704238480132"></div>
				  	
					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="yeongnam2">
							<dl class="dl-horizontal company-dl">
								<dt>상호</dt>
								<dd>영남주차장</dd>
								<dt>주소</dt>
								<dd>도로명: (07301)서울시 영등포구 영등포로 34길 9 영남주차장</dd>
								<dd>지번 : (07301)서울시 영등포구 영등포동4가 123 영남주차장</dd>
								<dt>TEL</dt>
								<dd>02-6263-6378</dd>
							</dl>
					   	</div>
					   	
					   	<div role="tabpanel" class="tab-pane" id="daejeon2">
							<dl class="dl-horizontal company-dl">
								<dt>상호</dt>
								<dd>아마존카 대전지점(현대카독크)</dd>
								<dt>주소</dt>
								<dd>도로명: (34344) 대전 대덕구 벚꽃길 100, 2층 (상서동, 현대카독크)</dd>
								<dd>지번 : (34344) 대전 대덕구 상서동 290번지 현대카독크 2층</dd>
								<dt>TEL</dt>
								<dd>042-824-1770</dd>
							</dl>
					   	</div>
					   	
					   	<div role="tabpanel" class="tab-pane" id="daegu2">
							<dl class="dl-horizontal company-dl">
								<dt>상호</dt>
								<dd>아마존카 대구지점</dd>
								<dt>주소</dt>
								<dd>도로명: 대구 달서구 호산동로90-16,3층 303호(호산동,유일빌딩)</dd>
								<dd>지번 : 대구 달서구 호산동 708-5 유일빌딩 3층</dd>
								<dt>TEL</dt>
								<dd>053-582-2998</dd>
							</dl>      
					   	</div> 
					   	
					   	<div role="tabpanel" class="tab-pane" id="kwangju2">
							<dl class="dl-horizontal company-dl">
								<dt>상호</dt>
								<dd>상무1급자동차공업사</dd>
								<dt>주소</dt>
								<dd>도로명: 광주광역시 서구 상무누리로 131-1</dd>
								<dd>지번 : 광주광역시 서구 치평동 884-7</dd>
								<dt>TEL</dt>
								<dd>062-371-3444</dd>
							</dl>      
					   	</div>   
					   	
						<div role="tabpanel" class="tab-pane" id="busan2">
							<dl class="dl-horizontal company-dl">
								<dt>상호</dt>
								<dd>아마존카 부산지점</dd>
								<dt>주소</dt>
								<dd>도로명: (51418) 부산광역시 연제구 반송로 69, 3층 (연산동, 하이트빌딩)</dd>
								<dd>지번 : (51418) 부산광역시 연제구 연산1동 582-7번지 하이트빌딩 3층</dd>
								<dt>TEL</dt>
								<dd>051-851-0606</dd>
							</dl>      
					   	</div> 
					   	
					</div>
				</div>	        
		   		</div>
		    	<div class="modal-footer">
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	
</t:genericpage>