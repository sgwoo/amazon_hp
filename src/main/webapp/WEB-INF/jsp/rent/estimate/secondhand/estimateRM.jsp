<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/common.css"/>
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
<link rel="stylesheet" href="/resources/stylesheets/print.css"/>
<script src="/resources/js/library/printThis.js"></script>
<script src="/resources/js/library/jspdf.min.js"></script>
<script src="/resources/js/library/html2canvas.js"></script>
<style>
.underline {
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여  */
   color: black;
}
</style>
<script>
var _CONVERSION_CPCGUARD = 2; //cpcguard
$(document).ready(function(){
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* $("#no-modal").click(function(){
		alert("현재, 서버 정비작업으로 인해 간편상담신청이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */
	
	// url 가져오기
	var url = location.href;
	
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    var firstParam = parameters[0].split('=')[0];
    // var firstParamVal = parameters[0].split('=')[1];
    
    /* alert(firstParam);
    alert(firstParamVal); */    
    
   /*  var urlParam = parameters[0].split('=')[1];
    var urlParamChk = urlParam.indexOf("HP");
    alert(urlParamChk); */
    
    /* if (firstParam == "carManagedId") {
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show();
    } */
    
    var date = new Date(); 
    var year = date.getFullYear(); 
    var month = new String(date.getMonth()+1); 
    var day = new String(date.getDate()); 

    // 한자리수일 경우 0을 채워준다. 
    if(month.length == 1){ 
      month = "0" + month; 
    } 
    if(day.length == 1){ 
      day = "0" + day; 
    }
    
    var today = year + "" + month + "" + day;
    var rent_dt = $("#rent_dt").val();
    
    if (today == rent_dt) {
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show(); 
    }
	
	//연비에서 () 안의 글자를 복합연비기준으로 대체한다
	var contiRatDesc = $('#contiRatDesc').text();
	var point = contiRatDesc.indexOf("(");
	if(point == -1){
		$('#contiRatDesc').text( contiRatDesc + "(복합연비기준)");
	}else{
		$('#contiRatDesc').text(contiRatDesc.substring(0,point) + "(복합연비기준)");
	}

	var titleCount = 0;
	$(".title-num").each(function(){
		if($(this).css("display") != "hidden"){
			titleCount++;
			var text = $(this).text();
			$(this).text(titleCount + ". " + text);
		}
	})
	
	$('#print').click(function(){
		$('.print-content').printThis({
			pageTitle: "장기렌트의 기준-아마존카" 
		});
		printAnalytics();
		ga('send', 'event', '버튼', '클릭', ''); //구글 광고 전환 분석 함수 호출
		if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
			DaumConversionDctSv="type=W,orderID=,amount=";
			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
			var DaumConversionScriptLoaded=true;
			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
		}
	})
	
	$("#contract-doc-print-btn").click(function(){
		$("#contract-doc").printThis({
			pageTitle:"장기렌트의 기준-아마존카 계약준비서류"
		});
	})
	
	$('#pdf').click(function(){
		html2canvas(document.getElementById("print-report"),{
			onrendered:function(canvas){
				var imgData = canvas.toDataURL('image/png');
				var doc = new jsPDF("p","mm",[297,210]);
				doc.addImage(imgData,'PNG', 10, -5, 195, 300);
				doc.save('amazoncar-sheet.pdf');
			}
		});
		printAnalytics();
		ga('send', 'event', '버튼', '클릭', ''); //구글 광고 전환 분석 함수 호출
		if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
			DaumConversionDctSv="type=W,orderID=,amount=";
			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
			var DaumConversionScriptLoaded=true;
			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
		}
	})
	
	var gubunValue = $('#gubun').val().substr(1,1);
	$('#'+gubunValue).prop("checked", true);
	
	//차종명, 옵션 클릭시 세부사항 링크
	var estimateId = "${param.estimateId}";
	var car_id = "${data.CAR_ID}";
	var car_seq = "${data.CAR_SEQ}";
	var url = "https://www.amazoncar.co.kr/home/acar/main_car_hp/opt.jsp?est_id="+encodeURIComponent(estimateId)+"&car_id="+encodeURIComponent(car_id)+"&car_seq="+encodeURIComponent(car_seq);
	$(".detail-page").on("click", function(){
	   window.open(url,"차량 상세정보","width=800,height=500,top=0,left=100,scrollbars=yes");
	});
	
	//매입옵션 세팅
	setPurchaseOpt();
	
})

function carUnderlineOn()	{	$("#carDetail").addClass("underline"); 		}
function carUnderlineOff()	{	$("#carDetail").removeClass("underline");	}
function optUnderlineOn()	{	$("#optDetail").addClass("underline"); 		}
function optUnderlineOff()	{	$("#optDetail").removeClass("underline");	}

//매입옵션 세팅(20190419)
function setPurchaseOpt(){
	if($("#ro_13_amt").val() > 0 && $("#a_b").val() < 24){
		$("#ro_13").val(0);
		$("#ro_13_amt").val(0);
	}
	if($("#est_st").val()==3 && $("#o_l").val()==0){
		$("#ro_13").val(0);
		$("#ro_13_amt").val(0);
	}
	if($("#rent_dt").val() < 20190419 && $("#diesel_yn").val()==2){
		if($("#s_st").val()==300||$("#s_st").val()==301||$("#s_st").val()==302){
			$("#ro_13").val(0);
			$("#ro_13_amt").val(0);
		}
	}
	if($("#a_a").val()==21 || $("#a_a").val()==11){
		$("#ro_13").val(0);
		$("#ro_13_amt").val(0);
	}
	
	if($("#ro_13_amt").val()>0){
		$(".m_opt_on").css("display",'inline');
		$(".m_opt_off").css("display",'none');
	}else{
		$(".m_opt_on").css("display",'none');
		$(".m_opt_off").css("display",'table-row');
	}
	
	if($("#ro_13").val()==0){
		if($("#a_b").val()<24 || ($("#a_a").val()=='21'||$("#a_a").val()=='11')){
			$(".m_opt_on2").css("display",'table-row');
			$(".m_opt_off2").css("display",'none');
		}else{
			$(".m_opt_on2").css("display",'none');
			$(".m_opt_off2").css("display",'table-row');
		}
	}
	
}

</script>
<input type="hidden" value="${data.A_A}" id="gubun" />
<input type="hidden" value="${data.A_B}" id="a_b" />
<input type="hidden" value="${data.RO_13}" id="ro_13" />
<input type="hidden" value="${data.RO_13_AMT}" id="ro_13_amt" />
<input type="hidden" value="${data.EST_ST}" id="est_st" />
<input type="hidden" value="${data.RENT_DT}" id="rent_dt" />
<input type="hidden" value="${baseData.O_L}" id="o_l" />
<input type="hidden" value="${baseData.S_ST}" id="s_st" />
<input type="hidden" value="${detailData.DIESEL_YN}" id="diesel_yn" />

<jsp:useBean id="toDay" class="java.util.Date" />
<c:set var="endDate" value="<%=new Date(new Date().getTime() + 60*60*24*3*1000)%>"/>
<div class="print-tool">
	<ul>	
		<li id="print"><span class="glyphicon glyphicon-print"></span>&nbsp;인쇄</li>
		<li data-toggle="modal" data-target="#email-modal"><span class="glyphicon glyphicon-envelope"></span>&nbsp;메일발송</li>
		<li id="pdf"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;PDF 다운로드</li>
		<!-- <li data-toggle="modal" data-target="#compare-modal"><span class="glyphicon glyphicon-signal"></span>&nbsp;비용비교 안내</li> -->
		<li data-toggle="modal" data-target="#requiredDoc"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;계약준비서류 안내</li>
		<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
		<li data-toggle="modal" data-target="#simple-esti-modal" class="point-dash"><span class="glyphicon glyphicon-edit"></span>&nbsp;간편상담신청</li>
		<!-- <li id="no-modal" class="point-dash"><span class="glyphicon glyphicon-edit"></span>&nbsp;간편상담신청</li> -->
	</ul>
</div>
<div id="print-report">
	<div class="print-container">
		<div class="print-content">
			<input type="hidden" id="rent_dt" value="${data.RENT_DT}">
			<br>
			<%-- <small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/> --%>
			<div class="print-header" style="margin-top: 10px;">
				<h1>아마존카 장기대여 견적서</h1>
				<div align="right" id="rent_dt_div" style="margin-top: -20px">
					<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/>
				</div>
				<div align="right" id="rent_dt_div2" style="margin-top: -20px">
					<input type="hidden" value="<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>">
					<small>작성일 : <fmt:formatDate value="${dateStr}" pattern="yyyy년 MM월 dd일"/></small><br/>
				</div>
				<div class="print-pre-info">
					<h3 class="primary-orange" style="margin-top:0px !important">
						<c:if test="${data.A_A eq '11'}">[리스 일반식] 보유차 재리스</c:if>
						<c:if test="${data.A_A eq '12'}">[리스 기본식] 보유차 재리스</c:if>
						<c:if test="${data.A_A eq '21'}">[장기렌트 일반식] 보유차 재렌트</c:if>
						<c:if test="${data.A_A eq '22'}">[장기렌트 기본식] 보유차 재렌트</c:if>
					</h3>
					<table class="customer-table">
						<tr>
							<td><span style="float:right"> 님 귀하</span></td>
						</tr>
						<tr>
							<td>Tel. </td>
						</tr>
						<tr>
							<td>Fax. </td>
						</tr>
					</table>
				</div>
				<div class="print-pre-info" style="width:55%;">
					<table class="inquiry-table table table-condensed">
				    	<colgroup>
				    		<col width="15%">
				    		<col width="40%">
				    		<col width="40%">
				    	</colgroup>
				    	<tr>
				    		<th class="car-info-title text-center" rowspan="5">이용<br/>문의</th>
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
			<div class="print-info">
				<div>
					<h4><span class="title-num"></span>&nbsp;대여차량</h4>			
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>제조사</th>
							<td>${detailData.CAR_COMP_NM}</td>
							<th class="text-center">금액</th>
						</tr>
						<tr>
							<th>차종(차량모델명)</th>
							<%-- <td class="print-primary">${detailData.CAR_JNM}&nbsp;${detailData.CAR_NM}</td> --%>
							<td class="print-primary">
								<div class="print-primary detail-page" id="carDetail" style="cursor: pointer;" onmouseover="carUnderlineOn()" onmouseleave="carUnderlineOff()">
									${detailData.CAR_JNM}&nbsp;${detailData.CAR_NM}
								</div>
							</td>
							<td class="text-right"><fmt:formatNumber value="${data.CAR_AMT}" pattern="#,###"/> 원</td>
						</tr>
						<tr>
							<th>옵션</th>
							<td class="print-primary">
								<div class="print-primary detail-page" id="optDetail" style="cursor: pointer;" onmouseover="optUnderlineOn()" onmouseleave="optUnderlineOff()">${data.OPT}</div>
							</td>
							<td class="text-right"><fmt:formatNumber value="${data.OPT_AMT}" pattern="#,###"/> 원</td>
						</tr>
						<tr>
							<th>색상</th>
							<td>
								<span class="badge" style="font-size:7px;">외장</span> ${data.COL} &nbsp;&nbsp;&nbsp;
								<c:if test="${!empty data.IN_COL}">
									<span class="badge" style="font-size:7px;">내장</span> ${data.IN_COL}
								</c:if>
							</td>
							<td class="text-right"><fmt:formatNumber value="${empty data.COL_AMT ? 0 : data.COL_AMT}" pattern="#,###"/> 원</td>
						</tr>
						<c:if test="${data.CONTI_RAT ne null}">
							<tr>
								<th>연비</th>
								<td><span id="contiRatDesc">${data.CONTI_RAT}</span></td>
								<td></td>
							</tr>
						</c:if>
						<!-- 신차일때의 개소세감면액 추가 2017.10.12 -->
						<c:if test="${data.TAX_DC_AMT ne null && data.TAX_DC_AMT ne 0}">
							<tr>
								<th>신차 개소세 감면</th>
								<td></td>
								<td class="text-right">-<fmt:formatNumber value="${empty data.TAX_DC_AMT ? 0 : data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
							</tr>
						</c:if>
						<tr>
							<th>감가상각</th>
							<%-- <td>신차등록일: ${detailData.INIT_REG_DT}(모델연도:${detailData.CAR_Y_FORM})&nbsp;&nbsp;주행거리: <fmt:formatNumber value="${data.TODAY_DIST}"/>&nbsp;km</td> --%>
							<td>
								신차등록일 : ${detailData.INIT_REG_DT}(모델연도:${detailData.CAR_Y_FORM})<br>
								주행거리 : <fmt:formatNumber value="${data.TODAY_DIST}"/>&nbsp;km 
								<c:if test="${data.TOT_DT != '' && data.TOT_DT != null}">
									<fmt:parseDate value="${data.TOT_DT}" var="dateFmt" pattern="yyyyMMdd"/>
									(확인일자 : <fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>)
								</c:if>
							</td>
							<c:choose>
								<c:when test="${data.TAX_DC_AMT ne null && data.TAX_DC_AMT ne 0}">
									<td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1 - data.TAX_DC_AMT}" pattern="#,###"/>원</td>
								</c:when>
								<c:otherwise>
									<td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1}" pattern="#,###"/>원</td>	
								</c:otherwise>
							</c:choose>
							<%-- <td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1}" pattern="#,###"/>원</td> --%>
						</tr>
						<tr>
							<th>차량가격</th>
							<td>차량번호 : ${detailData.CAR_NO}</td>
							<td class="print-primary text-right""><fmt:formatNumber value="${data.O_1}" pattern="#,###" /> 원</td>
						</tr>
					</table>
					<small>※ 엔진, 변속기 : 2개월/5,000Km 품질보증 (기간 또는 주행거리 중 먼저 도래한 것을 보증기간 만료로 간주)</small>
					<div style="float:right;">
						<small>
							<c:choose>
								<c:when test="${detailData.JG_CODE eq '1232' || detailData.JG_CODE eq '1021212'}"> ※ LPG/휘발유 겸용차</c:when>	
								<c:when test="${detailData.JG_CODE eq '1242' || detailData.JG_CODE eq '1023112'}"> ※ LPG/휘발유 겸용차</c:when>	
								<c:otherwise>
									<c:choose>
										<c:when test="${compareData.ENGIN eq 'Y'}"> ※ 디젤엔진 </c:when>
										<c:when test="${compareData.ENGIN eq '1'}"> ※ 가솔린엔진 </c:when>
										<c:when test="${compareData.ENGIN eq '2'}"> ※ LPG전용차 </c:when>
										<c:when test="${compareData.ENGIN eq '3'}"> ※ 하이브리드 </c:when>
										<c:when test="${compareData.ENGIN eq '4'}"> ※ 플러그인 하이브리드 </c:when>
										<c:when test="${compareData.ENGIN eq '5'}"> ※ 전기차 </c:when>
										<c:when test="${compareData.ENGIN eq '6'}"> ※ 수소차 </c:when>
										<c:otherwise>
											<c:if test="${detailData.DIESEL_YN eq 'Y'}"> ※ 디젤엔진  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '1'}"> ※ 가솔린엔진  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '2'}"> ※ LPG전용차  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '3'}"> ※ 하이브리드 </c:if>
											<c:if test="${detailData.DIESEL_YN eq '4'}"> ※ 플러그인 하이브리드  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '5'}"> ※ 전기차  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '6'}"> ※ 수소차  </c:if>
										</c:otherwise>
									</c:choose>	
								</c:otherwise>
							</c:choose>
						</small>
					</div>
					<c:if test="${data.BR_TO_ST ne NULL}">
					<div>
						<small>
							※ 고객주소지(차량인도지역) : 
							<c:if test="${data.BR_TO_ST eq '0'}"> 수도권  </c:if>
							<c:if test="${data.BR_TO_ST eq '1'}"> 대전/세종/충남/충북  </c:if>
							<c:if test="${data.BR_TO_ST eq '2'}"> 대구/경북  </c:if>
							<c:if test="${data.BR_TO_ST eq '3'}"> 광주/전남/전북 </c:if>
							<c:if test="${data.BR_TO_ST eq '4'}"> 부산/울산/경남  </c:if>
							<c:if test="${data.BR_TO_ST eq '5'}"> 강원  </c:if>
						</small>
					</div>
					</c:if>
					<c:if test="${baseData.DIST_CNG ne NULL}">
						<div style="margin-top:5px;">
							<small>
								※ 위 차량은 계기판 교환 이력이 있는 차량으로 계기판 교환 전 주행 거리는 ${baseData.B_DIST}km, 교환 후 현 계기판의 주행 거리는 <fmt:formatNumber value="${baseData.TODAY_DIST}" pattern="#,###" />km 입니다. <br/>
								감가상각 계산 시에는 주행거리를  <fmt:formatNumber value="${baseData.TODAY_DIST}" pattern="#,###" />km로 적용하고, 사고 수리에 따른 시세 하락을 반영하였습니다.
							</small>
						</div>
					</c:if>
				</div>
				
				<div>
					<h4><span class="title-num"></span>&nbsp;약정운행거리 <small>(약정운행거리 이하 운행시 환급대여료 지급)</small></h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col width="150px;"/>
							<col width="110px;"/>
						</colgroup>				
						<tr>
							<th rowspan="3">약정운행거리</th>
							<td rowspan="3">
								<span class="print-primary"><fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span>
							</td>
							<th rowspan="3" style='text-align: center;'>약정운행거리에<br>따른 정산</th>
							<td>
								<span style='font-weight: bold; width: 60%;'>(약정이하운행시) 환급대여료</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${ data.RTN_RUN_AMT_YN eq '1' }">
										미적용
									</c:when>
									<c:otherwise>
										${data.RTN_RUN_AMT}원/1km	(부가세 별도)
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<td><span style='font-weight: bold; width: 60%;'>(약정초과운행시) 초과운행대여료</span>&nbsp;&nbsp;&nbsp;&nbsp;${empty data.OVER_RUN_AMT ? 0 : data.OVER_RUN_AMT}원/1km(부가세 별도)</td>
						</tr>
						<tr>
							<td>
								<c:if test="${data.A_B >= 24}">
									<c:if test="${data.A_A eq 22 || data.A_A eq 12 }">
										매입옵션 행사시에는 (약정이하운행시) 환급대여료가 지급되지 않고, (약정초과운행시) 초과운행대여료가 면제됩니다. (기본식)
									</c:if>
								</c:if>
							</td>
						</tr>
						<%-- <tr>
							<td>
								<c:if test="${data.A_A eq 22 || data.A_A eq 12}">
									<c:if test="${detailData.DIESEL_YN ne '2'}"> <!-- LPG차량이 아니고 -->									
										<c:if test="${data.RO_13_AMT > 0 && data.A_B >= 24}">
											매입옵션 행사시에는 초과운행대여료가 면제됩니다
										</c:if>
									</c:if>
								</c:if>
								<c:if test="${data.OPT_CHK eq 1}">매입옵션 행사시에는 초과운행대여료가 면제됩니다</c:if>
							</td>
						</tr> --%>
					</table>
					<small>* 약정운행거리를 줄이면 대여요금이 인하되고, 약정운행거리를 늘리면 대여요금이 인상됩니다.</small>
				</div>
				
				<div style='display: flex;'>
					<div class="" style="width:260px;margin-right:10px;">
						<%-- <c:if test="${param.car_gubun=='7' && param.leaseYn=='1'}">
							<h4><span class="title-num"></span>&nbsp;대여요금<small>(보험료 미포함)</small></h4>
						</c:if>
						<c:if test="${param.car_gubun!='7' || param.leaseYn!='1'}">
							<h4><span class="title-num"></span>&nbsp;대여요금<small>(보험료 포함)</small></h4>
						</c:if> --%>
						<h4>
							<span class="title-num"></span>&nbsp;대여요금
							<small>
								<c:choose>
									<c:when test="${data.INS_PER ne '2'}">
										<c:choose>
											<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 12 }">
												<!-- (보험료 미포함) -->
												(보험료 포함)
											</c:when>
											<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 11 }">
												(보험료 미포함)
											</c:when>
											<c:otherwise>
												(보험료 포함)
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										(보험료 미포함)
									</c:otherwise>
								</c:choose>
							</small>
						</h4>					
						<table class="print-table table table-condensed table-bordered">
							<colgroup>
								<col width="110px;"/>
							</colgroup>			
							<tr>
								<th>대여기간</th>
								<td class="text-right">${data.A_B}개월</td>
							</tr>
							<tr>
								<th>공급가</th>
								<td class="text-right">
									<fmt:formatNumber value="${data.TO_FEE_S_AMT}" pattern="#,###" /> 원
									<%-- <fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" /> 원 --%>
								</td>
							</tr>
							<tr>
								<th>부가세</th>
								<td class="text-right">
									<fmt:formatNumber value="${data.TO_FEE_V_AMT}" pattern="#,###" /> 원
									<%-- <fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" /> 원 --%>
								</td>
							</tr>
							<tr>
								<th>월대여료</th>
								<td class="print-primary text-right">
									<%-- <fmt:formatNumber value="${data.FEE_S_AMT + data.FEE_V_AMT}" pattern="#,###" /> 원 --%>
									<fmt:formatNumber value="${data.TO_FEE_S_AMT + data.TO_FEE_V_AMT}" pattern="#,###" /> 원
								</td>
							</tr>
						</table>
					</div>
					<div class="" style="width:490px;">
						<h4><span class="title-num"></span>&nbsp;보험보상범위</h4>
						<table class="print-table table table-condensed table-bordered">
							<colgroup>
								<col width="110px;"/>
								<col/>
								<col width="110px;"/>
							</colgroup>			
							<c:choose>
								<c:when test="${data.INS_PER ne '2'}">
									<c:choose>
										<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 12 }">
											<%-- <tr>
												<th>대인배상</th>
												<td class="text-center">보험미반영</td>
												<th>무보험차상해</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>	
												<th>대물배상</th>
												<td class="text-center">보험미반영</td>
												<th>운전자연령</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>
												<th>자기신체사고</th>
												<td class="text-center">보험미반영</td>
												<th>긴급출동</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>
												<th>자차면책금</th>
												<td class="text-center">보험미반영</td>
												<th></th>
												<td></td>
											</tr> --%>
											<tr>
												<th>대인배상</th>
												<td>무한(대인 I, II)</td>
												<th>무보험차상해</th>
												<td>1인당 최고 2억원</td>
											</tr>
											<tr>	
												<th>대물배상</th>
												<td>
													<c:if test="${data.INS_DJ == 1}">5천만원/</c:if>
													<c:if test="${data.INS_DJ == 2}">1억원</c:if>
													<c:if test="${data.INS_DJ == 3}">5억원</c:if>
													<c:if test="${data.INS_DJ == 4}">2억원</c:if>
													<c:if test="${data.INS_DJ == 8}">3억원</c:if>
												</td>
												<th>운전자연령</th>
												<td>
													만
													<c:if test="${data.INS_AGE == 1}">26</c:if>
													<c:if test="${data.INS_AGE == 2}">21</c:if>
													<c:if test="${data.INS_AGE == 3}">24</c:if>
													세 이상					
												</td>
											</tr>
											<tr>
												<th>자기신체사고</th>
												<td>
													<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
													<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
												</td>
												<th>긴급출동</th>
												<td>가입</td>
											</tr>
											<tr>
												<th>자차면책금</th>
												<td><fmt:formatNumber value="${data.CAR_JA}" pattern="#,###"/>원</td>
												<th></th>
												<td></td>
											</tr>
										</c:when>
										<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 11 }">
											<tr>
												<th>대인배상</th>
												<td class="text-center">보험미반영</td>
												<th>무보험차상해</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>	
												<th>대물배상</th>
												<td class="text-center">보험미반영</td>
												<th>운전자연령</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>
												<th>자기신체사고</th>
												<td class="text-center">보험미반영</td>
												<th>긴급출동</th>
												<td class="text-center">보험미반영</td>
											</tr>
											<tr>
												<th>자차면책금</th>
												<td class="text-center">보험미반영</td>
												<th></th>
												<td></td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<th>대인배상</th>
												<td>무한(대인 I, II)</td>
												<th>무보험차상해</th>
												<td>1인당 최고 2억원</td>
											</tr>
											<tr>	
												<th>대물배상</th>
												<td>
													<c:if test="${data.INS_DJ == 1}">5천만원/</c:if>
													<c:if test="${data.INS_DJ == 2}">1억원</c:if>
													<c:if test="${data.INS_DJ == 3}">5억원</c:if>
													<c:if test="${data.INS_DJ == 4}">2억원</c:if>
													<c:if test="${data.INS_DJ == 8}">3억원</c:if>
												</td>
												<th>운전자연령</th>
												<td>
													만
													<c:if test="${data.INS_AGE == 1}">26</c:if>
													<c:if test="${data.INS_AGE == 2}">21</c:if>
													<c:if test="${data.INS_AGE == 3}">24</c:if>
													세 이상					
												</td>
											</tr>
											<tr>
												<th>자기신체사고</th>
												<td>
													<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
													<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
												</td>
												<th>긴급출동</th>
												<td>가입</td>
											</tr>
											<tr>
												<th>자차면책금</th>
												<td><fmt:formatNumber value="${data.CAR_JA}" pattern="#,###"/>원</td>
												<th></th>
												<td></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<tr>
										<th>대인배상</th>
										<td class="text-center">보험미반영</td>
										<th>무보험차상해</th>
										<td class="text-center">보험미반영</td>
									</tr>
									<tr>	
										<th>대물배상</th>
										<td class="text-center">보험미반영</td>
										<th>운전자연령</th>
										<td class="text-center">보험미반영</td>
									</tr>
									<tr>
										<th>자기신체사고</th>
										<td class="text-center">보험미반영</td>
										<th>긴급출동</th>
										<td class="text-center">보험미반영</td>
									</tr>
									<tr>
										<th>자차면책금</th>
										<td class="text-center">보험미반영</td>
										<th></th>
										<td></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
				
				<c:if test="${data.CAR_COMP_ID > 5 && data.A_A == 12}">
					<div class="col-md-12 col-xs-12" style="padding: 0px; text-align: right;">
						<small>	※ 사고수리시 아마존카 지정 정비공장에서 수리</small><br/>
					</div>
				</c:if>
				
				<!-- 재렌트/재리스도 멘트 추가 2017.09.18-->
				<div>
					<c:if test="${baseData.JG_CODE < 1000000 && (baseData.JG_CODE > 6999 || baseData.JG_CODE < 2000)}">
						<small>	* 대여료(월대여료,선납금)가 업무용으로 손비처리 가능할 경우 부가세는 매입세액공제(환급)받으실 수 있습니다.</small><br/>
					</c:if>
					<c:if test="${baseData.JG_CODE > 1000000 && (baseData.JG_CODE > 6999999 || baseData.JG_CODE < 2000000)}">
						<small>	* 대여료(월대여료,선납금)가 업무용으로 손비처리 가능할 경우 부가세는 매입세액공제(환급)받으실 수 있습니다.</small><br/>
					</c:if>
					<c:if test="${data.INS_AGE eq 2 || data.INS_AGE eq 3 || data.CAR_JA eq 200000}">
						<small>* 운전자 연령 및 자차 면책금은 최종 심사 후 조정 될 수 있습니다.</small>
					</c:if>
				</div>
				
				<div>
					<h4><span class="title-num"></span>&nbsp;초기납입금</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col width="150px; "/>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>보증금</th>
							<td class="text-right"><fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" /> 원</td>
							<th class="text-center">차가의 ${data.RG_8}%</th>
							<td>
								보증금은 계약기간 만료 후 환불해 드립니다. [보증금 100만원을 증액하면,
		  						월대여료 5,500원(VAT포함)이 인하됩니다.(년리6.6%효과)]
		  					</td>
						</tr>
						<tr>
							<th>선납금</th>
							<td class="text-right">
								<%-- <fmt:formatNumber value="${empty data.PP_AMT ? data.PP_AMT : 0}" pattern="#,###" /> 원 --%>
								<fmt:formatNumber value="${data.PP_AMT}" pattern="#,###" /> 원
							</td>
							<th class="text-center">VAT 포함</th>
							<td>선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.
								<div style="font-size: 10.8px !important;">※ 세금계산서는 계약이용기간 동안 매월 균등 발행 또는 납부시 일시 발행 중 선택가능</div>
							</td>
						</tr>
						<tr>
							<th>개시대여료</th>
							<td class="text-right">${data.IFEE_S_AMT + data.IFEE_V_AMT} 원</td>
							<th class="text-center">VAT 포함</th>
							<td>개시대여료는 마지막 (${data.G_10})개월치 대여료를 선납하는 것입니다.</td>
						</tr>
						<tr>
							<th>합계</th>
							<td class="print-primary text-right""><fmt:formatNumber value="${data.RG_8_AMT + data.PP_AMT}" pattern="#,###" /> 원</td>
							<th colspan="2">위의 대여요금은 좌측 초기납입금 이자효과가 반영된 금액입니다.</th>
						</tr>
					</table>
					<!-- <small>※ 초기납입금은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</small> -->
					<small>* 초기납입금은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다. (고객신용도에 따른 최소 초기납입금 규정이 있습니다)</small>
				</div>
				<%-- <c:if test="${data.A_A eq 22 || data.A_A eq 12}">
					<c:if test="${detailData.DIESEL_YN ne '2'}"> <!-- LPG차량이 아니고 -->									
						<c:if test="${data.RO_13_AMT > 0 && data.A_B >= 24}"> --%>
							<div>
								<h4><span class="title-num"></span>&nbsp;적용 잔가율</h4>
								<table class="print-table table table-condensed table-bordered">
									<colgroup>
										<col width="110px;"/>
										<col/>
										<col width="110px;"/>
									</colgroup>			
									<tr>
										<th>적용잔가율</th>
										<td class="text-center">
											<span class='m_opt_on' style="display:none;">&nbsp;${data.RO_13}%</span>
											<span class='m_opt_off' style="display:none;"></span>
										</td>
										<th colspan="2">적용잔가율 = 매입옵션율</th>
									</tr>
									<tr>
										<th>매입옵션가격</th>
										<td class="text-right" width="20%">
											<span class='m_opt_on' style="display:none;">
												&nbsp;<fmt:formatNumber value="${data.RO_13_AMT}" pattern="#,###" /> 원
											</span>
											<span class='m_opt_off' style="display:none;">&nbsp;매입옵션 없음</span>
										</td>
										<th class="text-center">
											<span class='m_opt_on' style="display:none;">&nbsp;VAT 포함</span>
											<span class='m_opt_off' style="display:none;"></span>
										</th>
										<td>
											<span class='m_opt_on' style="display:none;">
												&nbsp;본 매입옵션가격에 이용차량을 매입할 수 있는 권리를 드립니다.
											</span>
											<span class='m_opt_off' style="display:none;"></span>	
										</td>
									</tr>
								</table>
							</div>
							<div>
								<span class='m_opt_on2' style="display:none;">&nbsp;<span class=style8>※ 매입옵션은 <strong>기본식 24개월이상 계약</strong>시에만 주어짐.</span>
								<span class='m_opt_off2' style="display:none;">&nbsp;<span class=style8>※ 매입옵션 없음</span>
							</div>
						<%-- </c:if>
					</c:if>
				</c:if> --%>
				
				<div>
					<h4><span class="title-num"></span>&nbsp;중도해지위약금</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
						</colgroup>				
						<tr>
							<th>중도해지위약금</th>
							<td colspan="2">중도해지시에는 잔여계약기간 총 대여료의 <span class="print-primary">${data.CLS_PER}%</span> 의 위약금이 있음</td>
						</tr>
					</table>
				</div>
				
				<div>
					<h4>
						<span class="title-num"></span>&nbsp;차량관리 서비스 제공 범위
						<small>( 공통 서비스와 체크된 □칸의 서비스가 제공됩니다)
							<c:choose>
								<c:when test="${data.A_A=='22' || data.A_A=='12'}">
									<c:choose>
										<c:when test="${jgData.JG_K=='0'}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스 미제공
										</c:when>
										<c:when test="${jgData.JG_K=='2'}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 승용 및 RV로 제공
										</c:when>
										<c:when test="${jgData.JG_K=='3'}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관차량으로 제공
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${jgData.JG_K=='2'}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 승용 및 RV로 제공	
										</c:when>
										<c:when test="${jgData.JG_K=='3'}">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관차량으로 제공
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</small>
					</h4>
					<table class="print-table table table-condensed table-bordered" style="margin-bottom:0px !important;">
						<colgroup>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>공통서비스</th>
							<td>* 교통사고 발생시 <span class="bold">사고처리 업무 대행&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*사고대차서비스</span>(피해사고시는 보험대차)</td>
						</tr>
					</table>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="50%"/>
							<col width="50%"/>
						</colgroup>
						<tr>
							<th class="text-center"><input type="checkbox" id="2" /> <span class="bold">기본식</span> (정비서비스 미포함 상품)</th>
							<th class="text-center"><input type="checkbox" id="1" /> <span class="bold">일반식</span> (정비서비스 포함 상품)</th>
						</tr>
						<tr>
							<td>
								* 아마존케어 서비스<br/>
							     - 차량 정비 관련 유선 상담서비스 상시 제공<br/>
							     - 대여 개시 2개월 이내 무상 정비대차 제공<c:if test="${data.CAR_COMP_ID eq 56}">(테슬라차량 제외)</c:if><br/>
							       (24시간 이상 정비공장 입고시)<br/>
							     - 대여 개시 2개월 이후 원가 수준의 유상 정비대차 제공<br/>
							       (단기 대여요금의 15~30% 수준, 탁송료 별도)
							</td>
							<td>
							    * 일체의 정비서비스<br/>
							     - 각종 내구성부품/소모품 점검, 교환, 수리<br/>
							     - 제조사 차량 취급설명서 기준<br/>
							    * 정비대차서비스<br/>
							     - 4시간 이상 정비공장 입고시
							</td>
						</tr>
					</table>
				</div>
				
				<div>
					<h4><span class="title-num"></span>&nbsp;기타 대여 조건</h4>
					<ul>
						<li>자동차세 납부, 정기검사 등도 아마존카에서 처리(고객 비용 부담 없음)</li>
						<li>홈페이지에서 대여차량 유지관리내역 정보제공 【FMS(Fleet Management System)】</li>
						<li>대여기간 만료시에는 반납, 연장이용
						<c:if test="${data.A_A eq 22 || data.A_A eq 12}">
							<c:if test="${data.RO_13_AMT > 0 && data.A_B >= 24}">
							, 매입옵션 행사
							</c:if>
						</c:if>	
						중 선택 가능
						</li>
						<c:if test="${data.A_A eq '22' || data.A_A eq '21'}">
						<!-- <li>계약기간 동안 아래금액의 이행(지급)보증보험 가입조건(신용우수업체 면제)</li> -->
						<%-- <li>
							<span class="primary-orange">보증보험 가입 금액 :</span>
							0원 &nbsp;&nbsp;&nbsp;&nbsp;
							<span class="primary-orange">보증보험료(${data.A_B}개월치) : </span>
							0원
						</li> --%>
						</c:if>						
					</ul>
				</div>
				<!-- <div class="text-right" style="margin-top: -30px;"> -->
				<div class="text-right" style="margin-top: -10px;">
					<img src="/resources/images/ceo.gif"/>
				</div>
			</div>
		</div>
		
	</div>
