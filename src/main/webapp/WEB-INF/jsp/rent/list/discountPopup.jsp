<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<c:set var="today"><fmt:formatDate value="${toDay}" pattern="yyyyMMdd" /></c:set>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.widgets.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
<link href="<c:url value='/resources/stylesheets/common.css'/>" rel="stylesheet"> 
<style>
.loaderLayer {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0px;
  visibility: hidden;
  background-color: rgba(112, 113, 102, 0.3);
  z-index: 1200;
}
.loader {
  position: absolute;
  top: 45%;
  left: 50%;
  z-index: 1;
  border: 8px solid #f3f3f3;
  border-radius: 50%;
  border-top: 8px solid #3498db;
  width: 30px;
  height: 30px;
  /* -webkit-animation: spin 1s linear infinite; */
  /* animation: spin 0.8s linear infinite; */
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<style>
.toggle_radio{
  position: relative;
  background: #5cb85c;
  margin: 4px auto;
  overflow: hidden;
  padding: 0 !important;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  position: relative;
  height: 24px;
  width: 638px;
  float: left;
}
.toggle_radio > * {
  float: left;
}
.toggle_radio input[type=radio]{
  display: none;
  /*position: fixed;*/
}
.toggle_radio label{
  font: 90%/1.618 "Source Sans Pro";
  color: #FFF;
  z-index: 0;
  display: block;
  width: 100px;
  height: 20px;
  margin: 3px 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  cursor: pointer;
  z-index: 1;
  /*background: rgba(0,0,0,.1);*/
  text-align: center;
  /*margin: 0 2px;*/
  /*background: blue;*/ /*make it blue*/
}
.toggle_option_slider{
  /*display: none;*/
  /*background: red;*/
  width: 100px;
  height: 20px;
  position: absolute;
  top: 3px;
  -webkit-border-radius: 50px;
  -moz-border-radius: 50px;
  border-radius: 50px;
  -webkit-transition: all .4s ease;
  -moz-transition: all .4s ease;
  -o-transition: all .4s ease;
  -ms-transition: all .4s ease;
  transition: all .4s ease;
}
.sticky-header {
	z-index: 10 !important;
}
#dist-1:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 3px;
}
#dist-2:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 109px;
}
#dist-3:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 215px;
}
#dist-4:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 319px;
}
#dist-5:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 425px;
}
#dist-6:checked ~ .toggle_option_slider{
  background: rgba(255,255,255,.3);
  left: 529px;
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
	/* border: 1px solid #f98460 !important; */
	border: none;
	background-color: #f6f6f6;
	color: #f98460 !important;
    margin-left: 50px !important;
    margin-top: 20px !important;
}
.custom-tab.active {
    /* background-color: #f98460 !important;
    color: #ffffff !important; */
    background-color: #f6f6f6;
    color: #f98460 !important;
}
.pointer {
	cursor: pointer;
}
.table {
	border: 1px solid #dddddd !important;
}
th {
	background-color: #eee;
	padding: 5px;
}
th, td {
	border: 1px solid #ddd;
	padding: 5px !important;
}
.amazon-tab-info-content {
    height: 100% !important;
}
.custom-button {
	font-weight: 400;
    color: #FFF;
    background-color: #5cb85c;
    padding: 10px 20px;
    border-radius: 5px;
    border-style: none;
    font-size: 14px;
}
.custom-style {
	width: 150px;
    height: 40px;
    font: 18px Noto Sans KR,sans-serif;
    border: 1px solid #f98460;
    vertical-align: middle;
    display: table-cell;
}
select {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark(black, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    cursor: default;
    margin: 0em;
    font: 400 13.3333px Arial;
    border-radius: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(195, 195, 195));
    border-image: initial;
}
label#agree-error {
	width: 250px !important;
    max-width: 250px !important;
}
body:not(.modal-open){
  padding-right: 0px !important;
}

/* placeholder 감추기  */
input:focus::-webkit-input-placeholder, 
textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
input:focus:-moz-placeholder, 
textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; }
input:focus::-moz-placeholder, 
textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
input:focus:-ms-input-placeholder, 
textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }

