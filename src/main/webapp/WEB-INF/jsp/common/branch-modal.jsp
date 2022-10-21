<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<style>
.map {
	width: 870px !important;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4419b2a3a6bac750d7b19ffd37d7b995"></script>
<script>
//지도 생성 공통 function 
function createMap(mapId){
	
	var lat = $("#"+mapId).attr("param").split(":")[0];
	var lng = $("#"+mapId).attr("param").split(":")[1];	
	
	/* mapContainer = document.getElementById(mapId), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var markerPosition  = new daum.maps.LatLng(lat, lng); 
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

  	map = new daum.maps.Map(mapContainer, mapOption);
  	map.relayout();
  	marker.setMap(map); */  	
  	
  	var container = document.getElementById(mapId);
	var options = {
		center: new daum.maps.LatLng(lat, lng),
		level: 3
	};

	var map = new daum.maps.Map(container, options);
	
	var markerPosition  = new daum.maps.LatLng(lat, lng); 
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);
  	
}

$(document).ready(function(){
	
	createMap("yeoido-map");
	
	$("[role='tab']").click(function(){
		$('.map').css("visibility", "hidden");

		var target = $(this).attr("aria-controls");
		var targetMap = $(this).attr("aria-controls") + "-map";

		$("#"+targetMap).css("visibility", "visible");
		$("#"+targetMap).css("height", "400px");
		
		createMap(targetMap);	  	
	});
	
})
</script>
<!-- Modal -->
<div class="modal fade" id="branch-modal" tabindex="-1" role="dialog" aria-labelledby="branch-modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h2 class="primary">연락처 및 지점</h2>
	     	</div>
	     	<div class="modal-body" id="document-body">			
			아마존카는 여의도 본사와 각 지역별 지점을 통해 신속하고 편리한 서비스를 제공하고 있습니다.			
			<div role="tabpanel" style="margin-top:30px;">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
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
			  
				<div id="yeoido-map" class="map" param="37.528003:126.916875" style="visibility:visible; !important"></div>
				<div id="kangbuk-map" class="map" param="37.573155:126.973218"></div>
				<!-- <div id="kangnam-map" class="map" param="37.505249:126.999975"></div> -->
				<div id="kangnam-map" class="map" param="37.509095:127.001400"></div>
				<div id="songpa-map" class="map" param="37.487745:127.131159"></div>
				<div id="incheon-map" class="map" param="37.538796:126.736042"></div>
				<div id="suwon-map" class="map" param="37.258696:126.962602"></div>
				<div id="daejeon-map" class="map" param="36.4302660:127.423275"></div>
				<div id="daegu-map" class="map" param="35.842843:128.487519"></div>
				<div id="kwangju-map" class="map" param="35.157646:126.849196"></div>
				<div id="busan-map" class="map" param="35.190480:129.087000"></div>
				<!-- <div id="mokdong-map" class="map" param="37.530639:126.878489"></div> -->
				<div id="yeongdeungpo-map" class="map" param="37.519643:126.902541"></div>	
			  	
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