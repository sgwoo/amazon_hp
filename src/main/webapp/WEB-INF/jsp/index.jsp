<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<t:blankpage>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="<c:url value='/resources/stylesheets/index.css'/>" rel="stylesheet">
<style>
.baner_a:link {
  text-decoration: none;
}
.baner_a:visited {
  text-decoration: none;
}
.baner_a:hover {
  text-decoration: none;
}
.baner_a:active {
  text-decoration: none;
}

.nav-login:hover{
	color: #FDB913 !important;
}
body:not(.modal-open){
	padding-right: 0px !important;
}

.radio_style {
	color: #FFF;
	text-decoration: none;
}
.radio_style:link {
	color: #FFF;
	text-decoration: none;
}
.radio_style:visited {
	color: #FFF;
	text-decoration: none;
}
.radio_style:hover {
	color: #FFF;
	text-decoration: none;
}
.radio_style:focus {
	color: #FFF;
	text-decoration: none;
	outline: none;
}
</style>
<style>
.marquee {
  width:500px;
  padding:0.5em 0;
  overflow:hidden;
  /* background-color:#f6f6f6; */
  margin-bottom:10px;
  position:relative;
}
.marquee p:after {
  content:"";
  white-space:nowrap;
  padding-right:50px;
}
.marquee p {
  margin:0;
  color: #FFF;
  /* font-weight: bold; */
  padding-left:500px;
  display:inline-block;
  white-space:nowrap;
  -webkit-animation-name:marquee;
  -webkit-animation-timing-function:linear;
  -webkit-animation-duration:15s;
  -webkit-animation-iteration-count:infinite;
  -moz-animation-name:marquee;
  -moz-animation-timing-function:linear;
  -moz-animation-duration:15s;
  -moz-animation-iteration-count:infinite;
  -ms-animation-name:marquee;
  -ms-animation-timing-function:linear;
  -ms-animation-duration:15s;
  -ms-animation-iteration-count:infinite;
  -o-animation-name:marquee;
  -o-animation-timing-function:linear;
  -o-animation-duration:15s;
  -o-animation-iteration-count:infinite;
  animation-name:marquee;
  animation-timing-function:linear;
  animation-duration:15s;
  animation-iteration-count:infinite;
}
@-webkit-keyframes marquee {
  from   { -webkit-transform: translate(0%);}
  99%,to { -webkit-transform: translate(-100%);}
}
@-moz-keyframes marquee {
  from   { -moz-transform: translate(0%);}
  99%,to { -moz-transform: translate(-100%);}
}
@-ms-keyframes marquee {
  from   { -ms-transform: translate(0%);}
  99%,to { -ms-transform: translate(-100%);}
}
@-o-keyframes marquee {
  from   { -o-transform: translate(0%);}
  99%,to { -o-transform: translate(-100%);}
}
@keyframes marquee {
  from   { transform: translate(0%);}
  99%,to { transform: translate(-100%);}
}

.light:hover{
	border: 2px solid #ffb100 !important;
	background: white;
	color: black;
}

.light:hover span, 
.light:hover .glyphicon{
	color: black !important;
}
.discount_a:hover {
  text-decoration: none;
}
</style>
<!-- <link href="https://fonts.googleapis.com/earlyaccess/nanumbrushscript.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel="stylesheet">
<script src="/resources/js/library/masonry.pkgd.min.js"></script>
<script src="https://www.youtube.com/iframe_api"></script>
<script src="https://www.youtube.com/player_api"></script>
<script>
//모바일 리다이렉트
if (navigator.userAgent.match(/iPhone/) || navigator.userAgent.match(/iPad/) || navigator.userAgent.match(/Android/)) {
	location.replace("https://www.amazoncar.co.kr/home/mobile/index.jsp");
}
if(window.location.hostname !='localhost'){
	if (document.location.protocol == 'http:') {
	    document.location.href = document.location.href.replace('http:', 'https:');
	}	
}
$(document).ready(function(){
	
	//BOX 영역 반응형 개발
	$('.grid').masonry({
		itemSelector: '.grid-item',
		columnWidth: 87
	});
	
	var nav = $('.nav-container');
	var menuList = nav.find("a");
	
	$("#onAir_div").click(function(){
		$("#music-modal").modal("show");
	})
	
	$("#estimate-btn").click(function(){
		/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		} else {	 */		
			window.open('/estimate/smart/step1','esti_popup','width=1200,height='+(screen.availHeight-50)+',top=0,left=0,scrollbars=yes');
		/* } */
	})
	
	$("#estimate-span").click(function(){
		/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		} else { */
			window.open('/estimate/smart/step1','esti_popup','width=1200,height='+(screen.availHeight-50)+',top=0,left=0,scrollbars=yes');
		/* } */
	})
	
	$("#estiAndCon").click(function(){
		/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		} else { */
			//window.open('/estimate/smart/step1','esti_popup','width=1200,height='+(screen.availHeight-50)+',top=0,left=100,scrollbars=yes');			
		/* } */
		//$("#contact-modal").hide();
		//$("#simple-esti-modal2").show();
		$('#contact-modal').modal('hide');
		$('#simple-esti-modal2').modal('show');
	})
	
	$('body').on("mousewheel", function (e) {
		var dir= "";
		if($(window).scrollTop() == 0 && !$('.nav-notice').hasClass('close')){
			if (e.originalEvent.detail > 0 || e.originalEvent.wheelDelta < 0)  {
				$('.nav-notice').css("display","block");
				$('.nav-notice-detail').css("margin-top","-300px");
				$('.nav-notice-detail').css("visibility","hidden");
	        }else{
	        	var flag = $('.nav-notice-detail').css("visibility");
	        	if(flag == "hidden"){
	        		$('.nav-notice-detail').css("visibility","visible");
	        		$('.nav-notice-detail').css("margin-top","0");
	        		$('.nav-notice-detail').css("display","none");
	        		$('.nav-notice-detail').slideDown();
	        		$('.nav-notice').fadeOut();
	        	}
	        	
	        }
		}
		
    });
	
	$(window).scroll(function () {
		
		//네비게이션 메뉴 띄우기
	    if ($(this).scrollTop() > 10) {
	        nav.addClass("f-nav");
	        menuList.addClass("f-nav-style");
			$(".login-btn").addClass("hover");
		//	$("#amazoncarLogo").attr("src","/resources/images/toplogo_w.png");
			$("#amazoncarLogo").attr("src","/resources/images/logo_1.png");
// 			$("#greenBanner").attr("src","/resources/images/greencar_img01.png");
// 			$("#minusMileageBanner").attr("src","/resources/images/minus_mileage.gif");
			$("#minusMileageBanner").attr("src","/resources/images/payback_img01.png");
			$("#amazoncarLogo").addClass("scroll");
	    } else {
	        nav.removeClass("f-nav");
	        menuList.removeClass("f-nav-style");
	        $(".login-btn").removeClass("hover");
	    //  $("#amazoncarLogo").attr("src","/resources/images/logo_white.png");
	        $("#amazoncarLogo").attr("src","/resources/images/logo_1_w.png");
// 	        $("#greenBanner").attr("src","/resources/images/greencar_img02.png");
// 	        $("#minusMileageBanner").attr("src","/resources/images/minus_mileage.gif");
	        $("#minusMileageBanner").attr("src","/resources/images/payback_img02.png");
	        $("#amazoncarLogo").removeClass("scroll");
	    }
	});
	
	//다른 음악재생시 재생중이던 음악 pause
	$("audio").on("play", function (self) {
		$("audio").each(function (i,e) {
			if (e != self.currentTarget) {
				this.pause();
			}
		});
		//유튜브 재생정지
		$(".btn_stop").click();
	});
	
	$("#music-modal").on("hidden.bs.modal", function () {
		$("audio").each(function (i,e) {
			this.pause();
			this.currentTime = 0;
		});
		//유튜브 재생정지
		$(".btn_stop").click();
	});
	
	var checkCookie = getCookie('todayClose'); // 하루 동안 팝업 보이지 않기 쿠키 여부
	if(!checkCookie){	// 위 쿠키 없는 경우에만 팝업 노출.
		var discount = '${discount}';
		var carMngId = '${discountList[0].CAR_MNG_ID}';
		if(discount > 0 && carMngId == '051620'){
			window.open('/lease/discountPopup', 'discountPop', 'height=700, width=650, left=280, top=200');
		}
	}
});

