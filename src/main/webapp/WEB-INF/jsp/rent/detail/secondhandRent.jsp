<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<t:genericpage>
<link rel="stylesheet" href="<c:url value='/resources/stylesheets/rent.css'/>"  />
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/resources/stylesheets/library/icomoon.css"/>
<script src="/resources/js/rent.js"></script>
<script>
//모든 개월이 '이용불가'인 경우 견적 페이지에서 disable 처리
function checkNoServiceProduct(){
	var tagetUpperArray = [	{name:"rent",value:"2"},
	                       	{name:"leasePlus",value:"1"}  ];
	var tagetArray = [  {name:"left",value:"2"},
						{name:"right",value:"1"} ];
	var noServiceArea = "";
	
	$.each(tagetUpperArray,function(index,upperValue){
		$.each(tagetArray,function(inx,target){
			var totalLength = $("#" + upperValue.name + " .price-tab-"+ target.name + " table tr").length;
			var noServiceLength = $("#" + upperValue.name + " .price-tab-"+ target.name + " table td:contains('불가')").length;
			if(totalLength == noServiceLength){
				noServiceArea += upperValue.value + target.value + ":";				
			}
		})
	})
	$('#estiFrm').append("<input type='hidden' name='disableProduct' value='"+noServiceArea+"'/>");
	
	if(noServiceArea.indexOf("21") >= 0 && noServiceArea.indexOf("22") >= 0){
		$("a[href='#leasePlus']").trigger("click");
	}
}

