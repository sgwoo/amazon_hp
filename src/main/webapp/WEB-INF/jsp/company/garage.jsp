<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<style>
.garage-tab {
	width: 1000px !important;
}
</style>
<t:genericpage>
<!-- <script src="https://apis.daum.net/maps/maps3.js?apikey=c509e7c645091bfc601925be38fafcee"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4419b2a3a6bac750d7b19ffd37d7b995"></script>
<script type="text/javascript"> 
$(document).ready(function(){

	// url 가져오기
	var url = location.href;
	
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    
    // alert(parameters);
    var urlParamChk = parameters.indexOf("f=m");
    // alert(urlParamChk);
    
    if (urlParamChk =='0') {
    	$('.navbar-default').hide();
    	$('.footer').hide();
    	$('.detail-title').show();
    } else {
    	$('.navbar-default').show(); 
    	$('.footer').show();
    	$('.detail-title').hide();
    }

});
</script>
<script>
//지도 생성 공통 function 
function createMap(mapId){
	
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

$(document).ready(function(){
	
	createMap("yeongnam2-map");
	
	$("[role='tab']").click(function(){
		$('.map').css("visibility","hidden");

		var target = $(this).attr("aria-controls");
		var targetMap = $(this).attr("aria-controls") + "-map";

		$("#"+targetMap).css("visibility","visible");
		$("#"+targetMap).css("height","400px");
		
		createMap(targetMap);
	});	
})
</script>

<div class="detail-title" style="display: none;">
	<h2>
		<!-- <a href="/rent/month" class="back-arrow"> -->
		<a onclick="javascript:history.go(-1);" class="back-arrow" style="cursor: pointer;">
			<span class="icon-arrow_left"></span>
		</a>
	</h2>
</div>

<h2 class="primary">월렌트 차량수령 방문위치 안내</h2>
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
</t:genericpage>