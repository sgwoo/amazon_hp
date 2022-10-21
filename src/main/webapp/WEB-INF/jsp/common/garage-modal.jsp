<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<style>
.map {
	width: 870px !important;
}
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4419b2a3a6bac750d7b19ffd37d7b995"></script>
<script>
//지도 생성 공통 function
function createMap(mapId) {
	
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


<script type="text/javascript">
$(document).ready(function(){
	createMap("yeongnam-map");		
	map.relayout();
})
</script>

