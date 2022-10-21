<%@ tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@ attribute name="header" fragment="true" %>
<%@ attribute name="footer" fragment="true" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="google-site-verification" content="LLuu8EwWUTNc3EJl1eDwml9ZLwPWbjp25xpPlr7ozsE" />
<title>장기렌트의 기준-아마존카</title>
<!-- style -->
<link href="<c:url value='/resources/stylesheets/common.css'/>" rel="stylesheet"> 
<style>
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
<!-- jQuery -->
<script type="text/javascript" src="<c:url value='/webjars/jquery/1.12.4/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/js/library/bootstrap.js'/>"></script>
<script>
//모바일 리다이렉트(2018.02.28)
if (navigator.userAgent.match(/iPhone/) || navigator.userAgent.match(/iPad/) || navigator.userAgent.match(/Android/)) {
	var curUrl = location.href;
	if(curUrl=="https://www.amazoncar.co.kr/rent/secondhand"){
		location.replace("https://www.amazoncar.co.kr/home/mobile/shcar_list.jsp");
	}else if(curUrl=="https://www.amazoncar.co.kr/rent/domestic"){
		if(!${param.from=="m"}){
			location.replace("https://www.amazoncar.co.kr/home/mobile/price_rent.jsp");
		}
	}else if(curUrl=="https://www.amazoncar.co.kr/lease/domestic"){
		if(!${param.from=="m"}){
			location.replace("https://www.amazoncar.co.kr/home/mobile/price_lease.jsp");
		}
	}else if(curUrl=="https://www.amazoncar.co.kr/rent/month"){
		location.replace("https://www.amazoncar.co.kr/home/mobile/mrent_list.jsp");
	}
}
if(window.location.hostname !='localhost'){
	if (document.location.protocol == 'http:') {
	    document.location.href = document.location.href.replace('http:', 'https:');
	}	
}
</script>
<!--구글 분석기 시작-->
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-30468978-3', 'auto');
	ga('send', 'pageview');
</script>
<!--구글 분석기 종료-->
<!-- Facebook Pixel Code -->
<script>
	!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
	n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
	document,'script','//connect.facebook.net/en_US/fbevents.js');
	
	fbq('init', '735514506582860');
	fbq('track', "PageView");
</script>
<noscript>
	<img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=735514506582860&ev=PageView&noscript=1"/>
</noscript>
<!-- End Facebook Pixel Code -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<!-- 네이버 애널리틱스 시작 -->
<script type="text/javascript"> if(!wcs_add) var wcs_add = {}; wcs_add["wa"] = "95b9916dfeb4d0"; wcs_do(); </script>
<!-- 네이버 애널리틱스 끝 -->
<!-- 네이버 로그분석(웹) 시작 -->
<script type="text/javascript">
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_54b732620502";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script>
<!-- 네이버 로그분석 끝 -->

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
    	$.each(cnt[index],function(inx,value){
    		if(inx == 0){
    			$('#gugun').append("<option value=''>"+cnt[index][inx]+"</option>");
    		}else{
    			$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
    	})
    })
    
    $('#sido2').change(function(){
    	var index = $("#sido2").prop('selectedIndex');
    	$('#gugun2 option').remove();
    	$.each(cnt[index],function(inx,value){
    		if(inx == 0){
    			$('#gugun2').append("<option value=''>"+cnt[index][inx]+"</option>");
    		}else{
    			$('#gugun2').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
    	})
    })
    
    // validation
    $('#simple-est-submit').bind('click', function() {
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
function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 || keyID == 9) {
		return;
	} else {
		return false;
	}
}

//문자 제거
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) {
		return;
	} else {
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
}

