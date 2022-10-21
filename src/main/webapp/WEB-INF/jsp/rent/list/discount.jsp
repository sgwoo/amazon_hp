<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<c:set var="today"><fmt:formatDate value="${toDay}" pattern="yyyyMMdd" /></c:set>
<t:genericpage>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.4/js/jquery.tablesorter.widgets.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/rent.js"></script>
<script src="/resources/js/tablesorter-config.js"></script>
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
	margin-left: 0.5px;
	border: 1px solid #f98460 !important;
	background-color: #f98460;
	color: #ffffff !important;
}
.custom-tab.active {
    /* background-color: #f98460 !important;
    color: #ffffff !important; */
    background-color: #f98460;
	color: #ffffff !important;
}
.pointer {
	cursor: pointer;
}
.table {
	border: 1px solid #dddddd !important;
}
th {
	background-color: #eee;
}
th, td {
	border: 1px solid #ddd;
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
</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#tab_1").click(function(){
		location.href="/rent/domestic";
	})
	$("#tab_2").click(function(){
		location.href="/rent/imports";
	})
	$("#tab_3").click(function(){
		location.href="/rent/discount";
	})
	$("#tab_4").click(function(){
		location.href="/lease/domestic";
	})
	$("#tab_5").click(function(){
		location.href="/lease/imports";
	})
	$("#tab_6").click(function(){
		location.href="/lease/discount";
	})
	
	var privacy_text = "개인정보 수집·이용 동의\n\n"+
	"(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다. \n\n"+
	"1. 개인정보의 수집 및 이용목적\n\n사전예약에 대한 상담 및 견적제시 목적\n*상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.\n\n"+
	"2. 수집하는 개인정보 항목\n\n필수항목 : 고객명, 연락처, 고객주소지\n\n"+
	"3. 개인정보의 보유 및 이용기관\n\n개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.\n"+
	"* 최대 보유기간 : 수집 후 6개월 (수집 후 6개월 이후에는 무조건 파기)\n\n"+
	"4. 동의 거부권 및 불이익\n\n개인정보 수집·이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 사전예약이 불가합니다.";
	$("#privacy-area").text(privacy_text);
	
	var cnt = new Array();
    cnt[0] = new Array('구/군');
    cnt[1] = new Array('구/군','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
    cnt[2] = new Array('구/군','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
    cnt[3] = new Array('구/군','남구','달서구','동구','북구','서구','수성구','중구','달성군');
    cnt[4] = new Array('구/군','계양구','남구','남동구','동구','미추홀구','부평구','서구','연수구','중구','강화군','옹진군');
    cnt[5] = new Array('구/군','광산구','남구','동구','북구','서구');
    cnt[6] = new Array('구/군','대덕구','동구','서구','유성구','중구');
    cnt[7] = new Array('구/군','남구','동구','북구','중구','울주군');
	cnt[8] = new Array('구/군','세종특별자치시');
    cnt[9] = new Array('구/군','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주시','양평군','여주군','연천군','용인시','이천시','파주시','포천시','화성시');
    cnt[10] = new Array('구/군','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
    cnt[11] = new Array('구/군','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
    cnt[12] = new Array('구/군','공주시','계룡시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
    cnt[13] = new Array('구/군','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
    cnt[14] = new Array('구/군','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
    cnt[15] = new Array('구/군','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
    cnt[16] = new Array('구/군','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
    cnt[17] = new Array('구/군','서귀포시','제주시','남제주군','북제주군');
    
    $('#sido').change(function(){
    	var index = $("#sido").prop('selectedIndex');
    	$('#gugun option').remove();
    	$.each(cnt[index],function(inx,value){
    		if(inx == 0){
    			$('#gugun').append("<option value=''>"+cnt[index][inx]+"</option>");
    		}else{
    			$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
    	})
    });   
    
  	
    
    
    
    // modal종료시 화면전환    
    $("#redirect_view").click(function() {
    	var car_type = $('input:radio[name="car_nm"]:checked').val();
    	if (car_type == "9") {
    		$('#complete').modal('hide');
    		//window.location.href = '/single/reservation?type=hydro_car';
    	} else {
    		$('#complete').modal('hide');
    		//window.location.href = '/single/reservation?type=electric_car';
    	}
    })
    
    
});

//상담요청하기 입력폼 modal_start
function reservation_start(car_nm, option, color, in_color, garnish, ncar_spe_dc_cau) {
	$("#car_nm").val(car_nm);
	
	$("#option").val(option);
	$("#color").val(color);
	$("#in_color").val(in_color);
	$("#garnish").val(garnish);
	$("#ncar_spe_dc_cau").val(ncar_spe_dc_cau);
	
	$("#reservation").modal("show");
}

//상담요청하기 입력 실행 modal_start
function reservation_complete() {
	//fn_layer_popup("show");
	//$("#reservation").modal("hide");
	//$("#complete").modal("show");
	reservation();
}

function reservation() {
	
	var sido = $('#sido option:checked').val();
	var gugun = $('#gugun option:checked').val();
	var areaName = sido + "/" + gugun;
	
	var est_st = "PD9";
	var car_nm = $("#car_nm").val();
	
	var option = $("#option").val();
	var color = $("#color").val();
	var in_color = $("#in_color").val();
	var garnish = $("#garnish").val();
	var ncar_spe_dc_cau = $("#ncar_spe_dc_cau").val();
	var etc = "옵션 : " + option + " / 외장 : " + color + " / 내장 : " + in_color + " / 가니쉬 : " + garnish + " / 특별 할인 금액 : " + ncar_spe_dc_cau;
	
	var pattern=/^[0-9]+$/g;
	
	if ($("#est_nm").val() == "") {
		alert("이름을 입력해 주세요.");
		$("#est_nm").focus();
		return;
		
	} else if ($("#est_tel").val() == "") {
		alert("휴대전화번호를 입력해 주세요.");
		$("#est_tel").focus();
		return;
		
	} else if (!pattern.test($("#est_tel").val())) {
		alert("휴대전화번호는 기호없이 숫자로만 입력해주세요.");
		$("#est_tel").val("");
		$("#est_tel").focus();
		return;
		
	} else if ($("#sido option:selected").val() == "") {
		alert("고객주소지의 시/도를 선택해주세요.");
		$("#sido").focus();
		return;
		
	} else if ($("#gugun option:selected").val() == "") {
		alert("고객주소지의 구/군을 선택해주세요.");
		$("#gugun").focus();
		return;
		
	} else if ($('#agree').is(':checked') == false) {
		alert("상담요청 등록을 위해서는 개인정보 수집이용 동의가 필요합니다.");
		$("#agree").focus();
		return;
		
	} else {
		
		var data = {};
		data["est_nm"] = $("#est_nm").val();
		data["est_tel"] = $("#est_tel").val();
		data["estArea"] = areaName;
		data["car_nm"] = car_nm;
		data["est_st"] = est_st;
		data["etc"] = etc;
		
		fn_layer_popup("show");
		
		/* $.ajax({
			contentType:'application/json',
			data:JSON.stringify(data),
			url:'/estimate/discount',
			type:'POST',
			success:function(data){
				fn_layer_popup("hide");
				$('#complete').modal('show');
			}
		}); */
	}
}

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
</script>
<div class="amazon-tab-container">
	<c:choose>
		<c:when test="${mode eq 'rent'}">
			<div class="amazon-tabs">
				<div id="tab_1" class="amazon-tab pointer">국산신차</div>
				<div id="tab_2" class="amazon-tab pointer">수입신차</div>
				<div id="tab_3" class="amazon-tab pointer custom-tab active">
					특별할인차량
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="amazon-tabs">
				<div id="tab_4" class="amazon-tab pointer">국산신차</div>
				<div id="tab_5" class="amazon-tab pointer">수입신차</div>
				<div id="tab_6" class="amazon-tab pointer custom-tab active">
					특별할인차량
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div class="amazon-tab-info-title"><h3>특별 할인 차량</h3></div>

<c:forEach var="resultList" items="${resultList}" varStatus="status">
	<div class="rent-filter-container">
		<div class="amazon-tab-info-content">
			<%-- ${resultList.INIT_REG_DT} --%>
			<fmt:parseDate value="${resultList.INIT_REG_DT}" var="noticePostDate" pattern="yyyyMMdd"/>
			차량등록일 : <fmt:formatDate value="${noticePostDate}" pattern="yyyy-MM-dd"/><br>
			주행거리 : <fmt:formatNumber value="${resultList.TOT_DIST}" pattern="#,###" /> km<br>
			특별 할인 사유 : ${resultList.NCAR_SPE_DC_CAU}<br>
			<c:choose>
				<c:when test="${discount eq 1 && resultList.CAR_MNG_ID eq '051620' }">
					특별 할인 금액 : 장기렌트 견적시 3,000,000 원(VAT포함),  리스 견적시 5,000,000 원(VAT포함)<br>
				</c:when>
				<c:otherwise>
					특별 할인 금액 : <fmt:formatNumber value="${resultList.NCAR_SPE_DC_AMT}" pattern="#,###" /> 원(VAT포함)<br>
				</c:otherwise>
			</c:choose>
			(※ 고객 선택에 따라 특별 할인 금액을 계약기간으로 나눠서 균등하게 정상 월대여료에서 차감하거나, 1회차 대여료부터 특별 할인 금액이 소진될 때 까지 대여료 면제)<br><br>
		</div>
		<div class="amazon-tab-info-content">
			<table class="table">
				<colgroup>
					<col width="15%"/>
					<col width="70%"/>
					<col width="15%"/>
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
		<%-- <div class="text-right" style="padding-top: 18px;">
			<button type="button" id="reservation_start" class="custom-button" onclick="reservation_start('${resultList.CAR_NM} ${resultList.CAR_NAME}', '${resultList.OPT}', '${resultList.COLO}', '${resultList.IN_COL}', '${resultList.GARNISH_COL}', '<fmt:formatNumber value="${resultList.NCAR_SPE_DC_AMT}" pattern="#,###" /> 원(VAT포함)');">상담요청하기</button>
		</div> --%>
	</div>
</c:forEach>

<div class="amazon-tab-info" style="margin-top: 20px;">
	<div class="amazon-tab-info-title"><h3>견적내기 및 상담 요청</h3></div>
	<div class="amazon-tab-info-content">
		1. 견적내기<br>
		홈페이지 우측 상단 실시간 견적(신차)에서 위 차종과 동일한 트림 및 옵션을 선택하여 견적하시면 됩니다.<br>
		견적내기 번거롭다면 당사 지점에 전화하여 상담직원에게 견적 요청하시면 됩니다.<br><br>
		2. 상담요청<br>
		- 전화상담 요청: 당사 지점에 전화하여 홈페이지 게시된 특별 할인 차량 상담이라고 말씀해주시면 원활한 상담이 가능합니다.<br>
		- 인터넷 상담요청: 인터넷에서 실시간 견적내기 후 상담요청 해주시면 됩니다. (기타문의 사항 란에 홈페이지에 게시된 특별 할인 차량이라고 기재해주시면 원활한 상담이 가능합니다)<br><br>
		3. 지점 연락처<br>
		<table class="table" style="width: 50% !important;">
			<colgroup>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="10%"/>
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
</div>

<div class="modal fade" id="reservation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="">상담신청정보 입력</h4>
			</div>
			<div class="modal-body">
				<div style="padding: 10px 0px;">
					<table class="table">
						<colgroup>
							<col width="20%"/>
							<col width="80%"/>
						</colgroup>
						<tr>
							<th style="vertical-align: middle;">* 이름</th>
							<td><input type="text" class="form-control" name="est_nm" id="est_nm" style="width: 40%;"></td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">* 휴대전화</th>
							<td><input type="text" class="form-control" name="est_tel" id="est_tel" style="width: 40%; display: inline;"></td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">* 고객주소지</th>
							<td>
								<select name="estSido" id="sido" class="form-control" style="width:35%; display: inline;">
									<option value="" disabled selected>시/도</option>
									<option value="서울">서울특별시</option>
									<option value="부산">부산광역시</option>
									<option value="대구">대구광역시</option>
									<option value="인천">인천광역시</option>
									<option value="광주">광주광역시</option>
									<option value="대전">대전광역시</option>
									<option value="울산">울산광역시</option>
									<option value="세종">세종특별자치시</option>
									<option value="경기">경기도</option>
									<option value="강원">강원도</option>
									<option value="충북">충청북도</option>
									<option value="충남">충청남도</option>
									<option value="전북">전라북도</option>
									<option value="전남">전라남도</option>
									<option value="경북">경상북도</option>
									<option value="경남">경상남도</option>
									<option value="제주">제주도</option>
								</select>
								<select name="estGugun" id="gugun" class="form-control" style="width:35%; display: inline;">
									<option value="">구/군</option>
								</select>
							</td>
						</tr>
					</table>
					<input type="hidden" name="car_nm" id="car_nm" value="">					
					<input type="hidden" name="option" id="option" value="">
					<input type="hidden" name="color" id="color" value="">
					<input type="hidden" name="in_color" id="in_color" value="">
					<input type="hidden" name="garnish" id="garnish" value="">
					<input type="hidden" name="ncar_spe_dc_cau" id="ncar_spe_dc_cau" value="">
				</div>
				
				<div class="text-center" style="padding: 10px 0px;">
					<textarea id="privacy-area" style="height:150px; resize: none;" class="full-width form-control input-sm" readonly="readonly"></textarea>
					<div style="padding-top: 10px;">
						<label class="checkbox-inline">
							<input type="checkbox" id="agree" name="agree"/>
						</label>
						<label for="agree">개인정보 수집·이용에 동의합니다.</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="reservation_complete" onclick="reservation_complete();">상담 요청</button>
				<button type="button" class="btn btn-success" data-dismiss="modal" aria-label="취소">취소</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="complete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body bold center" style="text-align: center; padding: 20px 0px 20px 0px">
				<font style="font-weight: bold; font-size: 18px;">상담요청이 완료되었습니다.</font><br><br>
				아마존카 담당자가<br>
				세부차종 선택 및 향후 진행에 대한<br>
				안내를 드리도록 하겠습니다.<br><br>
				감사합니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" data-dismiss="modal" aria-label="확인">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- logding_indicator -->
<div class="loaderLayer" id="loader">
	<div class="loader" id="loaderContent"></div>
</div>
	
</t:genericpage>