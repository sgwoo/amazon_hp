<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/common.css"/>
<link rel="stylesheet" href="/resources/stylesheets/print.css"/>
<script src="/resources/js/library/printThis.js"></script>
<script src="/resources/js/library/jspdf.min.js"></script>
<script src="/resources/js/library/html2canvas.js"></script>
<script src="https://wcs.naver.net/wcslog.js"></script>
<jsp:useBean id="toDay" class="java.util.Date" /> 
<jsp:useBean id="todayYear" class="java.util.Date" />
<c:set var="endDate" value="<%=new Date(new Date().getTime() + 60*60*24*3*1000)%>"/>
<c:set var="today"><fmt:formatDate value="${toDay}" pattern="yyyyMMdd" /></c:set>   
<c:set var="yyyyMMddHH"><fmt:formatDate value="${toDay}" pattern="yyyyMMddHH" /></c:set>   
<style>
.underline {
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여  */
   color: black;
}
#carDetail:hover {
   text-decoration: underline; /* 언더라인(아래줄) 스타일 부여  */
   color: black;
}
</style>
<script>
var _CONVERSION_CPCGUARD = 2; //cpcguard
$(document).ready(function(){
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* $("#no-modal").click(function(){
		alert("현재, 서버 정비작업으로 인해 간편상담신청이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */
	
	// 유효기간 세팅
	if('${param.refer}' == ''){	// 실시간 견적내기 시에만 표기
		
		var rentDt = '${data.RENT_DT}'; // 작성일
		var rentYear = rentDt.substring(0, 4);  
		var rentMonth = parseInt(rentDt.substring(4, 6))-1;  
		var rentDate = parseInt(rentDt.substring(6, 8));
		
		var valiDt = new Date(rentYear, rentMonth, rentDate+9); // 유효기간 = 작성일 +9일.
		var valiYear = valiDt.getFullYear(); 
		var valiMonth = parseInt(valiDt.getMonth());
		var valiDate = parseInt(valiDt.getDate());
		
		if( valiMonth != rentMonth ){	// 계산한 유효기간이 다음 달로 넘어갈 경우 유효기간은 해당 월 말일까지.
			valiDt = new Date(valiYear, valiMonth, 0);
			valiMonth -= 1;
			valiDate = parseInt(valiDt.getDate());
		}
		valiMonth += 1;
		
		if(valiMonth < 10) valiMonth = "0"+valiMonth;
		if(valiDate < 10) valiDate = "0"+valiDate;
		
		var valiDtStr = valiYear+'년 '+valiMonth+'월 '+valiDate+'일';
		
		document.getElementById('vali_dt').innerHTML = valiDtStr;
		
	}
	
	
	// url 가져오기
	var url = location.href;
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    
    var size = parameters.length;
    var key, value;
    var com_count = 0;
    
    for(var i=0 ; i < size ; i++) {
        key = parameters[i].split("=")[0];
        value = parameters[i].split("=")[1];
        
        if (key == "refer") {
        	com_count++;
        }
    }
    
    if (com_count > 0) {
    	/* $('#rent_dt_div').show();
    	$('#rent_dt_div2').hide(); */
    } else {
    	/* $('#rent_dt_div').hide();
    	$('#rent_dt_div2').show(); */
    }
    // alert(parameters[0].split('=')[1]);
    /* var urlParam = parameters[2];
    var urlParamChk = urlParam.indexOf("refer");
    
    if (urlParamChk =='0') {
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show();
    } */
	
	var titleCount = 0;
	$(".title-num").each(function() {
		if ($(this).css("display") != "hidden") {
			titleCount++;
			var text = $(this).text();
			$(this).text(titleCount + ". " + text);
		}
	})
	
	//연비에서 () 안의 글자를 복합연비기준으로 대체한다
	var contiRatDesc = $('#contiRatDesc').text();
	var point = contiRatDesc.indexOf("(");
	if (point == -1) {
		$('#contiRatDesc').text( contiRatDesc + "(복합연비기준)");
	} else {
		$('#contiRatDesc').text(contiRatDesc.substring(0,point) + "(복합연비기준)");
	}
	
	$('#print').click(function() {
		$('.print-content').printThis({
			pageTitle: "장기렌트의 기준-아마존카" 
		});
		printAnalytics(); //amazonsoft - 로그 분석을 위한 공통 함수 호출 
		ga('send', 'event', '버튼', '클릭', ''); //구글 광고 전환 분석 함수 호출
		if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
			DaumConversionDctSv="type=W,orderID=,amount=";
			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
			var DaumConversionScriptLoaded=true;
			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
		}
	})
	
	$("#compare-print-btn").click(function(){
		$("#compare-print").printThis({
			pageTitle:"할부구입 vs 아마존카 장기대여 비용비교",
			importCSS:true,
			printContainer:true,
			removeInline:true,
			doctypeString : '<!DOCTYPE html>'
		});
	});
	
	$("#contract-doc-print-btn").click(function(){
		$("#contract-doc").printThis({
			pageTitle:"장기렌트의 기준-아마존카 계약준비서류"
		});
	})
	
	$('#pdf').click(function(){
		html2canvas(document.getElementById("print-report"),{
			onrendered:function(canvas){
				var imgData = canvas.toDataURL('image/png');
				var doc = new jsPDF("p","mm",[297,210]);
				doc.addImage(imgData,'PNG', 10, -5, 195, 295);
				doc.save('amazoncar-sheet.pdf');
			}
		})
		printAnalytics();
		ga('send', 'event', '버튼', '클릭', ''); //구글 광고 전환 분석 함수 호출
		if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
			DaumConversionDctSv="type=W,orderID=,amount=";
			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
			var DaumConversionScriptLoaded=true;
			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
		}
	})
	
	if($("#jg_k").val() != "0"){
		var gubunValue = $('#gubun').val().substr(1,1);
		$('#'+gubunValue).prop("checked", true);
	}
	
	//차종명, 옵션 클릭시 세부사항 링크
	var estimateId = "${param.estimateId}";
	var url = "https://www.amazoncar.co.kr/home/acar/main_car_hp/opt.jsp?est_id="+encodeURIComponent(estimateId);
	$(".detail-page").on("click", function(){
	   window.open(url,"차량 상세정보","width=800,height=500,top=0,left=100,scrollbars=yes");
	});
	
	//작성일세팅 수정(2017.10초 연휴기간 처리)
	 var rent_dt = $("#rent_dt").val();
	 /* if(rent_dt > 20170930 && rent_dt < 20171010){	
		 $("#rent_dt_div").html("<small>기준일 : 2017년 09월 30일</small><br/>");
	 } */
	 carAmtText();
	 setRegLocSt();
	 viewDutyFreeOptMent();	//면세가표기차량여부표시
	 viewDCMonth();				//제조사dc월표시	
	 viewPurSub();				//전기차 구매보조금 표시
})

// function carUnderlineOn()	{	$("#carDetail").addClass("underline"); 		}
// function carUnderlineOff()	{	$("#carDetail").removeClass("underline");	}
function optUnderlineOn()	{	$("#optDetail").addClass("underline"); 		}
function optUnderlineOff()	{	$("#optDetail").removeClass("underline");	}

function carAmtText(){	
	// url 가져오기
	var url = location.href;
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    
    var size = parameters.length;
    var key, value;
    var com_count = 0;
    var data_rent_dt = 0;
    var ref_reg_dt = 0;
    
    for (var i = 0; i < size; i++) {
        key = parameters[i].split("=")[0];
        value = parameters[i].split("=")[1];
        
        if (key == "refer") {
        	com_count++;
        }
    }
	
	if (com_count > 0) {
		data_rent_dt = ${today};
		
		ref_reg_dt = ${yyyyMMddHH};
    } else {
    	data_rent_dt = ${data.RENT_DT};
    	
    	var temp_reg_dt = String(${data.REG_DT});
    	var result_reg_dt = temp_reg_dt.substring(0, temp_reg_dt.length - 2);
    	ref_reg_dt = Number(result_reg_dt);
    }
	
	/* var temp_reg_dt = String(${data.REG_DT});
	var result_reg_dt = temp_reg_dt.substring(0, temp_reg_dt.length - 2);
	ref_reg_dt = Number(result_reg_dt); */
    
    //data_rent_dt = 20200103;
	
	var reference_date = 20200101;
	var info_end_dt = 2021010514;
	
	if (Number(${data.CAR_COMP_ID}) > 5) {
		reference_date = 20200108;
		info_end_dt = 2021011514;
	}
	
	$("#jg_g_7").val(${jgData.JG_G_7});
	$("#jg_g_8").val(${jgData.JG_G_8});
	var jg_g_7 = $("#jg_g_7").val();
	var jg_g_8 = $("#jg_g_8").val();
	
	var bk_198_text = "";
	var bk_213_text = "";
	var bk_206_text = "";
	
	var fee_add_text1 = "";
	var fee_add_text2 = "";
	
	var etc_jg_code_match = false;
	var etc_jg_code = [
		"2179", 
		"4115", "4116", "4117", "4149", "4150", "4160", 
		"4264", "4265", 
		"5155", "5156", "5171", "5172", "5173", 
		"5229", "5230", "5271", "5272", "5273", "5274", 
		"5351", "5352",
		"6134", "6135", "6136", "6137", "6161", "6162", "6163", 
		"6255", "6256", "6271", "6272",
		
		"2013714", 
		"4012621", "4012622", "4012623", "4016311", "4016312", "4016313", 
		"4024121", "4024122", 
		"5018411", "5018412", "6018111", "6018112", "6018113", 
		"5026111", "5026112", "6022411", "6022412", "6022413", "6022414", 
		"3053511", "3053512",
		"6016111", "6016112", "6016113", "6016114", "6018116", "6018117", "6018118", 
		"6024411", "6024412", "6022416", "6022417"
	];
	
	for (var j = 0; j < etc_jg_code.length; j++) {
		if (etc_jg_code[j] == ${mainData.JG_CODE}) {
			etc_jg_code_match = true;
		}
	}
	
	var bk_198 = $("#bk_198").val();
	if (bk_198 == "") {
		bk_198 = "0";
	}
	var bk_213 = $("#bk_213").val();
	if (bk_213 == "") {
		bk_213 = "0";
	}
	var bk_206 = $("#bk_206").val();
	if (bk_206 == "") {
		bk_206 = "0";
	}
	//수입차 이거나 하이브리드,플러그하이브리드 이거나 특정차종 문구표시	
	if (ref_reg_dt >= 2020083113 && ref_reg_dt <= 2020121812) {
		if (bk_198 > 0) {
			$("#bk_198_div").html("※ 2021년1월1일 이후 신차가 출고되어 한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우 월대여료가 "+numberWithCommas(${examData.BK_198})+"원(공급가) 인상됩니다.");
		}
	}
	if (ref_reg_dt >= 2020121813 && ref_reg_dt <= 2020123123) {
		if (bk_213 > 0) {
			$("#bk_213_div").html("※ 2021년1월1일이후 신차가 출고되면 개별소비세율 한시적 인하 연장에도 불구하고 개별소비세 인하 한도(100만원) 초과로 월대여료가 "+numberWithCommas(${examData.BK_213})+"원(공급가) 인상됩니다.");
		}
	}
	if (ref_reg_dt >= 2020083113 && ref_reg_dt <= 2020123123) {
		//if ($("#jg_w").val() == "1" || ((jg_g_7 == "1" || jg_g_7 == "2")) || etc_jg_code_match == true) {
		if (bk_206 > 0) {
			$("#bk_206_div").html("※ 2021년1월1일 이후 신차가 출고되면 하이브리드 자동차 취득세 감면 혜택 축소에 따라 월대여료가 "+numberWithCommas(${examData.BK_206})+"원(공급가) 인상됩니다.");			
		}
		//}
	}
	var sn_bn_text = '';
	if( ref_reg_dt >= 2021090600 ){
		if( !('${data.CAR_COMP_ID}' == '0056' || '${data.CAR_COMP_ID}' == '0057' || (Number(${detailData.JG_CODE}) > 9017300 && Number(${detailData.JG_CODE}) < 9018200)) ){
			sn_bn_text = "* 전면/측후면 썬팅 포함";
			if( Number(${detailData.JG_CODE}) < 8000000 ){
				sn_bn_text += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 2채널 블랙박스 포함";
			} else{
				sn_bn_text += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 블랙박스 포함";
			}
		}
	}
	$('#sn_bn_div').html(sn_bn_text);
	
	var plate_text = '';
	var jg_g_7 = '${jgData.JG_G_7}';
	var car_comp_id = '${data.CAR_COMP_ID}';
	var jg_code = '${detailData.JG_CODE}';
	var jg_b = '${jgData.JG_B}';
	
	if( ref_reg_dt >= 2021090600 ){
		if( jg_b == '5' || jg_b == '6' ||  ( Number(jg_code) > 9018110 && Number(jg_code) < 9018999 ) || car_comp_id == '0044' || car_comp_id == '0007' || car_comp_id == '0025' || car_comp_id == '0033' || car_comp_id == '0048' ){
			if(jg_b == '5'){
				plate_text = '* 전기차 전용번호판';
			} else if(jg_b == '6'){
				plate_text = '* 수소전기차 전용번호판';
			} else if( Number(jg_code) > 9018110 && Number(jg_code) < 9018999 ){
				plate_text = '* 페인트식 일반(구형) 번호판';
			} else if(car_comp_id == '0044' || car_comp_id == '0007' || car_comp_id == '0025' || car_comp_id == '0033' || car_comp_id == '0048'){
				plate_text = '* 페인트식 일반(구형) 번호판';
			}
		}
	}
	$('#plate_div').html(plate_text);
	
	if ((${today} >= 20181114 || data_rent_dt >= 20181114) && data_rent_dt <= reference_date) {	
    	
		//20181114 2019년 개별소비세 환원 및 구매보조금 변경 안내
		var fee_add_amt1 = 0;	//개별소비세 환원에 따른 월대여료 인상금액
    	var fee_add_amt2 = 0;	//구매보조금 지원중단에 따른 월대여료 인상금액
    	
    	var car_c_amt = ${data.CAR_AMT}+${data.OPT_AMT}+${data.COL_AMT}-${data.DC_AMT};
    	var fee_pp_amt = ${data.FEE_S_AMT}+(${data.PP_AMT}/${data.A_B});	//월대여료+선납금/개월수
		//보증금이자효과 20191108
    	var grt_mo_amt = 0;
    	if (${data.GTR_AMT} > 0) {
    		//grt_mo_amt = ${data.GTR_AMT}*0.06/12*0.014;
    		grt_mo_amt = ${data.GTR_AMT}*(${subsidyData.A_F_2}/100)/12*0.014;    		
    	}
    	//20191108 0.015->0.014 변경    	
    	//기본개별소비세가 있다.
    	if (${jgData.JG_3}*100 > 0) {
    		//전기차
    		if (jg_g_7 == '3') {
    			//개소세전차량가
    			var car_c_amt2 = ${examData.O_3}/1.1;
    			//수입차는 수입차추정통관면세가
    			if ($("#jg_w").val() == "1") {
    				car_c_amt2 = ${examData.K_SU_4}/1.1;
    			}
    			if (car_c_amt2 <= 60000000) {
    				fee_add_amt1 = 0;
    			} else if (car_c_amt2 > 85714286) {
       				//fee_add_amt1 = priceCutting(fee_pp_amt*0.015, "R", 1000);
       				fee_add_amt1 = fee_pp_amt*0.014;
       			} else {
       				//fee_add_amt1 = (car_c_amt2-60000000)/25714286*0.015*fee_pp_amt;
       				fee_add_amt1 = (car_c_amt2-60000000)/25714286*0.014*fee_pp_amt;
       				//fee_add_amt1 = priceCutting(fee_add_amt1*1, "R", 1000);
       			}
    		} else if (jg_g_7 == '4') {
    			fee_add_amt1  = 0;
    		//하이브리드	
    		} else if(jg_g_7 == '1' || jg_g_7 == '2') {
    			if (car_c_amt <= 23001000) {
    				fee_add_amt1 = 0;
    			} else if (car_c_amt >= 32858571) {
    				//fee_add_amt1 = priceCutting(fee_pp_amt*0.014, "R", 1000);	//fms처럼 맞출려면 0.014곱해줘야함.
    				//fee_add_amt1 = priceCutting(fee_pp_amt*0.015, "R", 1000);	//(20190411)
    				fee_add_amt1 = fee_pp_amt*0.014;
    			} else {
    				//fee_add_amt1 = ((car_c_amt/1.0455*0.065)-1430000)/car_c_amt*0.7*fee_pp_amt;
    				fee_add_amt1 = ((car_c_amt/1.0455*0.065)-1430000)/car_c_amt*0.75*fee_pp_amt;		//(20190411)
    				//fee_add_amt1 = priceCutting(fee_add_amt1*1, "R", 1000);
    			}	
   			//그외	
    		} else {
    			//fee_add_amt1 = priceCutting(fee_pp_amt*0.014, "R", 1000);	//fms처럼 맞출려면 0.014곱해줘야함.
    			//fee_add_amt1 = priceCutting(fee_pp_amt*0.015, "R", 1000);	//(20190411)
    			fee_add_amt1 = fee_pp_amt*0.014;
    		}
    		if (fee_add_amt1 > 0) {
    			fee_add_amt1 = fee_add_amt1+grt_mo_amt;
    			fee_add_amt1 = priceCutting(fee_add_amt1, "R", 100);
    		}
    		//개별소비세 환원 문구
    		//0보다 작으면 표기안함
    		if (fee_add_amt1 < 0) {
    			fee_add_amt1 = 0;
    		}
    		//특정코드(싼타페,투싼)이고 36개월이면 표기안함 20190923 조건해제
    		//if((${mainData.JG_CODE}=='5136'||${mainData.JG_CODE}=='5163'||${mainData.JG_CODE}=='6127') && ${data.A_B}=='36'){ fee_add_amt1 = 0;	}
    		
    		//(주석처리 20181217) // 20181231 다시 해제 (팰리세이드한정)
    		/* var origin_text = $("#carDetail").text();
    		if (origin_text.indexOf("팰리세이드") != -1) {
	    		if(fee_add_amt1 > 0){
	    			fee_add_text1 = '2019년7월1일 이후 신차가 출고되어 개별소비세가 환원(3.5%->5%)될 경우<br>월대여료가 '+numberWithCommas(fee_add_amt1)+'원(공급가) 인상됩니다.';	
	    		}
    		} */
    		/* if(fee_add_amt1 > 0){
    			//팰리세이드는 출고 7개월 걸림
    			//VV펠리세이드 제외 차종들은 일시적으로 문구삭제(20190527)
    			//20190923 수입차와 특정차종코드는 문구 표시
    			if ($("#jg_w").val() == "1" || //수입차1 이면 전차종 문구표시
   					((jg_g_7=='1' || jg_g_7=='2')) || //하이브리드 이면 전차종 문구표시
    				(
    					${mainData.JG_CODE}=='6134'||${mainData.JG_CODE}=='6135'||${mainData.JG_CODE}=='6136'||${mainData.JG_CODE}=='6137'||${mainData.JG_CODE}=='4276'||${mainData.JG_CODE}=='5261'||${mainData.JG_CODE}=='5262'||${mainData.JG_CODE}=='6261'||
    					${mainData.JG_CODE}=='4272'||${mainData.JG_CODE}=='4273'||${mainData.JG_CODE}=='4274'||${mainData.JG_CODE}=='4275'||${mainData.JG_CODE}=='5229'||${mainData.JG_CODE}=='5230'||${mainData.JG_CODE}=='5105'||
    					${mainData.JG_CODE}=='4115'||${mainData.JG_CODE}=='4116'||${mainData.JG_CODE}=='4117'||${mainData.JG_CODE}=='4118'
    				) 	
    			) {
	    		//	fee_add_text1 = '2019년7월1일 이후 신차가 출고되어 개별소비세가 환원(3.5% → 5%)될 경우<br>월대여료가 '+numberWithCommas(fee_add_amt1)+'원(공급가) 인상됩니다.';
	    			fee_add_text1 = "한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우<br>월대여료가 "+numberWithCommas(fee_add_amt1)+"원(공급가) 인상됩니다.";	//문구변경(20190527)
    			} else {
    				fee_add_amt1 = 0;
    			}
    		} */
    		if (fee_add_amt1 > 0) {
    			fee_add_text1 = "한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우<br>월대여료가 "+numberWithCommas(fee_add_amt1)+"원(공급가) 인상됩니다.";	//문구변경(20190527)
    		}
    	}
    	//하이브리드
    	//주석처리(20181227)
    	var bk_128 = $("#bk_128").val();
    	if (bk_128 == "") {
    		bk_128 = 0;
    	}
    	if (jg_g_7 == '1' && jg_g_8 == '1' && bk_128 > 0) {
    		fee_add_amt2 = priceCutting(bk_128/${data.A_B}, "R", 100);
    		if (fee_add_amt2 > 0) { 
    			fee_add_text2 = "2019년1월1일 이후 신차가 출고되면 하이브리드 구매보조금 지원중단에 따라<br>월대여료가 "+numberWithCommas(fee_add_amt2)+"원(공급가) 인상됩니다.";
    		}
    	}
      	//20191007 2020년부터 하이브리드 취득세 감면 혜택 축소 문구 추가
		fee_add_amt2 = 0;
     	//하이브리드,플러그하이브리드
     	if (${today} <= 20191231 || data_rent_dt <= 20191231) {
     		if (jg_g_7 == "1" || jg_g_7 == "2") {
     			if (${data.A_A} == "21" || ${data.A_A} == "22") {
     				var car_c_amt2 = ${examData.S_D};
     				if (car_c_amt2 == "") {
     					car_c_amt2 = 0; 
     				}
     				
     				if (car_c_amt2 <= 22500000) {
     					fee_add_amt2 = 0;
     				} else if (car_c_amt2 >= 35000000) {
     					fee_add_amt2 = priceCutting(500000/${data.A_B}, "R", 100);
     				} else {
     					fee_add_amt2 = priceCutting((car_c_amt2 - 22500000)*0.04/${data.A_B}, "R", 100);
     				}
     			} else {
     				fee_add_amt2 = priceCutting(500000/${data.A_B}, "R", 100);
     			}
     		}
     		if (fee_add_amt2 > 0) {
     			fee_add_text2 = "2020년1월1일 이후 신차가 출고되면 하이브리드 자동차 취득세 감면 혜택 축소에 따라<br>월대여료가 "+numberWithCommas(fee_add_amt2)+"원(공급가) 인상됩니다.";
     		}
     	}
     	
     	if (fee_add_text1 != '' && fee_add_text2 == '') {	
     		$('#fee_add_text_div').html(fee_add_text1);
     	}
        if (fee_add_text1 != '' && fee_add_text2 != '') {
        	$('#fee_add_text_div').html(fee_add_text1+'<br>'+fee_add_text2);
        }
        if (fee_add_text1 == '' && fee_add_text2 != '') {
        	$('#fee_add_text_div').html(fee_add_text2);
        }
        
	} else if (data_rent_dt >= 20190101) {
		if (jg_g_7 == '2' && ${data.ECAR_PUR_SUB_AMT} > 0) {
        	<!-- 친환경차일경우-->
        	$('#fee_add_text_div').html("친환경차 구매보조금 "+numberWithCommas(${data.ECAR_PUR_SUB_AMT})+"원은 월대여료 계산시 반영됨");
        }
	} else {
		if ((jg_g_7 == '1' || jg_g_7 == '2' || jg_g_7 == '4') && ${data.ECAR_PUR_SUB_AMT} > 0) {
			$('#fee_add_text_div').html("친환경차 구매보조금 "+numberWithCommas(${data.ECAR_PUR_SUB_AMT})+"원은 월대여료 계산시 반영됨");
		}
	}
	
	if ((${detailData.CAR_ID} == '006171' || ${detailData.CAR_ID} == '006172') && (${data.A_A} == '21' || ${data.A_A} == '22')) {
		$('#fee_add_text_div').html("본 견적서의 차량가격은 개별소비세 포함가격 입니다.<br>(견적 계산 과정에서는 제조사 가격표와 동일하게 개별소비세 면세가 ("+numberWithCommas(${data.O_1/1.065})+" 원)로 환산하여 계산됨)");
	}
	
	//K7 프리미어
	if ((${today} >= 20190614 || ${data.RENT_DT} >= 20190614) && (${today} <= 20190623 || ${data.RENT_DT} <= 20190623)) {
		if (${mainData.JG_CODE} == '4272' || ${mainData.JG_CODE} == '4273' || ${mainData.JG_CODE} == '4274' || ${mainData.JG_CODE} == '4275' || ${mainData.JG_CODE} == '4276' || ${mainData.JG_CODE} == '4022221' || ${mainData.JG_CODE} == '4022222' || ${mainData.JG_CODE} == '4022223' || ${mainData.JG_CODE} == '4022224' || ${mainData.JG_CODE} == '4022225') {
			$('#fee_add_text_div').html("※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본 견적은 참고용 예상 견적임)");
		}
	}
	
	//셀토스
	if ((${today} >= 20190626 || ${data.RENT_DT} >= 20190626) && (${today} <= 20190717 || ${data.RENT_DT} <= 20190717)) {
		if (${mainData.JG_CODE} == '5229' || ${mainData.JG_CODE} == '5230' || ${mainData.JG_CODE} == '5026111' || ${mainData.JG_CODE} == '5026112') {
			$('#fee_add_text_div').html("※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본 견적은 참고용 예상 견적임)");
		}
	}
	
	//모하비
	if ((${today} >= 20190827 || ${data.RENT_DT} >= 20190827) && (${today} <= 20190902 || ${data.RENT_DT} <= 20190902)) {
		if (${mainData.JG_CODE} == '5261' || ${mainData.JG_CODE} == '5262' || ${mainData.JG_CODE} == '6261' || ${mainData.JG_CODE} == '6026141' || ${mainData.JG_CODE} == '6026142' || ${mainData.JG_CODE} == '6026146') {
			$('#fee_add_text_div').html("※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본 견적은 참고용 예상 견적임)");
		}
	}
	
	//쏘렌토 MQ4
	if ((${today} >= 20200219 || ${data.RENT_DT} >= 20200219) && (${today} <= 20200317 || ${data.RENT_DT} <= 20200317)) {
		if (${mainData.JG_CODE} == '5271' || ${mainData.JG_CODE} == '5273' || ${mainData.JG_CODE} == '6271' || ${mainData.JG_CODE} == '6022411' || ${mainData.JG_CODE} == '6022413' || ${mainData.JG_CODE} == '6022416') {
			$('#fee_add_text_div').html("※ 사전계약 기간 중 예상한 총 차량가격 대비 출시일 확정된 총 차량가격 초과 금액이 30만원 이내이면 월대여료 인상이 없습니다.");
		}
	}
	
	//쏘렌토 MQ4 하이브리드
	if ((${today} >= 20200219 || ${data.RENT_DT} >= 20200219) && (${today} <= 20200310 || ${data.RENT_DT} <= 20200310)) {
		if (${mainData.JG_CODE} == '5272' || ${mainData.JG_CODE} == '5274' || ${mainData.JG_CODE} == '6272' || ${mainData.JG_CODE} == '6022412' || ${mainData.JG_CODE} == '6022414' || ${mainData.JG_CODE} == '6022417') {
			$('#fee_add_text_div').html("※ 사전계약 기간 중 예상한 총 차량가격 대비 출시일 확정된 총 차량가격 초과 금액이 30만원 이내이면 월대여료 인상이 없습니다.");
		}
	}
	
	//아반떼 CN7
	if ((${today} >= 20200325 || ${data.RENT_DT} >= 20200325) && (${today} <= 20200406 || ${data.RENT_DT} <= 20200406)) {
		if (${mainData.JG_CODE} == '2176' || ${mainData.JG_CODE} == '2177' || ${mainData.JG_CODE} == '2013711' || ${mainData.JG_CODE} == '2013712') {
			$('#fee_add_text_div').html("※ 사전계약 기간 중 예상한 총 차량가격 대비 출시일 확정된 총 차량가격 초과 금액이 20만원 이내이면 월대여료 인상이 없습니다.");
		}
	}
	
	//20200701 한시적 안내문
	if (Number(${data.CAR_COMP_ID}) > 5 && !(${mainData.JG_CODE} == '3871' || ${mainData.JG_CODE} == '3313111' )) {	
		if (ref_reg_dt >= 2020070100 && ref_reg_dt <= 2020070813) {
			$('#fee_add_text_div_temp').html("※ 7월1일자로 개별소비세율이 조정(세액 감면 → 세율 조정)됨에 따라 차량 가격이 변경됩니다. 당사는 7월1일 자로 변경되는 차량가격을 순차적으로 반영중이라, 본 견적서의 현재 차량가격이 변경전 차량가격일 수 있습니다. 차량가격 변경 반영으로 신차가격이 변경되는 경우 월대여료도 변경되니 이 점 참고 바랍니다. (궁금한 점이 있으면 영업담당 직원에게 문의 바랍니다.)");
		}
	} else {
		if (ref_reg_dt >= 2020070100 && ref_reg_dt <= 2020070113) {
			$('#fee_add_text_div_temp').html("※ 7월1일자로 개별소비세율이 조정(세액 감면 → 세율 조정)됨에 따라 차량 가격이 변경됩니다. 당사는 오늘(7월1일) 자로 변경되는 차량가격을 순차적으로 반영중이라, 본 견적서의 현재 차량가격이 변경전 차량가격일 수 있습니다. 차량가격 변경 반영으로 신차가격이 내려가는 경우 월대여료도 인하되니 이 점 참고 바랍니다. (궁금한 점이 있으면 영업담당 직원에게 문의 바랍니다.)");
		}
	}
	
	if ($("#jg_g_7").val() == "3" || $("#jg_g_7").val() == "4") {
		
		if(Number(${jgData.JG_G_15}) > 0 && '${data.ECAR_LOC_ST}' == '13'){	// 전기차고객주소지 보조금 없는 견적 선택 시
			$('#fee_add_text_div').html("[보조금 없는 견적]");
		} else if('${data.CAR_COMP_ID}' == '0056'){	// 테슬라 차량
			if(Number(${jgData.JG_G_15}) > 0){	// 국고보조금 있는 경우
				$('#fee_add_text_div').html("※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다. 또한 보조금의 소진 또는 변경시 대여료가 변경되거나  계약진행이 불가능 할 수 있습니다.");
			} else {	// 국고보조금 없는 경우
				$('#fee_add_text_div').html("※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다.");
			}
		} else if(Number(${jgData.JG_G_15}) > 0){	// 친환경차 구분상 전기/수소차면서 국고보조금이 있는 경우 
			$('#fee_add_text_div').html("※ 보조금 소진 또는 변경, 차량 출고지연 등으로 대여료가 변경되거나 계약진행이 불가능 할 수 있습니다.");
		} else {
			$('#fee_add_text_div').html("");
		}
		//테슬라
// 		if (${mainData.JG_CODE} == '4854' || ${mainData.JG_CODE} == '3871' || ${mainData.JG_CODE} == '3313111' || ${mainData.JG_CODE} == '3313112' || ${mainData.JG_CODE} == '3313113' || ${mainData.JG_CODE} == '3313114' || ${mainData.JG_CODE} == '5315111' || ${mainData.JG_CODE} == '5315112') {
// 		if ('${data.CAR_COMP_ID}' == '0056') {
// 			if( '${data.ECAR_LOC_ST}' == '13'){
// 				$('#fee_add_text_div').html('※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다.<br>[보조금 없는 견적]');
// 			} else{
// 				if (fee_add_text1 != "") {			
// 					$('#fee_add_text_div').html(fee_add_text1 + "<br>※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다. 또한 보조금의 소진 또는 변경시 대여료가 변경되거나  계약진행이 불가능 할 수 있습니다.");
// 				} else {
// 					$('#fee_add_text_div').html("※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다. 또한 보조금의 소진 또는 변경시 대여료가 변경되거나  계약진행이 불가능 할 수 있습니다.");
// 				}
// 			}
// 		} else if (${mainData.JG_CODE} == '5866') {
// 			if (fee_add_text1 != "") {			
// 				$('#fee_add_text_div').html(fee_add_text1 + "<br>※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다.");
// 			} else {
// 				$('#fee_add_text_div').html("※ 환율, 연식, 세율 등의 변동이나 제조사 가격정책에 따라 차량가격이 변경될 경우 대여료가 변경될 수 있습니다.");
// 			}
// 		} else {
// 			if( '${data.ECAR_LOC_ST}' != '13'){
// 				$('#fee_add_text_div').html("※ 보조금 소진 또는 변경, 차량 출고지연 등으로 대여료가 변경되거나 계약진행이 불가능 할 수 있습니다.");
// 			} else {
// // 				if( Number('${examData.BK_128}') > 0){
// 				if( '${detailData.JG_CODE}' != '4218111' && '${detailData.JG_CODE}' != '5315113' ){	// 벤츠 EQS 차량의 경우 정부 보조금 없음. 보조금 없는 견적 문구 안 나오도록.
// 					$('#fee_add_text_div').html("[보조금 없는 견적]");
// 				}
// 			}
// 		}
	}	
	
// 	if ($("#jg_g_7").val() == "4") {
// 		$("#fee_add_text_div").html("※ 지자체 보조금 소진 등의 사유로 보조금 지급을 받지 못하거나, 차량 출고지연 등으로 보조금이 변경되거나 차량가격이 변동 될 경우 대여료가 변경되거나 계약진행이 불가능 할 수 있습니다.");
// 	}
	
	// 기본개별소비세율이 0보다 크고 수입차이면서 전기/수소차가 아닌 차량들, 특정 차종코드 차량 안내문 표기
	// 개별소비세 환원 시 월대여료 인상금액 안내문구 전 차종으로 확대. 2021.04.19.
	// 기본개별소비세율이 0보다 크고 개별소비세 환원에 따른 월대여료 인상금액이 0보다 큰 경우. + 특정 차종코드
	if (ref_reg_dt >= 2021070200) {
		if( ${jgData.JG_3} > 0 && bk_198 > 0 ){ // 기본개별소비세율(jgData.JG_3)이 0보다 크고 개별소비세 세율 환원 시 월대여료 인상금액(bk_198)이 0보다 클 때 // 프로시저 쪽에도 금액 계산 관련 날짜 조건이 있음.	
			if( $("#jg_g_7").val() == "3" || $("#jg_g_7").val() == "4" ){ // 친환경차 구분상 전기/수소차
				$("#fee_add_text_div").html($("#fee_add_text_div").html() + "※ 2023년 1월 1일 이후 신차가 출고되어 한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우 월대여료가 인상됩니다.");
			} else {
				$("#fee_add_text_div").html($("#fee_add_text_div").html() + "※ 2023년 1월 1일 이후 신차가 출고되어 한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우 월대여료가 "+ numberWithCommas(${examData.BK_198})+"원(공급가) 인상됩니다.");
			}
		}
	}
}

//실등록지역 세팅
function setRegLocSt() {
	var reg_loc_st = 0;	//서울
	var eco_e_tag = $("#eco_e_tag").val();
	var jg_g_7 = $("#jg_g_7").val();
	var jg_g_7m = $("#jg_g_7m").val();
	var ecar_loc_st = $("#ecar_loc_st").val();
	var hcar_loc_st = $("#hcar_loc_st").val();
	var jg_b = $("#jg_b").val();
	
	if (eco_e_tag == '1') {	//맑은서울스티커 발급선택
		/* if(jg_g_7==3 || ecarFlag==3 || jg_g_7==3){ //전기차 */
		if (jg_b == "5") { //엔진구분 - 전기차
			/* if(ecar_loc_st==0){	//서울
			}else if(ecar_loc_st==1){	//인천,경기
			}else if(ecar_loc_st==2){	//강원
			}else if(ecar_loc_st==3){	//대전
				if(${data.A_A}==21||${data.A_A}==22){		//렌트
				}else if(${data.A_A}==11||${data.A_A}==12){	//리스
					reg_loc_st = 4;	//대전
				}
			}else if(ecar_loc_st==4){	//광주,전남,전북
			}else if(ecar_loc_st==5){	//대구
				reg_loc_st = 7;	//대구
			}else if(ecar_loc_st==6){	//부산,울산,경남
			}else if(ecar_loc_st==7){	//세종,충남,충북(대전제외)
			}else if(ecar_loc_st==8){	//경북(대구제외)
			} */
// 			if (${mainData.JG_CODE} == '3871' || ${mainData.JG_CODE} == '4854' || ${mainData.JG_CODE} == '3313111' || ${mainData.JG_CODE} == '3313112' || ${mainData.JG_CODE} == '3313113' || ${mainData.JG_CODE} == '3313114' || ${mainData.JG_CODE} == '4314111') {
			if ('${data.CAR_COMP_ID}' == '0056') {
				reg_loc_st = 0;
			} else {
				reg_loc_st = 0;	
			}
			
		/* }else if(jg_g_7m==4 || ecarFlag==4 || jg_g_7==4){	//수소차 */
		} else if (jg_b == "6") {	//엔진구분 - 수소차
			/* if(hcar_loc_st==0){	//서울,경기
			}else if(hcar_loc_st==1){	//인천
				reg_loc_st = 5;	//인천
			}else if(hcar_loc_st==1){	//강원
			}else if(hcar_loc_st==1){	//대전
				if(${data.A_A}==21||${data.A_A}==22){		//렌트
				}else if(${data.A_A}==11||${data.A_A}==12){	//리스
					reg_loc_st = 4;	//대전
				}
			}else if(hcar_loc_st==4){	//광주,전남,전북
				reg_loc_st = 6;	//광주
			}else if(hcar_loc_st==5){	//대구,경북
			}else if(hcar_loc_st==6){	//부산,울산,경남
				reg_loc_st = 2;	//부산
			}else if(hcar_loc_st==7){	//세종,충남,충북(대전제외)
			} */
			reg_loc_st = 5;
			//reg_loc_st = 0;
		}
	}
	return reg_loc_st;
}

//일반승용 LPG 여부에서 1일 경우
function jg2Check() {
	var jg_2 = $("#jg_2").val();
	var jg_2m = $("#jg_2m").val();
	var result_jg_2 = 0;	
	
	if (jg_2 == "1" || jg_2m == "1") {
		result_jg_2 = 1;
	}
	
	return result_jg_2;
}

//면세가 표기차량 여부 표시(20190502)
function viewDutyFreeOptMent() {
	if ($("#duty_free_opt").val()=="0") {
		$("#duty_span").html("[차량가격은 개별소비세 과세가격 기준]");
	} else if ($("#duty_free_opt").val()=="1") {
		$("#duty_span").html("[차량가격은 개별소비세 면세가격 기준]");
	} else {
		$("#duty_span").html("");
	}
}

//제조사DC 월 표시
function viewDCMonth() {
	if (${data.DC_AMT} > 0) {
		var dc_mon = ${data.RENT_DT}+"";
		
		var temp_mon = Number(dc_mon.substr(4,2)); 
		
		//$("#dc_mon").html(dc_mon.substr(5,1));
		$("#dc_mon").html(temp_mon);
	}
}

//전기차 구매보조금 표시
function viewPurSub() {
	
	// url 가져오기
	var url = location.href;
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    
    var size = parameters.length;
    var key, value;
    var com_count = 0;
    var data_rent_dt = 0;
    
    for (var i = 0; i < size; i++) {
        key = parameters[i].split("=")[0];
        value = parameters[i].split("=")[1];
        
        if (key == "refer") {
        	com_count++;
        }
    }
	
	if (com_count > 0) {
		data_rent_dt = ${today};
    } else {
    	data_rent_dt = ${data.RENT_DT};
    }
    
    //data_rent_dt = 20200103;
	
	if ($("#jg_g_7").val() == "3") {
		if (!(${detailData.JG_CODE} == "5866" || ${detailData.JG_CODE} == "6316111") && !(${detailData.JG_CODE} == "4854" || ${detailData.JG_CODE} == "4314111")) {
// 			if (!(${detailData.JG_CODE} == "3871" || ${detailData.JG_CODE} == "3313111" || ${detailData.JG_CODE} == "3313112" || ${detailData.JG_CODE} == "3313113" || ${detailData.JG_CODE} == "3313114")) {
			if ('${data.CAR_COMP_ID}' != '0056') {	
				
				var pur_sub = "※ 전기차 구매보조금 1200만원 기준 견적";
				
				if ((${today} >= 20181114 || data_rent_dt >= 20181114) && data_rent_dt <= 20200121) {
					
					$("#pur_sub").html(pur_sub);
					
				} else {
					
					var jg_g_15 = Number(${jgData.JG_G_15}) / 10000;
					var ecar_amt = 0;
					var ecar_region = "서울";
					
					var reg_loc_st = setRegLocSt();
					var region_st = $("#loc_st").val();
					
					//실등록지역에따른 구매보조금
					if (reg_loc_st == 0) {			//서울
						ecar_amt = Number(${subsidyData.ECAR_0_AMT});
					} else if (reg_loc_st == 1) {	//인천,경기
						ecar_amt = Number(${subsidyData.ECAR_1_AMT});
					} else if (reg_loc_st == 2) {	//강원
						ecar_amt = Number(${subsidyData.ECAR_2_AMT});
					} else if (reg_loc_st == 3) {	//대전
						ecar_amt = Number(${subsidyData.ECAR_3_AMT});
					} else if (reg_loc_st == 4) {	//광주,전남,전북
						ecar_amt = Number(${subsidyData.ECAR_4_AMT});
					} else if (reg_loc_st == 5) {	//대구
						ecar_amt = Number(${subsidyData.ECAR_5_AMT});
					} else if (reg_loc_st == 6) {	//부산
						ecar_amt = Number(${subsidyData.ECAR_6_AMT});
					} else if (reg_loc_st == 7) {	//세종,충남,충북(대전제외)
						ecar_amt = Number(${subsidyData.ECAR_7_AMT});
					} else if (reg_loc_st == 8) {	//경북(대구제외)
						ecar_amt = Number(${subsidyData.ECAR_8_AMT});
					} else if (reg_loc_st == 9) {	//경북
						ecar_amt = Number(${subsidyData.ECAR_9_AMT});
					}
					
					//차량인도지역
					if (region_st == "1") {
						ecar_region = "서울";
					} else if (region_st == "2") {
						ecar_region = "인천/경기";
					} else if (region_st == "3") {
						ecar_region = "강원";
					} else if (region_st == "4") {
						ecar_region = "대전/세종/충남/충북";
					} else if (region_st == "5") {
						ecar_region = "광주/전남/전북";
					} else if (region_st == "6") {
						ecar_region = "대구/경북";
					} else if (region_st == "7") {
						ecar_region = "부산/울산/경남";
					}
					
					var total_amt = jg_g_15 + ecar_amt;
					
					//pur_sub = "※ 전기차 구매보조금 " + total_amt + "만원 기준 견적";
					pur_sub = "※ 차량 인도 지역 : " + ecar_region;					
					//$("#pur_sub").html(pur_sub);					
				}
			}
		}
	}
}

</script>
<input type="hidden" value="${data.A_A}" id="gubun" />
<input type="hidden" value="${jgData.JG_K}" id="jg_k" />
<input type="hidden" value="${jgData.JG_G_7}" id="jg_g_7" />
<input type="hidden" value="${jgData.JG_G_15}" id="jg_g_15" />
<input type="hidden" value="${subsidyData.ECAR_0_AMT}" id="ecar_0_amt" />
<input type="hidden" value="${data.CAR_COMP_ID}" id="carCompId">
<input type="hidden" value="${jgData.JG_2}" id="jg_2" />
<input type="hidden" value="${mainData.JG_2}" id="jg_2m" />
<input type="hidden" value="${mainData.JG_G_7}" id="jg_g_7m" />
<input type="hidden" value="${jgData.JG_G_8}" id="jg_g_8" />
<input type="hidden" value="${examData.BK_128}" id="bk_128" />
<input type="hidden" value="${examData.BK_190}" id="bk_190" />
<input type="hidden" value="${examData.BK_198}" id="bk_198" />
<input type="hidden" value="${examData.BK_213}" id="bk_213" />
<input type="hidden" value="${examData.BK_206}" id="bk_206" />
<input type="hidden" value="${examData.JG_W}" id="jg_w" />
<input type="hidden" value="${examData.O_3}" id="o_3" />
<input type="hidden" value="${examData.K_SU_4}" id="k_su_4" />
<input type="hidden" value="${examData.S_D}" id="s_d" />
<input type="hidden" value="${data.ECO_E_TAG}" id="eco_e_tag"/>
<input type="hidden" value="${data.ECAR_LOC_ST}" id="ecar_loc_st"/>
<input type="hidden" value="${data.HCAR_LOC_ST}" id="hcar_loc_st"/>
<input type="hidden" value="${data.LOC_ST}" id="loc_st"/>
<input type="hidden" value="${mainData.DUTY_FREE_OPT}" id="duty_free_opt"/>
<input type="hidden" value="${jgData.JG_B}" id="jg_b"/>

<div class="print-tool" style="z-index: 99;">
	<ul>	
		<li id="print"><span class="glyphicon glyphicon-print"></span>&nbsp;인쇄</li>
		<li data-toggle="modal" data-target="#email-modal"><span class="glyphicon glyphicon-envelope"></span>&nbsp;메일발송</li>
		<li id="pdf"><span class="glyphicon glyphicon-download-alt"></span>&nbsp;PDF 다운로드</li>
		<c:if test="${smartFlag eq null}">
			<!-- <li data-toggle="modal" data-target="#compare-modal"><span class="glyphicon glyphicon-signal"></span>&nbsp;비용비교 안내</li> -->
			<c:if test="${((jgData.JG_G_7 ne 1 && jgData.JG_G_7 ne 2 && jgData.JG_G_7 ne 3 && jgData.JG_G_7 ne 4)&&(mainData.JG_G_7 ne 1 && mainData.JG_G_7 ne 2 && mainData.JG_G_7 ne 3 && mainData.JG_G_7 ne 4)&&(ecarFlag ne 1 && ecarFlag ne 2 && ecarFlag ne 3 && ecarFlag ne 4))}">
				<li data-toggle="modal" data-target="#compare-modal"><span class="glyphicon glyphicon-signal"></span>&nbsp;비용비교 안내</li>
			</c:if>
		</c:if>
		<li data-toggle="modal" data-target="#requiredDoc"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;계약준비서류 안내</li>
		<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
		<li data-toggle="modal" data-target="#simple-esti-modal" class="point-dash"><span class="glyphicon glyphicon-edit"></span>&nbsp;간편상담신청</li>
		<!-- <li class="point-dash" id="no-modal"><span class="glyphicon glyphicon-edit"></span>&nbsp;간편상담신청</li> -->
	</ul>
</div>
<div class="print-container" id="print-report">
	<div class="print-content">
		<%-- <small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/> --%>
		<div class="print-header">
		<br><br><br>
			<h1>아마존카 장기대여 견적서</h1>
			<br>
			<%-- 
				<c:if test="${data.CAR_COMP_ID > 5}">
					<c:choose>
						<c:when test="${today >= 20200101 && today <= 20200110}">
							<small>작성일 : 2019년 12월 31일</small><br>
						</c:when>
						<c:otherwise>
							<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${data.CAR_COMP_ID < 6}">
					<c:choose>
						<c:when test="${today >= 20200101 && today <= 20200103}">
							<small>작성일 : 2019년 12월 31일</small><br>
						</c:when>
						<c:otherwise>
							<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br>
						</c:otherwise>
					</c:choose>
				</c:if> 
			--%>
			
			<%-- 
			<div align="right" id="rent_dt_div" style="margin: -25px 0px -10px 0px;">
				<input type="hidden" value="<fmt:formatDate value="${toDay}" pattern="yyyyMMdd" />" id="rent_dt">
				<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br>
			</div>
			
			<div align="right" id="rent_dt_div2" style="margin: -25px 0px -10px 0px;">
				<input type="hidden" value="<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>">		
				<small>작성일 : <fmt:formatDate value="${dateStr}" pattern="yyyy년 MM월 dd일"/></small><br/>				
			</div> 
			--%>
			
			<div align="right" style="margin: -25px 0px -10px 0px;">
				<c:choose>
					<c:when test="${empty param.refer}">
						<input type="hidden" value="<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>">		
						<small>작성일 : <fmt:formatDate value="${dateStr}" pattern="yyyy년 MM월 dd일"/></small><br/>
						<small>유효기간 : <span id='vali_dt'></span></small><br>
					</c:when>
					<c:otherwise>
						<input type="hidden" value="<fmt:formatDate value="${toDay}" pattern="yyyyMMdd" />" id="rent_dt">
						<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일"/></small><br>
						<%-- <c:choose>
							<c:when test="${today >= 20200630 && today <= 20200731}">
								<small>작성일 : 2020년 06월 30일</small><br>
							</c:when>
							<c:otherwise>
								<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br>
							</c:otherwise>
						</c:choose> --%>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="print-pre-info">
				<h3 class="primary-orange" style="margin-top:0px !important">
					<c:if test="${data.A_A eq '11'}">[리스 일반식]</c:if>
					<c:if test="${data.A_A eq '12'}">[리스 기본식]</c:if>
					<c:if test="${data.A_A eq '21'}">[장기렌트 일반식]</c:if>
					<c:if test="${data.A_A eq '22'}">[장기렌트 기본식]</c:if>
				</h3>
				<table class="customer-table">
					<tr>
						<td><span style="float:right"> 님 귀하</span></td>
					</tr>
					<tr>
						<td>Tel. </td>
					</tr>
					<tr>
						<td>Fax. </td>
					</tr>
				</table>
			</div>
			<div class="print-pre-info" style="width:55%;">
	 			<table class="inquiry-table table table-condensed">
			    	<colgroup>
			    		<col width="15%">
			    		<col width="40%">
			    		<col width="40%">
			    	</colgroup>
			    	<tr>
			    		<th class="car-info-title text-center" rowspan="5">이용<br/>문의</th>
			    		<td>여의도 영업부 : 02-757-0802</td>
			    		<td>광화문지점 : 02-2038-8661</td>
			    	</tr>
			    	<tr>
			    		<td>강남지점 : 02-537-5877</td>
			    		<td>송파지점 : 02-2038-2492</td>
			    	</tr>
			    	<tr>
			    		<td>인천지점 : 032-554-8820</td>
			    		<td>수원지점 : 031-546-8858</td>
			    	</tr>
			    	<tr>
			    		<td>대전지점 : 042-824-1770</td>
			    		<td>대구지점 : 053-582-2998</td>
			    	</tr>
			    	<tr>
			    		<td>광주지점 : 062-385-0133</td>
			    		<td>부산지점 : 051-851-0606</td>
			    	</tr>
			    </table>			    
			</div>
		</div>
		<div class="print-info" style="margin-top: 60px;">
			<div>
				<table style="width: 100%;">
					<tr>
						<td width="50%">
							<h4 style="text-align: left; margin-bottom: 5px;">
								<span class="title-num"></span>
								&nbsp;대여차량								
							</h4>
						</td>
						<td width="50%" style="text-align: right; vertical-align: bottom !important;">
							<c:if test="${data.ECO_E_TAG=='1'}">
								<c:choose>
									<%-- <c:when test="${mainData.JG_G_7 eq 3 || ecarFlag eq 3 || jgData.JG_G_7 eq 3 || mainData.JG_G_7 eq 4 || ecarFlag eq 4 || jgData.JG_G_7 eq 4}"> --%>
									<c:when test="${jgData.JG_B eq 5 || jgData.JG_B eq 6}">
										<c:choose>
											<c:when test="setRegLocSt()==0"><!-- 실등록지가 서울 -->
												<!-- ※ 맑은서울스티커(남산터널 이용 전자태그) 발급 -->
											</c:when>
											<c:otherwise><!-- 실등록지가 서울 -->
												<!-- ※ 맑은서울스티커(남산터널 이용 전자태그) 발급불가 -->
											</c:otherwise>
										</c:choose>
									</c:when>
									<%-- <c:when test="${mainData.JG_G_7 eq 1 || ecarFlag eq 1 || jgData.JG_G_7 eq 1 || mainData.JG_G_7 eq 2 || ecarFlag eq 2 || jgData.JG_G_7 eq 2}"> --%>
									<c:when test="${jgData.JG_B eq 3 || jgData.JG_B eq 4}">
										<c:choose>
											<c:when test="${setRegLocSt()==0}"><!-- 실등록지가 서울 -->
												※ 맑은서울스티커(남산터널 이용 전자태그) 발급
											</c:when>
											<c:otherwise><!-- 실등록지가 서울 -->
												※ 맑은서울스티커(남산터널 이용 전자태그) 발급불가
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
							</c:if>
							<%-- <c:if test="${not empty mainData.JG_2 || not empty jgData.JG_2}">
								<c:if test="${mainData.JG_2 eq 1 || jgData.JG_2 eq 1}"><span style="font-size: 12px;">[차량가격은 개별소비세 과세가격 기준]</span></c:if>
							</c:if> --%>
							<%-- <c:if test="jg2Check()==1">[차량가격은 개별소비세 과세가격 기준]</c:if> --%>
							<span id="duty_span"></span>
						</td>
					</tr>
					<!-- 현대나 기아차면서 개본개별소비세율이 0보다 크면서 면세가표기차량이 아닌 경우 -->
					<c:if test="${examData.BK_220 > 0}">
						<tr>
							<td colspan="2">
								<span style="font-size: 12px;">
									※ 본 견적 차량가격은 개소세 3.5% 기준 차가로 개소세 5% 기준 환산 차량가격은 <fmt:formatNumber value="${examData.BK_220}" pattern="#,###"/>원<c:if test="${examData.BK_221 > 0}">(친환경차 세제혜택 후 <fmt:formatNumber value="${examData.BK_221}" pattern="#,###"/>원)</c:if> 정도입니다.
								</span>
							</td>
						</tr>
					</c:if>
				</table>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
						<col width=""/>
						<col width="110px;"/>
					</colgroup>			
					<tr>
						<th>제조사</th>
						<td>${detailData.CAR_COMP_NM}</td>
						<th class="text-center">금액</th>
					</tr>
					<tr>
						<th>차종(차량모델명)</th>
						<td class="print-primary">
							<%-- <a class="print-primary" href="https://www.amazoncar.co.kr/home/acar/main_car_hp/opt.jsp?est_id=${param.estimateId}" target="_blank">${detailData.CAR_NM} --%>
							<div class="print-primary detail-page" id="carDetail" style="cursor: pointer;">${detailData.CAR_NM}
								<c:if test="${detailData.CAR_NM ne detailData.CAR_NAME}">
									&nbsp;${detailData.CAR_NAME}
								</c:if>
								<c:if test="${detailData.CAR_Y_FORM_YN eq 'Y'}"> <!-- 신차 견적서 연형 표기 여부 -->
								 	<!-- 현재 년도가 모델 년도보다 이후면 출력하지 않는다(올해 차 이하는 출력 X) -->
									<fmt:formatDate value="${todayYear}" pattern="yyyy" var="year"/> 
									<c:if test="${year <= detailData.CAR_Y_FORM}">
										[${detailData.CAR_Y_FORM}년형]						
									</c:if><!-- </a> -->
								</c:if>
							</div>
						</td>
						<td class="text-right"><fmt:formatNumber value="${data.CAR_AMT}" pattern="#,###"/> 원</td>
					</tr>
					<tr>
						<th>옵션</th>
						<td class="print-primary">
							<div class="print-primary detail-page" id="optDetail" style="cursor: pointer;" onmouseover="optUnderlineOn()" onmouseleave="optUnderlineOff()">${data.OPT}</div>
						</td>
						<td class="text-right"><fmt:formatNumber value="${data.OPT_AMT}" pattern="#,###"/> 원</td>
					</tr>
					<c:if test="${!empty data.COL}">
						<tr>
							<th>색상</th>
							<td>
								<span class="badge" style="font-size:7px;">외장</span> ${data.COL} &nbsp;&nbsp;&nbsp;
								<c:if test="${!empty data.IN_COL}">
									<span class="badge" style="font-size:7px;">내장</span> ${data.IN_COL}
								</c:if>
							<td class="text-right"><fmt:formatNumber value="${data.COL_AMT}" pattern="#,###"/> 원</td>
						</tr>
					</c:if>
					<c:if test="${!empty data.CONTI_RAT}">
						<tr>
							<th>연비</th>
							<td>
								<span id="contiRatDesc">${data.CONTI_RAT}</span>
							</td>
							<td class=""></td>
						</tr>
					</c:if>
					<tr>
						<th>기타</th>
						<td>
							<%-- ${today} / ${data.RENT_DT}<br>
							${(today >= 20191001 && data.RENT_DT >= 20191001)}<br>
							${(today <= 20191030 && data.RENT_DT <= 20191030)}<br> --%>
							<%-- <c:if test="${ (jgData.JG_G_7 eq 3 ) && jgData.JG_G_15 > 0 }">
								※ 본 견적은 참고용 예상 견적으로 2022년 보조금 확정 공고시 월대여료가 변경 될 수 있습니다. <br>
							</c:if> 2022.02.18. 해당 문구 미표기 요청으로 주석 처리--%>
							<c:if test="${data.DC_AMT > 0}">
								제조사D/C (<span id='dc_mon'></span>월 출고조건)&nbsp;${data.ESTI_D_ETC}
							</c:if>
							
							<c:if test="${data.DC_AMT > 0 && data.ETC != '' && data.ETC != null}"><br></c:if>
							
							<c:if test="${data.ETC != '' && data.ETC != null}">
								${data.ETC}
								<input type="hidden" value="${data.ETC}">
							</c:if>
							
							<%-- <c:if test="${ today <= 20220704 }">
								<c:if test="${ detailData.JG_CODE eq '5048111' }">
									※ 사전계약 가격표 예상 가격 중 최저가격 기준 견적입니다. 정확한 차량가격은 정식 출시일에 확정될 예정입니다. 견적 차량가격과 확정 차량가격이 차이가 날 경우 [차량가격 차이 ÷ 대여개월수] (vat포함, 십원단위이하절사)로 월대여료가 인상됩니다.
								</c:if>
							</c:if> --%>
							
							<c:if test="${ today >= 20221004 && today <= 20221030 }">
								<c:if test="${ detailData.JG_CODE eq '5055113' }">
									※ 사전계약 가격표 예상 가격 중 최저가격 기준 견적입니다. 정확한 차량가격은 정식 출시일에 확정될 예정입니다. 견적 차량가격과 확정 차량가격이 차이가 날 경우 [차량가격 차이 ÷ 대여개월수] (vat포함, 십원단위이하절사)로 월대여료가 인상됩니다.
								</c:if>
							</c:if>
							
							<c:if test="${ today >= 20220801 && today < 20220822 }">
								<c:if test="${ detailData.JG_CODE eq '3016111' }">
									※ 본 견적은 참고용 예상 견적으로 정확한 차량가격 및 옵션가격은 정식 출시일에 확정될 예정입니다. (본 견적으로는 계약이 확정되지 않으며, 사전계약 참고용으로만 활용바랍니다)
								</c:if>
							</c:if>
							
							<c:if test="${(today >= 20191001 && data.RENT_DT >= 20191001) && (today <= 20191030 && data.RENT_DT <= 20191030)}">
								<c:if test="${detailData.JG_CODE eq '2172' || detailData.JG_CODE eq '2173' || detailData.JG_CODE eq '3191' || detailData.JG_CODE eq '3192' || detailData.JG_CODE eq '4135' || detailData.JG_CODE eq '4136' || detailData.JG_CODE eq '4137' || detailData.JG_CODE eq '4139' || detailData.JG_CODE eq '4140' || detailData.JG_CODE eq '5113' || detailData.JG_CODE eq '5114' ||	detailData.JG_CODE eq '2013621' || detailData.JG_CODE eq '2013622' || detailData.JG_CODE eq '3013811' || detailData.JG_CODE eq '3013812' || detailData.JG_CODE eq '4012611' || detailData.JG_CODE eq '4012612' || detailData.JG_CODE eq '4012613' || detailData.JG_CODE eq '4012615' || detailData.JG_CODE eq '4012616' || detailData.JG_CODE eq '5014111' || detailData.JG_CODE eq '5014112'}">
									<c:if test="${(data.DC_AMT > 0) || (data.ETC != '' && data.ETC != null)}">
										<br>
									</c:if>
									<c:choose>
										<c:when test="${data.DC_AMT > 0}">
											<span style="font-weight: bold;">
												현대자동차 세일즈 페스타 프로모션이 적용되는 차량 재고가 있을 경우 우측의 기본D/C 외에<br>
												추가로 특별할인이 가능합니다.  (자세한 내용은 위 아마존카 지점으로 전화하여 확인 가능)
											</span>
										</c:when>										
										<c:otherwise>
											<span style="font-weight: bold;">
												현대자동차 세일즈 페스타 프로모션이 적용되는 차량 재고가 있을 경우 특별할인 가능<br>
												(자세한 내용은 위 아마존카 지점으로 전화하여 확인 가능합니다)
											</span>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:if>
							
							<c:choose>
								<%-- <c:when test="${detailData.JG_CODE eq '9015435' || detailData.JG_CODE eq '9015436' || detailData.JG_CODE eq '9015437' || detailData.JG_CODE eq '9025435' || detailData.JG_CODE eq '9025439' || detailData.JG_CODE eq '9025440'}">
									※ 전기화물차의 경우 현재 지자체 보조금 접수대수 초과 상태이나, 향후 보조금 추경 편성시 계약이 가능할 수 있습니다.
								</c:when> --%>
								<c:when test="${data.CAR_COMP_ID eq '0056'}">
<!-- 									※ 8월 인도예정 -->
								</c:when>
								<c:when test="${detailData.JG_CODE eq '5315112'}">
<!-- 									※ 11월 중순경 인도예정 -->
								</c:when>
								<%-- <c:when test="${detailData.JG_CODE eq '5016111' || detailData.JG_CODE eq '5027111' || detailData.JG_CODE eq '5027112'}"> --%>
								<%-- <c:when test="${detailData.JG_CODE eq '5027111' || detailData.JG_CODE eq '5027112'}">
									<!-- ※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본 견적은 참고용 예상 견적임),  ※ 견적기준 : 정부보조금 최대금액 800만원(추정)+지자체별(고객주소지) 보조금 기준, 사전계약 가격표 예상 가격 중 최저가격 기준, 옵션 미포함 기본 트림 기준 견적 -->
									※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본 견적은 참고용 예상 견적임), ※ 견적기준 : 정부보조금 최대금액 800만원(추정)+지자체별(고객주소지) 보조금 기준, 추후 옵션(4WD, 20인치휠등)에 따라 보조금이 상이하여 월대여료가 변경될 수 있습니다. 
								</c:when> --%>
								<%-- <c:when test="${detailData.JG_CODE eq '5215111'}">
									 ※ 정확한 차량가격 및 옵션가격은 정식 출시일에 확정 예정(본견적은 사전예약 참고용 예상 견적임). ※ 견적기준 : 정부보조금 720만원(추정)+지자체별(고객주소지) 보조금 기준, 추후 보조금 확정시 월대여료가 변경될 수 있습니다.
								</c:when> --%>
							</c:choose>
							<%-- <c:if test="${detailData.JG_CODE eq '6015111' || detailData.JG_CODE eq '6015112' || detailData.JG_CODE eq '6015113' || detailData.JG_CODE eq '6015114'}">
								2021년4/4분기 신규출시 차량으로 보조금이 소진되거나 변경될 가능성이 매우 높습니다.
							</c:if> --%>
						</td>
						<td class="text-right"><c:if test="${data.DC_AMT > 0}">-<fmt:formatNumber value="${data.DC_AMT}"  pattern="#,###"/> 원</c:if></td>
					</tr>
					
					<!-- 개소세 감면 -->
					<%-- <c:if test="${data.TAX_DC_AMT > 0}">
						<tr>
							<th>개소세 감면</th>
							<td>개별소비세 및 교육세 감면</td>
							<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
						</tr>
					</c:if> --%>
					
			<%-- <c:choose>
				<c:when test="${empty param.refer}">
					<c:set var="ref_date_value" value="${data.RENT_DT}"/>
				</c:when>
				<c:otherwise>
					<c:set var="temp_reg_dt" value="${data.REG_DT}"/>
					<c:set var="temp_reg_dt_size" value="${fn:length(temp_reg_dt)}"/>
					<c:set var="ref_date_value" value="${fn:substring(temp_reg_dt, 0, temp_reg_dt_size - 2)}"/>
					<c:set var="ref_date_value" value="${today}"/>
				</c:otherwise>
			</c:choose> --%>
			
			<c:set var="temp_reg_dt" value="${data.REG_DT}"/>
			<c:set var="temp_reg_dt_size" value="${fn:length(temp_reg_dt)}"/>
			<c:set var="ref_date_value" value="${fn:substring(temp_reg_dt, 0, temp_reg_dt_size - 2)}"/>
			
			<c:choose>
				<c:when test="${(ref_date_value >= 2020030100) && (ref_date_value <= 2020063023)}">
					
					<c:choose>
						<%-- <c:when test="${jgData.JG_3*100 eq 0 || (detailData.JG_CODE eq '2361' || detailData.JG_CODE eq '2031111') || ( ( (mainData.JG_G_7 eq 1 || jgData.JG_G_7 eq 1) || (mainData.JG_G_7 eq 2 || jgData.JG_G_7 eq 2) || (mainData.JG_G_7 eq 3 || jgData.JG_G_7 eq 3) || (mainData.JG_G_7 eq 4 || jgData.JG_G_7 eq 4) ) && data.CAR_COMP_ID > 5 )}"> --%>
						<c:when test="${jgData.JG_3*100 eq 0 || detailData.JG_CODE eq '3871' || detailData.JG_CODE eq '2361' || detailData.JG_CODE eq '3313111' || detailData.JG_CODE eq '2031111' || detailData.JG_CODE eq '5033111'}">
							<tr style="display: none;">
								<th>개소세 감면</th>
								<td>개별소비세 및 교육세 감면</td>
								<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
							</tr>
						</c:when>
						<c:when test="${((mainData.JG_G_7 eq 3 || jgData.JG_G_7 eq 3) || (mainData.JG_G_7 eq 4 || jgData.JG_G_7 eq 4)) && data.TAX_DC_AMT > 0}">
							<tr>
								<th>개소세 감면</th>
								<td>개별소비세 및 교육세 감면</td>
								<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
							</tr>
						</c:when>
						<c:when test="${(mainData.JG_G_7 eq 1 || jgData.JG_G_7 eq 1) || (mainData.JG_G_7 eq 2 || jgData.JG_G_7 eq 2)}">
							<tr>
								<th>개소세 감면</th>
								<td>
									<%-- <c:if test="${(today >= 20200301 && data.RENT_DT >= 20200301) && (today <= 20200630 && data.RENT_DT <= 20200630)}">
										개별소비세 한시적 감면(2020.3~6월) 관련 법률이 국회에서 통과되지 않거나 통과되더라도 개별소비세 감면기간을 초과하여 출고시 대여료는 인상됩니다. (감면금액 축소시에도 대여료가 인상됩니다)
									</c:if> --%>
									<c:choose>
										<c:when test="${(ref_date_value >= 2020030100) && (ref_date_value <= 2020063023)}">
											<!-- 개별소비세 한시적 감면기간(2020.3~6월)을 초과하여 출고 될 경우 대여료는 인상됩니다. -->
											<c:if test="${examData.BK_190 > 0}">
												개별소비세 한시적 세액 70% 감면(2020.3~6월) 기간을 초과하여,<br>개별소비세율이 3.5%(2020.7~12월)로 조정되어 출고시 월대여료가 <fmt:formatNumber value="${examData.BK_190}" pattern="#,###"/>원(공급가) 인상됩니다.
											</c:if>
											<c:if test="${examData.BK_190 <= 0 && data.TAX_DC_AMT ne 0}">
												개별소비세 한시적 감면기간(2020.3~6월)을 초과하여 출고 될 경우 대여료는 인상됩니다.
											</c:if>
										</c:when>
										<c:otherwise>
											개별소비세 한시적 감면기간(2020.3~6월)을 초과하여 출고 될 경우 대여료는 인상됩니다.
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-right">
									<c:choose>
										<c:when test="${data.TAX_DC_AMT eq 0}">
											개소세 감면효과<br>견적에 반영
										</c:when>
										<c:otherwise>
											-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원
										</c:otherwise>
									</c:choose>									
								</td>
							</tr>
						</c:when>
						<c:otherwise>						
							<c:if test="${(ref_date_value >= 2020030100) && (ref_date_value <= 2020063023)}">
								<tr>
									<th>개소세 감면</th>
									<td>
										<!-- 개별소비세 한시적 감면기간(2020.3~6월)을 초과하여 출고 될 경우 대여료는 인상됩니다. -->
										<c:if test="${examData.BK_190 > 0}">
											개별소비세 한시적 세액 70% 감면(2020.3~6월) 기간을 초과하여,<br>개별소비세율이 3.5%(2020.7~12월)로 조정되어 출고시 월대여료가 <fmt:formatNumber value="${examData.BK_190}" pattern="#,###"/>원(공급가) 인상됩니다.
										</c:if>
										<c:if test="${examData.BK_190 <= 0 && data.TAX_DC_AMT ne 0}">
											개별소비세 한시적 감면기간(2020.3~6월)을 초과하여 출고 될 경우 대여료는 인상됩니다.
										</c:if>
									</td>
									<td class="text-right">
										<c:choose>
											<c:when test="${data.TAX_DC_AMT eq 0}">
												개소세 감면효과<br>견적에 반영
											</c:when>
											<c:otherwise>
												-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원
											</c:otherwise>
										</c:choose>									
									</td>
								</tr>
							</c:if>
						
							<%--
							<tr>
								<th>개소세 감면</th>
								<td>개별소비세 한시적 감면(2020.3~6월) 관련 법률이 국회에서 통과되지 않거나 통과되더라도 개별소비세 감면기간을 초과하여 출고시 대여료는 인상됩니다. (감면금액 축소시에도 대여료가 인상됩니다)</td>
								<td class="text-right">
									<c:choose>
										<c:when test="${data.TAX_DC_AMT eq 0}">
											개소세 감면효과<br>견적에 반영
										</c:when>
										<c:otherwise>
											-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원
										</c:otherwise>
									</c:choose>									
								</td>
							</tr>
							--%>
						</c:otherwise>
					</c:choose>
					
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${examData.JG_W != 1 && !(detailData.JG_CODE eq '2362' || detailData.JG_CODE eq '2031112' || detailData.JG_CODE eq '5033111') && data.TAX_DC_AMT > 0}">
						<!-- 수입차가 아니면서 개소새 감면 한도(교육세포함, 부가세전)가 0보다 크면 개별소비세 및 교육세 감면. 볼트 제외. -->
							<tr>
								<th>개소세 감면</th>
								<td>개별소비세 및 교육세 감면</td>
								<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
							</tr>
						</c:when>
						<c:otherwise>
						<!-- 그 외 감면 미적용 개별소비세(개별소비세 인하한도 초과금액)가 0보다 크면 감면 미적용 개별소비세 -->
							<c:if test="${examData.BK_216 > 0}">
								<c:if test="${today >= 20210101}">
									<tr>
										<th>개별소비세</th>
										<td>감면 미적용 개별소비세(개별소비세 인하한도 초과금액)<br>※ 상기 차가는 개별소비세 3.5% 기준 금액(최대 인하한도 적용전)</td>
										<td class="text-right">
											<c:if test="${data.TAX_DC_AMT > 0}">
												-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원
											</c:if>
											<c:if test="${data.TAX_DC_AMT < 0}">
												<fmt:formatNumber value="${-1 * data.TAX_DC_AMT}" pattern="#,###"/> 원
											</c:if>
										</td>
									</tr>
								</c:if>
							</c:if>
						</c:otherwise>
						<%-- <c:when test="${examData.BK_216 > 0}">
							<c:if test="${today >= 20210101 && today <= 20220105}">
								<tr>
									<th>개별소비세</th>
									<td>감면 미적용 개별소비세(개별소비세 인하한도 초과금액)<br>※ 상기 차가는 개별소비세 3.5% 기준 금액(최대 인하한도 적용전)</td>
									<td class="text-right">
										<c:if test="${data.TAX_DC_AMT > 0}">
											-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원
										</c:if>
										<c:if test="${data.TAX_DC_AMT < 0}">
											<fmt:formatNumber value="${-1 * data.TAX_DC_AMT}" pattern="#,###"/> 원
										</c:if>
									</td>
								</tr>
							</c:if>
						</c:when> --%>
						<%-- <c:otherwise>
							<!-- 볼트제외 -->
							<c:if test="${!(detailData.JG_CODE eq '2362' || detailData.JG_CODE eq '2031112') && data.TAX_DC_AMT > 0}">
								<tr>
									<th>개소세 감면</th>
									<td>개별소비세 및 교육세 감면</td>
									<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
								</tr>
							</c:if>
						</c:otherwise> --%>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
					<tr>
						<th>차량가격</th>
						<td>							
							<div id="bk_198_div"></div>
							<div id="bk_213_div"></div>
							<div id="bk_206_div"></div>
							<div id="fee_add_text_div_temp"></div>
							<div id="fee_add_text_div"></div>
						</td>
						<td class="print-primary text-right"><fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.DC_AMT - data.TAX_DC_AMT}" pattern="#,###" /> 원</td>
					</tr>
				</table>
				<!-- 단산 된 차종일경우 문구 표현하기(2017.11.07) -->
				<c:if test="${mainData.END_DT=='N'}">
					<div style="text-decoration: underline; margin-bottom: 5px;"><small style="font-weight: bold;">※ 생산 중단된 차종입니다. 아마존카 담당자를 통해서 재고 유무를 확인하고 진행하시기 바랍니다.</small></div>
				</c:if>
				<div class="col-md-12 col-xs-12" style="padding: 0;">
					<div class="col-md-10 col-xs-10" style="text-align: left; padding: 0px;">
						<c:choose>
							<c:when test="${mainData.JG_G_7 eq 2 || ecarFlag eq 2 || jgData.JG_G_7 eq 2}">
								<!-- <small>※ 플러그인 하이브리드차 구매보조금 500만원 기준 견적</small> -->
							</c:when>
							<c:when test="${mainData.JG_G_7 eq 3 || ecarFlag eq 3 || jgData.JG_G_7 eq 3}">
								<!-- 전기차일경우 -->
								<small>
									<c:choose>
