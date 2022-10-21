<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 이메일 발송 및 PDF 다운로드, 인쇄 시 스크립트 실행 -->
<t:blankpage>
<script>
	//naver
	var _NGUL = "wcs.naver.net/wcslog.js";
	var _NPR = location.protocol=="https:"?"https://"+_NGUL:"http://"+_NGUL
	document.writeln("<scr"+"ipt type='text/ja"+"vascript' src='"+ _NPR +"'></scr"+"ipt>");///amazingsoft 해당 부분 오류
	var _nasa={};
	 _nasa["cnv"] = wcs.cnv("4","10"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
	 
	 //daum
	 var DaumConversionDctSv="type=W,orderID=,amount=10"; 
	 var DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00"; 
	 if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){ 
	    var DaumConversionScriptLoaded=true; 
	    document.write(unescape("%3Cscript%20type%3D%22text/javas"+"cript%22%20src%3D%22"+(location.protocol=="https:"?"https":"http")+"%3A//t1.daumcdn.net/cssjs/common/cts/vr200/dcts.js%22%3E%3C/script%3E")); 
	 } 
	 
	 //google
	 var google_conversion_id = 983140464;
	 var google_conversion_language = "en";
	 var google_conversion_format = "3";
	 var google_conversion_color = "ffffff";
	 var google_conversion_label = "pSwKCNjQ-mQQ8JDm1AM";
	 var google_remarketing_only = false;
	 
	 //cpcguard
	 var _CONVERSION_CPCGUARD = 1;
	 console.log("complete");
	 
	 location.reload();
</script>
</t:blankpage>