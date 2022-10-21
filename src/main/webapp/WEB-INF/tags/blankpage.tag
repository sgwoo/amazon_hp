<%@ tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<TITLE>장기렌트의 기준-아마존카</TITLE>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/library/css3-mediaqueries.js"></script>
<script src="<c:url value='/resources/js/library/bootstrap.js'/>"></script>
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
<!-- 네이버 애널리틱스 시작 -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"> if(!wcs_add) var wcs_add = {}; wcs_add["wa"] = "95b9916dfeb4d0"; wcs_do(); </script>
<!-- 네이버 애널리틱스 끝 -->
<!-- 네이버 로그분석(웹) 시작 -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_54b732620502";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script>
<!-- 네이버 로그분석 끝 --> 
<!-- 모비온 공통 스크립트 시작(Withpang Tracker v3.0)-->
<script src="https://cdn.megadata.co.kr/js/enliple_min2.js"></script>
<script type="text/javascript">
    var rf = new EN();
    rf.setData("sc", encodeURIComponent(""));
	rf.sendRf();
</script>
<!-- 모비온 공통 스크립트 끝 -->
<!-- style -->
<link href="<c:url value='/resources/stylesheets/common.css'/>" rel="stylesheet">  
</head>
<body>
	<jsp:doBody />

</body>
</html>