<%-- 										<c:when test="${ detailData.JG_CODE eq '9133' || detailData.JG_CODE eq '9237' || detailData.JG_CODE eq '9015435' || detailData.JG_CODE eq '9025435' || detailData.JG_CODE eq '9015436' || detailData.JG_CODE eq '9015437' || detailData.JG_CODE eq '9025439' || detailData.JG_CODE eq '9025440' }"> --%>
										<c:when test="${ Integer.parseInt(detailData.JG_CODE) > 8000000 }">
											<c:choose>
												<c:when test="${data.LOC_ST eq 1}">※ 차량인도지역: 서울</c:when>
												<c:when test="${data.LOC_ST eq 2}">※ 차량인도지역: 인천/경기</c:when>
												<c:when test="${data.LOC_ST eq 3}">※ 차량인도지역: 강원</c:when>
												<c:when test="${data.LOC_ST eq 4}">※ 차량인도지역: 대전/세종/충남/충북</c:when>
												<c:when test="${data.LOC_ST eq 5}">※ 차량인도지역: 광주/전남/전북</c:when>
												<c:when test="${data.LOC_ST eq 6}">※ 차량인도지역: 대구/경북</c:when>
												<c:when test="${data.LOC_ST eq 7}">※ 차량인도지역: 부산/울산/경남</c:when>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${data.ECAR_LOC_ST eq 0 || data.ECAR_LOC_ST eq 1}">
													※ [①법인: 사업장 소재지, ②개인: 주민등록등본상 주소지, ③개인사업자: 대표자 주민등록등본상 주소지]
													<c:choose>
														<c:when test="${data.ECAR_LOC_ST eq 0}">서울</c:when>
														<c:when test="${data.ECAR_LOC_ST eq 1}">인천</c:when>
													</c:choose>
													기준 견적
												</c:when>
												<c:otherwise>
													※ 차량인도지역:
													<c:choose>
														<c:when test="${data.LOC_ST eq 1}">서울</c:when>
														<c:when test="${data.LOC_ST eq 2}">인천/경기</c:when>
														<c:when test="${data.LOC_ST eq 3}">강원</c:when>
														<c:when test="${data.LOC_ST eq 4}">대전/세종/충남/충북</c:when>
														<c:when test="${data.LOC_ST eq 5}">광주/전남/전북</c:when>
														<c:when test="${data.LOC_ST eq 6}">대구/경북</c:when>
														<c:when test="${data.LOC_ST eq 7}">부산/울산/경남</c:when>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
								</small>
							</c:when>
							
							<c:when test="${mainData.JG_G_7 eq 4 || ecarFlag eq 4 || jgData.JG_G_7 eq 4 }">
								<!-- 수소차일경우 20190211-->
								<c:choose>
									<c:when test="${data.LOC_ST eq 1}"><small>※ 차량 인도 지역 : 서울</small></c:when>
									<c:when test="${data.LOC_ST eq 2}"><small>※ 차량 인도 지역 : 인천/경기</small></c:when>
									<c:when test="${data.LOC_ST eq 3}"><small>※ 차량 인도 지역 : 강원</small></c:when>
									<c:when test="${data.LOC_ST eq 4}"><small>※ 차량 인도 지역 : 대전/세종/충남/충북<!-- 충청 --></small></c:when>
									<c:when test="${data.LOC_ST eq 5}"><small>※ 차량 인도 지역 : 광주/전남/전북<!-- 전라 --></small></c:when>
									<c:when test="${data.LOC_ST eq 6}"><small>※ 차량 인도 지역 : 대구/경북</small></c:when>
									<c:when test="${data.LOC_ST eq 7}"><small>※ 차량 인도 지역 : 부산/울산/경남</small></c:when>
									<c:otherwise>
										<small>※ 차량 인도 지역 : 서울</small>
									</c:otherwise>
								</c:choose>
							</c:when>
							
							<c:otherwise>
								<c:choose>
									<c:when test="${detailData.JG_CODE ne '5866' && detailData.JG_CODE ne '4854' && detailData.JG_CODE ne '6316111' && detailData.JG_CODE ne '4314111'}">
										<small><!-- * 이용 지역 -->※ 차량 인도 지역 : 
											<c:choose>
												<c:when test="${data.LOC_ST eq 1}">서울</c:when>
												<c:when test="${data.LOC_ST eq 2}">인천/경기</c:when>
												<c:when test="${data.LOC_ST eq 3}">강원</c:when>
												<c:when test="${data.LOC_ST eq 4}">대전/세종/충남/충북<!-- 충청 --></c:when>
												<c:when test="${data.LOC_ST eq 5}">광주/전남/전북<!-- 전라 --></c:when>
												<c:when test="${data.LOC_ST eq 6}">대구/경북</c:when>
												<c:when test="${data.LOC_ST eq 7}">부산/울산/경남</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${data.ECAR_LOC_ST eq 1}">서울/경기/인천</c:when>
														<c:when test="${data.ECAR_LOC_ST eq 3}">서울/경기/인천 이외 지역</c:when>
														<c:otherwise>
															서울
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
											 <!-- 기준 월대여료 -->
										</small>
									</c:when>
								</c:choose>						
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-2 col-xs-2" style="text-align: right; padding: 0px;">
						<small>
							<c:choose>
								<c:when test="${detailData.JG_CODE eq '1232' || detailData.JG_CODE eq '1021212'}"> ※ LPG/휘발유 겸용차</c:when>	
								<c:when test="${detailData.JG_CODE eq '1242' || detailData.JG_CODE eq '1023112'}"> ※ LPG/휘발유 겸용차</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${compareData.ENGIN eq 'Y'}"> ※ 디젤엔진 </c:when>
										<c:when test="${compareData.ENGIN eq '1'}"> ※ 가솔린엔진 </c:when>
										<c:when test="${compareData.ENGIN eq '2'}"> ※ LPG전용차 </c:when>
										<c:when test="${compareData.ENGIN eq '3'}"> ※ 하이브리드 </c:when>
										<c:when test="${compareData.ENGIN eq '4'}"> ※ 플러그인 하이브리드 </c:when>
										<c:when test="${compareData.ENGIN eq '5'}"> ※ 전기차 </c:when>
										<c:when test="${compareData.ENGIN eq '6'}"> ※ 수소차 </c:when>
										<c:otherwise>
											<c:if test="${detailData.DIESEL_YN eq 'Y'}"> ※ 디젤엔진  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '1'}"> ※ 가솔린엔진  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '2'}"> ※ LPG전용차  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '3'}"> ※ 하이브리드 </c:if>
											<c:if test="${detailData.DIESEL_YN eq '4'}"> ※ 플러그인 하이브리드  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '5'}"> ※ 전기차  </c:if>
											<c:if test="${detailData.DIESEL_YN eq '6'}"> ※ 수소차  </c:if>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</small>
					</div>
				</div>
			</div>
			<div style='padding-top: 10px; margin-top: 10px;'>
				<h4><span class="title-num"></span>&nbsp;약정운행거리 <small>(약정운행거리 이하 운행시 환급대여료 지급)</small></h4>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
						<col width="150px;"/>
						<col width="110px;"/>
					</colgroup>				
					<tr>
						<th rowspan="3">약정운행거리</th>
						<td rowspan="3">
							<span class="print-primary"><fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span>
						</td>
						<th rowspan="3" style='text-align: center;'>약정운행거리에<br>따른 정산</th>
						<td>
							<span style='font-weight: bold; width: 60%;'>(약정이하운행시) 환급대여료</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%-- 							${empty data.RTN_RUN_AMT ? 0 : data.RTN_RUN_AMT}원/1km	(부가세 별도) --%>
							<c:choose>
								<c:when test="${ data.RTN_RUN_AMT_YN eq '1' }">
									미적용
								</c:when>
								<c:otherwise>
									${data.RTN_RUN_AMT}원/1km	(부가세 별도)
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td><span style='font-weight: bold; width: 60%;'>(약정초과운행시) 초과운행대여료</span>&nbsp;&nbsp;&nbsp;&nbsp;${empty data.OVER_RUN_AMT ? 0 : data.OVER_RUN_AMT}원/1km(부가세 별도)</td>
					</tr>
					<tr>
						<td><c:if test="${data.A_A eq 22 || data.A_A eq 12}">매입옵션 행사시에는 (약정이하운행시) 환급대여료가 지급되지 않고, (약정초과운행시) 초과운행대여료가 면제됩니다. (기본식)</c:if></td>
					</tr>
				</table>
				<c:if test="${data.CAR_COMP_ID ne 56}">
					<small>* 약정운행거리를 줄이면 대여요금이 인하되고, 약정운행거리를 늘리면 대여요금이 인상됩니다.</small>
				</c:if>
			</div>

			<div class="col-md-12 col-xs-12" style="padding: 0px; margin-bottom: 10px;">
				<div class="print-inline" style="width:260px;margin-right:10px;">
					<h4><span class="title-num"></span>&nbsp;대여요금
						<small>
							<c:choose>
								<c:when test="${data.INS_PER ne '2'}">
									<c:choose>
										<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 12 }">
											<!-- (보험료 미포함) -->
											(보험료 포함)
										</c:when>
										<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 11 }">
											(보험료 미포함)
										</c:when>
										<c:otherwise>
											(보험료 포함)
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									(보험료 미포함)
								</c:otherwise>
							</c:choose>
						</small>
					</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>대여기간</th>
							<td class="text-center">${data.A_B}개월</td>
						</tr>
						<tr>
							<th>공급가</th>
							<td class="text-right"><fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" /> 원</td>
						</tr>
						<tr>
							<th>부가세</th>
							<td class="text-right"><fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" /> 원</td>
						</tr>
						<tr>
							<th>월대여료</th>
							<td class="print-primary text-right"><fmt:formatNumber value="${data.FEE_S_AMT + data.FEE_V_AMT}" pattern="#,###" /> 원</td>
						</tr>
					</table>
				</div>
				<div class="print-inline" style="width:490px;">
					<h4><span class="title-num"></span>&nbsp;보험보상범위</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col/>
							<col width="110px;"/>
						</colgroup>			
						<c:choose>
							<c:when test="${data.INS_PER ne '2'}">
								<c:choose>
									<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 12 }">
										<tr>
											<th>대인배상</th>
											<td>무한(대인 I, II)</td>
											<th>무보험차상해</th>
											<td>1인당 최고 2억원</td>
										</tr>
										<tr>	
											<th>대물배상</th>
											<td>
												<c:if test="${data.INS_DJ == 1}">5천만원/</c:if>
												<c:if test="${data.INS_DJ == 2}">1억원</c:if>
												<c:if test="${data.INS_DJ == 3}">5억원</c:if>
												<c:if test="${data.INS_DJ == 4}">2억원</c:if>
												<c:if test="${data.INS_DJ == 8}">3억원</c:if>
											</td>
											<th>운전자연령</th>
											<td>
												만
												<c:if test="${data.INS_AGE == 1}">26</c:if>
												<c:if test="${data.INS_AGE == 2}">21</c:if>
												<c:if test="${data.INS_AGE == 3}">24</c:if>
												세 이상					
											</td>
										</tr>
										<tr>
											<th>자기신체사고</th>
											<td>
												<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
												<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
											</td>
											<th>긴급출동</th>
											<td>가입</td>
										</tr>
										<tr>
											<th>자차면책금</th>
											<td><fmt:formatNumber value="${data.CAR_JA}" pattern="#,###"/>원</td>
											<th></th>
											<td></td>
										</tr>
										<%-- <tr>
											<th>대인배상</th>
											<td class="text-center">보험미반영</td>
											<th>무보험차상해</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>	
											<th>대물배상</th>
											<td class="text-center">보험미반영</td>
											<th>운전자연령</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>
											<th>자기신체사고</th>
											<td class="text-center">보험미반영</td>
											<th>긴급출동</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>
											<th>자차면책금</th>
											<td class="text-center">보험미반영</td>
											<th></th>
											<td></td>
										</tr> --%>
									</c:when>
									<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 11 }">
										<tr>
											<th>대인배상</th>
											<td class="text-center">보험미반영</td>
											<th>무보험차상해</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>	
											<th>대물배상</th>
											<td class="text-center">보험미반영</td>
											<th>운전자연령</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>
											<th>자기신체사고</th>
											<td class="text-center">보험미반영</td>
											<th>긴급출동</th>
											<td class="text-center">보험미반영</td>
										</tr>
										<tr>
											<th>자차면책금</th>
											<td class="text-center">보험미반영</td>
											<th></th>
											<td></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<th>대인배상</th>
											<td>무한(대인 I, II)</td>
											<th>무보험차상해</th>
											<td>1인당 최고 2억원</td>
										</tr>
										<tr>	
											<th>대물배상</th>
											<td>
												<c:if test="${data.INS_DJ == 1}">5천만원/</c:if>
												<c:if test="${data.INS_DJ == 2}">1억원</c:if>
												<c:if test="${data.INS_DJ == 3}">5억원</c:if>
												<c:if test="${data.INS_DJ == 4}">2억원</c:if>
												<c:if test="${data.INS_DJ == 8}">3억원</c:if>
											</td>
											<th>운전자연령</th>
											<td>
												만
												<c:if test="${data.INS_AGE == 1}">26</c:if>
												<c:if test="${data.INS_AGE == 2}">21</c:if>
												<c:if test="${data.INS_AGE == 3}">24</c:if>
												세 이상					
											</td>
										</tr>
										<tr>
											<th>자기신체사고</th>
											<td>
												<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
												<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
											</td>
											<th>긴급출동</th>
											<td>가입</td>
										</tr>
										<tr>
											<th>자차면책금</th>
											<td><fmt:formatNumber value="${data.CAR_JA}" pattern="#,###"/>원</td>
											<th></th>
											<td></td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<tr>
									<th>대인배상</th>
									<td class="text-center">보험미반영</td>
									<th>무보험차상해</th>
									<td class="text-center">보험미반영</td>
								</tr>
								<tr>	
									<th>대물배상</th>
									<td class="text-center">보험미반영</td>
									<th>운전자연령</th>
									<td class="text-center">보험미반영</td>
								</tr>
								<tr>
									<th>자기신체사고</th>
									<td class="text-center">보험미반영</td>
									<th>긴급출동</th>
									<td class="text-center">보험미반영</td>
								</tr>
								<tr>
									<th>자차면책금</th>
									<td class="text-center">보험미반영</td>
									<th></th>
									<td></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				
				<c:if test="${ !(data.CAR_COMP_ID eq '0056' || (detailData.JG_CODE > 9017300 && detailData.JG_CODE < 9018200)) }">
					<div class="col-md-12 col-xs-12" style="padding: 0px;">
						<small id="sn_bn_div"></small>
					</div>
				</c:if>
				<!-- 번호판 표기 -->
				<c:if test="${ jgData.JG_G_7 eq '3' || jgData.JG_G_7 eq '4' || ( detailData.JG_CODE > 9018110 && detailData.JG_CODE < 9018999 ) || data.CAR_COMP_ID eq '0044' || data.CAR_COMP_ID eq '0007' || data.CAR_COMP_ID eq '0025' || data.CAR_COMP_ID eq '0033' || data.CAR_COMP_ID eq '0048'}">
					<div class="col-md-12 col-xs-12" style="padding: 0px;">
						<small id="plate_div"></small>
					</div>
				</c:if>
				
				<c:if test="${data.CAR_COMP_ID > 5 && data.A_A == 12}">
					<div class="col-md-12 col-xs-12" style="padding: 0px; text-align: right;">
						<small>	※ 사고수리시 아마존카 지정 정비공장에서 수리</small><br/>
					</div>
				</c:if>
				
				<div class="col-md-12 col-xs-12" style="padding: 0px;">
					<%-- <c:if test="${detailData.S_ST eq '101' || detailData.S_ST eq '601' || detailData.S_ST eq '602' || detailData.S_ST eq '701' ||
								  detailData.S_ST eq '702' || detailData.S_ST eq '801' || detailData.S_ST eq '802' || detailData.S_ST eq '803' ||
								  detailData.S_ST eq '811' || detailData.S_ST eq '812' || detailData.S_ST eq '821'}"> --%>
					<%-- <c:if test="${detailData.JG_CODE < 1000000 && (detailData.JG_CODE > 6999 || detailData.JG_CODE < 2000)}">			  
						<small>	* 대여료(월대여료,선납금)가 업무용으로 손비처리 가능할 경우 부가세는 매입세액공제(환급)받으실 수 있습니다.</small><br/>
					</c:if> --%>
