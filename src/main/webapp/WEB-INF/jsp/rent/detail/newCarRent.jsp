<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<t:genericpage>
<link rel="stylesheet" href="/resources/stylesheets/library/icomoon.css"/>
<script type="text/javascript">
$(document).ready(function(){
	//약정주행거리에 따라 가격표 셋팅
	$("input[name='mileage-option']").each(function(){
		var agreeVal = $(this).val();
		var car_comp_id = $("#carCompId").val();
		if (!$(this).prop("checked")) {
			$("tr[id='"+agreeVal+"']").css("display","none");
		}
		
		/* if (car_comp_id == "0056") {
			if (agreeVal != "20000" ) {
				$("tr[id='"+agreeVal+"']").css("display","none");
			}
		} else {
			if(!$(this).prop("checked")){
				$("tr[id='"+agreeVal+"']").css("display","none");
			}
		} */		
	})
	 
    $('input:radio').click(function(){
    	var selectItem = $(this).attr("value");
    	var car_comp_id = $("#carCompId").val();
    	$('.price-info-tr').hide();
    	$('tr[id='+selectItem+']').show();
    	
    	/* if (car_comp_id == "0056") {
    		if (Number(selectItem) <= 20000) {
        		$('tr[id="20000"]').show();	
        	} else {
        		$('tr[id='+selectItem+']').show();
        	}
    	} else {
    		$('tr[id='+selectItem+']').show();	
    	} */
    })
	
    $('.label-smart').click(function(){
    	var url="";
    	window.open('/estimate/smart/step1',"popup","width=1200,height=1200,top=0,left=0,scrollbars=yes");
    })
    
    $('.detail-btn-request').click(function(){
   		var temp_url = window.location.href;
		var temp_param = temp_url.split("?")[1];
		var from_page = window.location.pathname + "?" + temp_param;
		var car_comp_id = $("#carCompId").val();
		
		/* if (Number(car_comp_id) > 5) {
    		alert("실시간 견적내기 및 상담 요청\n\n한시적으로 인하된 자동차 개별소비세율이\n2020년 1월 1일부터 환원됩니다.\n\n아마존카 전산상 수입차 차량가격 인상 반영 전까지 \n실시간 견적내기 및 상담 요청 이용이 잠시 중단 됩니다.");
    		return;
    	} */
		
		/* 로그인 임시 변경 */
    	/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		    //location.replace("/login?from_page=" + btoa(from_page));
		} else { */
			
    	//실시간 견적 팝업창으로 전환
    	var pop_title = "esti_popup";
    	window.open("",pop_title,"width=1200,height=1200,top=0,left=0,scrollbars=yes");
    	$("#from_page").val(btoa(from_page));
    	$('#period').val($(this).closest("tr").find(".price-unit").html());
    	$('#gubun').val($(this).closest("div").siblings(".price-tab-subtitle").attr("id"));
    	$('#agreeDist').val($('input:radio:checked').val());
    	//테슬라차량 20000으로 고정
		/* if (car_comp_id == "0056") {
			$('#agreeDist').val("20000");
		} else {
	    	$('#agreeDist').val($('input:radio:checked').val());
		} */
    	
    	$('#estimateFrm').attr("target",pop_title);
    	$('#estimateFrm').submit();
		/* } */    	
    })
    
	var href = $(location).attr('pathname').replace("/detail","");
	var type = href.split("/")[2];
	$("a[href='"+href+"']").find("div").addClass("active");
	$('.detail-title a').attr("href","/rent/"+type);
	
	var flag = false;
	if(type == "imports") { flag = true; }
	$('#foreignFlag').val(flag);
		
	$('.detail-btn-print').click(function(){
		var id = $(this).attr("id");
		var seq = $('#seq').val();
		var agreeDist = $('input:radio:checked').val();
		var car_comp_id = $("#carCompId").val();
		var url = "";
		
		//테슬라차량 20000으로 고정
		/* if (car_comp_id == "0056") {			
			url = "/rent/print?estimateId=" + id + "&seq=" + seq + "&refer=detail&agreeDist=20000";
		} else {
			url = "/rent/print?estimateId=" + id + "&seq=" + seq + "&refer=detail&agreeDist=" + agreeDist;
		} */
		
		url = "/rent/print?estimateId=" + id + "&seq=" + seq + "&refer=detail&agreeDist=" + agreeDist;
		
		window.open(url,"popup","width=1010,height=800,top=0,left=100,scrollbars=yes");
	})
	
	//가격이 0원이면 서비스 미제공으로 변경한다
	$('.price-info > table > tbody > tr').each(function(){
		var car_comp_id = $("#carCompId").val();
		
		var priceVal = $(this).find("td:eq(1) > span").text().replace("원", "");
		var get_tr_id = $(this).attr('id');
		var get_td_0 = $(this).find("td:eq(0)").text();
		
		if (priceVal == 0) {
			$(this).find("td:eq(1) > span").text("미운영");
			$(this).find("td:eq(1) > span").removeClass();
			$(this).find("td:eq(2)").html("");
			$(this).find("td:eq(3)").html("");
		} else if(priceVal < 0) {
			if ($("#duty_free_opt").val()=="1") {
				$(this).find("td:eq(1) > span").text("미운영");
			} else {
				$(this).find("td:eq(1) > span").text("이용불가");
			}
			$(this).find("td:eq(1) > span").removeClass();
			$(this).find("td:eq(2)").html("");
			$(this).find("td:eq(3)").html("");
		}
		
		if (car_comp_id == "0056") {
			if (Number(get_tr_id) > 30000) {
				$(this).find("td:eq(1) > span").text("미운영");
				$(this).find("td:eq(1) > span").removeClass();
				$(this).find("td:eq(2)").html("");
				$(this).find("td:eq(3)").html("");
			} else {				
				if(priceVal == 0){
					$(this).find("td:eq(1) > span").text("미운영");
					$(this).find("td:eq(1) > span").removeClass();
					$(this).find("td:eq(2)").html("");
					$(this).find("td:eq(3)").html("");
				}else if(priceVal < 0){
					if($("#duty_free_opt").val()=="1"){
						$(this).find("td:eq(1) > span").text("미운영");
					}else{
						$(this).find("td:eq(1) > span").text("이용불가");
					}
					$(this).find("td:eq(1) > span").removeClass();
					$(this).find("td:eq(2)").html("");
					$(this).find("td:eq(3)").html("");
				} /* else if (get_td_0 == "60개월" || get_td_0 == "48개월") {
					$(this).find("td:eq(1) > span").text("미운영");
					$(this).find("td:eq(1) > span").removeClass();
					$(this).find("td:eq(2)").html("");
					$(this).find("td:eq(3)").html("");
				} */
			}
		} else {			
			if(priceVal == 0){
				$(this).find("td:eq(1) > span").text("미운영");
				$(this).find("td:eq(1) > span").removeClass();
				$(this).find("td:eq(2)").html("");
				$(this).find("td:eq(3)").html("");
			}else if(priceVal < 0){
				if($("#duty_free_opt").val()=="1"){
					$(this).find("td:eq(1) > span").text("미운영");
				}else{
					$(this).find("td:eq(1) > span").text("이용불가");
				}
				$(this).find("td:eq(1) > span").removeClass();
				$(this).find("td:eq(2)").html("");
				$(this).find("td:eq(3)").html("");
			}
		}
	});
})
</script>
<link rel="stylesheet" href="<c:url value='/resources/stylesheets/rent.css'/>"  />
<link href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css" rel="stylesheet"/>
	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/rent/domestic"><div class="amazon-tab">국산신차</div></a>
			<a href="/rent/imports"><div class="amazon-tab">수입신차</div></a>
		</div>
		<div class="detail-title">
			<h2>
				<!-- <a href="/rent/domestic"> -->
				<a onclick="javascript:history.back();">
					<img src="/resources/images/green-arrow_left.png" style="margin-top:-4px;"/>
				</a>
				&nbsp;${mainData.CAR_NM}&nbsp;
				<c:if test="${mainData.CAR_NM ne mainData.CAR_NAME }">
					${mainData.CAR_NAME}
				</c:if>
				<c:choose>
					<c:when test="${mainData.JG_G_7 eq '3'}"> <!-- 전기차 -->
						<input type="button" class="btn btn-default" value="충전요금 및 충전방법" style="float:right" onclick="location.href='/rent/green/desc#tab_howto'" />
					</c:when>
					<c:when test="${(mainData.JG_G_7 eq '1') or (mainData.JG_G_7 eq '2') or (mainData.JG_G_7 eq '4')}"> <!-- 하이브리드 -->
						<input type="button" class="btn btn-default" value="혜택 및 연비보기" style="float:right"  onclick="location.href='/rent/green/desc#tab_benefit'"/>
					</c:when>
				</c:choose>				
			</h2>
		</div>
  	</div>    
  	<ul class="nav nav-tabs amazon-detail-tab" role="tablist">
	   <li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">차량 정보</a></li>
	   <li role="presentation"><a href="#spec" aria-controls="spec" role="tab" data-toggle="tab">사양 정보</a></li>
	 </ul>
	<!-- Tab panes -->
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active domestic-content-box" id="info">
  		   <div class="domestic-left-content">
			    <!-- 차량 정보  -->
		    	<table>
		    		<colgroup>
		    			<col width="20%"/>
		    			<col width="30%"/>
		    			<col width="20%"/>
		    			<col width="30%"/>
		    		</colgroup>	
			    	<tr>
			    		<th class="car-info-title">제조사</th>
			    		<td class="car-info-value">${mainData.COMP_FULL_NM}</td>
			    		<th class="car-info-title">배기량</th>
			    		<td class="car-info-value">
			    			<c:choose>
				    			<c:when test="${detailData.DPM > 50}">
				    				${detailData.DPM}cc
				    			</c:when>
				    			<c:otherwise>
				    				- <!-- 전기차인 경우 배기량이 0이므로 출력하지 않는다  -->
				    			</c:otherwise>
			    			</c:choose>
			    		</td>			    		
			    	</tr>
			    	<tr>
			    		<%-- <th class="car-info-title">차종 </th> --%>
			    		<%-- <td class="car-info-value">${mainData.CAR_KIND}</td> --%>
			    		<th class="car-info-title">승차정원</th>
			    		<td class="car-info-value">${priceList[0].JG_G_17}인승</td>
			    		<th class="car-info-title">연료</th>
			    		<td class="car-info-value">${mainData.DIESEL}</td>			    		
			    	</tr>
			    	<tr>
			    		<th class="car-info-title">변속기</th>
			    		<td class="car-info-value">${mainData.AUTO}</td>
			    		<th class="car-info-title">차량가격<br/></th>
			    		<td class="car-info-value"><fmt:formatNumber value="${mainData.O_1_2}" pattern="#,###" />만원</td>			    		
			    	</tr>
			    </table>
		    </div>
		    <div class="car-info" style="padding:33px;">
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
	   <div role="tabpanel" class="tab-pane domestic-content-box" id="spec" style="padding:20px;">
	    	<div>
		    	<h4 class=primary>기본사양품목<small class="spec-title bold" style="font-size:15px;">&nbsp;&nbsp;(${mainData.CAR_NM} ${mainData.CAR_NAME})</small></h4>
		    	<c:if test="${spec ne null}">
		    		<span class="spec-title bold">${spec} 기본사양품목 및</span>
		    	</c:if>
		    	<pre>${detailData.CAR_B}</pre>
		    	<div class="spec-option-box">
					<h4 class="primary">선택사양품목</h4>
					<%-- <c:forEach var="option" items="${optionList}">
						• ${option.NM} ${option.OPT_B} : <span class="bold"><fmt:formatNumber value="${option.AMT}" pattern="#,###"/>원</span><BR/>
					</c:forEach> --%>
					<c:forEach var="option" items="${optionList}">
						• ${option.NM} : <span class="bold"><fmt:formatNumber value="${option.AMT}" pattern="#,###"/>원</span><BR/>
						<c:if test="${option.OPT_B != '' and option.OPT_B != null}">
							<div style="margin-left: 8px;">- ${option.OPT_B}</div>
						</c:if>
					</c:forEach>
				</div>
				<br/><br/>
				<!-- 상위 사양이 있으면 -->
				<c:if test="${specList ne null}"> 
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
									<h5 class="spec-title">${mainData.CAR_NM} ${spec.CAR_NAME}</h5>
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
	<div class="price-select-group" style='display: flex; margin-bottom: 0px !important;'>
		<%-- <span>연간 약정운행거리 선택&nbsp;:&nbsp;</span>
		<input type="radio" name="mileage-option" id="option1" value="20000" <c:if test="${param.agreeDist eq 20000}">checked</c:if> />
		<label for="option1" style="font-weight:500 !important;">20,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="mileage-option" id="option2" value="30000" <c:if test="${param.agreeDist eq 30000}">checked</c:if> >
		<label for="option2" style="font-weight:500 !important;">30,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="mileage-option" id="option3" value="40000" <c:if test="${param.agreeDist eq 40000}">checked</c:if> >
		<label for="option3" style="font-weight:500 !important;">40,000km</label>&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="margin-left:15px;font-weight:lighter;">약정운행거리 선택에 따라 월대여료가 달라집니다.</span> --%>
		<div>
			<span>연간 약정운행거리 선택&nbsp;:&nbsp;</span>
			<input type="radio" name="mileage-option" id="option1" value="10000" <c:if test="${param.agreeDist eq 10000}">checked</c:if> />
			<label for="option1" style="font-weight:500 !important;">10,000km</label>&nbsp;&nbsp;
			
			<input type="radio" name="mileage-option" id="option2" value="15000" <c:if test="${param.agreeDist eq 15000}">checked</c:if> />
			<label for="option2" style="font-weight:500 !important;">15,000km</label>&nbsp;&nbsp;
			
			<input type="radio" name="mileage-option" id="option3" value="20000" <c:if test="${param.agreeDist eq 20000}">checked</c:if> />
			<label for="option3" style="font-weight:500 !important;">20,000km</label>&nbsp;&nbsp;
			
			<input type="radio" name="mileage-option" id="option4" value="25000" <c:if test="${param.agreeDist eq 25000}">checked</c:if> />
			<label for="option4" style="font-weight:500 !important;">25,000km</label>&nbsp;&nbsp;
			
			<input type="radio" name="mileage-option" id="option5" value="30000" <c:if test="${param.agreeDist eq 30000}">checked</c:if> >
			<label for="option5" style="font-weight:500 !important;">30,000km</label>&nbsp;&nbsp;
			
			<input type="radio" name="mileage-option" id="option6" value="40000" <c:if test="${param.agreeDist eq 40000}">checked</c:if>>
			<label for="option6" style="font-weight:500 !important;">40,000km</label>&nbsp;&nbsp;
		</div>
		<div style="cursor: pointer; margin-left: 20px;">
      		<div style="border: 2px solid #f98460; background-color: #f98460; height: 30px; width: 220px; text-align: center; display: flex; justify-content: center; align-items: center;">
				<a class="minus_mileage" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');" style="color: #f98460; font-size: 13px; color: #ffffff">약정이하 운행 시 Km당  대여료 환급</a>
			</div>
       	</div>
	</div>
	<div>
		<span style="font-weight:lighter; margin-left: 150px;">※ 약정운행거리 선택에 따라 월대여료가 달라집니다.</span>
	</div>	
	<%-- <c:if test="${mainData.CAR_COMP_ID eq '0056'}">
		<div class="col-md-12" style="padding: 0px 0px 20px 0px !important; margin-top: 30px !important;">
			<span style="font-weight: bold;">※ 테슬라 차량의 경우 이용기간 36개월에 연간 약정운행거리 2만km 기준으로 견적됩니다.</span>
		</div>
	</c:if> --%>
	<!-- Tab panes -->
	<div class="tab-content price-tab">
	  	<ul class="nav nav-tabs amazon-detail-tab" role="tablist">
	   		<li role="presentation" class="active"><a href="#rent" aria-controls="rent" role="tab" data-toggle="tab">장기렌트</a></li>
	   		<li role="presentation"><a href="#leasePlus" aria-controls="leasePlus" role="tab" data-toggle="tab">리스</a></li>
	 	</ul>
	    <div role="tabpanel" class="tab-pane active domestic-content-box price-box" id="rent">
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
			    		<c:forEach var="priceData" items="${priceList}" varStatus="status">
			    			<c:set var="detailData" value="${detailData}" />
			    			<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">60개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RB60_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RB60_ID}">견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">48개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RB48_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RB48_ID}">견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">36개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RB36_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RB36_ID}" >견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>			    	
				    	</c:forEach>
			    	</table>
		    	</div>
	    	</div>
	    	<div class="price-tab-right">
		    	<div class="price-tab-subtitle" id="21">일반식(정비 포함)</div>
		    	<div class="price-info">
			    	<table>
					    <colgroup>
				    		<col width="30%"/>
				    		<col width="27%"/>
				    		<col width="20%"/>
				    		<col width="23%"/>
				    	</colgroup>
				    	<c:forEach var="priceData" items="${priceList}" varStatus="status">
				    		<c:set var="detailData" value="${detailData}" />
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">60개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RS60_AMT}" pattern="#,###" />원</span></span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RS60_ID}" >견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">48개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RS48_AMT}" pattern="#,###" />원</span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RS48_ID}">견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">36개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.RS36_AMT}" pattern="#,###" />원</span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.RS36_ID}">견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
				    	</c:forEach>
			    	</table>
		    	</div>
	    	</div>
	    </div>
		<div role="tabpanel" class="tab-pane domestic-content-box price-box" id="leasePlus">
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
			    		<c:forEach var="priceData" items="${priceList}" varStatus="status">
			    			<c:set var="detailData" value="${detailData}" />
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">60개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LB60_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LB60_ID}">견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>			    	
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">48개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LB48_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LB48_ID}">견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">36개월</td>
					    		<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LB36_AMT}" pattern="#,###" />원</span></td>
					    		<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LB36_ID}">견적서 보기</button></td>
					    		<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
				    	</c:forEach>
			    	</table>
		    	</div>
	    	</div>
	    	<div class="price-tab-right">
		    	<div class="price-tab-subtitle" id="11">일반식(정비 포함)</div>
		    	<div class="price-info">
			    	<table>
					    <colgroup>
				    		<col width="30%"/>
					    		<col width="27%"/>
					    		<col width="20%"/>
					    		<col width="23%"/>
				    	</colgroup>
				    	<c:forEach var="priceData" items="${priceList}" varStatus="status">   
				    		<c:set var="detailData" value="${detailData}" /> 	
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">60개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LS60_AMT}" pattern="#,###" />원</span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LS60_ID}">견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>			    	
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">48개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LS48_AMT}" pattern="#,###" />원</span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LS48_ID}">견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
					    	<tr id="${priceData.AGREE_DIST}" class="price-info-tr">
					    		<td class="price-unit">36개월</td>
				    			<td class="detail-price"><span class="text-bold"><fmt:formatNumber value="${priceData.LS36_AMT}" pattern="#,###" />원</span></td>
				    			<td class="text-center"><button type="button" class="detail-btn-print" id="${priceData.LS36_ID}">견적서 보기</button></td>
				    			<td class="text-center">
					    			<c:if test="${detailData.USE_YN eq 'Y' && detailData.ESTIMATE_YN eq 'Y' && detailData.MAIN_YN eq 'Y' && detailData.HP_YN eq 'Y'}">
					    				<button type="button" class="detail-btn-request">맞춤견적내기</button>
					    			</c:if>
					    		</td>
					    	</tr>
				    	</c:forEach>
			    	</table>
		    	</div>
	    	</div>
	    </div>
	</div>
	<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="" />
	</sec:authorize>
	<form method="post" id="estimateFrm" action="/estimate/smart/step1">
		<input type="hidden" value="${detailData.CAR_SEQ}" name="carSeq" id="carSeq" />
		<input type="hidden" value="${estimateData.CAR_AMT}" name="carAmt" id="carAmt" />
		<input type="hidden" value="${mainData.SEQ}" name="seq" id="seq" />
		<input type="hidden" value="${mainData.CAR_NM}" name="carName" id="carName" />
		<input type="hidden" value="${mainData.CAR_NAME}" name="carDetailName" id="carDetailName" />
		<input type="hidden" value="${mainData.CAR_CD}" name="carCode" id="carCode" />
		<input type="hidden" value="${mainData.CAR_COMP_ID}" name="carCompId" id="carCompId" />
		<input type="hidden" value="${estimateData.EST_ID}" name="estimateId" id="estimateId"/>
		<input type="hidden" value="${detailData.CAR_ID}" name="carId" id="carId"/>
		<input type="hidden" value="${mainData.stdAgreeDist}" name="stdAgreeDist" id="stdAgreeDist"/>
		<input type="hidden" value="" name="agreeDist" id="agreeDist"/>
		<input type="hidden" value="" name="gubun" id="gubun"/>
		<input type="hidden" value="" name="period" id="period"/>
		<input type="hidden" value="" name="foreignFlag" id="foreignFlag"/>
		<input type="hidden" value="${mainData.JG_G_7}" id="jg_g_7"/>
		<input type="hidden" value="${detailData.DUTY_FREE_OPT}" id="duty_free_opt"/>
	</form>
	<c:choose>
		<c:when test="${(mainData.JG_G_7 eq 3) && (mainData.CAR_COMP_ID ne '0056') && !(detailData.JG_CODE eq '9133' || detailData.JG_CODE eq '9015435')}">
			<div class="vat-info" style="height: 180px;">
				<!-- <span style="font-weight: bold; font-size: 16px;">반납형 기준 월대여료입니다. 매입옵션이 주어지는 [기본식 인수/반납 선택형 월대여료]는<br>기본식(정비 미포함) 견적서 보기 클릭시 확인 할 수 있습니다.</span><br> -->				
				<div style=""></div>
					보증금
				<c:choose>
					<c:when test="${fn:substring(mainData.CAR_COMP_ID,2,4) <= 5}">
						20% 
					</c:when>
					<c:otherwise>
						25% <!-- 수입차면 -->
					</c:otherwise>
				</c:choose>
		 		 기준, 보증금은 계약기간 만료 후 환불해드립니다.<br/>
		 		<c:choose>
					<c:when test="${fn:substring(mainData.CAR_COMP_ID,2,4) <= 5}">
						자동차세, 보험료  포함 / VAT 별도 가격입니다.<br/> 
					</c:when>
					<c:otherwise>
						자동차세, 보험료  포함 / VAT 별도 가격입니다. (단, 수입차 리스는 보험료 제외)<br/> <!-- 수입차면 -->
					</c:otherwise>
				</c:choose>
		 		이용 지역 서울 기준 월대여료입니다.<br/>
		 		<!-- ※선택 사양 추가 및 대여조건 변경 견적은 맞춤견적내기로 확인 가능 -->
		 		<span style="font-weight: bold;">※ 선택 사양 추가, 보증금 조정 및 대여조건 변경 견적은 맞춤 견적내기로 확인 가능</span>
			</div>
		</c:when>
		<c:otherwise>
			<div class="vat-info" <c:if test="${mainData.CAR_COMP_ID eq '0056'}">style="height: 200px !important;"</c:if>>				
				<c:if test="${mainData.CAR_COMP_ID eq '0056'}">
					<span style="font-weight: bold;">※ 24개월 견적은 맞춤견적내기로 확인 가능합니다.</span><br>
				</c:if>
				보증금
				<%-- <c:if test="${estimateData.CAR_AMT >= 45000000}">25%</c:if>
				<c:if test="${estimateData.CAR_AMT < 45000000}">20%</c:if> --%>
				<c:choose>
					<c:when test="${fn:substring(mainData.CAR_COMP_ID,2,4) <= 5}">
						20%
					</c:when>
					<c:otherwise>
						25% <!-- 수입차면 -->
					</c:otherwise>
				</c:choose>
		 		 기준, 보증금은 계약기간 만료 후 환불해드립니다.<br/>
		 		<c:choose>
					<c:when test="${fn:substring(mainData.CAR_COMP_ID,2,4) <= 5}">
						자동차세, 보험료  포함 / VAT 별도 가격입니다.<br/> 
					</c:when>
					<c:otherwise>
						자동차세, 보험료  포함 / VAT 별도 가격입니다. <!-- (단, 수입차 리스는 보험료 제외) --><br/> <!-- 수입차면 -->
					</c:otherwise>
				</c:choose>
		 		이용 지역 서울 기준 월대여료입니다.<br/>
		 		<!-- ※선택 사양 추가 및 대여조건 변경 견적은 맞춤견적내기로 확인 가능 -->
		 		<span style="font-weight: bold;">※ 선택 사양 추가, 보증금 조정 및 대여조건 변경 견적은 맞춤 견적내기로 확인 가능</span>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div class="text-center">
		<button type="button" class="list-btn" onclick="javascript:history.back();"><i class="glyphicon glyphicon-list"></i>&nbsp;&nbsp;목록으로</button>
	</div>
</t:genericpage>