</div>
<!-- modal -->
<!-- Modal -->
<div class="modal fade" id="requiredDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-body" id="contract-doc">
      			<h4 class="modal-title" id="myModalLabel">계약준비서류</h4><br/>
      			<table class="table table-condensed table-bordered print-table">
					<tbody>
						<tr>
							<th rowspan="2" width="7%">구분</th>
							<th rowspan='2' width='20%'>개인</th>
							<th rowspan='2' width='25%'>개인사업자</th>
							<th colspan='2'>법인</th>
						</tr>
						<tr>
							<th height="30" width='23%'><span>대표이사 자필서명</span></th>
							<th height="30" width='25%'><span>대표이사 자필서명이<br>어려운 경우</span></th>
						</tr>
						<tr>
							<th align="center"><span>제<br>출<br>서<br>류</span></th>
							<td style='vertical-align: unset !important; padding: 65px 5px 0px 5px !important;'>
								①운전면허증 사본<br>②통장 사본(자동이체용)
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								① 사업자등록증 사본<br>
								② 운전면허증 사본<br>
								③ 통장 사본(자동이체용)<br>
								④ 주운전자가 직원일 경우<br><span style='margin-left: 15px;'>주운전자 면허증 사본</span><br><br>
								<span style='font-size: 11px;'>※ 계약자(사업주)가 운전면허증이 없는 경우 주운전자가 공동임차인으로 계약 진행</span>
							</td>
							<td style='vertical-align: top !important; padding: 60px 5px 0px 5px !important;'>
								① 사업자등록증 사본<br>
								② 통장 사본(자동이체용)<br>
								③ 대표이사 신분증 사본<br>
								④ 주운전자 면허증 사본<br>
							</td>
							<td valign="top" style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								① 사업자등록증 사본<br>
								② 통장 사본(자동이체용)<br>
								③ 법인인감증명서 1통<br>
								④ 대표이사 신분증 사본<br>
								⑤ 대표이사 인감증명서 1통<br>
								⑥ 주운전자 면허증 사본<br><br>
								<span style='font-size: 11px;'>※ 인감증명서는 최근 3개월 이내 발급된 것이라야 합니다.</span><br><br>
								<span style='font-size: 11px;'>※ 대표이사 연대보증이 면제된 경우, 대표이사 개인인감증명서, 신분증 사본은 제출하지 않습니다.</span>
							</td>
						</tr>
						<tr>
							<th rowspan="2" align="center">
								계약서<br>작성시
							</th>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>계약자 자필 서명</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								계약자(사업주) 자필서명<br><br>
								<span style='font-size: 11px;'>※ 계약자(사업주)의 위임을 받은 직원이 계약을 대리해야 할 경우에는 계약자(사업주)의 개인인감도장을 날인하고 개인인감증명서(최근 3개월이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다.(아마존카 사전승인 및 대리인 신분증 필요)</span>
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span style='font-size: 10px;'>▶</span> 계약자란:<br>
								명판, 법인명의 도장 날인후<br>
								대표이사 자필서명<br><br>
								<span style='font-size: 10px;'>▶</span> 연대보증인란:<br>
								연대보증을 서는 대표이사<br>자필서명
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span style='font-size: 10px;'>▶</span> 계약자란:<br>
								명판, 법인인감도장 날인<br><br>
								<span style='font-size: 10px;'>▶</span> 연대보증인란:<br>
								연대보증을 서는 대표이사<br>개인인감도장 날인
							</td>
						</tr>
						<tr>
							<td colspan="4" height="30" style='padding-left: 5px !important; padding-right: 5px !important;'>
								① 계약자 및 연대보증인 「개인(신용)정보 수집·이용·제동·조회 동의서」 서명 필요<br>
								② 자동이체용 「CMS 출금이체 신청서」 서명 및 날인 필요
							</td>
						</tr>
						<tr>
							<th rowspan="2" align="center">
								<span>신용<br>심사<br>참고<br>서류</span>
							</th>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span>· 재직증명서<br>· 소득증빙자료<br>&nbsp;(원천징수영수증 등)</span>
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>· 매출증빙자료<br>&nbsp;(부가가치세과세표준증명서 등)</td>
							<td colspan="2">· 재무제표(대차대조표, 손익계산서 등)</td>
						</tr>
						<tr>
							<td colspan="4" height="30" style='padding-left: 5px !important; padding-right: 5px !important;'><span>※ 신용 심사에 필요할 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</span></td>
						</tr>
					</tbody>
				</table>
      		</div>
      		<div class="modal-footer">
      			<input type="button" class="btn btn-default-reverse" value="인쇄하기" id="contract-doc-print-btn">
      		</div>
    	</div>
  	</div>
</div>
<input type="hidden" id="mailTitle" value="${detailData.CAR_JNM} (${data.A_B}개월) 장기대여 견적서">
<input type="hidden" id="estimateId" value="${paramData.estCode}"/>
<input type="hidden" id="productType" value="PJ">
<%@include file="/WEB-INF/jsp/common/simple-esti-modal.jsp"%>
<%-- <%@include file="/WEB-INF/jsp/common/compare-modal.jsp"%> --%>
<%@include file="/WEB-INF/jsp/common/email-modal.jsp"%>
</t:blankpage>