function getCookie(name){
	var cookie = document.cookie;
	var result = false;
	
	if(cookie != ''){
		var cookie_array = cookie.split('; ');
		for(var i in cookie_array){
			var cookie_name = cookie_array[i].split('=');
			if(cookie_name[0] == 'todayClose'){
				result = true;
			}
		}
	}
	return result;
}

function closeNotice(){
	$('.nav-notice').addClass("close");
	$('.nav-notice-detail').css("display","none");
}

function go_login(){
	var fm = document.indexLoginForm;
    fm.param.value = "Y";
    fm.submit();
}

function cretop_window() {
	var popWidth = 1100;
	var popHeight = 700;
	
	var winHeight = document.body.clientHeight - 650;
	var winWidth = document.body.clientWidth;
	
	var winX = window.screenX || window.screenLeft || screen.width || 0; 
	var winY = window.screenY || window.screenTop || screen.height || 0; 

	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	
	var popUrl = "https://www.amazoncar.co.kr/home/reasonable/cretop_rank.jsp";
	var popOption = "width=1100, height=" + winHeight + ", top=" + 0 + ",left=" + popX + ",scrollbars=yes, status=yes";
	
	window.open(popUrl, "", popOption);
}
</script>
<script>
//youtube API
/* var tag = document.createElement('script');
tag.src = "https://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); */

//플레이어변수 설정
var player;

function onYouTubeIframeAPIReady() {
	player = new YT.Player("player", {
		width : "568",
        height : "300",
        videoId : "Hs2juDGLtk8",
        playerVars : {
        	autoplay : 0,				//자동실행여부
        	rel : 0,						//추천영상 안보여주게 설정
        	controls : 1,				//재생컨트롤 노출여부
        	disablekb : 1,				//키보드제어
        	modestbranding : 1
        },
        events: {
        	"onReady" : onPlayerReady, //로딩할때 이벤트 실행
          	"onStateChange" : onPlayerStateChange //플레이어 상태 변화시 이벤트실행
        }
    }); //player셋팅
}

//로딩할때 실행될 동작을 작성한다.
function onPlayerReady(event) {
    //event.target.playVideo(); //자동재생
    player.setPlaybackQuality("hd720");
}

function onPlayerStateChange(event) {
	//YT.PlayerState.ENDED
	//YT.PlayerState.PLAYING
	//YT.PlayerState.PAUSED
	//YT.PlayerState.BUFFERING
	//YT.PlayerState.CUED
	
	//플레이어 종료시 섬네일을 노출을 위해 정지처리
	if (event.data == YT.PlayerState.ENDED) {
        //플레이어가 재생중일때 작성한 동작이 실행된다.
		$(".btn_stop").click();
    }
	
	//플레이어 재생 및 일시정지시 라디오음원 일시정지
	if (event.data == YT.PlayerState.PLAYING || event.data == YT.PlayerState.PAUSED) {
        //플레이어가 재생중일때 작성한 동작이 실행된다.
		$("audio").each(function (i,e) {
			this.pause();
		});
    }
}
 
$(document).ready(function(){
	//플레이어 재생
	$(".btn_play").on("click", function () {
		player.playVideo();
    });
	//플레이어 정지
    $(".btn_stop").on("click", function () {
    	player.seekTo(0, true); // 영상의 시간을 0초로 이동시킨다.
    	player.stopVideo();
    });
  	//플레이어 일시정지
    $(".btn_pause").on("click", function () {
    	player.pauseVideo();
    });
});
</script>	
<script>
$( document ).ready(function() {
	
	/* var privacy_text = "개인(신용)정보 수집·이용·제공·조회 동의\n\n"+ */
	var privacy_text = "개인정보 수집·이용 동의\n\n"+
	"(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다. \n\n"+
	"1. 개인정보의 수집 및 이용목적\n\n견적신청에 대한 상담 및 견적제시 목적\n*상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.\n\n"+
	"2. 수집하는 개인정보 항목\n\n필수항목 : 고객명, 연락처, 지역, 이메일주소\n\n"+
	"3. 개인정보의 보유 및 이용기관\n\n개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.\n"+
	"* 최대 보유기간 : 수집 후 6개월 (수집 후 6개월 이후에는 무조건 파기)\n\n"+
	"4. 동의 거부권 및 불이익\n\n개인정보 수집·이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 스마트 견적 상담이 불가합니다.";
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
    	$.each(cnt[index], function(inx, value) {
    		if (inx == 0) {
    			$('#gugun').append("<option value=''>"+cnt[index][inx]+"</option>");
    		} else {
    			$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
    	})
    })    
    
    // validation
    $("#simple-est-submit").bind("click", function() {
    	var policy_chk = $("#agree").is(":checked");
		if (policy_chk == true) {
			consultRequest();
		} else {
			alert('개인정보 수집·이용에 동의해 주세요');
		}
  	});	
	
	function consultRequest() {
    	
    	//고객정보
        var estName = $("#estName").val();
    	var estTel = $("#estTel").val();
    	var estEmail = $("#estEmail").val();
    	
    	//지역 이름 셋팅
    	var sido = $('#sido option:checked').val();
    	var gugun = $('#gugun option:checked').val();
    	var areaName = sido + "/" + gugun;
    	
    	//상담신청내용
    	var etc = $("#etc-textarea").val();
    	
    	//지역 이름 셋팅
    	var sido = $('#sido option:checked').val();
    	var gugun = $('#gugun option:checked').val();
    	var areaName = sido + "/" + gugun;
    	$('#estArea').val(areaName);
    	
    	//문의사항 셋팅
    	var inquiry = $('#etc-textarea').val();
    	$('#etc').val(inquiry);
    	
        //regExp
    	var num_regex = /^[0-9]+$/g;
    	var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\''\"]/gi;
        
        if (estName == "") {
            alert("고객명을 입력해주세요");
            $("#estName").focus();
            return;
        }
        if (regExp.test(estName)) {
        	alert("고객명에는 특수문자를 제외하고 입력해주세요.");
            $("#estName").focus();
            return;
    	}
        if (estTel == "") {
            alert("연락처를 입력해주세요");
            $("#estTel").focus();
            return;
        }
        if (!num_regex.test(estTel)) {
        	alert("연락처는 기호없이 숫자로만 입력해주세요.");
        	$("#estTel").focus();
        	return;
        }
        if (sido == "0" || sido == "") {
            alert("시/도를 선택해주세요");
            return;
        }
        if (gugun == "0" || gugun == "") {
            alert("구/군을 선택해주세요");
            return;
        }
        if (estEmail == "") {
            alert("이메일을 입력해주세요");
            $("#estEmail").focus();
            return;
        }
        if (email_regex.test(estEmail) == false) {
    	    alert("잘못된 이메일 형식입니다.");
    	    $("#estEmail").focus();
    	    return;
    	}
        if (etc == "") {
            alert("기타문의사항을 입력해주세요.");
            $("#estArea").focus();
            return;
        }
//         if (regExp.test(etc)) {
//         	alert("기타문의사항에는 특수문자를 제외하고 입력해주세요.");
//         	$('#estArea').focus();
//             return;
//     	}
    	
        var data = {};
		data["estArea"] = $('#estArea').val().trim();
		data["estName"] = $('#estName').val().trim();
		data["estTel"] = $('#estTel').val().trim();
		data["estEmail"] = $('#estEmail').val().trim();
		data["hpKey"] = $('#hpKey').val().trim();
		data["estGubun"] = "PC4";
		data["etc"] = $('#etc').val().trim();
		data["cType"] = "pc";
		
		var result = "";
		$.ajax({
			contentType: 'application/json',
			data: JSON.stringify(data),
			url: '/estimate/simple2',
			async: false,
			type: 'POST',
			success: function(response) {
				result = response;
				alert(result);
				$("#simple-esti-modal2 .close").click();
			}
		});
		
    }
    
});

