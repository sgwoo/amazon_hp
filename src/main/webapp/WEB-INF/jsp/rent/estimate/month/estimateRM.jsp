<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/common.css"/>
<link rel="stylesheet" href="/resources/stylesheets/print.css"/>
<script src="/resources/js/library/printThis.js"></script>
<script src="/resources/js/library/jspdf.min.js"></script>
<script src="/resources/js/library/html2canvas.js"></script>
<%@include file="/WEB-INF/jsp/common/monthRent-modal.jsp"%> <!-- 원렌트 준비서류 모달 -->
<style>
.underline {
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여  */
   color: black;
}
</style>
<script>
var _CONVERSION_CPCGUARD = 2; //cpcguard
$(document).ready(function(){
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
			pageTitle: ""
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
	
	var gubunValue = $('#gubun').val();
	$('#'+gubunValue).prop("checked", true);
	
	//차종명 클릭시 세부사항 링크
	$(".detail-page").on("click", function(){
		var estimateId = "${param.estimateId}";
		var car_id = "${data.CAR_ID}";
		var car_seq = "${data.CAR_SEQ}";
		var url = "https://www.amazoncar.co.kr/home/acar/main_car_hp/opt.jsp?est_id="+encodeURIComponent(estimateId)+"&car_id="+encodeURIComponent(car_id)+"&car_seq="+encodeURIComponent(car_seq);
	   window.open(url,"차량 상세정보","width=800,height=500,top=0,left=100,scrollbars=yes");
	});
	
	//페이지 로딩시 월렌트값에 따른 checkbox 보여주기 유무
	var tempMonthPay = $("#supplyFeeVal").val();
	var monthPayIndex = tempMonthPay.lastIndexOf(".");
	var monthPay;
	if (monthPayIndex == -1) {
		monthPay = Number(tempMonthPay);
	} else {
		monthPay = Number(tempMonthPay.substring(0, monthPayIndex));
	}
	
	if (monthPay >= 750000) {
		$('#creditReview').show();
	} else {
		$('#creditReview').hide();
	}
	
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
    
    if (firstParam == "carManagedId") {
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show();
    }
    
 	// 유효기간 처리
    var limitTimeSet = Number($("#dateEnd").val());
    var limitTime = new Date(limitTimeSet);
    
    var currYear = limitTime.getFullYear();
    var currMonth = limitTime.getMonth() + 1; //Months are zero based
    var currDate = limitTime.getDate();
    var getLimitTime = currYear + "년 " + currMonth + "월 " + currDate + "일";
    // alert(getLimitTime);
    
    $("#limitDate").text(getLimitTime);

})

function carUnderlineOn()	{	$("#carDetail").addClass("underline"); 		}
function carUnderlineOff()	{	$("#carDetail").removeClass("underline");	}
function optUnderlineOn()	{	$("#optDetail").addClass("underline"); 		}
function optUnderlineOff()	{	$("#optDetail").removeClass("underline");	}

</script>
<input type="hidden" value="${data.A_A}" id="gubun" />
<jsp:useBean id="toDay" class="java.util.Date" />
<c:set var="endDate" value="<%=new Date(new Date().getTime() + 60*60*24*3*1000)%>"/>

<div class="print-tool">
	<ul>	
		<li id="print"><span class="glyphicon glyphicon-print"></span>&nbsp;인쇄</li>
		<li data-toggle="modal" data-target="#email-modal"><span class="glyphicon glyphicon-envelope"></span>&nbsp;메일발송</li>
		<li id="pdf"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;PDF 다운로드</li>
		<li data-toggle="modal" data-target="#monthrent-modal"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;계약준비서류 안내</li>
	</ul>
