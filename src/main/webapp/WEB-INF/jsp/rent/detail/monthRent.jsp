<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<t:genericpage>
<link rel="stylesheet" href="<c:url value='/resources/stylesheets/rent.css'/>"  />
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/stylesheets/library/icomoon.css"/>
<script src="/resources/js/library/printThis.js"></script>
<script src="/resources/js/rent.js"></script>
<script>
$(document).ready(function(){
	
	var reserveRank = $('#reserveRank').val();
	if(parseInt(reserveRank) >= 3){
		$('.detail-btn-booking').prop("disabled",true);
		$('.detail-btn-booking').addClass("disabled");
		$('.rank-info').show();
	}
	
	//견적서 보기 popup 띄우기
	$('.detail-btn-print').click(function(){
		var url = "/rent/month/print?";
		
		$('form input').each(function(){
			var name = $(this).attr("name");
			var value = $(this).val();
			if(url.substring(url.length-1,url.length) != "?"){	url += "&"; }
			url += name + "=" + value ;
		})
		
		url += url = "&refer=detail";
		
		window.open(url,"popup","width=1010,height=800,top=0,left=0,scrollbars=yes");
	})
	
	//차량예약 화면으로 이동
	$('.detail-btn-booking').click(function(){
		var temp_url = window.location.href;
		var temp_param = temp_url.split("?")[1];
		var from_page = window.location.pathname + "?" + temp_param;
		if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		    //location.replace("/login?from_page=" + btoa(from_page));
		} else {	    	
			var pop_title = "esti_popup";
	    	window.open("",pop_title,"width=1200,height="+(screen.availHeight-50)+",top=0,left=0,scrollbars=yes");
	    	$("#from_page").val(btoa(from_page));
	    	$('#form').attr("target",pop_title);
			$('#form').attr("action","/reserve/month/step1");
			$('#form').attr("method","post");
			$('#form').submit();
		}		
	})
	
	$(".print-btn").click(function(){
		$('#document-body').printThis({
			pageTitle: "장기렌트의 기준-아마존카 월렌트 구비서류" 
		});
		printAnalytics(); //amazonsoft - 로그 분석을 위한 공통 함수 호출 
	})
})
</script>
<style>
.price-info table tr{
	height:50px;
}
.swiper-container {
    width: 100%;
    height: 300px;
    margin-left: auto;
    margin-right: auto;
}
.swiper-slide {
    background-size: cover;
    background-position: center;
}
.gallery-top {
	float:left;
    height: 400px;
    width: 100%;
}
.gallery-thumbs {
    height: 100px;
    box-sizing: border-box;
    padding: 10px 0;
    float:left;
}
.gallery-thumbs .swiper-slide {
    width: 25%;
    height: 100%;
    opacity: 0.4;
}
.gallery-thumbs .swiper-slide-active {
    opacity: 1;
}
</style>
    <input type="hidden" value="${type}" id="carType"/>
    
    <sec:authorize access="isAuthenticated()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="" />
	</sec:authorize>
    
	<div class="amazon-tab-container">
		<div class="detail-title">
			<h2>
			<!-- <a href="/rent/month"> -->
			<a onclick="javascript:history.go(-1);" style="cursor: pointer;">
				<img src="/resources/images/green-arrow_left.png" style="margin-top:-4px;"/>
			</a>
				&nbsp;${data.CAR_JNM}&nbsp;${data.CAR_NM}
				
			</h2>
		</div>
  	</div>    
   	<div class="sub-link-container">
		<span class="car-info-sub-link"  data-toggle="modal" data-target="#history">차량이용이력</span>
    	<!-- <span class="car-info-sub-link"  data-toggle="modal" data-target="#service">정비기록</span> -->
		<span class="car-info-sub-link"  data-toggle="modal" data-target="#accident">사고수리내역</span>
	</div>	 
  	<ul class="nav nav-tabs amazon-detail-tab" role="tablist">
	  	<li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">차량 정보</a></li>
	   	<li role="presentation"><a href="#spec" aria-controls="spec" role="tab" data-toggle="tab">사양 정보</a></li>
	</ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active month-content-box" id="info">
  		   <div class="photozone">
  		   		<c:set var="imgListSize" value="${fn:length(imageList)}"/>
  		   		<%-- <c:out value="${imgListSize}"/> --%>
				<c:choose>
			    	<c:when test="${data.SAVE_FOLDER ne null}">
			    	<%-- <c:when test="${imgListSize > 0}"> --%>
			    		<!-- Swiper -->
				    	<div class="swiper-container">
				    		<div class="swiper-wrapper">
				            <c:forEach var="image" items="${imageList}" varStatus="status">
				            	<div class="swiper-slide" style="background-image:url(https://fms3.amazoncar.co.kr${image.SAVE_FOLDER}${image.SAVE_FILE})"></div>
				            </c:forEach>
					        </div>
						   	<div class="swiper-pagination"></div>
					       	<div class="swiper-button-next"></div>
					       	<div class="swiper-button-prev"></div>
						</div>
					    <!-- Swiper JS -->
					    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
					
					    <!-- Initialize Swiper -->
					    <script>
						    var swiper = new Swiper('.swiper-container', {
						        nextButton: '.swiper-button-next',
						        prevButton: '.swiper-button-prev',
						        pagination: '.swiper-pagination'
						    });
					    </script>
			    	</c:when>
			    	<c:otherwise>
			    		<div>
			    			<img src="/resources/images/no_photo.gif"/>
			    		</div>
			    	</c:otherwise>
		        </c:choose>
		    </div>
		    <div class="car-info">
 			  	<!-- 차량 정보  -->
		    	<table>
			    	<tr>
			    		<th class="car-info-title">제조사</th>
			    		<td class="car-info-value" colspan="3">${data.CAR_COMP_NM}</td>
			    	</tr>
			    	<tr>
			    		<th class="car-info-title">연료</th>
			    		<td class="car-info-value">${data.FUEL_KD}</td>			
			    		<th class="car-info-title">배기량</th>
			    		<td class="car-info-value">${data.DPM}cc</td>	    		
			    	</tr>
			    	<tr>
			    		<th class="car-info-title">신차등록일</th>
			    		<td class="car-info-value">${data.INIT_REG_DT}</td>
			    		<th class="car-info-title">모델 연도</th>
			    		<td class="car-info-value">${data.CAR_Y_FORM}</td>
			    	</tr>
			    	<tr>
			    		<th class="car-info-title">주행거리</th>
			    		<td class="car-info-value" id="todayDist"><fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km</td>			  
			    		<th class="car-info-title">색상</th>
			    		<td class="car-info-value">${data.COLO}</td>	    		
			    	</tr>
			    	<tr>
			    		<th class="car-info-title">차량번호</th>
			    		<td class="car-info-value">${data.CAR_NO}</td>
			    		<th class="car-info-title">소유자</th>
			    		<td class="car-info-value">아마존카</td>		
			    	</tr>
			    </table>
			    <hr />
			    <table class="inquiry-table">
			    	<colgroup>
			    		<col width="15%">
			    		<col width="43%">
			    		<col width="42%">
			    	</colgroup>
			    	<c:choose>
				    	<c:when test="${data.BR_NM eq '대전'}">
					    	<tr>
					    		<th class="car-info-title" rowspan="5">문의</th>
					    		<td>대전지점: 042-824-1770</td>
					    	</tr>
				    	</c:when>
				    	<c:when test="${data.BR_NM eq '대구'}">
					    	<tr>
					    		<th class="car-info-title" rowspan="5">문의</th>
					    		<td>대구지점: 053-582-2998</td>
					    	</tr>
				    	</c:when>
				    	<c:when test="${data.BR_NM eq '광주'}">
					    	<tr>
					    		<th class="car-info-title" rowspan="5">문의</th>
					    		<td>광주지점: 062-385-0133</td>
					    	</tr>
				    	</c:when>
				    	<c:when test="${data.BR_NM eq '부산'}">
					    	<tr>
					    		<th class="car-info-title" rowspan="5">문의</th>
					    		<td>부산지점: 051-851-0606</td>
					    	</tr>
				    	</c:when>
				    	<c:otherwise>
				    		<c:if test="${validTimeFlag eq false}"> <!-- 공휴일/주말이거나 워킹타임 아닌 경우 -->
						    	<tr>
						    		<th class="car-info-title" rowspan="5">문의</th>
						    		<td>여의도 영업부 : 02-392-4242</td>
						    	</tr>
				    		</c:if>
				    		<c:if test="${validTimeFlag eq true}"> 
				    			<tr>
						    		<th class="car-info-title" rowspan="5">문의</th>
						    		<td>여의도 영업부 : 02-757-0802</td>
						    		<td>광화문지점 : 02-2038-8661</td>
						    	</tr>
						    	<tr>
						    		<td>강남지점 : 02-537-5877</td>
						    		<td>송파지점 : 02-2038-2492</td>
						    	</tr>
						    	<tr>
						    		<td>인천지점 : 032-554-8820</td>
						    		<td>수원지점 : 031-546-8858</td>
						    	</tr>
				    		</c:if>
				    	</c:otherwise>
			    	</c:choose>
			    </table>			    
		    </div>
	   </div>
  
		 <!-- Tab panes -->
	   <div role="tabpanel" class="tab-pane tab-content-box" id="spec" style="padding:20px;">
	    	<div>
		    	<h4 class=primary>기본사양품목<small class="spec-title bold" style="font-size:15px;">&nbsp;&nbsp;(${data.CAR_JNM} ${data.CAR_NM})</small></h4>
		    	<c:if test="${spec ne null}">
		    		<span class="spec-title bold">${spec} 기본사양품목 및</span>
		    	</c:if>
		    	<pre>${detailData.CAR_B}</pre>
		    	<pre class="spec-detail">${data.CAR_B}</pre>
				<h4 class="primary">선택사양품목</h4>
				<pre class="spec-detail">${data.OPT}</pre>
				<br/>
				<c:if test="${specList ne null}"> <!-- 상위 사양이 있으면 -->
					※참고
					<table class="table table-bordered">
						<colgroup>
							<col width="20%"/>
						</colgroup>
						<thead>
							<tr>
								<th class="text-center" style="font-size:14px;">구분</th>
								<th class="text-center" style="font-size:14px;">기본사양품목</th>
							</tr>
						</thead>
						<c:forEach var="spec" items="${specList}" varStatus="status">
							<tr>
								<th>
									<h5 class="spec-title bold">${data.CAR_JNM} ${spec.CAR_NAME}</h5>
								</th>
								<td>
									<c:if test="${spec.SUB_CAR_NAME ne null}">
										<span class="spec-title bold" style="font-size:14px;">${data.CAR_JNM} ${spec.SUB_CAR_NAME} 기본사양품목 및</span>
									</c:if>
									<pre>${spec.CAR_B}</pre>
								</td>	
							</tr>
						</c:forEach>
					</table>
				</c:if>
	    	</div>
	    </div>
	</div>
	<div class="tab-content price-tab">
		<span class="bold primary-orange">
			※ 대기상태 : 
			<c:if test="${data.reserveFlag eq 0}">
				입고 예정<br>
				&nbsp;&nbsp;&nbsp;&nbsp;입고예정 차량은 대기상태가 예약가능으로 바뀐 후에 예약이 가능합니다.
			</c:if>
			<%-- <c:if test="${data.reserveFlag > 0}">
				예약가능
			</c:if> --%>
			<c:if test="${data.reserveFlag > 0}">
				<!-- 즉시가능차량 쿼리에 데이터가 있으면 -->
				<c:if test="${param.carStat != 2}">
					예약가능
				</c:if>
				<c:if test="${param.carStat == 2}">
					<!-- data.reserveFlag 만으로는 차량예약이 가능해지는 경우가 있어 이중체크 -->
					입고 예정<br>
					&nbsp;&nbsp;&nbsp;&nbsp;입고예정 차량은 대기상태가 예약가능으로 바뀐 후에 예약이 가능합니다.
				</c:if>
			</c:if>
			
		</span>
		<div role="tabpanel"
			class="tab-pane active tab-content-box month-rent-price-box"
			style="padding: 25px; margin-top: 10px;">
			<table style="width: 100%;">
				<colgroup>
					<col width="10%" />
					<col width="25%" />
					<col width="10%" />
					<col width="10%" />
					<col width="12%" />
					<col width="*" />
				</colgroup>
				<tr>
					<td class="price-unit">1개월</td>
					<td>
						<span class="text-bold price">
							<fmt:formatNumber value="${data.RM1}" pattern="#,###" />원 (VAT 별도)
						</span>
					</td>
					<td class="text-center">
						<button type="button" class="detail-btn-print">견적서 보기</button>
					</td>
					<c:if test="${data.reserveFlag > 0}">
						<!-- 즉시가능차량 쿼리에 데이터가 있으면 -->
						<c:if test="${param.carStat != 2}">
							<td class="text-center">
								<button type="button" class="detail-btn-booking">차량 예약</button>
							</td>
						</c:if>
						<c:if test="${param.carStat == 2}">
							<!-- data.reserveFlag 만으로는 차량예약이 가능해지는 경우가 있어 이중체크  -->
							<%-- <td class="text-center"><button type="button"
									class="detail-btn-booking" style="display:none;">차량 예약</button></td> --%>
						</c:if>
					</c:if>
					<td class="text-center">
						<button type="button" class="detail-btn-other" data-toggle="modal" data-target="#monthrent-modal">필요 서류 보기</button>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	
	<form id="form">
		<input type="hidden" name="carManagedId" id="carManagedId" value="${paramData.carManagedId}"/>
		<input type="hidden" name="rentManagedId" id="rentManagedId" value="${paramData.rentManagedId}"/>
		<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${paramData.rentLocationCode}"/>
		<input type="hidden" name="locationId" id="locationId" value="${paramData.locationId}"/>
		<input type="hidden" name="o_1" id="o_1" value="${data.APPLY_SH_PR}"/>
		<input type="hidden" name="rentDate" id="rentDate" value="${data.UPLOAD_DT}"/>
		<input type="hidden" name="estCode" id="estCode" value="${data.REG_CODE}"/>
		<input type="hidden" name="agreeDist" id="agreeDist" value="20000"/>
		<input type="hidden" name="a_a" id="a_a" value="21"/>
		<input type="hidden" name="a_b" id="a_b" value="1"/>
		<input type="hidden" name="carAmt" id="carAmt" value="${data.RM1}"/>
		<input type="hidden" name="regCode" value="${data.REG_CODE}"/>
		<input type="hidden" name="naviFlag" id="naviFlag" value="N"/>
		<input type="hidden" name="type" id="type" value="month"/>
		<input type="hidden" value="${data.rankData}" name="reserveRank" id="reserveRank"/>
	</form>
	<div class="text-center">
		<button type="button" class="list-btn" onclick="javascript:history.back();"><i class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;목록으로</button>
	</div>
	<!-- Modal Area -->
	<!-- Car History  -->
	<div class="modal fade" id="history" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">차량이력표</h4>
				</div>
				<div class="modal-body">
					<table class="modal-table table table-striped">
						<thead>
							<tr>
								<th>No</th>
								<th>고객명</th>
								<th>대여기간</th>
								<th>운전자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="history" items="${historyData}" varStatus="status">
								<tr>
									<td class="text-center">${status.index+1}</td>
									<td class="text-center">
										<c:choose>
											<c:when test="${history.FIRM_NM eq '개인고객'}">
												${history.FIRM_NM}
											</c:when>										
											<c:otherwise>
												${fn:substring(history.FIRM_NM,0, (fn:length(history.FIRM_NM)) -2 ) }**
											</c:otherwise>
										</c:choose>
									</td>
									<td class="text-center">
										<fmt:parseDate value="${fn:substring(fn:replace(history.RENT_START_DT,'-',''), 0, 8)}"  var="rentStartDate" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${rentStartDate}" pattern="yyyy-MM-dd"/> ~
										<fmt:parseDate value="${fn:substring(fn:replace(history.RENT_END_DT,'-',''), 0, 8)}"  var="rentEndDate" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${rentEndDate}" pattern="yyyy-MM-dd"/>					
									</td>
									<td class="text-center">${history.MGR_TITLE}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Accident History  -->
	<div class="modal fade" id="accident" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">사고기록</h4>
				</div>
				<div class="modal-body">
					<table class="modal-table table table-striped">
						<colgroup>
							<col width="5%"/>
							<col width="10%"/>
							<col width="30%"/>
							<col width="10%"/>
							<col width="15%"/>
						</colgroup>
						<thead>
							<tr>
								<th>No</th>
								<th>사고일자</th>
								<th>수리내역</th>
								<th>수리비용</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(accidentData) > 0}">
								<c:forEach var="acci" items="${accidentData}" varStatus="status">
									<tr>
										<td class="text-center">${status.index+1}</td>
										<td class="text-center">
											<fmt:parseDate value="${fn:substring(fn:replace(acci.ACCID_DT,'-',''), 0, 8)}"  var="accidentDate" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${accidentDate}" pattern="yyyy-MM-dd"/>
										</td>										
										<td>
											<c:if test="${(acci.SERV_ST ne '12') && (acci.SERV_ST ne '7')}">
												${acci.ITEM}
											</c:if>
										</td>										
										<td class="text-center"><fmt:formatNumber value="${acci.TOT_AMT}" pattern="#,###"/>원</td>
										<td class="text-center">
											<c:if test="${(acci.SERV_ST eq '12') || (acci.SERV_ST eq '7')}">
												재렌트/재리스 상품화 정비
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(accidentData) == 0}">
								<tr>
									<td colspan="6" style="text-align:center;">사고 내역이 없습니다</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Service History (정비이력) -->
	<div class="modal fade" id="service" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">정비기록</h4>
				</div>
				<div class="modal-body">
					<table class="modal-table table table-striped">
						<colgroup>
							<col width="5%"/>
							<col width="15%"/>
							<col width="15%"/>
							<col width="20%"/>
							<col width="*"/>
							<col width="10%"/>
						</colgroup>					
						<thead>
							<tr>
								<th>No</th>
								<th>정비일자</th>
								<th>정비구분</th>
								<th>정비업체</th>
								<th>점검내용</th>
								<th>주행거리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="serv" items="${serviceData}" varStatus="status">
								<tr>
									<td>${status.index+1}</td>
									<td>
										<fmt:parseDate value="${fn:substring(fn:replace(serv.REG_DT,'-',''), 0, 8)}"  var="servRegDate" pattern="yyyyMMdd"/>
										<fmt:formatDate value="${servRegDate}" pattern="yyyy-MM-dd"/>
									</td>
									<td>${serv.SERV_ST}</td>
									<td>${serv.OFF_NM}</td>
									<td class="service-item">${serv.ITEM}</td>
									<td><fmt:formatNumber value="${serv.TOT_DIST}" pattern="#,###" />km</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<%@include file="/WEB-INF/jsp/common/monthRent-modal.jsp"%>
</t:genericpage>