</script>
<script>
$(document).ready(function(){
	
	var href = $(location).attr('pathname').split("/")[1] +"/" + $(location).attr('pathname').split("/")[2];
	var upperMenu = [
		{menu:"longRent", link:"rent/domestic"},
		{menu:"longRent", link:"rent/imports"},
		{menu:"longRent", link:"rent/discount"},
		{menu:"longRent", link:"rent/desc"},
		{menu:"lease", link:"lease/domestic"},
		{menu:"lease", link:"lease/imports"},
		{menu:"lease", link:"lease/discount"},
		{menu:"lease", link:"lease/desc"},
		{menu:"secondhand", link:"rent/secondhand"},
		{menu:"secondhand", link:"rent/secondhand/desc"},
		{menu:"month", link:"rent/month"},
		{menu:"month", link:"rent/month/desc"},
		{menu:"company", link:"company/branch"},
		{menu:"company", link:"company/garage"}
    ];
	
	$('.nav-menu').removeClass("active");
	$.each(upperMenu,function(index,item){
		var link = item.link;
		if (link.indexOf(href) >= 0) {
			var id = "#" + item.menu;
			$(id).addClass("active");
		}
	})
	
	$("#estimate-span").click(function(){
		/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		} else { */
			window.open('/estimate/smart/step1', 'esti_popup', 'width=1200,height='+(screen.availHeight-50)+',top=0,left=0,scrollbars=yes');
		/* } */
	})
	
	$("#estiAndCon_chk").click(function(){
		/* if ($('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
		    alert("로그인이 필요한 서비스 입니다.");
		    location.replace("/login");
		} else { */
			/* window.open('/estimate/smart/step1','esti_popup','width=1200,height='+(screen.availHeight-50)+',top=0,left=0,scrollbars=yes'); */
		/* } */
		
		/* $('#contact-modal').modal('hide');
		$('#simple-esti-modal2').modal('show'); */
		$("#contact-modal .close").click();
	})
});

function go_login(){
	var fm = document.loginForm;
    fm.param.value = "Y";
    fm.submit();
}
</script>
<!-- CPCGUARD SCRIPT END -->
<!-- 모비온 공통 스크립트 시작(Withpang Tracker v3.0)-->
<script src="https://cdn.megadata.co.kr/js/enliple_min2.js"></script>
<script type="text/javascript">
    var rf = new EN();
    rf.setData("sc", encodeURIComponent(""));
	rf.sendRf();
</script>
<!-- 모비온 공통 스크립트 끝 -->
</head>
<body style="min-width: 1300px;">
	<form action="/login" name="loginForm" method="GET">
		<input type="hidden" name="param" value=""/>
	</form>
    <!-- header 시작 -->
    <nav class="navbar navbar-default">
    	<a class="navbar-brand" href="/">
    		<!-- <img alt="Brand" src="/resources/images/toplogo_w.png" /> -->
    		<img alt="Brand" src="/resources/images/logo_1.png"  style="margin-top:-2px;" width="200px;"/>
    	</a>
<!--     	<a href="/rent/green/desc#tab_green-compare1"><img src="/resources/images/greencar_img01.png" id="greenBanner" alt="친환경차 안내" style="float:left;margin-top:20px;"/></a> -->
    	<a href='#' onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');"><img src="/resources/images/payback_img01.png" id="minusMileageBanner" alt="마이너스 마일리지" style="float:left;margin-top:25px;"/></a>
        <div class="container" style="width: 1000px;">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse"
                id="bs-example-navbar-collapse-1" style="width: 1080px;">
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-menu" id="longRent"><a href="/rent/domestic">장기렌트</a></li>
                    <li class="nav-menu" id="lease">
                    	<a href="/lease/domestic">
                    		<span>리스 </span>
                    		<span style="font-size: 13px;">(화물차포함)</span>
                    	</a>
                    </li>
                    <li class="nav-menu" id="secondhand"><a href="/rent/secondhand">재렌트·재리스</a></li>
                    <li class="nav-menu" id="month"><a href="/rent/month">월렌트</a></li>
                    <!-- <li class="nav-menu nav-estimate primary" onclick="window.open('/estimate/smart/step1','esti_popup','width=1200,height=1200,top=0,left=0,scrollbars=yes')" ><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간견적</a></li> -->
                    <li class="nav-menu nav-estimate primary" id="estimate-span"><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간 견적</a></li>
                    <li class="nav-menu nav-call primary" id="company"><a data-toggle="modal" data-target="#contact-modal" href="#"><span class="glyphicon glyphicon-earphone"></span>&nbsp;간편상담</a></li>
                   
                   
                    <%-- jjlim --%>
                    <sec:authorize access="isAnonymous()">
						<li class="nav-menu nav-login"><a href="#" onclick="javascript:go_login();"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
						<!-- <li class="nav-menu nav-login"><a href="/login?param=Y"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li> -->
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-menu nav-login dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
								<span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지&nbsp;<span class="caret"></span>
							</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/mypage/rent/list">견적/상담/예약 이력</a></li>
								<li><a href="/mypage/info">회원정보</a></li>
								<li><a href="/mypage/feedback/list">불편합니다</a></li>
								<li><a href="/logout">로그아웃</a></li>
							</ul>
						</li>
					</sec:authorize>
					<li class="nav-menu nav-client">
						<a href="https://client.amazoncar.co.kr/" target="_blank" style="text-align: center; padding-bottom: 10px !important;">