</div>
<div id="print-report">
	<div class="print-container">
		<div class="print-content">
			<%-- <small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/>
			<small>유효기간 : <fmt:formatDate value="${endDate}" pattern="yyyy년 MM월 dd일" /></small> --%>
			<br><br><br>
			<div class="print-header" style="height:150px; margin-top: 10px;">
				<h1 style="margin-bottom:10px !important;">아마존카 월렌트 견적서</h1>
				<div align="right" id="rent_dt_div" style="margin-top: -40px;">
					<input type="hidden" value="<fmt:formatDate value="${toDay}" pattern="yyyyMMdd" />">
					<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/>
					<small>유효기간 : <fmt:formatDate value="${endDate}" pattern="yyyy년 MM월 dd일" /></small>
				</div>
				<div align="right" id="rent_dt_div2" style="margin-top: -40px;">
					<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>					
					<%-- <input type="hidden" value="<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>"> <!--  id="rent_dt" --> --%>
					<small>작성일 : <fmt:formatDate value="${dateStr}" pattern="yyyy년 MM월 dd일"/></small><br/>
					<fmt:parseNumber var="dateEnd" value="${dateStr.time + 60*60*24*3*1000}"/>
					<input type="hidden" id="dateEnd" value="${dateEnd}">
					<%-- <input type="hidden" value="<fmt:parseNumber var="dateEnd" value="${data.RENT_DT + (60*60*24*3*1000)}" />"> <!--  id="rent_dt" --> --%>
					<%-- <small>유효기간 : <fmt:formatDate value="${endDate}" type="date" pattern="yyyy년 MM월 dd일" /></small> --%>
					<small>유효기간 : <span id="limitDate"></span></small>
					
				</div>
				<div class="print-pre-info" style="margin-top:10px;">
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
				    	<c:choose>
					    	<c:when test="${detailData.BR_NM eq '대전'}">
						    	<tr>
						    		<th class="car-info-title text-center">이용<br/>문의</th>
						    		<td>대전: 042-824-1770</td>
						    	</tr>
					    	</c:when>
					    	<c:when test="${detailData.BR_NM eq '대구'}">
						    	<tr>
						    		<th class="car-info-title text-center">이용<br/>문의</th>
						    		<td>대구: 053-582-2998</td>
						    	</tr>
					    	</c:when>
					    	<c:when test="${detailData.BR_NM eq '광주'}">
						    	<tr>
						    		<th class="car-info-title text-center">이용<br/>문의</th>
						    		<td>광주: 062-385-0133</td>
						    	</tr>
					    	</c:when>
					    	<c:when test="${detailData.BR_NM eq '부산'}">
						    	<tr>
						    		<th class="car-info-title text-center">이용<br/>문의</th>
						    		<td>부산: 051-851-0606</td>
						    	</tr>
					    	</c:when>
					    	<c:otherwise>
					    		<c:if test="${validTimeFlag eq false}"> <!-- 공휴일/주말이거나 워킹타임 아닌 경우 -->
							    	<tr>
							    		<th class="car-info-title text-center">이용<br/>문의</th>
							    		<td>여의도 : 02-757-0802</td>
							    	</tr>
					    		</c:if>
					    		<c:if test="${validTimeFlag eq true}"> 
					    			<tr>
							    		<th class="car-info-title text-center" rowspan="5">이용<br/>문의</th>
							    		<td>여의도 : 02-757-0802</td>
							    		<td>강남 : 02-537-5877</td>
							    	</tr>
							    	<tr>
							    		<td>광화문 : 02-2038-8661</td>
							    		<td>송파 : 02-2038-2492</td>
							    	</tr>
							    	<tr>
							    		<td>인천 : 032-554-8820</td>
							    		<td>수원 : 031-546-8858</td>
							    	</tr>
					    		</c:if>
					    		<%-- <c:if test="${empty validTimeFlag != '' || validTimeFlag eq null}"> 
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
					    		</c:if> --%>
					    	</c:otherwise>
				    	</c:choose>
				    </table>   
				</div>
			</div>
			<div class="print-info">
				<div>
					<h4><span class="title-num"></span>&nbsp;대여차량</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col width="*%;"/>
							<col width="110px;"/>
						</colgroup>
						<tr>
							<th>제조사</th>
							<td>${detailData.CAR_COMP_NM}</td>
							<th>금액</th>
						</tr>
						<tr>
							<th>차종(차량모델명)</th>
							<td class="print-primary">
								<%-- ${detailData.CAR_JNM}&nbsp;${detailData.CAR_NM} --%>
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
							<td>${data.COL}</td>
							<td class="text-right"><fmt:formatNumber value="${data.COL_AMT}" pattern="#,###"/> 원</td>
						</tr>
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
							<td>신차등록일: ${detailData.INIT_REG_DT}&nbsp;&nbsp;주행거리:<fmt:formatNumber value="${data.TODAY_DIST}"/>&nbsp;km</td>
							<c:set var="dc" value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1}"/>
							<c:choose>
								<c:when test="${data.TAX_DC_AMT ne null && data.TAX_DC_AMT ne 0}">
									<td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1 - data.TAX_DC_AMT}" pattern="#,###"/>원</td>
								</c:when>
								<c:otherwise>
									<td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1}" pattern="#,###"/>원</td>	
								</c:otherwise>
							</c:choose>
							<%-- <td class="text-right">-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.O_1}"/>원</td> --%>
						</tr>
						<tr>
							<th>차량가격</th>
							<td>차량번호 : ${detailData.CAR_NO}</td>
							<td class="print-primary text-right"><fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - dc}" pattern="#,###" /> 원</td>
						</tr>
					</table>
					<div class="text-right">
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
				</div>
				<div class="print-inline" style="width:260px;margin-right:10px;">
					<h4><span class="title-num"></span>&nbsp;대여요금<small>(보험료 포함)</small></h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>대여기간</th>
							<td class="text-center">${data.A_B}개월</td>
						</tr>
						<tr>
							<th>공급가</th>
							<td class="text-right">
								<c:if test="${paramData.naviFlag eq 'Y'}">
									<c:set var="supplyFee" value="${data.FEE_S_AMT + 25000}"/>
								</c:if>
								<c:if test="${paramData.naviFlag eq 'N'}">
									<c:set var="supplyFee" value="${data.FEE_S_AMT}"/>
								</c:if>
								<c:if test="${paramData.naviFlag eq null}">
									<c:set var="supplyFee" value="${data.FEE_S_AMT}"/>
								</c:if>
								<fmt:formatNumber value="${supplyFee}" pattern="#,###" /> 원
								<c:set var="vatFee" value="${supplyFee / 10}"/>
							</td>
							
						</tr>
						<tr>
							<th>부가세</th>
							<td class="text-right"><fmt:formatNumber value="${supplyFee / 10}" pattern="#,###" /> 원</td>
						</tr>
						<tr>
							<th>월대여료</th>
							<td class="print-primary text-right"><input type="hidden" id="supplyFeeVal" value="${supplyFee}"><fmt:formatNumber value="${supplyFee + vatFee}" pattern="#,###" /> 원</td>
						</tr>
					</table>
				</div>
				<div class="print-inline" style="width:490px;">
					<h4><span class="title-num"></span>&nbsp;보험보상범위</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col/>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>대인배상</th>
							<td>무한(대인 I, II)</td>
							<th>자차면책금</th>
							<td>300,000원</td>
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
							<th>무보험차상해</th>
							<td>
								1인당 최고 2억원			
							</td>
						</tr>
						<tr>
							<th>자기신체사고</th>
							<td>
								<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
								<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
							</td>
							<th>운전자연령</th>
							<td>만 26세 이상</td>
						</tr>
						<tr>
							<th>운전자범위</th>
							<td colspan="3">계약자 및 계약서상 명시된 추가 운전자</td>
						</tr>
					</table>
				</div>
				<div>
					<!-- <small>* 월단위 연장계약시 최초계약 월대여료 대비 3% 할인된 금액 적용</small> --><br>
				</div>
				<div>
					<h4 style="height:19px; margin-top: 120px;"><span class="title-num"></span>&nbsp;주요 대여조건</h4>
					<h5>필수 확인사항</h5>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px"/>
							<col width="*"/>
						</colgroup>
						<tr>
							<th>운전자격요건</th>
							<td>
								만 26세 이상 면허취득 3년이상인 대한민국 운전면허증 소지자(아마존카 월렌트는 만 26세 미만 보험 운영않음)<br>
								※ 국적이 대한민국인 사람만 이용가능 
							</td>
						</tr>
						<tr>
							<%-- <th>최초 대여료 결제</th> --%>
							<th>대여료 결제</th>
							<%-- <td>최초 대여료는 계약자 본인 명의(법인의 경우 법인 명의)의 신용카드로 결제해야 합니다.(체크카드 불가)</td> --%>
							<td>
								<!-- <div>대여료는 계약자 본인 명의(법인의 경우 법인 명의)의 신용카드로 결제해야 합니다.(체크카드 불가)</div>
								<div>※ 법인카드는 기명식 카드(카드에 이용자 개인 이름이 찍혀있는 법인카드)만 가능합니다.</div> -->
								<div>대여료는 계약자 본인 명의의 신용카드로 결제해야 합니다.(체크카드 불가)</div>
								<div>※ 법인의 경우에는 기명식 법인카드(카드에 이용자 개인 이름이 찍혀 있는 법인카드) 또는 법인 임직원 개인카드만 가능합니다.</div>
							</td>
						</tr>
						<tr>
							<th>운전자 범위</th>
							<td>
								일반개인 : 본인만 운전가능 (단, 배우자에 한하여 사전 심사 후 추가 가능)<br/>
								개인사업자 : 계약자(개인사업자) 및 사전에 면허증이 접수된 직원 1인만 운전 가능(임직원 한정운전 특약 가입)<br/>
								법인 : 사전에 면허증이 접수된 직원 2인만 운전 가능(임직원 한정운전 특약 가입)
							</td>
						</tr>
						<!-- 20180516_공급가에 따른 화면 표시 문구 추가 -->
						<tr id="creditReview">
							<th>신용심사</th>
							<td>
								본 차량은 계약자의 신용등급 조회가 필요한 차량입니다. (신용등급에 따라 계약진행이 불가 할 수 도 있습니다.)<br/>
							</td>
						</tr>
					</table>
					<h5>일반 확인사항</h5>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px"/>
							<col width="*"/>
						</colgroup>
						<tr>
							<th>약정운행거리</th>
							<td>4,000km / 1개월, 초과시 1km당 <span class="print-primary">${data.OVER_RUN_AMT}</span>원(부가세별도)의 초과운행대여료가 부과됩니다(대여종료시)</td>
						</tr>
						<tr>
							<th>예약 관련</th>
							<td>
								홈페이지를 통해서 차량 예약이 가능하고, 당사 직원과 상담을 통해서도 차량예약이 가능합니다.<br/>
								예약 기한은 근무일 기준 익일 16시까지 입니다. 예약 기한 내에 계약을 진행하셔야 예약이 취소되지 않습니다.
							</td>
						</tr>
						<tr>
							<th>차량인수/반납</th>
							<td>
								대여시 차량인수는 평일 오전 9시~오후 5시 내에만 가능합니다.<br/>
								차량인수 및 반납장소는 아마존카 주차장이 원칙이며, 반납시에는 탁송가능합니다.<br/>
								※ 탁송반납시 추가요금이 부과됩니다. 탁송료 예) 서울 : 22,000원(부가세 포함)
							</td>
						</tr>
						<tr>
							<th>대여요금 결제</th>
							<td>
								① 대여료는 1개월씩 선불로 결제해야 합니다.<br/>
								② 대여료는 계약자 본인 명의(체크카드 불가)의 신용카드로 결제해야 합니다.<br/> 
								<!-- &nbsp; (신용우수 개인 및 법인의 경우 당사 심사 후 승인된 경우에 한하여 현금결제도 가능)<br/> -->
								③ 2회차부터의 대여요금, 연장대여요금, 중도해지위약금, 면책금 등의 기타 채무는 신용카드로 자동출금됩니다.<br/>
								&nbsp; (계약시 신용카드 자동출금 신청 필수, 2회차부터의 대여요금은 해당 회차 대여시작일 하루 전날 결제)
							</td>
						</tr>
						<tr>
							<th>차량 이용 중 정비</th>
							<td>
								차량 이용 중 정비(고장수리, 엔진오일 교환 등)가 필요한 경우 필히 아마존카 관리담당자에게 연락하여야 하며,<br>
								차량 정비시 아마존카 지정정비업체로 직접 방문해 주셔야 합니다.<br>
								정비비는 아마존카에서 지불하며, 개인비용으로 처리시 비용처리가 안됩니다.
							</td>
						</tr>
						<tr>
							<th>계약 연장</th>
							<td>
								최초계약기간보다 연장하여 이용하고자 할 경우에는 <span class="print-primary">계약만료 7일 전</span>까지는 당사의 승인을 받아야 합니다.<br/>
								계약연장 희망시 고객님께서 먼저 아마존카로 연락하셔야 하며, 고객님의 연락이 없으면 연장하지 않는 것으로 간주합니다.<br/>
								일자단위로 연장계약시 전월 대여료 기준으로 일할계산하여 적용되며, 추가연장이 불가능합니다.
							</td>
						</tr>
						<tr>
							<th>중도해지시</th>
							<td>
								① 실이용기간이 1개월 이상일 경우: 잔여기간 대여요금의 <span class="print-primary">10%의 위약금</span>이 부과됩니다.<br/>
								② 실이용기간이 1개월 미만일 경우: 아래 5.의 요금정산 방법을 따릅니다.
							</td>
						</tr>
						<tr>
							<th>유류대 정산</th>
							<td>
								본 대여계약은 월렌트(장기계약)의 특성상 유류대 정산을 하지 않습니다. 이용자께서는 이점을 감안하시어 이용하시기 바랍니다.
							</td>
						</tr>
						<tr>
							<th>차량 반납<br/>가능 시간</th>
							<td>
								평일: 오전 9시~오후 5시까지 차량반납이 가능합니다.<br>
			                  	공휴일 및 토요일: 오전 9시~12시까지 차량반납이 가능합니다.<br>
			                  	일요일, 설날(음력 1월 1일) 및 추석 당일: 차량반납이 불가하오니 다음날 반납해 주시기 바랍니다.
