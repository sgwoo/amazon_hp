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
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />
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
    font-weight: 500;
}
.amazon-tab-info-content {
	font-size: 14px;
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



</script>

<body style='background-color: white;'>
<div class="amazon-tab-info-title" style='margin: 30 10 20 10; text-align: center;'>
	<h3 style='font-weight: bold;'>[ 아마존카는 적게 탄 만큼 돌려드립니다!! ]</h3>
</div>

<div style='text-align: right; margin-right: 15px;'>
	※ 2022년 4월 15일 견적부터
</div>

<div class="amazon-tab-info" style="margin: 0 10 15 10;">
	<div class="amazon-tab-info-title" style='display: flex;'>
		<i class='fa fa-square' style='font-size: 20px; margin: 10px 10px 0 0;'></i>
		<h4>약정 운행거리 이하 운행 시 대여료 환급 상품 운영 개시</h4>
	</div>
	<div style='display: flex; font-size: 14px; margin-left: 10px;'>
		<div>
		<i class='fa fa-question' style='font-size: 40px;'></i>
		</div>
		<div style='margin-left: 25px;'>
		반납 시 실제 운행거리가 적어 대여료가 아까우셨다면?<br>
		초과운행 대여료는 있는데, 왜?? 적게 타면 혜택이 없는지 궁금하셨다면?
		</div>
	</div>
	<div style='margin-top: 10px; display: flex; margin-left: 10px;'>
		<div>
			<i class='fa fa-exclamation' style='font-size: 30px; margin-left: 7px;'></i>
		</div>
		<div style='text-align: center; margin: auto 30px;'>
			<span style='font-weight: bold; font-size: 16px;'>적게 탄 만큼</span> 돌려주는 대여료, 아마존카가 시작합니다.
		</div>
	</div>
</div>

<div class="amazon-tab-info" style="margin: 30 10px;">
	<div class="amazon-tab-info-title" style='display: flex;'>
		<i class='fa fa-square' style='font-size: 20px; margin: 10px 10px 0 0;'></i>
		<h4>아마존카 장기렌트/리스 상품 변경 내용</h4>
	</div>
	<div style='display: flex; font-size: 14px; margin: 0 10px;'>
		<div>
		<i class='fa fa-tachometer' style='font-size: 40px;'></i>
		</div>
		<div style='margin-left: 10px;'>
		약정운행거리 초과 운행 시,<br>
		일반적으로 약정운행거리 초과분에 대한 <span style='font-weight: bold;'>초과운행대여료</span>를 부과 받는데, 이 부분도 합리적 수준으로 낮추었고,
		</div>
	</div>
	<div style='display: flex; font-size: 14px; margin: 10 10px;'>
		<div style='margin-top: 8px;'>
		<i class='fa fa-krw' style='font-size: 40px;'></i>
		</div>
		<div style='margin-left: 10px; margin-top: 5px;'>
		더구나, 약정 운행거리보다 덜 탔을 경우,<br>
		이제는 차량 반납 시 적게 탄 만큼, 그 미달분에 대한 <span style='font-size: 18px; font-weight: bold; color: red;'>대여 요금을 환급</span>하여 받게 됩니다.
		</div>
	</div>
</div>

<div class="amazon-tab-info" style="margin: 30 10px;">
	<div class="amazon-tab-info-title" style='display: flex;'>
		<i class='fa fa-square' style='font-size: 20px; margin: 10px 10px 0 0;'></i>
		<h4>약정 운행거리 이하 운행 시 대여료 환급 예시</h4>
	</div>
	<div style='display: flex; font-size: 14px; margin: 10 10px; '>
		<div style='width: 35%'>
			<div style='margin-left: 70px; font-weight: bold;'>고객 A의 계약 약정사항</div>
			<img src="/resources/images/grandeur.jpg" hspace="10" style="width: 250px; height: 135px;">
		</div>
		<div style='margin-left: 10px; width: 65%;'>
			<i class='fa fa-check' style='font-size: 16px;'></i> 그랜저 가솔린 2.5 (3681만원)<br>
			<i class='fa fa-check' style='font-size: 16px;'></i> 계약기간: 48개월<br>
			<i class='fa fa-check' style='font-size: 16px;'></i> 약정 운행거리: 30,000km/1년(4년 120,000km)<br>
			<div style='margin-left: 10px; font-size: 12px;'>
			· 환급대여료(약정 운행거리 이하 운행 시): 41원/km(부가세 별도)<br>
			· 초과운행 대여료(약정 운행거리 초과 운행 시): 61원/km(부가세 별도)<br>
			※ 구체적인 금액은 견적에서 확인 가능합니다.
			</div>
		</div>
	</div>
	
	<div style='text-align: center; margin-top: -20px; margin-bottom: 10px;'>
		<i class='fa fa-arrow-down' style='font-size: 30px;'></i> 4년 후
	</div>
	
	<div style='display: flex; font-size: 14px; margin: 10 10px;'>
		<div style='width: 35%;'>
			<div style='margin-left: 70px; font-weight: bold;'>고객 A의 계약 만기 시</div>
		</div>
		<div style='margin-left: 10px; width: 65%;'>
			정산 / 환급 대여료<br>
			· 계약 만료 시 실제 주행거리: 9만km<br>
			· 계약 만료 후 차량 반납 시 <span style='font-size: 18px; font-weight: bold; color: red;'>대여료 환급 금액: 1,307,900원</span><br>
			<div style='margin-left: 10px; font-size: 12px;'>
			= [120,000km(약정 운행거리) - 90,000km(차량 반납 시 실제 주행거리) - 기본공제 거리(1,000km)] <br>
			x 41원(부가세 별도) x 1.1(부가세 포함) = 1,307,900원
			</div>
		</div>
	</div>
</div>

</body>