<%-- 					<c:if test="${detailData.JG_CODE > 1000000 && (detailData.JG_CODE > 6999999 || detailData.JG_CODE < 2000000)}">			   --%>
					<c:if test="${detailData.S_ST <= 101 || detailData.S_ST == 409 || detailData.S_ST >= 601}">			  
						<small>	* 대여료(월대여료,선납금)가 업무용으로 손비처리 가능할 경우 부가세는 매입세액공제(환급)받으실 수 있습니다.</small><br/>
					</c:if>
					<c:if test="${data.TINT_S_YN ne null || data.TINT_N_YN ne null || data.TINT_EB_YN ne null}">
						<small>* 위 대여료는
							<c:if test="${data.TINT_S_YN eq 'Y' && data.TINT_N_YN ne 'Y' && data.TINT_EB_YN ne 'Y'}"> <span class="bold">전면 썬팅</span>이</c:if>
							<c:if test="${data.TINT_S_YN ne 'Y' && data.TINT_N_YN eq 'Y' && data.TINT_EB_YN ne 'Y'}"> <span class="bold">거치형 내비게이션</span>이</c:if>
							<c:if test="${data.TINT_S_YN ne 'Y' && data.TINT_N_YN ne 'Y' && data.TINT_EB_YN eq 'Y'}"> <span class="bold">이동형 충전기</span>가</c:if>
							<c:if test="${data.TINT_S_YN eq 'Y' && data.TINT_N_YN eq 'Y' && data.TINT_EB_YN ne 'Y'}"> <span class="bold">전면 썬팅, 거치형 내비게이션</span>이</c:if>
							<c:if test="${data.TINT_S_YN eq 'Y' && data.TINT_N_YN ne 'Y' && data.TINT_EB_YN eq 'Y'}"> <span class="bold">전면 썬팅, 이동형 충전기</span>가</c:if>
							<c:if test="${data.TINT_S_YN ne 'Y' && data.TINT_N_YN eq 'Y' && data.TINT_EB_YN eq 'Y'}"> <span class="bold">거치형 내비게이션, 이동형 충전기</span>가</c:if>
							<c:if test="${data.TINT_S_YN eq 'Y' && data.TINT_N_YN eq 'Y' && data.TINT_EB_YN eq 'Y'}"> <span class="bold">전면 썬팅, 거치형 내비게이션, 이동형 충전기</span>가</c:if>
								 포함된 금액입니다
						</small><br/>
					</c:if>
					<c:choose>
						<c:when test="${param.carIncome eq 2 && data.A_A eq 12}">
							<small></small>
						</c:when>
						<c:otherwise>
							<c:if test="${data.INS_AGE ne 1 && data.CAR_JA ne 200000}">
								<small>* 운전자 연령은 최종 심사 후 조정 될 수 있습니다.</small>
								<!-- <small>* 운전자 연령 및 자차 면책금은 최종 심사 후 조정 될 수 있습니다.</small> -->
							</c:if>
							<c:if test="${data.INS_AGE eq 1 && data.CAR_JA eq 200000}">
								<small>* 자차 면책금은 최종 심사 후 조정 될 수 있습니다.</small>
							</c:if>
							<c:if test="${data.INS_AGE ne 1 && data.CAR_JA eq 200000}">
								<small>* 운전자 연령 및 자차 면책금은 최종 심사 후 조정 될 수 있습니다.</small>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div>
				<h4><span class="title-num"></span>&nbsp;초기납입금</h4>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
						<col width="150px;"/>
						<col width="110px;"/>
					</colgroup>			
					<tr>
						<th>보증금</th>
						<td class="text-right"><fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" /> 원</td>
						<th class="text-center">차가의 ${data.RG_8}%</th>
						<td>보증금은 계약기간 만료 후 환불해 드립니다. [보증금 100만원을 증액하면, 월대여료 5,500원(VAT포함)이 인하됩니다.(년리6.6%효과)]</td>
					</tr>
					<tr>
						<th>선납금</th>
						<td  class="text-right"><fmt:formatNumber value="${data.PP_AMT}" pattern="#,###"/> 원</td>
						<th class="text-center">VAT 포함</th>
						<td>선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.
							<div style="font-size: 10.8px !important;">※ 세금계산서는 계약이용기간 동안 매월 균등 발행 또는 납부시 일시 발행 중 선택가능</div>
						</td>
					</tr>
					<%-- <tr>
						<th>개시대여료</th>
						<td  class="text-right">${data.IFEE_S_AMT + data.IFEE_V_AMT} 원</td>
						<th class="text-center">VAT 포함</th>
						<td>개시대여료는 마지막 (${data.G_10})개월치 대여료를 선납하는 것입니다.</td>
					</tr> --%>
					<tr>
						<th>합계</th>
						<td class="print-primary text-right"><fmt:formatNumber value="${data.RG_8_AMT + data.PP_AMT}" pattern="#,###" /> 원</td>
						<th colspan="2">위의 대여요금은 좌측 초기납입금 이자효과가 반영된 금액입니다.</th>
					</tr>
					<c:if test="${data.IFEE_S_AMT > 0}">
						<tr>
							<td colspan="4">월 대여료 잔여 납입 횟수  ${data.G_10} 개시 대여료를 납입한 경우만 적용되는 내용입니다.</td>
						</tr>
					</c:if>
				</table>
				<!-- <small>* 초기납입금은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</small> -->
				<small>* 초기납입금은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다. (고객신용도에 따른 최소 초기납입금 규정이 있습니다)</small>
			</div>
			<c:if test="${data.A_A eq 22 || data.A_A eq 12}"> <!-- 매입옵션 있을 때만 보여준다 -->
				<div>
					<h4><span class="title-num"></span>&nbsp;적용 잔가율</h4>
					<table class="print-table table table-condensed table-bordered">
						<colgroup>
							<col width="110px;"/>
							<col/>
							<col width="110px;"/>
						</colgroup>			
						<tr>
							<th>적용잔가율</th>
							<td class="text-center">${data.RO_13}%</td>
							<th colspan="2">적용잔가율 = 매입옵션율</th>
						</tr>
						<tr>
							<th>매입옵션가격</th>
							<td class="text-right"><fmt:formatNumber value="${data.RO_13_AMT}" pattern="#,###" /> 원</td>
							<th class="text-center">VAT 포함</th>
							<td>본 매입옵션가격에 이용차량을 매입할 수 있는 권리를 드립니다.</td>
						</tr>
					</table>
				</div>
			</c:if>
			
			<div>
				<h4><span class="title-num"></span>&nbsp;중도해지위약금</h4>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
					</colgroup>				
					<tr>
						<th>중도해지위약금</th>
						<td colspan="2">중도해지시에는 잔여계약기간 총 대여료의 <span class="print-primary">${data.CLS_PER}%</span> 의 위약금이 있음</td>
					</tr>
				</table>
			</div>
			
			<div>
				<h4>
					<span class="title-num"></span>&nbsp;차량관리 서비스 제공 범위
					<small style="letter-spacing: -1.3px; font-size: 13px !important;">(공통 서비스와 체크된 □칸의 서비스가 제공됩니다)
						<%-- <c:if test="${data.INS_PER eq 2 || jgData.JG_K eq 0}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차 서비스 미제공</c:if> --%>
						<c:choose>
							<c:when test="${data.OPT_CHK=='1' || data.OPT_CHK=='' || data.OPT_CHK==null}">
								<c:choose>
									<c:when test="${jgData.JG_K=='0'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스 미제공
									</c:when>
									<c:when test="${jgData.JG_K=='2'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 승용 및 RV로 제공
									</c:when>
									<c:when test="${jgData.JG_K=='3'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관차량으로 제공
									</c:when>
									<c:when test="${jgData.JG_K=='4'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관 승용 및 RV로 제공
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${jgData.JG_K=='2'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 승용 및 RV로 제공	
									</c:when>
									<c:when test="${jgData.JG_K=='3'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관차량으로 제공
									</c:when>
									<c:when test="${jgData.JG_K=='4'}">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※대차서비스는 일반 내연기관 승용 및 RV로 제공
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</small>
				</h4>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
					</colgroup>			
					<tr>
						<th>공통서비스</th>
						<td>
							<c:if test="${data.INSURANT ne 2}">
								*교통사고 발생시 <span class="bold">사고처리 업무 대행 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							</c:if>
							<c:choose>
								<c:when test="${data.INS_PER eq 2 || jgData.JG_K eq 0}"></c:when>
								<c:otherwise>*사고대차서비스 (피해사고는 보험대차)</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<tr>
						<th class="text-center"><input type="checkbox" id="2" /> <span class="bold">기본식</span> (정비서비스 미포함 상품)</th>
						<th class="text-center"><input type="checkbox" id="1" /> <span class="bold">일반식</span> (정비서비스 포함 상품)</th>
					</tr>
					<tr>
						<td>
							* 아마존케어 서비스<br/>
						     - 차량 정비 관련 유선 상담서비스 상시 제공<br/>
						     - 대여 개시 2개월 이내 무상 정비대차 제공<c:if test="${data.CAR_COMP_ID eq 56}">(테슬라차량 제외)</c:if><br/>
						       (24시간 이상 정비공장 입고시)<br/>
						     - 대여 개시 2개월 이후 원가 수준의 유상 정비대차 제공<br/>
						       (단기 대여요금의 15~30% 수준, 탁송료 별도)
						</td>
						<td>
						    * 일체의 정비서비스<br/>
						     - 각종 내구성부품/소모품 점검, 교환, 수리<br/>
						     - 제조사 차량 취급설명서 기준<br/>
						    * 정비대차서비스<br/>
						     - 4시간 이상 정비공장 입고시
						</td>
					</tr>
				</table>
			</div>
			
			<div>
				<h4><span class="title-num"></span>&nbsp;기타 대여 조건</h4>
				<ul>
					<li>제조사의 차량 상품성 개선, 연식 변경 또는 정부 정책(안전사양 의무장착, 배기가스저감, 세율조정 등) 등으로<br>차량가격이 변동되거나 정부 조세정책이 변경될 경우 상기 견적금액은 변동 될 수 있습니다.</li>
					<li>등록, 자동차세 납부<c:if test="${data.CAR_COMP_ID ne 56}">, 정기검사</c:if> 등도 아마존카에서 처리(고객 비용 부담 없음)</li>
					<li>홈페이지에서 대여차량 유지관리내역 정보제공 【FMS(Fleet Management System)】</li>
					<li>대여기간 만료시에는 반납, 연장이용
					<%-- <c:if test="${data.CAR_COMP_ID ne 56 && (detailData.JG_CODE ne 9133 && detailData.JG_CODE ne 9237 && detailData.JG_CODE ne 9015435 && detailData.JG_CODE ne 9025435)}"> --%>
					<c:if test="${!(mainData.JG_G_7 eq 3 || mainData.JG_G_7 eq 4 || jgData.JG_G_7 eq 3 || jgData.JG_G_7 eq 4)}">
						(할인요금 적용) 
					</c:if>
					<c:if test="${data.A_A eq 22 || data.A_A eq 12}">
						, 매입옵션 행사
					</c:if>
					중 선택 가능</li>
					<%-- <c:if test="${data.A_A eq '22' || data.A_A eq '21'}">
					<li>계약기간 동안 아래금액의 이행(지급)보증보험 가입조건(신용우수업체 면제)</li>
					<li>
						<span class="primary-orange">보증보험 가입 금액 :</span>
						0원 &nbsp;&nbsp;&nbsp;&nbsp;
						<span class="primary-orange">보증보험료(${data.A_B}개월치) : </span>
						0원
					</li>
					</c:if> --%>
				</ul>
				<!-- <div class="panel panel-default text-center">
					<div class="panel-body">
				    	<span class="primary">보증보험 가입금액  | </span>
				    	<span>&nbsp;&nbsp;<fmt:formatNumber value="${empty data.GI_AMT ? 0 : data.GI_AMT}" pattern="#,###"/>원</span>
				    	<span class="primary" style="margin-left:30px;">보증보험료(${data.A_B}개월치) | </span>
				    	<span>&nbsp;&nbsp;<fmt:formatNumber value="${empty data.GI_FEE ? 0 : data.GI_FEE}" pattern="#,###"/>원</span></span>
					</div>
				</div>
				 -->
			</div>
			<!-- <div class="text-right" style="margin-top: -30px;"> -->
			<div class="text-right" style="margin-top: -10px;">
				<img src="/resources/images/ceo.gif"/>
			</div>
		</div>
	</div>
</div>
<!-- modal -->
<!-- Modal -->
<div class="modal fade" id="requiredDoc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-body" id="contract-doc">
      			<h4 class="modal-title" id="myModalLabel">계약준비서류</h4><br/>
				<table class="table table-condensed table-bordered print-table">
					<tbody>
						<tr>
							<th rowspan="2" width="7%">구분</th>
							<th rowspan='2' width='20%'>개인</th>
							<th rowspan='2' width='25%'>개인사업자</th>
							<th colspan='2'>법인</th>
						</tr>
						<tr>
							<th height="30" width='23%'><span>대표이사 자필서명</span></th>
							<th height="30" width='25%'><span>대표이사 자필서명이<br>어려운 경우</span></th>
						</tr>
						<tr>
							<th align="center"><span>제<br>출<br>서<br>류</span></th>
							<td style='vertical-align: unset !important; padding: 65px 5px 0px 5px !important;'>
								①운전면허증 사본<br>②통장 사본(자동이체용)
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								① 사업자등록증 사본<br>
								② 운전면허증 사본<br>
								③ 통장 사본(자동이체용)<br>
								④ 주운전자가 직원일 경우<br><span style='margin-left: 15px;'>주운전자 면허증 사본</span><br><br>
								<span style='font-size: 11px;'>※ 계약자(사업주)가 운전면허증이 없는 경우 주운전자가 공동임차인으로 계약 진행</span>
							</td>
							<td style='vertical-align: top !important; padding: 60px 5px 0px 5px !important;'>
								① 사업자등록증 사본<br>
								② 통장 사본(자동이체용)<br>
								③ 대표이사 신분증 사본<br>
								④ 주운전자 면허증 사본<br>
							</td>
							<td valign="top" style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								① 사업자등록증 사본<br>
								② 통장 사본(자동이체용)<br>
								③ 법인인감증명서 1통<br>
								④ 대표이사 신분증 사본<br>
								⑤ 대표이사 인감증명서 1통<br>
								⑥ 주운전자 면허증 사본<br><br>
								<span style='font-size: 11px;'>※ 인감증명서는 최근 3개월 이내 발급된 것이라야 합니다.</span><br><br>
								<span style='font-size: 11px;'>※ 대표이사 연대보증이 면제된 경우, 대표이사 개인인감증명서, 신분증 사본은 제출하지 않습니다.</span>
							</td>
						</tr>
						<tr>
							<th rowspan="2" align="center">
								계약서<br>작성시
							</th>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>계약자 자필 서명</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<br>
								계약자(사업주) 자필서명<br><br>
								<span style='font-size: 11px;'>※ 계약자(사업주)의 위임을 받은 직원이 계약을 대리해야 할 경우에는 계약자(사업주)의 개인인감도장을 날인하고 개인인감증명서(최근 3개월이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다.(아마존카 사전승인 및 대리인 신분증 필요)</span>
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span style='font-size: 10px;'>▶</span> 계약자란:<br>
								명판, 법인명의 도장 날인후<br>
								대표이사 자필서명<br><br>
								<span style='font-size: 10px;'>▶</span> 연대보증인란:<br>
								연대보증을 서는 대표이사<br>자필서명
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span style='font-size: 10px;'>▶</span> 계약자란:<br>
								명판, 법인인감도장 날인<br><br>
								<span style='font-size: 10px;'>▶</span> 연대보증인란:<br>
								연대보증을 서는 대표이사<br>개인인감도장 날인
							</td>
						</tr>
						<tr>
							<td colspan="4" height="30" style='padding-left: 5px !important; padding-right: 5px !important;'>
								① 계약자 및 연대보증인 「개인(신용)정보 수집·이용·제동·조회 동의서」 서명 필요<br>
								② 자동이체용 「CMS 출금이체 신청서」 서명 및 날인 필요
							</td>
						</tr>
						<tr>
							<th rowspan="2" align="center">
								<span>신용<br>심사<br>참고<br>서류</span>
							</th>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>
								<span>· 재직증명서<br>· 소득증빙자료<br>&nbsp;(원천징수영수증 등)</span>
							</td>
							<td style='padding-left: 5px !important; padding-right: 5px !important;'>· 매출증빙자료<br>&nbsp;(부가가치세과세표준증명서 등)</td>
							<td colspan="2">· 재무제표(대차대조표, 손익계산서 등)</td>
						</tr>
						<tr>
							<td colspan="4" height="30" style='padding-left: 5px !important; padding-right: 5px !important;'><span>※ 신용 심사에 필요할 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</span></td>
						</tr>
					</tbody>
				</table>     
				<br/>
      		</div>
      		<div class="modal-footer">
      			<input type="button" class="btn btn-default-reverse" value="인쇄하기" id="contract-doc-print-btn">
      		</div>
    	</div>
  	</div>
</div>
<input type="hidden" id="mailTitle" value="${detailData.CAR_NM} (${data.A_B}개월) 장기대여 견적서">
<input type="hidden" id="estimateId" value="${param.estimateId}">
<input type="hidden" id="carIncome" value="${param.carIncome}">
<input type="hidden" id="productType" value="PS">
<%@include file="/WEB-INF/jsp/common/compare-modal.jsp"%>
<%@include file="/WEB-INF/jsp/common/email-modal.jsp"%>
<%@include file="/WEB-INF/jsp/common/simple-esti-modal.jsp"%>
</t:blankpage>