<!-- 						<a href="https://fms.amazoncar.co.kr/service/index.jsp" target="_blank" style="text-align: center; padding-bottom: 10px !important;"> -->
						고객 FMS
						</a>
					</li>
                    <!--
                     	<sec:authorize access="isAnonymous()">
		                    <li><a href="/login"><button type="button" class="login-btn">로그인</button></a></li>
	                    </sec:authorize>
	                    <sec:authorize access="isAuthenticated()">
	                    	<li class="dropdown">
	                    		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                    			<span class="display-username"><sec:authentication property="principal.username" /></span><span class="caret"></span>
	                    		</a>
	                    		<ul class="dropdown-menu" role="menu">
	                    			<li><a href="/mypage">마이페이지</a></li>
	                    			<li><a href="#">고객센터</a></li>
	                    			<li>
		                    			<a href="/logout" id="logout">로그아웃</a>
	                    			</li>
	                    		</ul>
	                    	</li>
	                    </sec:authorize>
	                 -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- header 끝 -->
    
    <!-- main list car image 시작 -->
    <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
	<%-- JSP에서 현재 URL 가져오기 : ${path} --%>
	<c:if test="${path eq '/rent/domestic'}">
	    <!-- 렌트 국산 -->
	    <!-- <div id="bck-car" style="position: relative !important; top: 0px !important;">
			<img src="/resources/images/img_visual_car2_4.png" style="width: 30%; float: right;">
		</div> -->
	</c:if>
	
	<c:if test="${path eq '/rent/imports'}">
		<!-- 렌트 수입 -->
		<!-- <div id="bck-car" style="position: relative !important; top: 0px !important;">
			<img src="/resources/images/img_visual_car_import3.png" style="width: 18%; float: right;">
		</div> -->
	</c:if>

	<c:if test="${path eq '/lease/domestic'}">
		<!-- 리스 국산 -->
		<!-- <div id="bck-car" style="position: relative !important; top: 20px !important;">
			<img src="/resources/images/img_visual_car2_7.png" style="width: 20%; float: right;">
		</div> -->
	</c:if>
	
	<c:if test="${path eq '/lease/imports'}">	
		<!-- 리스 수입 -->
		<!-- <div id="bck-car" style="position: relative !important; top: 0px !important;">
			<img src="/resources/images/img_visual_car_import3.png" style="width: 18%; float: right;">
		</div> -->
	</c:if>
	
	<c:if test="${path eq '/rent/secondhand'}">
		<!-- 재렌트/재리스 -->
		<!-- <div id="bck-car" style="position: relative !important; top: 0px !important;">
			<img src="/resources/images/img_visual_car2_5.png" style="width: 18%; float: right;">
		</div> -->
	</c:if>
	
	<c:if test="${path eq '/rent/month'}">
		<!-- 월렌트 -->
		<!-- <div id="bck-car" style="position: relative !important; top: 25px !important;">
			<img src="/resources/images/img_visual_car_month3.png" style="width: 25%; float: right;">
		</div> -->
	</c:if>
	<!-- main list car image 끝 -->
	
	<!-- main container 시작 -->
    <div class="container">
        <jsp:doBody />
    </div>
    <!-- main container 끝 -->
    
    <!-- footer -->
    <div class="container-fluid footer">
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
		<div class="modal-dialog">
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
			        		<!-- <td>1588-6688 (마스타 자동차 관리)</td> -->
			        		<td>1588-6688 / 1670-5494</td>
			        	</tr>
			        	<!-- <tr>
			        		<td>02-2119-3117 (삼성 애니카 랜드)</td>
			        	</tr> -->
			        </table>
		   		</div>
		    	<div class="modal-footer">
		    		<!-- <button type="button" id="estiAndCon_chk" class="btn btn-default-reverse" onclick="window.open('/estimate/smart/step1','esti_popup','width=1200,height=1200,top=0,left=0,scrollbars=yes')">견적내기 및 상담요청</button> -->
		    		<button type="button" id="estiAndCon_chk" class="btn btn-default-reverse" data-toggle="modal" data-target="#simple-esti-modal2">간편상담신청</button>
		       		<button type="button" class="btn btn-default-reverse" onclick="location.href='/company/branch'">각 지점 약도 보기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	<%-- <%@include file="/WEB-INF/jsp/common/simple-esti-modal2.jsp"%> --%>
	