$(document).ready(function(){

	//가격표 Height 구하기
	var tableHeight = $('.price-info table').height();
	var changeHeight = tableHeight + 90;
	
	$('.secondhand-rent-price-box').height( changeHeight );
	$('.secondhand-rent-price-box').css("min-height", changeHeight );
	
	checkNoServiceProduct();
	
	//주행거리가 바뀌었을때
	$("input[name='agreeDist']").change(function(){
		$("#searchFrm").submit();
	})
	
	$('.detail-btn-print, .detail-btn-request').click(function(){

		var carAmt = $(this).parent().siblings().find(".price").text().replace(",","").replace("원","");
		var rentMonth = $(this).parent().siblings(".price-unit").attr("name");
		var agreeDist = $("input[name='agreeDist']:checked").val();
		var a_a = $(this).closest("div").siblings(".price-tab-subtitle").attr("id");
		var car_gubun = $("#car_gubun").val();
		var brTo = $("#brTo").val();
		var brFrom = $("#brFrom").val();
		var leaseYn = $("#leaseYn").val();
	
		$('#agreeDist').val(agreeDist);  //차량 주행거리
		$('#carAmt').val(carAmt);  //선택한 월대여 금액
		$('#a_a').val(a_a);  //21:일반식, 22:기본식
		$('#a_b').val(rentMonth);  //개월수
		
		var temp_url = window.location.href;
		var temp_param = temp_url.split("?")[1];
		var from_page = window.location.pathname + "?" + temp_param;
		
		if($(this).hasClass('detail-btn-print')){ //견적서보기 버튼 클릭 시
			var url = "/rent/secondhand/print?";
			$("#estimateId").val($(this).attr("id"));
			$('#estiFrm input').each(function(){
				var name = $(this).attr("name");
				var value = $(this).val();
				if(url.substring(url.length-1,url.length) != "?"){	url += "&"; }
				url += name + "=" + value ;
			})
			url += url + "&refer=detail";
			window.open(url,"popup","width=1010,height=800,top=0,left=0,scrollbars=yes");
		}else{ //맞춤견적내기 버튼 클릭 시
			/* 로그인 임시 변경 */
			/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {				
			    alert("로그인이 필요한 서비스 입니다.");
			    location.replace("/login");
			    //location.replace("/login?from_page=" + btoa(from_page));
			} else { */	    	
				//맞춤견적내기 팝업창으로 전환
		    	var pop_title = "esti_popup";
				$("#dist").val(agreeDist);
				
		    	window.open("",pop_title,"width=1200,height=1200,top=0,left=0,scrollbars=yes");
		    	$("#from_page").val(btoa(from_page));
		    	$('#estiFrm').attr("target",pop_title);
		    	$('#estiFrm').attr("action","/estimate/secondhand/step1");
		    	$('#estiFrm').attr("method","post");
				$('#estiFrm').submit();
			/* } */			
		}
	})
	
	$("#tabLease").on("click", function(){
		$("#leaseYn").val("1");			
	});
	$("#tabRent").on("click", function(){
		$("#leaseYn").val("0");		
	});
	
	$(".list-btn").on("click", function(){
		var car_gubun = "${paramData.car_gubun}";
		var agree_dist = "${paramData.agreeDist}";
		var price_std = "max";
		var search_price = "";
		var br_to = "${paramData.brTo}";
		
		//location.replace("/rent/secondhand");
		location.replace("/rent/secondhand?carGubun="+car_gubun+"&agreeDist="+agree_dist+"&priceStd=max&searchPrice=&brTo="+br_to);
	});
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

	<input type="hidden" name="searchCondition" id="search_agreeDist" value="${paramData.agreeDist}"/>
    <input type="hidden" value="${type}" id="carType"/>
    <input type="hidden" value="${data.TOT_AMT}" id="totalAmt"/>
	<div class="amazon-tab-container">
		<div class="detail-title">
			<h2>
				<!-- <a href="/rent/secondhand"> -->
				<a onclick="javascript:history.go(-1);" style="cursor: pointer;">
					<img src="/resources/images/green-arrow_left.png" style="margin-top:-4px;"/>
				</a>
				&nbsp;${data.CAR_JNM}&nbsp;${data.CAR_NM}</h2>
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
  		   		<c:choose>
			    	<c:when test="${data.SAVE_FOLDER ne null}">
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
			    		<td class="car-info-value">${data.CAR_COMP_NM}</td>
			    		<td></td>
			    		<td></td>
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
			    	<tr>
			    		<th class="car-info-title">현위치</th>
			    		<td class="car-info-value" colspan="3">
			    			<c:if test="${data.BR_ID eq 'S1'}">수도권</c:if>
			    			<c:if test="${data.BR_ID eq 'D1'}">대전</c:if>
			    			<c:if test="${data.BR_ID eq 'G1'}">대구</c:if>
			    			<c:if test="${data.BR_ID eq 'J1'}">광주</c:if>
			    			<c:if test="${data.BR_ID eq 'B1'}">부산</c:if>
			    		</td>
			    	</tr>
			    </table>
			    <hr>
			    <table class="inquiry-table">
			    	<colgroup>
			    		<col width="15%">
			    		<col width="43%">
			    		<col width="42%">
			    	</colgroup>
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
			    	<tr>
			    		<td>대전지점 : 042-824-1770</td>
			    		<td>대구지점 : 053-582-2998</td>
			    	</tr>
			    	<tr>
			    		<td>광주지점 : 062-385-0133</td>
			    		<td>부산지점 : 051-851-0606</td>
			    	</tr>
			    </table>			    
		    </div>
	   </div>
  
	    <!-- Tab panes -->
	   <div role="tabpanel" class="tab-pane tab-content-box" id="spec" style="padding:20px;">
	    	<div>
		    	<h4 class=primary>기본 사양 품목<small class="spec-title bold" style="font-size:15px;">&nbsp;(${data.CAR_JNM} ${data.CAR_NM})</small></h4>
		    	<c:if test="${spec ne null}">
		    		<span class="spec-title bold">${spec} 기본사양품목 및</span>
		    	</c:if>
		    	<pre class="spec-detail">${data.CAR_B}</pre>
				<h4 class="primary">선택 사양 품목</h4>
				<pre class="spec-detail">${data.OPT}</pre>
				<BR/><BR/>
				<c:if test="${specList ne null}"> <!-- 상위 사양이 있으면 -->
					<h4 class="spec-title">※ 참고</h4>
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
									<h5 class="spec-title bold">${mainData.CAR_NM} ${spec.CAR_NAME}</h5>
								</th>
								<td>
									<c:if test="${spec.SUB_CAR_NAME ne null}">
										<span class="spec-title bold" style="font-size:14px;">${mainData.CAR_NM} ${spec.SUB_CAR_NAME} 기본사양품목 및</span>
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
	<!-- 약정주행거리 -->
	<form id="searchFrm" method="get">
		<input type="hidden" name="carManagedId" id="carManagedId" value="${paramData.carManagedId}"/>
		<input type="hidden" name="rentManagedId" id="rentManagedId" value="${paramData.rentManagedId}"/>
		<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${paramData.rentLocationCode}"/>
		<input type="hidden" name="brTo" value="${paramData.brTo}"/>
		<div class="price-select-group" style='display: flex; margin-bottom: 0px !important;'>
			<div>
				<span>연간 약정운행거리 선택&nbsp;:&nbsp;</span>
				<input type="radio" name="agreeDist" id="option4" value="10000" checked/>
				<label for="option4" style="font-weight:500 !important;">10,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="agreeDist" id="option1" value="20000"/>
				<label for="option1" style="font-weight:500 !important;">20,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="agreeDist" id="option2" value="30000">
				<label for="option2" style="font-weight:500 !important;">30,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="agreeDist" id="option3" value="40000">
				<label for="option3" style="font-weight:500 !important;">40,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div style='margin-right: 150px;'>
				<div style="cursor: pointer; margin-left: 20px;">
		      		<div style="border: 2px solid #f98460; background-color: #f98460; height: 30px; width: 220px; text-align: center; display: flex; justify-content: center; align-items: center;">
						<a class="minus_mileage" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');" style="color: #f98460; font-size: 13px; color: #ffffff">약정이하 운행 시 Km당  대여료 환급</a>
					</div>
		       	</div>
			</div>
		</div>
		<div>
			<span style="margin-left:150px;font-weight:lighter;">※ 약정운행거리 선택에 따라 월대여료가 달라집니다.</span>
		</div>
	</form>	
	<div role="tabpanel">
		<!-- 재렌트 가격 -->
		<div class="price-tab">
			<ul class="nav nav-tabs amazon-detail-tab" role="tablist">
			   <li role="presentation" class="active"><a href="#rent" aria-controls="rent" role="tab" data-toggle="tab" id="tabRent">재렌트</a></li>
			   <li role="presentation"><a href="#leasePlus" aria-controls="lease" role="tab" data-toggle="tab" id="tabLease">재리스</a></li>
			</ul>
			<div class="tab-content">
			    <div role="tabpanel" class="tab-pane active tab-content-box secondhand-rent-price-box" id="rent">
			    	<div class="price-tab-left">
				    	<div class="price-tab-subtitle" id="22">기본식(정비 미포함)</div>
				    	<div class="price-info">
					    	<table>
					    		<colgroup>
						    		<col width="30%"/>
						    		<col width="27%"/>
						    		<col width="20%"/>
						    		<col width="23%"/>
						    	</colgroup>
						    	<tr>
						    		<td class="price-unit" name="${data.MAX_USE_MON}">${data.MAX_USE_MON}개월</td>
						    		<td name="${data.MAX_USE_MON}"><span class="text-bold price">${data.TO_RBMAX}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_RBMAX, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RBMAX_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	<c:if test="${data.MAX_USE_MON > 48}">
							    	<tr>
							    		<td class="price-unit" name="48">48개월</td>
							    		<td><span class="text-bold price">${data.TO_RB48}</span></td>
							    		<c:choose>
								    		<c:when test="${fn:contains(data.TO_RB48, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
								    			<td></td>
								    			<td></td>
								    		</c:when>
								    		<c:otherwise>
								    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RBMAX_ID}">견적서 보기</button></td>
								    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
								    		</c:otherwise>
							    		</c:choose>
							    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 36}">
						    	<tr>
						    		<td class="price-unit" name="36">36개월</td>
						    		<td><span class="text-bold price">${data.TO_RB36}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_RB36, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RB36_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 24}">
						    	<tr>
						    		<td class="price-unit" name="24">24개월</td>
						    		<td><span class="text-bold price">${data.TO_RB24}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_RB24, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RB24_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>	
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 12}">
						    	<tr>
						    		<td class="price-unit" name="12">12개월</td>
						    		<td><span class="text-bold price">${data.TO_RB12}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_RB12, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RB12_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>
					    	</table>
				    	</div>
			    	</div>
			    	<div class="price-tab-right">
				    	<div class="price-tab-subtitle" id="21">일반식 (정비 포함)</div>
				    	<div class="price-info">
					    	<table>
						    	<colgroup>
						    		<col width="30%"/>
						    		<col width="27%"/>
						    		<col width="20%"/>
						    		<col width="23%"/>
						    	</colgroup>	
						    	<tr>
						    		<td class="price-unit" name="${data.MAX_USE_MON}">${data.MAX_USE_MON}개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_RSMAX}</span></td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_RSMAX, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print"  id="${data.RSMAX_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	<c:if test="${data.MAX_USE_MON > 48}">
							    	<tr>
							    		<td class="price-unit" name="48">48개월</td>
						    			<td class="detail-price"><span class="text-bold price">${data.TO_RS48}</span></td>
						    			<c:choose>
								    		<c:when test="${fn:contains(data.TO_RS48, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
								    			<td></td>
								    			<td></td>
								    		</c:when>
								    		<c:otherwise>
								    			<td class="text-center"><button type="button" class="detail-btn-print"  id="${data.RSMAX_ID}">견적서 보기</button></td>
								    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
								    		</c:otherwise>
							    		</c:choose>
							    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 36}">
						    	<tr>
						    		<td class="price-unit" name="36">36개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_RS36}</span></td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_RS36, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RS36_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 24}">
						    	<tr>
						    		<td class="price-unit" name="24">24개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_RS24}</span></td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_RS24, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RS24_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>	
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 12}">
						    	<tr>
						    		<td class="price-unit" name="12">12개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_RS12}</span></td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_RS12, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.RS12_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>
					    	</table>
				    	</div>
			    	</div>
			    </div>
			     <div role="tabpanel" class="tab-pane tab-content-box secondhand-rent-price-box" id="leasePlus">
			    	<div class="price-tab-left">
				    	<div class="price-tab-subtitle" id="12">기본식(정비 미포함)</div>
				    	<div class="price-info">
					    	<table>
					    		<colgroup>
						    		<col width="30%"/>
						    		<col width="27%"/>
						    		<col width="20%"/>
						    		<col width="23%"/>
						    	</colgroup>
						    	<tr>
						    		<td class="price-unit" name="${data.MAX_USE_MON}">${data.MAX_USE_MON}개월</td>
						    		<td name="${data.MAX_USE_MON}"><span class="text-bold price">${data.TO_LBMAX}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_LBMAX, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LBMAX_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	<c:if test="${data.MAX_USE_MON > 48}">
							    	<tr>
							    		<td class="price-unit" name="48">48개월</td>
							    		<td><span class="text-bold price">${data.TO_LB48}</span></td>
							    		<c:choose>
								    		<c:when test="${fn:contains(data.TO_LB48, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
								    			<td></td>
								    			<td></td>
								    		</c:when>
								    		<c:otherwise>
								    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LBMAX_ID}">견적서 보기</button></td>
								    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
								    		</c:otherwise>
							    		</c:choose>	
							    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 36}">
						    	<tr>
						    		<td class="price-unit" name="36">36개월</td>
						    		<td ><span class="text-bold price">${data.TO_LB36}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_LB36, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LB36_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>	
						    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 24}">
						    	<tr>
						    		<td class="price-unit" name="24">24개월</td>
						    		<td ><span class="text-bold price">${data.TO_LB24}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_LB24, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LB24_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>	
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 12}">
						    	<tr>
						    		<td class="price-unit" name="12">12개월</td>
						    		<td ><span class="text-bold price">${data.TO_LB12}</span></td>
						    		<c:choose>
							    		<c:when test="${fn:contains(data.TO_LB12, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LB12_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>	    						    	
					    	</table>
				    	</div>
			    	</div>
			    	<div class="price-tab-right">
				    	<div class="price-tab-subtitle" id="11">일반식 (정비 포함)</div>
				    	<div class="price-info" id="11">
					    	<table>
						    	<colgroup>
						    		<col width="30%"/>
						    		<col width="27%"/>
						    		<col width="20%"/>
						    		<col width="23%"/>
						    	</colgroup>    	
						    	<tr>
						    		<td class="price-unit" name="${data.MAX_USE_MON}">${data.MAX_USE_MON}개월</td>
						    			<td class="detail-price"><span class="text-bold price">${data.TO_LSMAX}</span></td>
						    			<c:choose>
								    		<c:when test="${fn:contains(data.TO_LSMAX, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
								    			<td></td>
								    			<td></td>
								    		</c:when>
								    		<c:otherwise>
								    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LSMAX_ID}">견적서 보기</button></td>
								    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
								    		</c:otherwise>
							    		</c:choose>
						    	</tr>
						    	<c:if test="${data.MAX_USE_MON > 48}">
							    	<tr>
							    		<td class="price-unit" name="48">48개월</td>
						    			<td class="detail-price"><span class="text-bold price">${data.TO_LS48}</span></td>
						    			<c:choose>
								    		<c:when test="${fn:contains(data.TO_LS48, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
								    			<td></td>
								    			<td></td>
								    		</c:when>
								    		<c:otherwise>
								    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LSMAX_ID}">견적서 보기</button></td>
								    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
								    		</c:otherwise>
							    		</c:choose>
							    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 36}">
						    	<tr>
						    		<td class="price-unit" name="36">36개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_LS36}</span></td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_LS36, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LS36_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 24}">
						    	<tr>
						    		<td class="price-unit" name="24">24개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_LS24}</td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_LS24, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LS24_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>	
						    	</c:if>
						    	<c:if test="${data.MAX_USE_MON > 12}">
						    	<tr>
						    		<td class="price-unit" name="12">12개월</td>
					    			<td class="detail-price"><span class="text-bold price">${data.TO_LS12}</td>
					    			<c:choose>
							    		<c:when test="${fn:contains(data.TO_LS12, '불')}"> <!-- 이용불가면 견적서보기, 맞춤견적내기 안나오게 처리함 -->
							    			<td></td>
							    			<td></td>
							    		</c:when>
							    		<c:otherwise>
							    			<td class="text-center"><button type="button" class="detail-btn-print" id="${data.LS12_ID}">견적서 보기</button></td>
							    			<td class="text-center"><button type="button" class="detail-btn-request">맞춤견적내기</button></td>
							    		</c:otherwise>
						    		</c:choose>
						    	</tr>
						    	</c:if> 
					    	</table>
				    	</div>
			    	</div>
			    </div>
			</div>
		</div>
	</div>
	<div class="vat-info" style="height:150px;">
		보증금 <span id="depositAmt" class="bold"><fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###"/>원 기준</span>, 보증금은 계약기간 만료 후 환불해 드립니다.<BR/>
		<c:choose>
			<c:when test="${fn:substring(data.CAR_COMP_ID,2,4) <= 5}">
				자동차세, 보험료  포함 / VAT 별도 가격입니다.<br/> 
			</c:when>
			<c:otherwise>
				자동차세, 보험료  포함 / VAT 별도 가격입니다. (단, 수입차 리스는 보험료 제외)<br/> <!-- 수입차면 -->
			</c:otherwise>
		</c:choose>
		※ 대여조건 변경 견적은 맞춤견적내기로 확인 가능
	</div>
	<div class="text-center">
		<!-- <button type="button" class="list-btn" onclick="javascript:history.back();"><i class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;목록으로</button> -->
		<button type="button" class="list-btn"><i class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;목록으로</button>
	</div>
	<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="" />
	</sec:authorize>
	<form id="estiFrm">
		<input type="hidden" name="carManagedId" id="carManagedId" value="${paramData.carManagedId}"/>
		<input type="hidden" name="rentManagedId" id="rentManagedId" value="${paramData.rentManagedId}"/>
		<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${paramData.rentLocationCode}"/>
		<!-- <input type="hidden" name="o_1" id="o_1" value="${data.APPLY_SH_PR}"/>  -->
		<input type="hidden" name="rentDate" id="rentDate" value="${data.UPLOAD_DT}"/>
		<input type="hidden" name="estCode" id="estCode" value="${data.REG_CODE}"/>
		<input type="hidden" name="a_a" id="a_a" value="2"/>
		<input type="hidden" name="a_b" id="a_b" value=""/>
		<input type="hidden" name="rentMonth" id="rentMonth" value=""/>
		<input type="hidden" name="carAmt" id="carAmt" value=""/>
		<input type="hidden" name="regCode" value="${data.REG_CODE}"/>
		<input type="hidden" name="type" id="type" value="secondhand"/>
		<input type="hidden" name="agreeDist" id="agreeDist" value="${param.agreeDist}"/>
		<input type="hidden" name="brTo" id="brTo" value="${paramData.brTo}"/>
		<input type="hidden" name="brFrom" id="brFrom" value="${data.BR_ID}"/>
		<input type="hidden" name="dist" id="dist" />
		<input type="hidden" name="estimateId" id="estimateId" value=""/>
		<input type="hidden" name="car_gubun" id="car_gubun" value="${paramData.car_gubun}"/>		
		<input type="hidden" name="leaseYn" id="leaseYn" value="0">
	</form>
	<!----------------------------------- Modal Area ------------------------------------------->
	
	<!-- Car History  -->
	<div class="modal fade" id="history" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">차량이용이력</h4>
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
							<c:set var="index" value="0"/>
							<c:if test="${receiveData ne null}">
								<c:set var="index" value="${index+1}"/>
								<tr>
									<td class="text-center">${index}</td>	
									<td class="text-center">*****</td>
									<td class="text-center">*****</td>
									<td class="text-center">※자산양수 차량</td>
								</tr>
							</c:if>
							<c:forEach var="history" items="${historyData}" varStatus="status">
								<c:set var="index" value="${index+1}"/>
								<tr>
									<td class="text-center">${index}</td>
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
										<c:choose>
											<c:when test="${!empty history.CLS_DT}">
												<fmt:parseDate value="${fn:substring(fn:replace(history.CLS_DT,'-',''), 0, 8)}"  var="rentEndDate" pattern="yyyyMMdd"/>
											</c:when>
											<c:otherwise>
												<fmt:parseDate value="${fn:substring(fn:replace(history.RENT_END_DT,'-',''), 0, 8)}"  var="rentEndDate" pattern="yyyyMMdd"/>
											</c:otherwise>
										</c:choose>
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
					<h4 class="modal-title" id="myModalLabel">사고수리내역</h4>
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
									<c:set var="index" value="0" />
									<c:if test="${receiveData ne null}">
										<c:set var="index" value="${index+1}"/>
										<tr>
											<td class="text-center">${index}</td>
											<td class="text-center">*****</td>
											<td class="text-center">*****</td>
											<td class="text-center">*****</td>
											<td class="text-center">
												※자산양수 차량
												<c:if test="${receiveData.ACCID_SERV_CONT ne null}">
													<br/><span>※사고수리내역(자산양수시 평가표에 의함):${receiveData.ACCID_SERV_CONT}</span>
												</c:if>
											</td>
										</tr>
									</c:if>
									<c:set var="index" value="${index+1}"/>
									<tr>
										<td class="text-center">${index}</td>
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
								<c:if test="${receiveData ne null}">
									<tr>
										<td class="text-center">1</td>
										<td class="text-center">*****</td>
										<td class="text-center">*****</td>
										<td class="text-center">*****</td>
										<td class="text-center">
											※자산양수 차량
											<c:if test="${receiveData.ACCID_SERV_CONT ne null}">
												<br/><span>※사고수리내역(자산양수시 평가표에 의함):${receiveData.ACCID_SERV_CONT}</span>
											</c:if>
										</td>
									</tr>
								</c:if>
								<tr>
									<td colspan="5" style="text-align:center;">사고 내역이 없습니다</td>
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
</t:genericpage>