<!-- 								차량 반납은 오전 9시~오후 5시까지 해 주셔야 합니다.<br/> -->
<!-- 								(단, 설날(음력 1월 1일) 및 추석 당일은 차량 반납이 불가합니다.) -->
							</td>
						</tr>
					</table>
				</div>
				<div>
					<h4><span class="title-num"></span>&nbsp;실 이용기간이 1개월 미만일 경우의 요금 정산</h4>
					<table  class="print-table table table-condensed table-bordered">
		               <tbody>
		                	<tr> 
		                  		<td colspan="31">&nbsp;<span>아래기준에 의거 이용 일수 만큼의 대여료가 적용됩니다. (단위: 일, %)</span></td>
		                	</tr>
		                	<tr>
		                		<th>이용 일수</th>
		                		<td>1</td>
		                		<td>2</td>
		                		<td>3</td>
		                		<td>4</td>
		                		<td>5</td>
		                		<td>6</td>
		                		<td>7</td>
		                		<td>8</td>
		                		<td>9</td>
		                		<td>10</td>
		                		<td>11</td>
		                		<td>12</td>
		                		<td>13</td>
		                		<td>14</td>
		                		<td>15</td>
		                		<td>16</td>
		                		<td>17</td>
		                		<td>18</td>
		                		<td>19</td>
		                		<td>20</td>
		                		<td>21</td>
		                		<td>22</td>
		                		<td>23</td>
		                		<td>24</td>
		                		<td>25</td>
		                		<td>26</td>
		                		<td>27</td>
		                		<td>28</td>
		                		<td>29</td>
		                		<td>30</td>
		                	</tr>
							<tr>
								<th>월대여료대비<br>적용율</th>
		                		<td>31</td>
		                		<td>37</td>
		                		<td>42</td>
		                		<td>46</td>
		                		<td>50</td>
		                		<td>53</td>		                		
		                		<td>56</td>		                		
		                		<td>59</td>		                		
		                		<td>62</td>		                		
		                		<td>64</td>		                		
		                		<td>66</td>		                		
		                		<td>69</td>		                		
		                		<td>71</td>		                		
		                		<td>73</td>		                		
		                		<td>75</td>		                		
		                		<td>77</td>		                		
		                		<td>79</td>		                		
		                		<td>81</td>		                		
		                		<td>83</td>		                		
		                		<td>84</td>		                		
		                		<td>86</td>		                		
		                		<td>88</td>		                		
		                		<td>89</td>		                		
		                		<td>91</td>		                		
		                		<td>93</td>		                		
		                		<td>94</td>		                		
		                		<td>96</td>		                		
		                		<td>97</td>		                		
		                		<td>99</td>		                		
		                		<td>100</td>
		                	</tr>
		             	</tbody>
		          </table>
		          <small>※ 예시) 6일 이용시 적용대여료: <fmt:formatNumber value="${supplyFee + vatFee}"/>원 × 53/100 = <fmt:formatNumber value="${(supplyFee + vatFee) * 0.53}"/>원  (기존 카드결제 취소 후, 적용대여료로 다시 결제함)</small>
				</div>
				<div>
					<h4><span class="title-num"></span>&nbsp;휴차 보상</h4>
					<table class="print-table table table-condensed table-bordered">
						<tr>
							<td colspan="6">
								고객의 귀책사유에 의한 사고 발생시, 대여차량의 수리기간에 해당하는 대여요금(아마존카 단기렌트 요금표 기준)의 50%를 고객이 부담하여야 합니다. (자동차대여 표준약관 제 19조에 의함)
							</td>
						</tr>
						<tr>
							<th rowspan="3" width="110px;">아마존카<br/>단기렌트 요금</th>
							<th>대여차량</th>
							<th colspan="4">대여기간 별 1일 요금(부가세 포함)</th>
						</tr>
						<tr>
							<td rowspan="2">${detailData.CAR_JNM}</td>
							<td>1~2일</td>
							<td>3~4일</td>
							<td>5~6일</td>
							<td>7일 이상</td>
						</tr>
						<tr>
							<td><fmt:formatNumber value="${shortFeeData.AMT_01D*1.1}"/>원</td>
							<td><fmt:formatNumber value="${shortFeeData.AMT_03D*1.1}"/>원</td>
							<td><fmt:formatNumber value="${shortFeeData.AMT_05D*1.1}"/>원</td>
							<td><fmt:formatNumber value="${shortFeeData.AMT_07D*1.1}"/>원</td>
						</tr>
					</table>
				</div>
				<div class="text-right">
					<img src="/resources/images/ceo.gif"/>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<!-- Modal -->
	<div class="modal fade" id="requiredDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title" id="myModalLabel">계약준비서류</h4>
	      		</div>
	      		<div class="modal-body">
					<table class="table table-condensed table-bordered print-table">
					<tbody>
						<tr>
							<th rowspan="2" width="5%">구분</th>
							<th colspan='2'>개인</th>
							<th colspan='2'>법인</th>
						</tr>
						<tr>
							<th width="20%"><span>개인</span></th>
							<th width="25%"><span>개인사업자</span></th>
							<th height="30" width='24%'><span>대표이사 자필서명(○ 가능)</span></th>
							<th height="30" width='26%'><span>대표이사 자필서명(X 불가)</span></th>
						</tr>
						<tr>
							<th align="center"><span>제<br>출<br>서<br>류</span></th>
							<td valign="top">
								<br><span>①운전면허증 사본<br>②자동이체통장 사본</span>
							</td>
							<td valign="top">
								<br>
									<span>
										① 사업자등록증 사본<br>
										② 신분증 사본<br>
										③ 주운전자 면허증 사본<br>
										④ 통장 사본(자동이체용) <br><br>
									※ 당사자의 위임을 받은 임·직원이 대리 계약: 당사자의 인감증명서(3개월 이내 발급된 것) 첨부 및 인감도장 날인(필수)
