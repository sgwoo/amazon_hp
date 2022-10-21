<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<t:blankpage>
<!-- <meta name="viewport" http-equiv="X-UA-Compatible" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, IE=edge"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link href="<c:url value='/resources/stylesheets/index.css'/>" rel="stylesheet">
<style>
	.nav-login:hover{
		color: #FDB913 !important;
	}
</style>
<script src="/resources/js/library/masonry.pkgd.min.js"></script>
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
	
	$(".nav-container").find(".container").css("width", "");
	
	//BOX 영역 반응형 개발
	$('.grid').masonry({
		itemSelector: '.grid-item',
		columnWidth: 87
	});
	
	var nav = $('.nav-container');
	var menuList = nav.find("a");
	
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
			window.open('/estimate/smart/step1','esti_popup','width=1200,height='+(screen.availHeight-50)+',top=0,left=100,scrollbars=yes');			
		/* } */
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
			$("#greenBanner").attr("src","/resources/images/greencar_img01.png");
			$("#amazoncarLogo").addClass("scroll");
	    } else {
	        nav.removeClass("f-nav");
	        menuList.removeClass("f-nav-style");
	        $(".login-btn").removeClass("hover");
	    //  $("#amazoncarLogo").attr("src","/resources/images/logo_white.png");
	        $("#amazoncarLogo").attr("src","/resources/images/logo_1_w.png");
	        $("#greenBanner").attr("src","/resources/images/greencar_img02.png");
	        $("#amazoncarLogo").removeClass("scroll");
	    }
	});
})

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
	<form action="/login" name="indexLoginForm" method="GET">
		<input type="hidden" name="param" value=""/>
	</form>
	<div class="index-container">		
		<div class="header nav-container col-md-12" style="padding-right: 0px;">
			<div class="col-md-4 col-xs-12" style="float:left; padding-left: 0px; padding-right: 0px;">
				<!-- <a href="javascript:;"><img id="amazoncarLogo" src="/resources/images/logo_white.png" alt="Logo" /></a> -->
				<a href="javascript:;" style="margin-right: 20px;"><img id="amazoncarLogo" src="/resources/images/logo_1_w.png" alt="Logo" style="margin-top: 7px; width: 200px;" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/rent/green/desc#tab_green-compare1"><img src="/resources/images/greencar_img02.png" id="greenBanner" alt="친환경차 안내" /></a>
				
			</div>
			<!-- <div class="container nav" style="margin-right: -130px;"> -->
			<!-- <div class="col-md-8 container nav" align="right"> -->
			<div class="col-md-8 col-xs-12 nav" align="center" style="padding-right: 0px; padding-top: 12px; min-width: 765px;">
				<ul class="menu">
					<li><a href="/rent/domestic">장기렌트</a></li>
					<li>
						<a href="/lease/domestic">
							<span>리스 </span>
							<span style="font-size: 13px;">(화물차포함)</span>
						</a>
					</li>
					<li><a href="/rent/secondhand">재렌트·재리스</a></li>
					<li><a href="/rent/month">월렌트</a></li>
                    <!-- <li class="nav-menu nav-estimate primary" onclick="window.open('/estimate/smart/step1','esti_popup','width=1200,height=1200,top=0,left=100,scrollbars=yes')"><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간 견적</a></li> -->					
                    <li class="nav-menu nav-estimate primary" id="estimate-span"><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;실시간 견적</a></li>					
					<li class="nav-menu nav-call" id="company"><a data-toggle="modal" data-target="#contact-modal" href="#"><span class="glyphicon glyphicon-earphone"  style="font-size:18px;vertical-align:-2px;"></span>&nbsp;상담</a></li>
				
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
		<!-- <div style="margin-top: 150px; margin-left: 50px; position: absolute; width: 280px; z-index: 10;">
			<a href="http://www.cretop.com" target="_blank"><img alt="cretop_logo" src="/resources/images/cretop_logo.jpg" width="90" align="left" hspace="10"></a>
			<span style="color: yellow; font-size: 16px; font-weight: bold;">	대한민국 렌터카</span><br/>
			<span style="color: white; font-size: 14px; ">	전체 1,102개사 중</span><br/>
			<span style="color: yellow; font-size: 16px; font-weight: bold;">	렌터카전업 부문 3위</span><br/>
			<span style="color: white; font-size: 14px; ">[2017년 매출액 기준]</span>	
		</div> -->		
		<!-- Main Carousel 시작  -->
        <div id="carousel-example" class="carousel slide text-slider col-md-12" data-ride="carousel">		
            <div class="row">
          		<div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-content">
                        	<div>
                               	<h1 style="color: #a8eb00;">친환경차</h1>
                                <hr/>
                                <span class="slider-detail">
						                                    미세먼지없는 세상<br/>
						                                    획기적인 경비절감과 친환경을 동시에 잡았다<br/><br/>
						                    
						                                    이제는 대세인 전기차와 하이브리드차
                                </span><br/>
                                <a href="/rent/domestic?companyName=&carGubun=green&agreeDist=20000&priceSearch=&priceStd=48&carName="><button type="button" class="detail-btn">자세히 보기</button></a>
                            </div>
                        </div>
                    </div>     
                    <div class="item">
                        <div class="carousel-content">
                        	<div>
                               	<h1>장기렌트</h1>
                                <hr/>
                                <span class="slider-detail">
						                                    비즈니스를 위한 당신의 발이 되어주는<br/>
						                                    현대인의 경제생활 필수품인 자동차!<br/><br/>
						                    
						                                    당신은 어떻게 이용하고 있으신가요?
                                </span><br/>
                                <a href="/rent/domestic"><button type="button" class="detail-btn">자세히 보기</button></a>
                            </div>
                        </div>
                    </div>     
 	                <div class="item">
                        <div class="carousel-content">
                        	<div>
                               	<h1>리스</h1>
                                <hr  style="width: 334px;" />
                                <span class="slider-detail">
						                                    리스를 하게 되면 대출 기록이 남을까요?<br/><br/>
						                                    렌트와 달리 리스는 허/하/호의 번호가 붙지 않으며<br/>
						                                    금융권 전산 상의 대출기록이 남지 않습니다.
                                </span><br/>
                                <a href="/lease/domestic"><button type="button" class="detail-btn">자세히 보기</button></a>
                            </div>
                        </div>
                    </div> 
                    <div class="item">
                        <div class="carousel-content">
                        	<div>
                               	<h1>재렌트/재리스</h1>
                                <hr style="width: 424px;" />
                                <span class="slider-detail">
						             저렴하면서 안전하게 이용할 자동차 렌트와 리스가 있을까요?<br/><br/>
						                                    네, 있습니다. 평균차령이 24개월 수준으로 차량관리 상태가<br/>
						                                    우수한 차량으로 제공되는 재렌트와 재리스가 그 해답입니다.
                                </span><br/>
                                <a href="/rent/secondhand"><button type="button" class="detail-btn">자세히 보기</button></a>
                            </div>
                        </div>
                    </div> 
                    <div class="item">
                        <div class="carousel-content">
                        	<div>
                               	<h1>월렌트</h1>
                                <hr />
                                <span class="slider-detail">
						             한 달만, 또는 한 달 단위로 이용할 차량은 있을까?<br/><br/>
						                                    아마존카는 저렴한 요금에 한 달 단위로 이용 가능한 월렌트를 제공합니다.<br/>
						                                    전국 어디서나 이용할 수 있습니다.
                                </span><br/>
                                <a href="/rent/month"><button type="button" class="detail-btn">자세히 보기</button></a>
                            </div>
                        </div>
                    </div>                     
                </div>
            </div>
            <!-- Indicators -->
            <ol class="carousel-indicators" style="">
                <li data-target="#carousel-example" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example" data-slide-to="1"></li>
                <li data-target="#carousel-example" data-slide-to="2"></li>
                <li data-target="#carousel-example" data-slide-to="3"></li>
                <li data-target="#carousel-example" data-slide-to="4"></li>
            </ol>	
        </div>
        <div class="col-md-12"  style="position: absolute; top: 150px; width: 100%; padding-right: 2%;">
        	<!-- <div class="col-md-6" style="padding-left: 4%;">
        		<div class="col-md-12">
        			<div style="width: 270px; color: white; text-align: center; font-size: 16px; border: 1px dotted #FFF;">
        				<div style="padding: 15px;">
		        			2019년<br>
							빠를수록 유리한<br>
							전기차 & 수소차<br>
							미리 예약하세요 !!
							<a href="/single/reservation?type=electric_car">
								<button type="button" style="font-weight: 400; color: #FFF; background-color: #76CF5F; padding: 5px 30px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 15px;">전기차 사전예약</button>
							</a>
							<a href="/single/reservation?type=hydro_car">
								<button type="button" style="font-weight: 400; color: #003590; background-color: #FFF; padding: 5px 30px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 10px;">수소차 사전예약</button>
							</a>
						</div>
					</div>
        		</div>
        	</div> -->
        	<div class="col-md-12 col-xs-12" style="padding-right: 0px;">
	        	<div class="col-md-12 col-xs-12" style="padding-right: 0px;">
	        		<div onclick="window.open('https://www.amazoncar.co.kr/home/reasonable/cretop_rank.jsp');" style="float: right; cursor: pointer;">
	        			<div style="float: left; width: 70px; margin-top: 10px;">
		        			<img src="/resources/images/hand.png" align="left" hspace="10">
		        		</div>
		        		<div style="float: left; width: 200px; color: white;">
	        				대한민국 렌터카회사 1,102개중<br>
	        				<font style="font-weight: bold;">렌터카전업 부분 3위</font><br>
							[2017년 매출액 기준]
	        			</div>
	        			<div style="padding-top: 48px;">
	        				<hr style="border: 0.5px solid #FFF; width: 238px; margin-bottom: 0px;">
	        			</div>
	        		</div>
	        	</div>
	        	<div class="col-md-12 col-xs-12"  style="margin-top: 10px; padding-right: 0px;">
	        		<!-- <div onclick="window.open('http://bscw.gapiasite.com/')" style="float: right; cursor: pointer;"> -->
	        		<div onclick="window.open('http://goodcompany.korcham.net/Application/05_Company/Details_page.aspx?MRID=22&URID=0&SNO=1288147957')" style="float: right; cursor: pointer;">
	        			<div style="float: left; width: 65px;">
	        				<img src="/resources/images/building.png" align="left" hspace="10">
	        			</div>
	        			<div style="float: left; width: 200px; color: white;">
	        				'일하기 좋은 중소기업' 부문<br>
							<font style="font-weight: bold;"><font style="color: #a8eb00; font-weight: bold;">아마존카</font> 대한상의 선정</font>
	        			</div>  
	        			<!-- <div style="padding-top: 30px; margin-right: 10px;">
	        				<hr style="border: 0.5px solid #FFF; width: 238px; margin-bottom: 0px;">
	        			</div>    -->   			
	        		</div>	
	        	</div>
	        	<div class="col-md-12 col-xs-12" style="z-index: 9; padding-right: 0px;">
        			<div style="width: 270px; color: white; text-align: center; font-size: 15px; float: right;"><!-- float: right; -->
        				<div style="padding-top: 50px; position: relative;">
		        			<span style="font-weight: bold;">
			        			2019년 빠를수록 유리한<br>
								전기차<br>
								미리 예약하세요 !!
							</span>							
						</div>
						<div onclick="window.open('/single/reservation?type=electric_car', '_self')" style="cursor: pointer; margin-top: 15px; position: absolute;">
							<div style="position: absolute; top: -50px;">
								<img src="/resources/images/index_plug.png" align="left" hspace="10">
							</div>
							<div style="margin-left: 30px; position: absolute; width: 220px;">
								<button type="button" style="font-weight: bold; color: #FFF; background-color: #a8eb00; padding: 10px 55px; border-radius: 10px; border-style: none; font-size: 15px;">전기차 사전예약</button>
							</div>
						</div>
						<!-- <div onclick="window.open('/single/reservation?type=hydro_car', '_self')" style="cursor: pointer; margin-top: 40px;">
							<div style="position: absolute; margin-top: 20px; margin-left: -11px;">
								<img src="/resources/images/index_leaf.png" align="left" hspace="10">
							</div>
							<div style="margin-left: 30px; margin-top: 35px; position: absolute; width: 220px;">
								<button type="button" style="font-weight: bold; color: #a8eb00; background-color: #FFF; padding: 10px 55px; border-radius: 10px; border-style: none; font-size: 15px;">수소차 사전예약</button>
							</div>
						</div> -->
					</div>
        		</div>
	        	<!-- <div class="col-md-12" style="margin-top: 10px;">
	        		<div onclick="window.open('http://bscw.gapiasite.com/Application/05_Company/Details_page.aspx?MRID=22&URID=0&SNO=1288147957')" style="float: right; cursor: pointer;">
	        			<div style="float: left; width: 65px;">
	        				<img src="/resources/images/best_2.png" align="left" hspace="10">
	        			</div>
	        			<div style="float: left; width: 200px; color: white;">
	        				'CEO 비전, 철학' 부문<br>
							<font style="font-weight: bold;"> BEST OF BEST 선정</font>
	        			</div>
	        		</div>
	        	</div> -->
        	</div>
        </div>
                
        <div class="col-md-12" style="margin-top: 10px;">
			<div class="graphicon">
				<!-- <div class="graphicon-background"></div> -->
				<div class="graphicon-section">
					<span class="icon-car" style="color:#fff;"></span><br/>
					<span class="ic-title"><fmt:formatNumber value="${info_car}" pattern="#,###"/>대<br/>보유차량</span><br/>
				</div>
				<div class="graphicon-section">
					<span class="icon-capital" style="color:#fff;"></span><br/>
					<span class="ic-title"><fmt:formatNumber value="${info_asset}" pattern="#,###"/>억<br/>보유자산</span><br/>
				</div>
				<div class="graphicon-section">
					<span class="icon-brief" style="color:#fff;"></span><br/>
					<span class="ic-title"><fmt:formatNumber value="${info_client}" pattern="#,###"/>업체<br/>고객사</span><br/>
				</div>
				<div class="graphicon-section">
					<span class="icon-throphy" style="color:#fff;"></span><br/>
					<%-- <span class="ic-title"><fmt:formatNumber value="${info_score}" pattern="#,###"/>위<br/>동종업계 <fmt:formatNumber value="${info_year}" pattern="#,###"/>년간</span><br/>
					<span style="font-size:11px;">(그룹계열 4개사 제외)</span> --%>
					<%-- <span class="ic-title"><fmt:formatNumber value="${info_year}" pattern="#,###"/>년<br>장기대여전문기업</span><br/> --%>
					<%-- <span class="ic-title"><fmt:formatNumber value="${info_year}" pattern="#,###"/>년<br>Since 2000</span><br/> --%>
					<span class="ic-title">20년 외길<br>장기렌트 전문</span><br/>
					<!-- <span style="font-size:11px;">(그룹계열 4개사 제외)</span>
					<span class="ic-title">2000년~<br/>장기대여전문기업</span><br/>	-->	
				</div>
			</div>
		</div>
	</div>
	
	<!-- <div style="margin:0 auto;max-width:1050px;margin-top:40px;">
		<div class="grid">
			<div class="box grid-item" style="border:3px solid #fff; background-color:#22b500;background: linear-gradient(-230deg, #22b500 0%,#429321 100%);">
				<div class="box-main" style="text-align:center;">
					<span class="title" style="color:#fff;">합리적인 가격</span>
					<hr style="width:80px;margin:12px auto 15px;border-top:1px solid #71c75a;"/>
					<p class="box-detail-ulStyle" style="color:#fff; line-height:19px !important;">
						아마존카는 다양한 상품에 대한 합리적인 기준을 제시하고 가격 공개를 원칙으로 합니다.
						<div style="float:left;margin-left:3px;margin-right:7px;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold; margin-top: 15px;">다양성</div>
						<div style="float:left;margin-right:7px;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold;margin-top: 15px;">편리성</div>
						<div style="float:left;padding-top:18px;text-align:center;font-size:12px;color:#fff;width:55px;height:55px;border:1px solid #fff;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold; margin-top: 15px;">가격공개</div>
					</p>
				</div>
				<div class="box-footer" style="margin-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff" onclick="location.href='/single/onePrice'"; >자세히보기</button>
				</div>
			</div>
			<div class="box grid-item">
				<div class="box-main">
					<div id="estimate-btn" class="title" style="background-color:#969db0;width:202px;height:46px;text-align:center;color:#fff;
						padding-top:10px;margin-bottom:12px;margin-top:-5px;margin-left:-5px;color:#fff;font-size:18px;">실시간 견적</div>
						<span style="font-size:15px;line-height:34px;font-weight:bold;">신차</span><br/>
						<a href="/rent/domestic"><span style="line-height:23px;color:#656464;">장기렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><Br/>
						<a href="/lease/domestic"><span style="line-height:23px;color:#656464;">자동차 리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
						<hr/>
						<span style="font-size:15px;line-height:34px;font-weight:bold;">아마존카 보유차량</span><br/>
						<a href="/rent/secondhand"><span style="line-height:23px;color:#656464;">재렌트/재리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><br/>
						<a href="/rent/month"><span style="line-height:23px;color:#656464;">월렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
				</div>
			</div>
			<div class="box grid-item">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;"><span class="title primary" style="vertical-align:bottom;">차량예약(월렌트)</span>
					<a href="/rent/month"><span class="title primary icon-arrow_right" style="font-size:30px;float:right;"></span></a></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:24px;">
						1개월 단위로 이용 가능한<br/>월렌트 차량을 예약하시려면,<br>
					</p>
				</div>
				<div class="col-md-12 col-xs-12" style="text-align: center; margin-top: -20px;">
					<img src="/resources/images/mrent_img.jpg"/>
				</div>
				<div class="box-footer" style="margin-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/month'"; >보유차량보기</button>
				</div>
			</div>			
			<div class="box grid-item" style="border:5px solid #d5d7dd;">
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
			</div>
			<div class="box grid-item">
				<div class="box-main">
					<div style="padding-top:5px;"><span class="title" style="color:#6b707d;vertical-align:bottom;">소통공간</span></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:28px;">
						<img src="/resources/images/icon_use_process.jpg" style="margin-right:7px;"><a href="/single/process">장기렌트 이용 절차</a><br/>
						<span class="icon-question_1" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/faq">자주 묻는 질문</a><br/>
						<span class="icon-complain" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/feedback">불편합니다</a><br/>
						<hr style="margin-top:20px;"/>
						<a href="http://blog.naver.com/amazoncarrent/220830451937" target="_blank">
							<img src="/resources/images/banner_kakaotalk5.jpg" style="float:left;border-radius:5px; margin-left: 14px; margin-top: 10px;" />
						</a>
					</p>
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
					<br/><br/>
					
				</div>
				<div class="box-footer" style="margin-top:22px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff;width:165px;"  onclick="window.open('https://fms.amazoncar.co.kr/service/index.jsp');">
					<span class="glyphicon glyphicon-log-in"></span>&nbsp;고객 FMS 로그인</button>
				</div>
			</div>
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
			<div class="box grid-item" style="background-color:#969db0;color:#fff;border:1px solid #969db0;">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;"><span class="title">장기렌트 효용지수</span></div>
					<hr style="border-top:1px solid #b9bdca;margin:9px 0 19px;"/>
					<p class="box-detail-ulStyle" style="color:#fff;font-size:15px;line-height:23px;">
						차량 가격 대비 월 대여료가<BR/>저렴한 차종을 알아볼까요?
					</p>
				</div>
				<div class="box-footer" style="margin:10px 10px 30px 5px;">
					<span class="icon-compare" style="font-size:67px;float:left;"></span>
					<ul style="margin-left:60px;line-height:20px;text-align:left;font-size:14px;color:#53575f;">
                        <li style="padding-top:4px;"><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_do_06_05.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;" target="_blank">국산 승용차</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_rv_06_01.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">국산 RV</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_im_06_02.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">수입차</a></li>
               		</ul>
				</div>
			</div>
		</div>
	</div> -->
	
	
	
	<div class="col-md-12 col-xs-12" style="padding-left: 18%; padding-right: 18%; margin-top: 20px;">	
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 3px solid rgb(255, 255, 255); background: linear-gradient(-230deg, rgb(34, 181, 0) 0%, rgb(66, 147, 33) 100%); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main" style="text-align:center;">
					<span class="title" style="color:#fff; font-size: 18px;">합리적인 가격</span>
					<hr style="width:80px;margin:12px auto 15px;border-top:1px solid #71c75a;"/>
					<p class="box-detail-ulStyle" style="color:#fff; line-height:19px !important;">
						아마존카는 다양한 상품에 대한 합리적인 기준을 제시하고 가격 공개를 원칙으로 합니다.
					</p>
					<div class="col-md-12 col-xs-12" style="padding: 0px;">
						<div class="col-md-4 col-xs-4" style="margin-right: 10px;padding: 18px 0px 0px 0px;text-align:center;font-size:12px;color:#FFF;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold;">
							다양성
						</div>
						<div class="col-md-4 col-xs-4" style="margin-right: 10px;padding: 18px 0px 0px 0px;text-align:center;font-size:12px;color:#FFF;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold;">
							편리성
						</div>
						<div class="col-md-4 col-xs-4" style="padding: 18px 0px 0px 0px;text-align:center;font-size:12px;color:#FFF;width:55px;height:55px;border:1px solid rgba(255, 255, 255, .65);border-radius:100px;-webkit-border-radius:100px;-moz-border-radius:100px;font-weight:bold;">
							가격공개
						</div>
					</div>
				</div>
				<div class="box-footer" style="margin-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff" onclick="location.href='/single/onePrice'" >자세히보기</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 1px solid #d3d3d3; background-color: #fff; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main" style="height: 100%;">
					<div id="estimate-btn" class="title" style="background-color:#969db0;color:#fff;font-size:18px; text-align: center; padding: 10px;">
						실시간 견적
					</div>
					<span style="font-size:15px;line-height:34px;font-weight:bold;">신차</span><br/>
					<a href="/rent/domestic"><span style="line-height:23px;color:#656464;">장기렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><Br/>
					<a href="/lease/domestic"><span style="line-height:23px;color:#656464;">자동차 리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
					<hr/>
					<span style="font-size:15px;line-height:34px;font-weight:bold;">아마존카 보유차량</span><br/>
					<a href="/rent/secondhand"><span style="line-height:23px;color:#656464;">재렌트/재리스 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a><br/>
					<a href="/rent/month"><span style="line-height:23px;color:#656464;">월렌트 보기</span><span class="primary icon-arrow_right" style="font-size:17px;float:right;line-height:20px;font-weight:bold;"></span></a>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 1px solid #d3d3d3; background-color: #FFF; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;"><span class="title primary" style="vertical-align:bottom; font-size: 18px;">차량예약(월렌트)</span>
					<a href="/rent/month"><span class="title primary icon-arrow_right" style="font-size:30px;float:right;"></span></a></div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:24px;">
						1개월 단위로 이용 가능한<br/>월렌트 차량을 예약하시려면,<br>
					</p>
				</div>
				<div class="col-md-12 col-xs-12">
					<img src="/resources/images/mrent_img.jpg" style="margin-top:-15px; margin-left:27px;"/>
				</div>
				<div class="col-md-12 col-xs-12 box-footer" style="padding-top:20px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/month'"; >보유차량보기</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 5px solid #d3d3d3; background-color: #FFF; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main">
					<div style="padding-top:1px;">
						<span class="title" style="color:#6b707d;font-weight:500; font-size: 18px;">손비처리 기준</span>
					</div>
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
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 1px solid #d3d3d3; background-color: #FFF; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main">
					<div style="padding-top:5px;">
						<span class="title" style="color:#6b707d; vertical-align:bottom; font-size: 18px;">소통공간</span>
					</div>
					<hr style="border-top:1px solid #edeef2;margin:9px 0 16px;"/>
					<p class="box-detail-ulStyle" style="font-size:15px;line-height:28px;">
						<img src="/resources/images/icon_use_process.jpg" style="margin-right:7px;"><a href="/single/process">장기렌트 이용 절차</a><br/>
						<span class="icon-question_1" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/faq">자주 묻는 질문</a><br/>
						<span class="icon-complain" style="color:#969db0;font-size:13px;padding-right:10px;"></span><a href="/single/feedback">불편합니다</a><br/>
						<hr style="margin-top:20px;"/>
						<a href="http://blog.naver.com/amazoncarrent/220830451937" target="_blank">
							<img src="/resources/images/banner_kakaotalk5.jpg" style="float:left;border-radius:5px; margin-left: 14px; margin-top: 10px;" />
						</a>
					</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 1px solid rgb(249, 132, 96); background-color: rgb(249, 132, 96); box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); color: rgb(255, 255, 255); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main">
					<div style="padding-top:5px;">
						<span class="title" style="vertical-align:bottom; font-size: 18px;">고객지원 서비스(FMS)</span>
					</div>
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
				</div>
				<div class="box-footer" style="margin-top:22px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#fff;width:165px;"  onclick="window.open('https://fms.amazoncar.co.kr/service/index.jsp');">
					<span class="glyphicon glyphicon-log-in"></span>&nbsp;고객 FMS 로그인</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="border: 3px solid rgb(34, 181, 0); background-color: #FFF; box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main">
					<div style="text-align:center;margin-top:-6px;margin-left:-5px;">
						<img src="/resources/images/greenrent_img.jpg">
					</div>
					<div style="text-align:center;padding-top:7px;">
						<span class="title" style="color:#489f02; font-size: 18px;">친환경차 장기렌트</span>
					</div>
					<p class="box-detail-ulStyle" style="font-size:15px; line-height:23px; padding-top:10px; letter-spacing: -1.4px;">
						첨단기능과 경제성을 갖춘 전기차, LPG보다 경제적인 하이브리드차를 장기렌트로 만나보세요.
					</p>
				</div>
				<div class="box-footer" style="margin-top:26px;">
					<button type="button" class="box-detail-btn" style="background-color:transparent;color:#333333;border:1px solid #b9b9b9;width:130px;" onclick="location.href='/rent/green/desc#tab_green-compare1'"; >친환경차 안내</button>
				</div>
			</div>
		</div>
		
		<div class="col-md-3 col-xs-6" style="padding: 20px;">
			<div class="col-md-12 col-xs-12" style="background-color: rgb(150, 157, 176); color: rgb(255, 255, 255); border: 1px solid rgb(150, 157, 176); box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1); min-width: 230px; max-width: 250px; min-height: 280px; max-height: 280px; padding: 18px;">
				<div class="box-main" style="height:140px;">
					<div style="padding-top:5px;">
						<span class="title" style="font-size: 18px;">장기렌트 효용지수</span>
					</div>
					<hr style="border-top:1px solid #b9bdca;margin:9px 0 19px;"/>
					<p class="box-detail-ulStyle" style="color:#fff;font-size:15px;line-height:23px;">
						차량 가격 대비 월 대여료가<BR/>저렴한 차종을 알아볼까요?
					</p>
				</div>
				<div class="box-footer" style="margin:10px 10px 30px 5px;">
					<span class="icon-compare" style="font-size:67px;float:left;"></span>
					<ul style="margin-left:60px;line-height:20px;text-align:left;font-size:14px;color:#53575f;">
                        <li style="padding-top:4px;"><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_do_06_05.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;" target="_blank">국산 승용차</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_rv_06_01.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">국산 RV</a></li>
                        <li><a href="https://www.amazoncar.co.kr/home/reasonable/2018/pop_uindex_im_06_02.jsp" style="color:#53575f;font-weight:bold;margin-left:-4px;"  target="_blank">수입차</a></li>
               		</ul>
				</div>
			</div>
		</div>		
	</div>
	
	
	
	<div class="container-fluid footer col-md-12 col-xs-12">
		<div class="row">
			<div class="footer-menu" style="width: 100%;">
				<ul class="footer-menu">
					<li><a href="/company/introduce">회사소개</a></li>
					<li><a href="/company/branch">지점안내</a></li>
					<li><a href="/single/standard">자동차대여약관</a></li>
					<li><a href="/single/shortRent">단기대여 요금기준</a></li>
					<li><a href="http://bpms.kemco.or.kr/transport_2012/car/car_choice.aspx?f=system" target="_blank">차종별 연비확인</a></li>
					<li><a href="/single/privacy" class="last">개인정보 취급방침</a></li>
				</ul>
			</div>
		</div>
		<div class="row footer-brand">			
			<div class="brand-info" style="width: 100% !important;">
				<div class="col-md-4 col-xs-3 text-right" style="padding-right: 45px; padding-left: 0px;">
					<!-- <img src="/resources/images/footer_logo.png" style="width:110px;float:right"/> -->
					<img src="/resources/images/logo_w.png" style="width:110px;float:right;margin-top: 10px;"/>
				</div>
	            <div class="col-md-4 col-xs-6" style="margin-bottom:15px; padding-left: 4%;">
	                <p>
	                    <span class="title">(주)아마존카</span><br/>
						서울특별시 영등포구 의사당대로 8, 802호 (여의도동, 태흥빌딩)<br/>
						사업자번호 : 128-81-47957<br/>
						통신판매업신고번호 : 제2012-서울영등포-1249호<br/>
						TEL : 대표)02-757-0802 | 고객지원) 02-392-4242<br/>
						Copyrightⓒ 2016 by amazoncar. All rights reserved. 
	                </p>
	            </div>
	            <div class="col-md-4 col-xs-3">
	            	<a href="https://www.facebook.com/amazoncar.rent/?fref=ts" target="_blank"><img src="/resources/images/footer_fb.png" style="float:left"/></a>
	            	<a href="https://blog.naver.com/amazoncarrent" target="_blank"><img src="/resources/images/footer_nv.png" style="float:left"/></a>
	            	<a href="https://www.instagram.com/amazoncarrent/" target="_blank"><img src="/resources/images/footer_ig_1.png"/></a>
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
		    		<button type="button" id="estiAndCon" class="btn btn-default-reverse">견적내기 및 상담요청</button>
		    		<button type="button" class="btn btn-default-reverse" onclick="location.href='/company/branch'">각 지점 약도 보기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
	<%-- <%@include file="/WEB-INF/jsp/common/contest-modal.jsp"%> --%> <!-- 아마존카 CI공모전 안내 모달 -->
</t:blankpage>