.select_control {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	text-align: start;
	-webkit-appearance: menulist;
	box-sizing: border-box;
	align-items: center;
	white-space: pre;
	-webkit-rtl-ordering: logical;
	cursor: default;
	margin: 0em;
	border-width: 1px;
	border-style: solid;
	border-image: initial;
}
</style>
<script type="text/javascript">

//logding_indicator
function fn_layer_popup(type) {
	var layer = document.getElementById("loader");
	var layerContent = document.getElementById("loaderContent");
	if (type == "show") {
		layer.style.visibility = "visible";
		layerContent.style.animation = "spin 0.8s linear infinite";
	} else {
		layer.style.visibility = "hidden";
		layerContent.style.animation = "";
	}
}

function today_close(){
	
	var checked = document.getElementById('todayClose').checked;
	
	if(checked){
// 		setCookie('todayCloseCookie', 'popupEnd', 1);
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var date = today.getDate();
		
		var popupEndDay = new Date(year, month, date);
		
		popupEndDay.setDate(popupEndDay.getDate() + 1);
		window.opener.document.cookie = 'todayClose=' + escape('popupEnd') + '; expires=' + popupEndDay.toUTCString();
	}
	
	window.close();
}

</script>

<div class="amazon-tab-info-title" style='margin-left: 10px;'><h3>특별 할인 차량</h3></div>

<c:forEach var="resultList" items="${resultList}" varStatus="status">
	<div class="rent-filter-container" style='margin: 0 10px; width: auto; height: auto;'>
		<div style='margin-bottom: 10px;'>
			<fmt:parseDate value="${resultList.INIT_REG_DT}" var="noticePostDate" pattern="yyyyMMdd"/>
			차량등록일 : <fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/><br>
			주행거리 : <fmt:formatNumber value="${resultList.TOT_DIST}" pattern="#,###" /> km<br>
			특별 할인 사유 : ${resultList.NCAR_SPE_DC_CAU}<br>
			특별 할인 금액 : 장기렌트 견적시 3,000,000 원(VAT포함),  리스 견적시 5,000,000 원(VAT포함)<br>
			(※ 고객 선택에 따라 특별 할인 금액을 계약기간으로 나눠서 균등하게 정상 월대여료에서 차감하거나, 1회차 대여료부터 특별 할인 금액이 소진될 때 까지 대여료 면제)<br>
		</div>
		<div class="">
			<table class="table" style='font-size: 14px;'>
				<colgroup>
					<col width="20%"/>
					<col width="60%"/>
					<col width="20%"/>
				</colgroup>
				<tr>
					<th>제조사</th>
					<td>
						<c:if test="${resultList.CAR_COMP_ID eq '0001'}">현대자동차(주)</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0002'}">기아자동차(주)</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0003'}">르노삼성자동차</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0004'}">한국GM(쉐보레)</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0005'}">쌍용자동차</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0006'}">볼보</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0007'}">도요타</c:if>							
						<c:if test="${resultList.CAR_COMP_ID eq '0011'}">폭스바겐</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0013'}">BMW</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0018'}">아우디자동차</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0021'}">포드자동차</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0027'}">메르세데스-벤츠</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0044'}">렉서스</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0049'}">랜드로버</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0051'}">링컨</c:if>
						<c:if test="${resultList.CAR_COMP_ID eq '0056'}">테슬라</c:if>
					</td>
					<th class="text-center">금액</th>
				</tr>
				<tr>
					<th>차종(차량모델명)</th>
					<td>${resultList.CAR_NM}&nbsp;${resultList.CAR_NAME}</td>
					<td class="text-right"><fmt:formatNumber value="${resultList.CAR_AMT}" pattern="#,###" /> 원</td>
				</tr>
				<tr>
					<th>옵션</th>
					<td>${resultList.OPT}</td>
					<td class="text-right"><fmt:formatNumber value="${resultList.OPT_AMT}" pattern="#,###" /> 원</td>
				</tr>
				<tr>
					<th>색상</th>
					<td>
						<c:if test="${not empty resultList.COLO}">외장 : ${resultList.COLO}&nbsp;</c:if>
						<c:if test="${not empty resultList.IN_COL}">내장색상 : ${resultList.IN_COL}&nbsp;</c:if>
						<c:if test="${not empty resultList.GARNISH_COL}">가니쉬 : ${resultList.GARNISH_COL}&nbsp;</c:if>
					</td>
					<td class="text-right"><fmt:formatNumber value="${resultList.COL_AMT}" pattern="#,###" /> 원</td>
				</tr>
				<tr>
					<th>차량가격</th>
					<td></td>
					<td class="text-right"><fmt:formatNumber value="${resultList.O_1}" pattern="#,###" /> 원</td>
				</tr>
			</table>
		</div>
	</div>