<!-- 								※ 불가피한 사정으로 계약자의 직원이 계약을 대리해야할 경우에는 계약자의 개인인감도장을 날인하고 개인인감증명서(최근 3개월이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다. -->
									</span>
							</td>
							<td valign="top">
								<br>
								<span>
									① 사업자등록증 사본<br>
									② 법인 인감도장 및 명판<br>
									③ 통장 사본(자동이체용)<br>
									④ 대표이사 신분증 사본<br>
									⑤ 주운전자 면허증 사본<br>
									⑥ 대표이사 자필 서명<br>
										<span style='margin-left: 10px;'>㉮ 계약자란</span><br>
										<span style='margin-left: 10px;'>㉯ 연대보증인란(면제=×)</span>
								</span>
							</td>
							<td valign="top">
								<br><span>
									① 사업자등록증 사본<br>
									② 통장 사본(자동이체용)<br>
									③ 대표이사 신분증 사본<br>
									④ 주운전자 면허증 사본<br>
									⑤ 법인 인감도장 및 명판<br>
									⑥ 법인 인감증명서(1)<br>
									⑦ 대표이사 개인 인감도장<br>
									⑧ 대표이사 개인 인감증명서(1)<br><br>
									※ <span style='text-decoration: underline;'>인감증명서(3개월 이내 발급)<br>
									단, 대표이사 연대보증인이 면제된 경우, 대표이사 개인인감증명서, 신분증 사본 등도 제출받지 않습니다.</span>
								</span>
							</td>
						</tr>
						<tr>
							<th rowspan="2" align="center">
								<span>신용<br>심사<br>참고<br>서류</span>
							</th>
							<td>
								<span>·재직증명서<br>·소득증빙자료<br>&nbsp;(원천징수영수증 등)</span>
							</td>
							<td><span>·매출증빙자료</span></td>
							<td colspan="2"><span>·재무제표</span></td>
						</tr>
						<tr>
							<td colspan="4" height="30"><span>※ 신용 심사에 필요할 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</span></td>
						</tr>
					</tbody>
				</table>     
					<br/>
					<h4>계약서 작성 시</h4>
					<table width="515" border="0" cellspacing="1" cellpadding="0" class="table table-condensed table-bordered print-table">
	        			<tbody>
	        				<tr>
        						<th align="center" width="13%"><span>개인</span></td>
        						<td colspan="2" height="30">&nbsp;<span>계약자 자필서명</span></td>
	        				</tr>
	        				<tr>
        						<th bgcolor="#e7ece1" align="center"><span>개인사업자</span></td>
        						<td colspan="2" height="30">&nbsp;<span>명판 날인후 계약자 자필서명</span></td>
	        				</tr>
	        				<tr>
        						<th bgcolor="#e7ece1" rowspan="2" align="center"><span>법인</span></td>
        						<th width="25%" align="center"><span align="center">대표이사 자필 서명이<br>가능할 경우</span></td>
        						<td height="45">&nbsp;<span>·계약자란: 명판, 법인명의 도장 날인후 대표이사 자필서명<br>
	        						    &nbsp;·연대보증인란: 연대보증을 서는 대표이사 자필서명</span></td>
	        				</tr>
	        				<tr>
        						<th align="center"><span align="center">대표이사 자필 서명이<br>불가능할 경우</span></td>
        						<td height="45">&nbsp;<span>·계약자란: 명판, 법인인감도장 날인<br>
	        								&nbsp;·연대보증인란: 연대보증을 서는 대표이사 개인인감도장 날인</span></td>
	        				</tr>
	        			</tbody>
	        		</table>   
	      		</div>
	    	</div>
	    </div>
  	</div>
</div>
<input type="hidden" id="mailTitle" value="${detailData.CAR_JNM} 월렌트 견적서">
<input type="hidden" id="estimateId" value="${paramData.estCode}"/>
<%@include file="/WEB-INF/jsp/common/email-modal.jsp"%>
</t:blankpage>