//숫자만 입력
function onlyNumber(event){	
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) 
		return;
	else
		return false;
}

//문자 제거
function removeChar(event) {	
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

</script>
	<form action="/login" name="indexLoginForm" method="GET">
		<input type="hidden" name="param" value=""/>
	</form>
	<div class="index-container">		
		<div class="col-md-12 header nav-container" style="z-index: 99;">
			<div style="float:left">
				<!-- <a href="javascript:;"><img id="amazoncarLogo" src="/resources/images/logo_white.png" alt="Logo" /></a> -->
				<a href="javascript:;" style="margin-right: 20px;"><img id="amazoncarLogo" src="/resources/images/logo_1_w.png" alt="Logo" style="margin-top: 7px; width: 200px;" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 				<a href="/rent/green/desc#tab_green-compare1"><img src="/resources/images/greencar_img02.png" id="greenBanner" alt="친환경차 안내" /></a>				 -->
				<a href="#" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');"><img src="/resources/images/payback_img02.png" id="minusMileageBanner" alt="마이너스 마일리지" /></a>				
			</div>
			<div class="container nav" style="margin-right: -130px;">
<!-- 			<div class="container nav" align="right"> -->
				<ul class="menu" style="display: flex; align-items: center;">
					<li><a href="/rent/domestic">장기렌트</a></li>
					<li>
						<a href="/lease/domestic">
							<span>리스</span><span style="font-size: 13px;">(화물차포함)</span>
						</a>
					</li>
					<li><a href="/rent/secondhand">재렌트·재리스</a></li>
					<li><a href="/rent/month">월렌트</a></li>
                    <!-- <li class="nav-menu nav-estimate primary" onclick="window.open('/estimate/smart/step1','esti_popup','width=1200,height=1200,top=0,left=100,scrollbars=yes')"><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간 견적</a></li> -->					
                    <li class="nav-menu nav-estimate primary" id="estimate-span"><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간견적</a></li>					
					<li class="nav-menu nav-call" id="company"><a data-toggle="modal" data-target="#contact-modal" href="#"><span class="glyphicon glyphicon-earphone"  style="font-size:18px;vertical-align:-2px;"></span>&nbsp;간편상담</a></li>
				
					<sec:authorize access="isAuthenticated()">
						<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<input type="hidden" name="loginEmail" id="loginEmail" value="" />
					</sec:authorize>
					<%-- jjlim --%>
					<sec:authorize access="isAnonymous()">
						<li class="nav-menu nav-login"><a href="#" onclick="javascript:go_login();"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
						<!-- <li class="nav-menu nav-login"><a href="/login?param=Y"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li> -->
						<!-- <li class="nav-menu nav-login" onclick="javascript:go_login();" style="font-size: 15px !important; color: white; padding: 0px 15px; text-decoration: none; font-weight: 400; cursor: pointer;">
							<a href="#" onclick="javascript:go_login();">
								<span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인
							</a>
						</li> -->
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-menu nav-login dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지&nbsp;<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu" id="myPageList">
								<li><a href="/mypage/rent/list">견적/상담/예약 이력</a></li>
								<li><a href="/mypage/info">회원정보</a></li>
								<li><a href="/mypage/feedback/list">불편합니다</a></li>
								<li><a href="/logout">로그아웃</a></li>
							</ul>
						</li>
					</sec:authorize>
					<li class="nav-menu nav-client">
						<!-- <a href="https://fms.amazoncar.co.kr/service/index.jsp" target="_blank"> -->
						<a href="https://client.amazoncar.co.kr/" target="_blank">
						&nbsp;고객FMS
						</a>
					</li>
				</ul>
				<!-- 
				<sec:authorize access="isAnonymous()">
					<ul class="menu-btn">
	                	<li><button type="button" class="btn login-btn" onclick="javscript:location.href='/login'">로그인</button></li>
	                </ul>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                	<ul class="menu-btn">
                    	<li class="dropdown">
                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    			<sec:authentication property="principal.username" /><span class="caret"></span>
                    		</a>
                    		<ul class="dropdown-menu" role="menu">
                    			<li><a href="/mypage">마이페이지</a></li>
                    			<li><a href="#">고객센터</a></li>
                    			<li>
	                    			<a href="/logout" id="logout">로그아웃</a>
                    			</li>
                    		</ul>
                    	</li>
                    </ul>
                </sec:authorize>
                 -->
			</div>
		</div>
		
		<!-- <div class="col-md-12" style="position: absolute; top: 80px; left: 30px; z-index: 99;">
        	<div class="marquee">
				<p>
					<a data-toggle="modal" data-target="#music-modal" href="#" class="radio_style">
						<img src="/resources/images/radio.png" style="width: 20px; height: 20px; margin-bottom: 7px;"/>&nbsp;&nbsp;
						<span style="color: yellow;">On-Air</span> TV 및 공중파 라디오 현재 광고방송 중
					</a>
				</p>
			</div>
        </div> -->
        
        <div class="col-md-12 col-xs-12">
        
	        <div class="col-md-3 col-xs-3" style="top: 120px; padding-left: 20px;">
	        	
	        	<div class="col-md-12 col-xs-12" style="width: 300px; text-align: center; padding: 0px;">
<!--         			<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25A0%259C%25EB%2584%25A4%25EC%258B%259C%25EC%258A%25A4%2520G80%2520%28RG3%29&fuelKd="> -->
<!--         				<img src="/resources/images/G80_hp.png" hspace="10" style="width: 250px; height: 85px;"> filter: brightness(1.1); -->
        				<img src="/resources/images/ioniq6_hp.png" hspace="10" style="width: 250px; height: 85px;">
<!--         			</a> -->
        			<!-- <div style="padding: 5px 5px 0px 5px;">
						<span style="color: #FFF; font-size: 20px; font-family: Jeju Hallasan, serif;">신규모델</span>
					</div> -->
        		</div>
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
		        	<div class="col-md-4 col-xs-4" style="width: 100px; padding: 0px; padding-right: 0px; margin-top: 10px; cursor: default;">
		        		<div class="col-md-12 col-xs-12" style="width: 100px; text-align: center; padding: 3px 0px; border: 2px solid #FFF; border-radius: 10px; margin-left: 10px; float: right;">						
		        		<div class="col-md-12 col-xs-12" style="width: 100px; text-align: center; padding: 66px 0px; margin-left: 10px; float: right;">					
							
							<div style="padding: 5px 5px 0px 5px;">
								<span style="color: #FFF; font-size: 20px; font-family: Jeju Hallasan, serif;">풀체인지</span>
							</div>
							<div style="padding: 0px 5px 5px 5px;">
								<span style="color: #FFF; font-size: 16px;">모델출시</span>
							</div>
						</div>
		        	</div>
		        	<div class="col-md-12 col-xs-12" style="margin-top: 10px; padding: 0px 0px 0px 10px; display: flex; flex-wrap: wrap;">
		        		<div class="light" style="width: 100%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&carGubun=&fuelKd=&companyName=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25A0%259C%25EB%2584%25A4%25EC%258B%259C%25EC%258A%25A4%2520G90" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px;">
									명실상부한 최고의 품격 세단 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">G90</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 100%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258A%25A4%25ED%258F%25AC%25ED%258B%25B0%25EC%25A7%2580" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px;">
									혁신적 공간, 승차감 좋은 SUV <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">스포티지</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 100%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258A%25A4%25ED%2583%2580%25EB%25A6%25AC%25EC%2595%2584" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px;">
									넉넉함의 현대적 Lifestyle <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">스타리아</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 100%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=K8" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px;">
									새로운 아름다움의 감성 세단 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">K8</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=K8&fuelKd=" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									K8 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">GL3</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258B%25BC%25ED%2583%2580%25ED%258E%2598" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									싼타페 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">하이브리드</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>									
								</span>
							</a>
						</div>
						<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25ED%2588%25AC%25EC%258B%25BC" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									투싼 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">NX4</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
						<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 6px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258F%2598%25EB%25A0%258C%25ED%2586%25A0" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									쏘렌토 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">하이브리드</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
		        		<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; margin-right: 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 6px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258A%25A4%25ED%258F%25AC%25ED%258B%25B0%25EC%25A7%2580" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									스포티지 <font style="color: #a8eb00; font-weight: bold; font-size: 13px;">NQ5</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
						<div class="light" style="width: 49%; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 6px;">						
							<a class="baner_a" href="/lease/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258A%25A4%25ED%2583%2580%25EB%25A6%25AC%25EC%2595%2584" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									스타리아
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
		        	</div>
	        	</div> -->
	        
	        	<div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px; margin-top: 30px;">
					<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; margin: 5px 0;">						
						<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&carGubun=&fuelKd=&companyName=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%2595%2584%25EC%259D%25B4%25EC%2598%25A4%25EB%258B%25896" style="padding: 10px 0px 10px 0px;">
							<span style="color: #FFF; font-size: 14px;">전동화 시대의 감성적 유선형 실루엣</span>
							<br>
							<span style="color: #FFF; font-size: 14px;">
								"<font style="color: #a8eb00; font-weight: bold; font-size: 16px;">아이오닉6</font>"
								&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
							</span>
						</a>
					</div>
					<div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
		        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">
			        		<hr style="width: 300px !important; margin: 5px 0px !important; float: left;">
		        		</div>
	        		</div>
					<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; margin: 5px 0;">						
						<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&carGubun=&fuelKd=&companyName=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25A0%259C%25EB%2584%25A4%25EC%258B%259C%25EC%258A%25A4%2520G80" style="padding: 10px 0px 10px 0px;">
							<span style="color: #FFF; font-size: 14px;">완벽한 밸런스 프리미엄 감성세단</span>
							<br>
							<span style="color: #FFF; font-size: 14px;">
								"<font style="color: #a8eb00; font-weight: bold; font-size: 16px;">제네시스 G80</font>"
								&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
							</span>
						</a>
					</div>
					<div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
		        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">
			        		<hr style="width: 300px !important; margin: 5px 0px !important; float: left;">
		        		</div>
	        		</div>
	        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; margin: 5px 0;">						
						<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&fuelKd=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25B9%25B4%25EB%258B%2588%25EB%25B0%259C" style="padding: 10px 0px 10px 0px;">
							<span style="color: #FFF; font-size: 14px;">웅장한 볼륨감, 커넥팅 라이프의 시작</span>
							<br>
							<span style="color: #FFF; font-size: 14px;">
								4세대 "<font style="color: #a8eb00; font-weight: bold; font-size: 16px;">카니발</font>"
								&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
							</span>
						</a>
					</div>
	        	</div>
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
	        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">
		        		<hr style="width: 300px !important; margin: 5px 0px !important; float: left;">
	        		</div>
	        	</div> -->
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
	        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">						
						<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EB%258D%2594%25EB%2589%25B4%2520%25EC%258B%25BC%25ED%2583%2580%25ED%258E%2598&fuelKd=" style="padding: 10px 0px 10px 0px;">
							<span style="color: #FFF; font-size: 14px;">더 고급스러운 감성의 4세대 SUV</span>
							<br>
							<span style="color: #FFF; font-size: 14px;">
								<font style="color: #a8eb00; font-weight: bold; font-size: 16px;">더 뉴 싼타페</font> 출시
								&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
							</span>
						</a>
					</div>
	        	</div> -->
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
	        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">
		        		<hr style="width: 300px !important; margin: 5px 0px !important; float: left;">
	        		</div>
	        	</div> -->
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px;">
		        	<div class="col-md-4 col-xs-4" style="width: 100px; padding: 0px; padding-right: 0px; margin-top: 10px; cursor: default;">						
		        		<div class="col-md-12 col-xs-12" style="width: 100px; text-align: center; padding: 27px 0px; border-top: 1px solid #FFF; /* border-bottom: 2px solid #FFF; */ margin-left: 10px; float: right;">						
							<div style="padding: 5px 5px 0px 5px;">
								<span style="color: #FFF; font-size: 16px;">SUV</span>
							</div>
							<div style="padding: 0px 5px 5px 5px;">
								<span style="color: #FFF; font-size: 16px;">풀체인지</span>
							</div>
						</div>
		        	</div>
		        	<div class="col-md-8 col-xs-8" style="width: 190px; margin-top: 10px; padding: 0px 0px 0px 10px;">
		        		<div class="col-md-12 col-xs-12" style="width: 190px; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25B9%25B4%25EB%258B%2588%25EB%25B0%259C%2520KA4&fuelKd=" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									카니발 <font style="color: #a8eb00; font-weight: bold; font-size: 15px;">KA4</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
		        		<div class="col-md-12 col-xs-12" style="width: 190px; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 6px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25ED%2588%25AC%25EC%258B%25BC%2520NX4&fuelKd=" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									투싼 <font style="color: #a8eb00; font-weight: bold; font-size: 15px;">NX4</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
		        		<div class="col-md-12 col-xs-12" style="width: 190px; text-align: center; padding: 3px 5px 6px 5px; border: 2px solid #FFDC5C; border-radius: 5px; margin-top: 6px;">						
							<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%258F%2598%25EB%25A0%258C%25ED%2586%25A0%2520MQ4&fuelKd=" style="padding: 10px 0px 10px 0px;">							
								<span style="color: #FFF; font-size: 13px; font-weight: bold;">
									쏘렌토 <font style="color: #a8eb00; font-weight: bold; font-size: 15px;">MQ4</font>
									&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
								</span>
							</a>
						</div>
		        	</div>
	        	</div> -->
	        	
	        	<!-- <div class="col-md-12 col-xs-12" style="width: 300px; padding: 0px; margin-top: 10px;">
	        		<div class="col-md-12 col-xs-12" style="width:300px; text-align: center; padding: 0px; padding-top: 0px;">
						<a class="baner_a" href="/rent/domestic?tempCompNm=&tempFuelKd=&companyName=&carGubun=&agreeDist=10000&priceSearch=&priceStd=48&carName=%25EC%25A0%259C%25EB%2584%25A4%25EC%258B%259C%25EC%258A%25A4%2520GV80&fuelKd=" style="padding: 10px 0px 10px 0px;">
							<span style="color: #FFF; font-size: 14px;">역동적 우아함의 프리미엄 SUV</span>
							<br>
							<span style="color: #FFF; font-size: 14px;">
								<font style="color: #a8eb00; font-weight: bold; font-size: 16px;">제네시스 GV80</font> 출시
								&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: #FFF;"></span>
							</span>
						</a>
					</div>
	        	</div> -->
	        	
	        </div>
			
			<!-- Main Carousel 시작  -->
	        <div id="carousel-example" class="col-md-6 col-xs-6 carousel slide text-slider" data-ride="carousel" data-interval="4000">		
	            <div class="row">
	          		<div class="carousel-inner">
	                    <div class="item active">
	                        <div class="carousel-content">
	                        	<div>
	                               	<div style='font-size: 60px;'>
	                               		대여료 환급
<!-- 	                               	<span style='font-size: 30px;'>적게 탄 만큼</span> 돌려준다고?? -->
	                               	</div>
	                                <hr/>
	                                <span class="slider-detail">
	                                	<br><br>
	                                	약정운행거리보다 적게 탄 만큼<br>
	                                	대여 요금을 환급해 드립니다.
	                                </span><br>
	                                <a href="#" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=480, top=200');"><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div>     
	                    <div class="item">
	                        <div class="carousel-content">
	                        	<div>
	                               	<h1>장기렌트</h1>
	                                <hr/>
	                                <span class="slider-detail">
										비즈니스를 위한 당신의 발이 되어주는<br>
										현대인의 경제생활 필수품인 자동차!<br><br>			                    
										당신은 어떻게 이용하고 있으신가요?
	                                </span><br>
	                                <a href="/rent/domestic"><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div>     
	                    <div class="item">
	                        <div class="carousel-content">
	                        	<div>
	                               	<h1>재렌트/재리스</h1>
	                                <hr style="width: 424px;" />
	                                <span class="slider-detail">
	                                	저렴하면서 안전하게 이용할 자동차 렌트와 리스가 있을까요?<br><br>
										네, 있습니다. 평균차령이 24개월 수준으로 차량관리 상태가<br>
										우수한 차량으로 제공되는 재렌트와 재리스가 그 해답입니다.
	                                </span><br>
	                                <a href="/rent/secondhand"><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div> 
	                    <div class="item">
	                        <div class="carousel-content">
	                        	<div>
	                               	<h1 style="color: #a8eb00;">친환경차</h1>
	                                <hr/>
	                                <span class="slider-detail">
										미세먼지없는 세상<br>
										획기적인 경비절감과 친환경을 동시에 잡았다<br><br>			                    
										이제는 대세인 전기차와 하이브리드차
	                                </span><br>
	                                <a href="/rent/domestic?companyName=&carGubun=green&agreeDist=10000&priceSearch=&priceStd=48&carName="><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div>     
	 	                <div class="item">
	                        <div class="carousel-content">
	                        	<div>
	                               	<h1>리스</h1>
	                                <hr  style="width: 334px;" />
	                                <span class="slider-detail">
										리스를 하게 되면 대출 기록이 남을까요?<br><br>
										렌트와 달리 리스는 허/하/호의 번호가 붙지 않으며<br>
										금융권 전산 상의 대출기록이 남지 않습니다.
	                                </span><br>
	                                <a href="/lease/domestic"><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div> 	                    
	                    <!-- <div class="item">
	                        <div class="carousel-content">
	                        	<div>
	                               	<h1>월렌트</h1>
	                                <hr />
	                                <span class="slider-detail">
										한 달만, 또는 한 달 단위로 이용할 차량은 있을까?<br><br>
										아마존카는 저렴한 요금에 한 달 단위로 이용 가능한 월렌트를 제공합니다.<br>
										전국 어디서나 이용할 수 있습니다.
	                                </span><br>
	                                <a href="/rent/month"><button type="button" class="detail-btn">자세히 보기</button></a>
	                            </div>
	                        </div>
	                    </div> -->                     
	                </div>
	            </div>
	            
	            <!-- Indicators -->
	            <ol class="carousel-indicators">
	                <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
	                <li data-target="#carousel-example" data-slide-to="1"></li>
	                <li data-target="#carousel-example" data-slide-to="2"></li>
	                <li data-target="#carousel-example" data-slide-to="3"></li>
	                <li data-target="#carousel-example" data-slide-to="4"></li>
	                <!-- <li data-target="#carousel-example" data-slide-to="4"></li> -->
	            </ol>
	            
	            <!-- graphicon-section -->
	            <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
					<!-- <div class="graphicon"> -->
					<div class="col-md-3 col-xs-3" style="padding: 0px;">
						<span class="icon-car" style="color:#fff;"></span><br>
						<span class="ic-title"><fmt:formatNumber value="${info_car}" pattern="#,###"/>대<br>보유차량</span><br>
					</div>
					<div class="col-md-3 col-xs-3" style="padding: 0px;">
						<span class="icon-capital" style="color:#fff;"></span><br>
						<span class="ic-title"><fmt:formatNumber value="${info_asset}" pattern="#,###"/>억<br>보유자산</span><br>
					</div>
					<div class="col-md-3 col-xs-3" style="padding: 0px;">
						<span class="icon-brief" style="color:#fff;"></span><br>
						<span class="ic-title"><fmt:formatNumber value="${info_client}" pattern="#,###"/>업체<br>고객사</span><br>
					</div>
					<div class="col-md-3 col-xs-3" style="padding: 0px;">
						<span class="icon-throphy" style="color:#fff;"></span><br>
						<span class="ic-title">${info_continue_year + 1}년 외길<br>장기렌트 전문</span><br>	
					</div>
					<!-- </div> -->
				</div>
	        </div>
	        
	        <div class="col-md-3 col-xs-3"  style="top: 130px;">        	
	        	<div class="col-md-12 col-xs-12" style="padding-right: 4%;">
		        	<div class="col-md-12 col-xs-12" onclick="window.open('https://www.amazoncar.co.kr/home/reasonable/cretop_rank2.jsp');" style="cursor: pointer;">
		        		<div class="col-md-12 col-xs-12" style="width: 270px; float: right; padding: 0px;">
			        		<div class="col-md-3 col-xs-3" style="padding: 10px 0px;">
			        			<img src="/resources/images/hand.png" align="left" hspace="10" style="margin-left: 0px;">
			        		</div>
			        		<div class="col-md-9 col-xs-9" style="padding: 0px; text-align: left; color: #FFF;">
			        			대한민국 렌터카전업회사<br>
		        				<font style="font-weight: bold;">1,100여개 중</font>[2022년기준]<br>
		        				<font style="font-weight: bold;">보유대수 3위, 매출액 4위</font>
			        		</div>
		        		</div>
		        	</div>
		        	
		        	<div class="col-md-12 col-xs-12">
		        		<div class="col-md-12 col-xs-12" style="width: 270px; float: right; padding: 0px 20px 0px 0px;">
			        		<hr style="border: 0.5px solid #FFF; width: 238px; margin: 10px;">
		        		</div>
	        		</div>
		        		
		        	<!-- <div class="col-md-12 col-xs-12" onclick="window.open('https://goodcompany.korcham.net/Application/05_Company/Details_page.aspx?MRID=23&URID=0&SCR=lC7ykxqUtuR8r0RfiUMd9Q==');" style="cursor: pointer;">
		        		<div class="col-md-12 col-xs-12" style="width: 270px; float: right; padding: 0px;">
			        		<div class="col-md-3 col-xs-3" style="padding: 0px;">
			        			<img src="/resources/images/building.png" align="left" hspace="10">
			        		</div>
			        		<div class="col-md-9 col-xs-9" style="padding: 0px; text-align: left; color: #FFF;">
			        			'일하기 좋은 중소기업' 부문<br>
								<font style="font-weight: bold;"><font style="color: #a8eb00; font-weight: bold;">아마존카</font> 대한상의 선정</font>
			        		</div>
		        		</div>
		        	</div> -->
		        	
					<c:if test="${discount > 0}">
			        	<div class="col-md-12 col-xs-12" style="cursor: pointer; margin-top: 20px;">
			        		<div class="col-md-12 col-xs-12" style="width: 270px; float: right; padding: 0px; display: flex; justify-content: center;">
			        			<div style="border: 2px solid #f98460; 	background-color: #f98460; height: 40px; width: 170px; text-align: center; display: flex; justify-content: center; align-items: center;">
									<a class="discount_a" href="/rent/discount" style="color: #f98460; font-size: 15px; color: #ffffff">&#34;특별할인차량&#34;</a>
								</div>
			        		</div>
			        	</div>
					</c:if>
		        	
		        	<div class="col-md-12 col-xs-12" style="z-index: 9;">
	        			<div class="col-md-12 col-xs-12" style="margin-top: 20px; width: 270px; color: white; text-align: center; font-size: 15px; float: right;"><!-- float: right; -->
	        				<div class="col-md-12 col-xs-12" style="position: relative; z-index: 99;">
			        			<span style="font-weight: bold;">
				        			빠를수록 유리한<br>
									전기차(승용, 화물) & 수소차<br>
									미리 예약하세요 !!
								</span>
							</div>
							<div class="col-md-12 col-xs-12" style="margin-top: 15px;">
								<div class="col-md-12 col-xs-12" style="top: -50px; padding: 0px;"><!-- position: absolute; -->
									<img src="/resources/images/index_plug.png" align="left" hspace="10" style="margin-left: -25px;">
								</div>
								<div class="col-md-12 col-xs-12" onclick="window.open('/single/reservation?type=electric_car', '_self')" style="cursor: pointer; width: 220px; text-align: center; padding: 0px; margin-top: -87px;"><!-- position: absolute; -->
									<button type="button" style="font-weight: bold; color: #FFF; background-color: #a8eb00; padding: 10px 55px; border-radius: 10px; border-style: none; font-size: 15px;">전기차 사전예약</button>
								</div>
							</div>
						</div>
	        		</div>
	        		
	        		<div id="onAir_div" class="col-md-12 col-xs-12" style="cursor: pointer; margin-top: -10px; width: 270px; color: white; text-align: center; font-size: 15px; float: right; padding-left: 0px;"><!-- float: right; -->
						<div class="col-md-12 col-xs-12" style="margin-top: 5px;">
							<div class="col-md-12 col-xs-12" style="padding: 0px; font-size: 18px;">
								<span style='font-weight: bold;'><!-- <span style="color: #caf900;">On-Air</span> --> 라디오 및 홍보영상</span>
							</div>
							<!-- <div class="col-md-12 col-xs-12" style="padding: 0px; z-index: 9; margin-top: -5px;">
								<img src="/resources/images/car_button.png" align="left" hspace="10" style="margin-left: -28px;">
							</div>
							<div class="col-md-12 col-xs-12" style="cursor: pointer; width: 220px; text-align: center; padding: 0px; margin-top: -25px;">position: absolute;
								<button type="button" style="font-weight: bold; color: #FFF; background-color: #a8eb00; padding: 10px 40px; border-radius: 10px; border-style: none; font-size: 15px;">음원 및 광고 보기&nbsp;&nbsp;<span class="glyphicon glyphicon-play" aria-hidden="true" style="color: red;"></span></button>
							</div> -->
						</div>
	        		</div>
	        		
	        		<c:if test="${recruitSize > 0}">
		        		<div id="recruit_div" class="col-md-12 col-xs-12" style="cursor: pointer; margin-top: -10px; width: 270px; color: white; text-align: center; font-size: 15px; float: right; padding-left: 0px; margin-top: 30px;">
							<div class="col-md-12 col-xs-12" style="margin-top: 5px;">
								<div class="col-md-12 col-xs-12" style="padding: 0px; font-size: 18px;">
									<a href='/company/recruit#tab_apply' style='color: #fff; text-decoration: none;'>
										<span style='font-weight: bold;'>채용공고</span>
									</a>
								</div>
							</div>
		        		</div>
	        		</c:if>
	        		
	        	</div>
	        	
	        </div>        
        </div>                
        
	</div>
	
	
	<div style="margin:0 auto;max-width:1050px;margin-top:40px;">
		<div class="grid" class="col-md-12">
			<div class="box grid-item" style="border:3px solid #fff; background-color:#22b500;background: linear-gradient(-230deg, #22b500 0%,#429321 100%);">
				<div class="box-main" style="text-align:center;">
					<span class="title" style="color:#fff;">합리적인 가격</span>
					<hr style="width:80px;margin:12px auto 15px;border-top:1px solid #71c75a;"/>
					<div class="box-detail-ulStyle" style="color:#fff; line-height:19px !important;">
						아마존카는 다양한 상품에 대한 합리적인 기준을 제시하고 가격 공개를 원칙으로 합니다.
						<div style="float:left;margin-left:3px;margin-right:7px;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold; margin-top: 15px;">다양성</div>
						<div style="float:left;margin-right:7px;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold;margin-top: 15px;">편리성</div>
						<div style="float:left;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid #fff;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold; margin-top: 15px;">가격공개</div>
					</div>
				</div>
				<div class="box-footer" style="margin-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff" onclick="location.href='/single/onePrice'"; >자세히보기</button>
				</div>
			</div>
			<div class="box grid-item">
				<div class="box-main">
					<div id="estimate-btn" class="title" style="background-color:#969db0;width:202px;height:46px;text-align:center;color:#fff;
						padding-top:10px;margin-bottom:12px;margin-top:-5px;margin-left:-5px;color:#fff;font-size:18px;">실시간 견적</div>
						<span style="font-size:15px;line-height:34px;font-weight:bold;">신차</span><br>
						<a href="/rent/domestic"><span style="line-height:23px;color:#656464;">장기렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><br>
						<a href="/lease/domestic"><span style="line-height:23px;color:#656464;">자동차 리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
						<hr/>
						<span style="font-size:15px;line-height:34px;font-weight:bold;">아마존카 보유차량</span><br>
						<a href="/rent/secondhand"><span style="line-height:23px;color:#656464;">재렌트/재리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><br>
						<a href="/rent/month"><span style="line-height:23px;color:#656464;">월렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
				</div>
			</div>
			<div class="box grid-item">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;"><span class="title primary" style="vertical-align:bottom;">차량예약(월렌트)</span>
					<a href="/rent/month"><span class="title primary icon-arrow_right" style="font-size:30px;float:right;"></span></a></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:24px;">
						1개월 단위로 이용 가능한<br>월렌트 차량을 예약하시려면,<br>
					</p>
				</div>
				<div><img src="/resources/images/mrent_img.jpg" style="margin-top:-15px;margin-left:27px;" /></div>
				<div class="box-footer" style="margin-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/month'"; >보유차량보기</button>
				</div>
			</div>
					
			<!-- <div class="box grid-item" style="border:5px solid #d5d7dd;">
				<div class="box-main">
					<div style="padding-top:1px;"><span class="title" style="color:#6b707d;font-weight:500;">손비처리 기준</span></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="line-height:24px;font-size:15px;margin-bottom:40px;">
						 <span style="letter-spacing: -1.4px;">법인세법 및 소득세법 개정에 <br>따른 <span style="color:#f98460;font-weight:bold;">업무용승용차 손비처리 <br>기준</span>을 알아볼까요?</span>
					</p>
					<div style="background:#acb2c3;width:85px;height:71px;float:left;text-align:center;font-size:13px;padding-top:17px;border-radius:5px;">
						<a href="/single/expense#tab_enterprise" style="color:#fff;font-weight:bold;">법인사업자<br>손비처리</a>
					</div>
					<div style="background:#acb2c3;width:85px;height:71px;float:right;text-align:center;font-size:13px;padding-top:17px;border-radius:5px;">
						<a href="/single/expense#tab_business" style="color:#fff;font-weight:bold;">개인사업자<br>손비처리</a>
					</div>
				</div>
			</div> -->
			
			<div class="box grid-item" style="border:3px solid #22b500;">
				<div class="box-main">
					<div style="text-align:center;margin-top:-6px;margin-left:-5px;"><img src="/resources/images/greenrent_img.jpg"></div>
					<div style="text-align:center;padding-top:7px;"><span class="title" style="color:#489f02;">친환경차 장기렌트</span></div>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:23px;padding-top:10px;letter-spacing: -1.4px;">
						첨단기능과 경제성을 갖춘 전기차, LPG보다 경제적인 하이브리드차를 장기렌트로 만나보세요.
					</p>
				</div>
				<div class="box-footer" style="margin-top:26px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/green/desc#tab_green-compare1'"; >친환경차 안내</button>
				</div>
			</div>
			
			<div class="box grid-item">
				<div class="box-main">
					<div style="padding-top:5px;"><span class="title" style="color:#6b707d;vertical-align:bottom;">소통공간</span></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<div class="box-detail-ulStyle" style="font-size:15px;line-height:28px;">
						<img src="/resources/images/icon_use_process.jpg" style="margin-right:7px;"><a href="/single/process">장기렌트 이용 절차</a><br>
						<span class="icon-question_1" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/faq">자주 묻는 질문</a><br>
						<span class="icon-complain" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/feedback">불편합니다</a><br>
						<hr style="margin-top:20px;"/>
						<!-- <a href="https://blog.naver.com/amazoncarrent/220830451937" target="_blank"> -->
						<a href="http://blog.naver.com/amazoncarrent/220830451937" target="_blank">
							<img src="/resources/images/banner_kakaotalk5.jpg" style="float:left;border-radius:5px; margin-left: 14px; margin-top: 10px;" />
						</a>
						<!-- <a href="https://talk.naver.com/WCAFYC" onclick="window.open('https://talk.naver.com/WCAFYC', 'talktalk', 'width=471, height=640');return false;">
							<img src="/resources/images/banner_navertalk.jpg" style="float:right;border-radius:3px;"/>
						</a> -->
					</div>
				</div>
			</div>
			<div class="box grid-item" style="background-color:#f98460;color:#fff;border:1px solid #f98460;">
				<div class="box-main">
					<div style="padding-top:5px;"><span class="title" style="vertical-align:bottom;">고객지원 서비스(FMS)</span></div>
					<hr style="border-top:1px solid #fbad94;margin:9px 0 19px;"/>
					<p class="box-detail-ulStyle" style="line-height:23px;font-size:15px;color:#fff;">
						이용하고 계신 차량에 관련된 정보를 확인하실 수 있습니다.
					</p>
					<ul style="margin-left:-20px;font-size:13px;">
						<li>계약정보</li>
						<li>대여료 스케줄, 세금계산서</li>
						<li>보험정보, 사고처리</li>
						<li>정비이력, 과태료관련</li>
					</ul>
					<br><br>
					
				</div>
				<div class="box-footer" style="margin-top:22px;">
					<!-- <button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff;width:165px;"  onclick="window.open('https://fms.amazoncar.co.kr/service/index.jsp');"> -->
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff;width:165px;"  onclick="window.open('https://client.amazoncar.co.kr/');">
					<span class="glyphicon glyphicon-log-in"></span>&nbsp;고객 FMS 로그인</button>
				</div>
			</div>
			
			<!-- <div class="box grid-item" style="border:3px solid #22b500;">
				<div class="box-main">
					<div style="text-align:center;margin-top:-6px;margin-left:-5px;"><img src="/resources/images/greenrent_img.jpg"></div>
					<div style="text-align:center;padding-top:7px;"><span class="title" style="color:#489f02;">친환경차 장기렌트</span></div>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:23px;padding-top:10px;letter-spacing: -1.4px;">
						경차보다 경제적인 전기차, LPG보다 경제적인 하이브리드차를 장기렌트로 만나보세요.
						첨단기능과 경제성을 갖춘 전기차, LPG보다 경제적인 하이브리드차를 장기렌트로 만나보세요.
					</p>
				</div>
				<div class="box-footer" style="margin-top:26px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/green/desc#tab_green-compare1'"; >친환경차 안내</button>
				</div>
			</div> -->
			<div class="box grid-item" style="border:5px solid #d5d7dd;">
				<div class="box-main">
					<div style="padding-top:1px;"><span class="title" style="color:#6b707d;font-weight:500;">손비처리 기준</span></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<div class="box-detail-ulStyle" style="line-height:24px;font-size:15px;margin-bottom:40px;">
						 <span style="letter-spacing: -1.4px;">법인세법 및 소득세법 개정에 <br>따른 <span style="color:#f98460;font-weight:bold;">업무용승용차 손비처리 <br>기준</span>을 알아볼까요?</span>
					</div>
					<div style="background:#acb2c3;width:85px;height:71px;float:left;text-align:center;font-size:13px;padding-top:17px;border-radius:5px;">
						<a href="/single/expense#tab_enterprise" style="color:#fff;font-weight:bold;">법인사업자<br>손비처리</a>
					</div>
					<div style="background:#acb2c3;width:85px;height:71px;float:right;text-align:center;font-size:13px;padding-top:17px;border-radius:5px;">
						<a href="/single/expense#tab_business" style="color:#fff;font-weight:bold;">개인사업자<br>손비처리</a>
					</div>
				</div>
			</div>
			
			<div class="box grid-item" style="background-color:darkgray;color:#fff;border:1px solid darkgray;">
				<div>
					<div style="padding-top:5px;"><span class="title">전국 각 지점안내</span></div>
					<hr style="border-top: 1px solid #fff; margin:9px 0 19px;"/>
				</div>
				<div class="box-footer" style="display: flex; justify-content: space-around;">
					<ul style="margin-left:10px; line-height:20px; text-align:left; font-size:16px; color:#fff; padding-left: 0px;">
                        <li style="padding-bottom: 10px;"><a href="/company/branch#yeoido" style="color:#fff;font-weight:400;margin-left:-4px;" target="_self">여의도본사</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#yeongdeungpo" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">영등포주차장</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#kangbuk" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">광화문</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#kangnam" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">강남</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#songpa" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">송파</a></li>
               		</ul>
					<ul style="margin-left:10px; line-height:20px; text-align:left; font-size:16px; color:#fff; padding-left: 10px;">
                        <li style="padding-bottom: 10px;"><a href="/company/branch#incheon" style="color:#fff;font-weight:400;margin-left:-4px;" target="_self">인천</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#suwon" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">수원</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#daejeon" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">대전</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#daegu" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">대구</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#kwangju" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">광주</a></li>
                        <li style='padding-bottom: 10px;'><a href="/company/branch#busan" style="color:#fff;font-weight:400;margin-left:-4px;"  target="_self">부산</a></li>
               		</ul>
				</div>
			</div>
			
			<!-- <div class="box grid-item" style="background-color:#969db0;color:#fff;border:1px solid #969db0;">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;"><span class="title">장기렌트 효용지수</span></div>
					<hr style="border-top:1px solid #b9bdca;margin:9px 0 19px;"/>
					<div class="box-detail-ulStyle" style="color:#fff;font-size:15px;line-height:23px;">
						차량 가격 대비 월 대여료가<br>저렴한 차종을 알아볼까요?
					</div>
				</div>
				<div class="box-footer" style="margin:10px 10px 30px 5px;">
					<span class="icon-compare" style="font-size:67px;float:left;"></span>
					<ul style="margin-left:60px;line-height:20px;text-align:left;font-size:14px;color:#53575f;">
                        <li style="padding-top:4px;"><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_do_06_05.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;" target="_blank">국산 승용차</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_rv_06_01.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">국산 RV</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_im_06_02.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">수입차</a></li>
               		</ul>
				</div>
			</div> -->
		</div>
	</div>
	<div class="container-fluid footer col-md-12">
		<div class="row">
			<div class="footer-menu">
				<ul class="footer-menu">
					<li><a href="/company/introduce">회사소개</a></li>
					<li><a href="/company/branch">지점안내</a></li>
					<li><a href="/single/standard">자동차대여약관</a></li>
					<li><a href="/single/shortRent">단기대여 요금기준</a></li>
					<li><a href="http://bpms.kemco.or.kr/transport_2012/car/car_choice.aspx?f=system" target="_blank">차종별 연비확인</a></li>
					<li><a href="/company/recruit">채용공고</a></li>
					<li><a href="/single/privacy" class="last">개인정보 취급방침</a></li>
				</ul>
			</div>
		</div>
		<div class="row footer-brand" style="padding: 60px 0px !important;">			
			<div class="brand-info">
				<div class="col-md-5 col-xs-5 text-right">
					<!-- <img src="/resources/images/footer_logo.png" style="width:110px;float:right"/> -->
					<div class="col-md-12 col-xs-12" style="float: right; padding: 0px; margin: 10px 55px 0px 0px;">
						<img src="/resources/images/logo_w.png" style="width: 110px;"/>
					</div>
					<div class="col-md-12 col-xs-12" style="float: right; margin: 15px; padding: 0px;">
						<a href="https://www.facebook.com/amazoncar.rent/?fref=ts" target="_blank">
							<img src="/resources/images/footer_fb.png">
						</a>
		            	<a href="https://blog.naver.com/amazoncarrent" target="_blank">
		            		<img src="/resources/images/footer_nv.png">
		            	</a>
		            	<a href="https://www.instagram.com/amazoncarrent/" target="_blank">
		            		<img src="/resources/images/footer_ig_1.png">
		            	</a>
					</div>					
				</div>
	            <div class="col-md-7 col-xs-7" style="margin-bottom:15px;">
	                <div>
	                    <span class="title">(주)아마존카</span><br>
						서울특별시 영등포구 의사당대로 8, 802호 (여의도동, 태흥빌딩)<br>
						사업자번호 : 128-81-47957<br>
						통신판매업신고번호 : 제2012-서울영등포-1249호<br>
						TEL : 대표)02-757-0802 | 고객지원) 02-392-4242<br>
						Copyrightⓒ 2016 by amazoncar. All rights reserved. 
	                </div>
	            </div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="contact-modal" tabindex="-1" role="dialog" aria-labelledby="contact-modal" aria-hidden="true">
		<div class="modal-dialog" style="margin:100px auto;">
		   	<div class="modal-content">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h4 class="modal-title" id="myModalLabel">전화 상담 문의</h4>
		     	</div>
		     	<div class="modal-body">
			        <table class="table table-bordered modal-table">
			        	<colgroup>
			        		<col width="40%"/>
			        		<col width="60%"/>
			        	</colgroup>
			        	<tr>
			        		<th>여의도 영업부</th>
			        		<td>02-757-0802</td>
			        	</tr>
			        	<tr>
			        		<th>광화문 지점</th>
			        		<td>02-2038-8661</td>
			        	</tr>
			        	<tr>
			        		<th>강남 지점</th>
			        		<td>02-537-5877</td>
			        	</tr>
			        	<tr>
			        		<th>송파 지점</th>
			        		<td>02-2038-2492</td>
			        	</tr>
			        	<tr>
			        		<th>인천 지점</th>
			        		<td>032-554-8820</td>
			        	</tr>
			        	<tr>
			        		<th>수원 지점</th>
			        		<td>031-546-8858</td>
			        	</tr>
			        	<tr>
			        		<th>대전 지점</th>
			        		<td>042-824-1770</td>
			        	</tr>
			        	<tr>
			        		<th>대구 지점</th>
			        		<td>053-582-2998</td>
			        	</tr>
			        	<tr>
			        		<th>부산 지점</th>
			        		<td>051-851-0606</td>
			        	</tr>
			        	<tr>
			        		<th>광주 지점</th>
			        		<td>062-385-0133</td>
			        	</tr>
			        	<tr>
			        		<th style="color:#f54242;">긴급 출동</th>
			        		<%-- <td>1588-6688 (마스타 자동차 관리)</td> --%>
			        		<td>1588-6688 / 1670-5494</td>
			        	</tr>
			        	<%-- <tr>
			        		<td>02-2119-3117 (삼성 애니카 랜드)</td>
			        	</tr> --%>
			        </table>
		   		</div>
		    	<div class="modal-footer">
		    		<!-- <button type="button" id="estiAndCon" class="btn btn-default-reverse" onclick="window.open('/estimate/smart/step1','esti_popup','width=1200,height=1200,top=0,left=100,scrollbars=yes')">견적내기 및 상담요청</button> -->
		    		<!-- <button type="button" id="estiAndCon" class="btn btn-default-reverse">견적내기 및 상담요청</button> -->
		    		<button type="button" id="estiAndCon" class="btn btn-default-reverse">간편상담신청</button>
		    		<button type="button" class="btn btn-default-reverse" onclick="location.href='/company/branch'">각 지점 약도 보기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="music-modal" tabindex="-1" role="dialog" aria-labelledby="music-modal" aria-hidden="true">
		<div class="modal-dialog" style="margin:100px auto;">
		   	<div class="modal-content">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h4 class="modal-title" id="musicModalLabel">아마존카 라디오 및 홍보영상</h4>
		     	</div>
		     	<div class="modal-body">
			        <div>
			        	<div>
			        		홍보영상
			        	</div>
			        	<div style="padding-top: 15px; text-align: center;">
			        		<!-- 플레이어를 불러올 영역-->
			        		<div id="player" class="ivideo"></div>
							<div class="btn_play" style="display: none;">시작</div><!-- 시작버튼-->
							<div class="btn_stop" style="display: none;">정지</div><!-- 정지버튼-->
							<div class="btn_pause" style="display: none;">일시정지</div> <!-- 일시정지버튼-->
			        	</div>
			        </div>
			        
			        <div style="padding-top: 30px;">
			        	<div>
			        		라디오 현재 음원
			        	</div>
			        	<div style="padding-top: 15px; text-align: center;">
				        	<audio controls preload="none" style="width: 100%;">
								<source src="/resources/sound/cs_amazoncar_radio_new.mp3" type="audio/mpeg">
							</audio>
						</div>
			        </div>
			        
			        <div style="padding-top: 30px;">
			        	<div>
			        		라디오 첫회 음원
			        	</div>
			        	<div style="padding-top: 15px; text-align: center;">
				        	<audio controls preload="none" style="width: 100%;">
								<source src="/resources/sound/cs_amazoncar_radio_old.mp3" type="audio/mpeg">
							</audio>
						</div>
			        </div>
		   		</div>
		    	<div class="modal-footer">
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	<%-- <%@include file="/WEB-INF/jsp/common/contest-modal.jsp"%> --%> <!-- 아마존카 CI공모전 안내 모달 -->
	<%-- <%@include file="/WEB-INF/jsp/common/simple-esti-modal2.jsp"%> --%>
	
	<div class="modal fade modal-open" id="simple-esti-modal2" tabindex="-1" role="dialog" aria-labelledby="simple-esti-modal2" aria-hidden="true" style="width: 100%;">
		<div class="modal-dialog modal-lg" id="pc_ver">
		   	<div class="modal-content" id="modal-content" style="width:950px;">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h4 class="modal-title" id="myModalLabel" style="color: #22b500;">간편상담신청</h4>
		     	</div>
		     	<div class="modal-body">
		     		<table class="full-width">
						<colgroup>
							<col width="8%"/>
							<col width="28%"/>
							<col width="5%"/>
							<col width="7%"/>
							<col width="28%"/>
						</colgroup>
						<tbody>
							<tr>
								<td><span style="vertical-align: middle;">*</span>고객명</td>
								<td style="padding-left: 10px;">
									<input type="text" name="estName" id="estName" class="full-width form-control input-sm" />
								</td>
								<td></td>
								<td><span style="vertical-align: middle;">*</span>연락처</td>
								<td style='padding-top: 20px;'>
									<input type="text" name="estTel" id="estTel" class="full-width form-control input-sm" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
									<small>- 제외한 숫자만 입력</small>
								</td>
							</tr>
							<tr>
								<td colspan="5"><br></td>
							</tr>
							<tr>
								<td><span style="vertical-align: middle;">*</span>지역</td>
								<td style="padding-left: 10px;">
									<select name="estSido" id="sido" class="form-control input-sm" style="width:49.4%; display: inline !important;">
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
									<select name="estGugun" id="gugun" class="form-control input-sm" style="width:49.4%; display: inline !important;">
										<option value="">구/군</option>
									</select>
								</td>
								<td></td>									
								<td><span style="vertical-align: middle;">*</span>이메일주소</td>
								<td>
									<sec:authorize access="isAuthenticated()">
										<input type="hidden" name="hpKey" id="hpKey" value="<sec:authentication property="principal.email" />" />
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										<input type="hidden" name="hpKey" id="hpKey" value="" />
									</sec:authorize>
									<input type="text" name="estEmail" id="estEmail" class="full-width form-control input-sm" />
								</td>
							</tr>
							<tr>
								<td colspan="5"><br /></td>
							</tr>
							<tr>
								<td class="option-title"  colspan="5">
									<div style="padding-bottom: 10px;">
										&nbsp;기타 문의사항
									</div> 
								</td>								
							</tr>
							<tr>
								<td colspan="5">
									<textarea id="etc-textarea" style="height:100px; resize: none;" class="full-width form-control input-sm" placeholder="ex) 그랜저 하이브리드 장기렌트 48개월 견적상담&#13;&#10;ex) 쏘나타LPG 재렌트 24개월 견적상담"></textarea>
								</td>
							</tr>
							<tr><td colspan="5"><br /></td></tr>
							<tr>
								<td colspan="5">
									<textarea id="privacy-area" style="height:150px; resize: none;" class="full-width form-control input-sm" readonly="readonly"></textarea>
									<div style="padding-top: 10px;">
										<label class="checkbox-inline">
											<input type="checkbox" id="agree" name="agree"/>
										</label>
										<label for="agree">개인정보 수집·이용에 동의합니다.</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="estArea" id="estArea" value="">
					<input type="hidden" name="etc" id="etc" value="">
					<input type="hidden" name="estGubun" id="estGubun" value="">
					<input type="hidden" name="type" id="type" value="new">
		   		</div>
		   		
		    	<div class="modal-footer">
					<button type="submit" id= "simple-est-submit" class="btn btn-default-reverse">상담 요청하기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
</t:blankpage>
	        			