</c:forEach>

<div class="amazon-tab-info" style="margin: 10 10;">
	<div class="amazon-tab-info-title"><h3>견적내기 및 상담 요청</h3></div>
	<div style='font-size: 13px;'>
		1. 견적내기<br>
		홈페이지 우측 상단 실시간 견적(신차)에서 위 차종과 동일한 트림 및 옵션을 선택하여 견적하시면 됩니다.<br>
		견적내기 번거롭다면 당사 지점에 전화하여 상담직원에게 견적 요청하시면 됩니다.<br><br>
		2. 상담요청<br>
		- 전화상담 요청: 당사 지점에 전화하여 홈페이지 게시된 특별 할인 차량 상담이라고 말씀해주시면 원활한 상담이 가능합니다.<br>
		- 인터넷 상담요청: 인터넷에서 실시간 견적내기 후 상담요청 해주시면 됩니다. (기타문의 사항 란에 홈페이지에 게시된 특별 할인 차량이라고 기재해주시면 원활한 상담이 가능합니다)<br><br>
		3. 지점 연락처<br>
		<table class="table" style='font-size: 14px; width: 80%;'>
			<colgroup>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
			</colgroup>
			<tr>
				<td class="text-center" style="background-color: #E2EFD9;">여의도 영업부</td>
				<td class="text-center">02-757-0802</td>
				<td class="text-center" style="background-color: #E2EFD9;">광화문지점</td>
				<td class="text-center">02-2038-8661</td>
			</tr>
			<tr>
				<td class="text-center" style="background-color: #E2EFD9;">강남지점</td>
				<td class="text-center">02-537-5877</td>
				<td class="text-center" style="background-color: #E2EFD9;">송파지점</td>
				<td class="text-center">02-2038-2492</td>
			</tr>
			<tr>
				<td class="text-center" style="background-color: #E2EFD9;">인천지점</td>
				<td class="text-center">032-554-8820</td>
				<td class="text-center" style="background-color: #E2EFD9;">수원지점</td>
				<td class="text-center">031-546-8858</td>
			</tr>
			<tr>
				<td class="text-center" style="background-color: #E2EFD9;">대전지점</td>
				<td class="text-center">042-824-1770</td>
				<td class="text-center" style="background-color: #E2EFD9;">대구지점</td>
				<td class="text-center">053-582-2998</td>
			</tr>
			<tr>
				<td class="text-center" style="background-color: #E2EFD9;">광주지점</td>
				<td class="text-center">062-385-0133</td>
				<td class="text-center" style="background-color: #E2EFD9;">부산지점</td>
				<td class="text-center">051-851-0606</td>
			</tr>
		</table>
	</div>
	<div style='display: flex; justify-content: center; align-items: cneter; margin-top: 20px;'>
		<input type='checkbox' id='todayClose' onclick='javascript:today_close();' style='margin-top: 2px; zoom: 1.5;'> <label for='todayClose' style='margin-left: 5px; font-size: 16px; font-weight: 500 !important;'>오늘 하루 열지 않기</label>
	</div>
</div>



<!-- logding_indicator -->
<div class="loaderLayer" id="loader">
	<div class="loader" id="loaderContent"></div>
</div>
	