<form id="simple-est-form" method="post" action="">
	<input type="hidden" value="" name="estArea" id="estArea"/>
	<input type="hidden" value="" name="etc" id="etc"/>
	<input type="hidden" value= "" id="estGubun"/>
	<input type="hidden" value= "new" name="type" id="type"/>
	
	<div class="modal fade modal-open" id="simple-esti-modal2" tabindex="-1" role="dialog" aria-labelledby="simple-esti-modal2" aria-hidden="true" style="width: 100%;">
		<div class="modal-dialog  modal-lg" id="pc_ver">
		   	<div class="modal-content" id="modal-content" style="width:900px;">
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
								<td style="font-size: 13px !important;">
									<span style="vertical-align: middle;">*</span> 고객명
								</td>
								<td style="padding-left: 10px;">
									<input type="text" name="estName" id ="estName" class="full-width form-control input-sm" />
								</td>
								<td></td>
								<td style="font-size: 13px !important;">
									<span style="vertical-align: middle;">*</span> 연락처
								</td>
								<td style='padding-top: 20px;'>
									<input type="text" name="estTel" id="estTel" class="full-width form-control input-sm" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
									<small>- 제외한 숫자만 입력</small>
								</td>
							</tr>
							<tr>
								<td colspan="5"><br></td>
							</tr>
							<tr>
								<td style="font-size: 13px !important;">
									<span style="vertical-align: middle;">*</span> 지역
								</td>
								<td style="padding-left: 10px;">
									<select name="estSido" id="sido" class="form-control input-sm select_control" style="width:49.4%; display: inline !important;">
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
									<select name="estGugun" id="gugun" class="form-control input-sm select_control" style="width:49.4%; display: inline !important;">
										<option value="">구/군</option>
									</select>
								</td>
								<td></td>									
								<td style="font-size: 13px !important;">
									<span style="vertical-align: middle;">*</span> 이메일주소
								</td>
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
								<td colspan="5"><br></td>
							</tr>
							<tr>
								<td class="option-title"  colspan="5">
									<div style="padding-bottom: 10px; font-size: 14px;">
										&nbsp;기타 문의사항
									</div> 
								</td>								
							</tr>
							<tr>
								<td colspan="5">
									<textarea id="etc-textarea" style="height:100px; resize: none;" class="full-width form-control input-sm" placeholder="ex) 그랜저 하이브리드 장기렌트 48개월 견적상담&#13;&#10;ex) 쏘나타LPG 재렌트 24개월 견적상담"></textarea>
								</td>
							</tr>
							<tr><td colspan="5"><br></td></tr>
							<tr>
								<td colspan="5">
									<textarea id="privacy-area" style="height:150px; resize: none;" class="full-width form-control input-sm" readonly="readonly"></textarea>
									<div style="padding-top: 10px;">
										<label class="checkbox-inline">
											<input type="checkbox" id="agree" name="agree"/>
										</label>
										<label for="agree"  style="font-size: 14px !important;">개인정보 수집·이용에 동의합니다.</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
		   		
		    	<div class="modal-footer">
					<button type="button" id="simple-est-submit" class="btn btn-default-reverse">상담 요청하기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
</form>
</body>
</html>