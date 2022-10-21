<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
.underline {
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
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show();
    }
    
    /* if (urlParamChk =='0') {
    	$('#rent_dt_div').show();
    	$('#rent_dt_div2').hide();
    } else {
    	$('#rent_dt_div').hide();
    	$('#rent_dt_div2').show();
    } */
	
	var titleCount = 0;
	$(".title-num").each(function(){
		if($(this).css("display") != "hidden"){
			titleCount++;
			var text = $(this).text();
			$(this).text(titleCount + ". " + text);
		}
	})
	
	//연비에서 () 안의 글자를 복합연비기준으로 대체한다
	var contiRatDesc = $('#contiRatDesc').text();
	var point = contiRatDesc.indexOf("(");
	if(point == -1){
		$('#contiRatDesc').text( contiRatDesc + "(복합연비기준)");
	}else{
		$('#contiRatDesc').text(contiRatDesc.substring(0,point) + "(복합연비기준)");
	}
	
	$('#print').click(function(){
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
	
	if ($("#jg_k").val() != "0") {
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
	 if(rent_dt > 20170930 && rent_dt < 20171010){	
		 $("#rent_dt_div").html("<small>기준일 : 2017년 09월 30일</small><br/>");
	 }
	 carAmtText();
	 setRegLocSt();
	 viewDutyFreeOptMent();	//면세가표기차량여부표시
	 viewDCMonth();				//제조사dc월표시
})

function carUnderlineOn()	{	$("#carDetail").addClass("underline"); 		}
function carUnderlineOff()	{	$("#carDetail").removeClass("underline");	}
function optUnderlineOn()	{	$("#optDetail").addClass("underline"); 		}
function optUnderlineOff()	{	$("#optDetail").removeClass("underline");	}
function carAmtText() {

	var reference_date = 20200102;
	
	if (Number(${data.CAR_COMP_ID}) > 5) {
		reference_date = 20200110;
	}
	
	if((${today} >= 20181114 || ${data.RENT_DT} >= 20181114) && ${data.RENT_DT} < reference_date){
	
    	$("#jg_g_7").val(${jgData.JG_G_7});
    	$("#jg_g_8").val(${jgData.JG_G_8});
    	var jg_g_7 = $("#jg_g_7").val();
    	var jg_g_8 = $("#jg_g_8").val();
    	
		//20181114 2019년 개별소비세 환원 및 구매보조금 변경 안내
		var fee_add_amt1 = 0;	//개별소비세 환원에 따른 월대여료 인상금액
    	var fee_add_amt2 = 0;	//구매보조금 지원중단에 따른 월대여료 인상금액
    	var fee_add_text1 = "";
    	var fee_add_text2 = "";
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
    	if(${jgData.JG_3}*100 > 0){
    		//전기차
    		if(jg_g_7=='3'){
    			//개소세전차량가
    			var car_c_amt2 = ${examData.O_3}/1.1;
    			//수입차는 수입차추정통관면세가
    			if ($("#jg_w").val()=="1") {
    				car_c_amt2 = ${examData.K_SU_4}/1.1;
    			}
    			if(car_c_amt2<=60000000){
    				fee_add_amt1 = 0;
    			}else if(car_c_amt2>85714286){
       				//fee_add_amt1 = priceCutting(fee_pp_amt*0.015, "R", 1000);
    				fee_add_amt1 = fee_pp_amt*0.014;
       			}else{
       				//fee_add_amt1 = (car_c_amt2-60000000)/25714286*0.015*fee_pp_amt;
       				fee_add_amt1 = (car_c_amt2-60000000)/25714286*0.014*fee_pp_amt;
       				//fee_add_amt1 = priceCutting(fee_add_amt1*1, "R", 1000);
       			}
    		}else if (jg_g_7=='4') {
    			fee_add_amt1  = 0;
    		//하이브리드	
    		}else if(jg_g_7=='1' || jg_g_7=='2'){
    			if(car_c_amt<=23001000){
    				fee_add_amt1 = 0;
    			}else if(car_c_amt>=32858571){
       				//fee_add_amt1 = priceCutting(fee_pp_amt*0.014, "R", 1000);	//fms처럼 맞출려면 0.014곱해줘야함.
       				//fee_add_amt1 = priceCutting(fee_pp_amt*0.015, "R", 1000);	//(20190411)
       				fee_add_amt1 = fee_pp_amt*0.014;
       			}else{
       				//fee_add_amt1 = ((car_c_amt/1.0455*0.065)-1430000)/car_c_amt*0.7*fee_pp_amt;
       				fee_add_amt1 = ((car_c_amt/1.0455*0.065)-1430000)/car_c_amt*0.75*fee_pp_amt;		//(20190411)
       				//fee_add_amt1 = priceCutting(fee_add_amt1*1, "R", 1000);
       			}	
      		//그외	
       		}else{
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
    		if(fee_add_amt1 < 0) fee_add_amt1 = 0;
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
    		if(fee_add_amt1 > 0){
    			fee_add_text1 = "한시적으로 인하된 자동차 개별소비세율이 환원(3.5% → 5%)될 경우<br>월대여료가 "+numberWithCommas(fee_add_amt1)+"원(공급가) 인상됩니다.";	//문구변경(20190527)
    		}
    	}
    	//하이브리드
    	//주석처리(20181227)
    	var bk_128 = $("#bk_128").val();
    	if(bk_128==""){	bk_128=0;	}
    	if(jg_g_7=='1' && jg_g_8=='1' && bk_128  > 0){
    		fee_add_amt2 = priceCutting(bk_128/${data.A_B}, "R", 100);
    		if(fee_add_amt2 > 0){ fee_add_text2 = "2019년1월1일 이후 신차가 출고되면 하이브리드 구매보조금 지원중단에 따라<br>월대여료가 "+numberWithCommas(fee_add_amt2)+"원(공급가) 인상됩니다.";		}
    	}
    	//20191007 2020년부터 하이브리드 취득세 감면 혜택 축소 문구 추가
        fee_add_amt2 = 0;
     	//하이브리드,플러그하이브리드
     	if (${today} <= 20191231) {
     		if (jg_g_7 == "1" || jg_g_7 == "2") {
     			if (${data.A_A} == "21" || ${data.A_A} == "22") {
     				var car_c_amt2 = ${examData.S_D};
     				if(car_c_amt2 == ""){
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
     	
    	if(fee_add_text1!='' && fee_add_text2==''){	$('#fee_add_text_div').html(fee_add_text1);	}
        if(fee_add_text1!='' && fee_add_text2!=''){	$('#fee_add_text_div').html(fee_add_text1+'<br>'+fee_add_text2); }
        if(fee_add_text1=='' && fee_add_text2!=''){	$('#fee_add_text_div').html(fee_add_text2);	}
        
	}else if(rent_dt >= 20190101){
		if(jg_g_7=='2' && ${data.ECAR_PUR_SUB_AMT}>0 ){
        	<!-- 친환경차일경우-->
        	$('#fee_add_text_div').html("친환경차 구매보조금 "+numberWithCommas(${data.ECAR_PUR_SUB_AMT})+"원은 월대여료 계산시 반영됨");
        }
	}else{
		if((jg_g_7=='1'||jg_g_7=='2'||jg_g_7=='4') && ${data.ECAR_PUR_SUB_AMT} > 0){
			$('#fee_add_text_div').html("친환경차 구매보조금 "+numberWithCommas(${data.ECAR_PUR_SUB_AMT})+"원은 월대여료 계산시 반영됨");
		}
	}
	
	if((${detailData.CAR_ID}=='006171'||${detailData.CAR_ID}=='006172') && (${data.A_A}=='21'||${data.A_A}=='22')){
		$('#fee_add_text_div').html("본 견적서의 차량가격은 개별소비세 포함가격 입니다.<br>(견적 계산 과정에서는 제조사 가격표와 동일하게 개별소비세 면세가 ("+numberWithCommas(${data.O_1/1.065})+" 원)로 환산하여 계산됨)");
	}
	
	if ($("#jg_g_7").val() == "3") {
		$('#fee_add_text_div').html("※ 전기차 지자체 보조금 소진 또는 변경, 차량 출고지연 등으로 대여료가 변경되거나 계약진행이 불가능 할 수 있습니다.");
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
	if(eco_e_tag=='1'){	//맑은서울스티커 발급선택
		/* if(jg_g_7==3 || ecarFlag==3 || jg_g_7==3){ //전기차 */
		if(jg_b = "5"){ //전기차
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
		}else if(jg_b = "6"){	//수소차
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
			//reg_loc_st = 0;
			reg_loc_st = 5;
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
	if($("#duty_free_opt").val()=="0"){
		$("#duty_span").html("[차량가격은 개별소비세 과세가격 기준]");
	}else if($("#duty_free_opt").val()=="1"){
		$("#duty_span").html("[차량가격은 개별소비세 면세가격 기준]");
	}else{
		$("#duty_span").html("");
	}
}

//제조사DC 월 표시
function viewDCMonth() {
	if(${data.DC_AMT}>0){
		var dc_mon = ${data.RENT_DT}+"";
		var temp_mon = Number(dc_mon.substr(4,2)); 
		
		$("#dc_mon").html(temp_mon);
	}
}

</script>
<input type="hidden" value="${data.A_A}" id="gubun" />
<input type="hidden" value="${jgData.JG_K}" id="jg_k" />
<input type="hidden" value="${jgData.JG_G_7}" id="jg_g_7" />
<input type="hidden" value="${jgData.JG_2}" id="jg_2" />
<input type="hidden" value="${mainData.JG_2}" id="jg_2m" />
<input type="hidden" value="${mainData.JG_G_7}" id="jg_g_7m" />
<input type="hidden" value="${jgData.JG_G_8}" id="jg_g_8" />
<input type="hidden" value="${examData.BK_128}" id="bk_128" />
<input type="hidden" value="${examData.JG_W}" id="jg_w" />
<input type="hidden" value="${examData.O_3}" id="o_3" />
<input type="hidden" value="${examData.K_SU_4}" id="k_su_4" />
<input type="hidden" value="${examData.S_D}" id="s_d" />
<input type="hidden" value="${data.ECO_E_TAG}" id="eco_e_tag"/>
<input type="hidden" value="${data.ECAR_LOC_ST}" id="ecar_loc_st"/>
<input type="hidden" value="${data.HCAR_LOC_ST}" id="hcar_loc_st"/>
<input type="hidden" value="${jgData.JG_B}" id="jg_b"/>

<div class="print-tool">
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
			<div align="right" id="rent_dt_div" style="margin: -25px 0 -10px 0;">
				<small>작성일 : <fmt:formatDate value="${toDay}" pattern="yyyy년 MM월 dd일" /></small><br/>
				<input type="hidden" value="<fmt:formatDate value="${toDay}" pattern="yyyyMMdd" />" id="rent_dt">
			</div>
			<div align="right" id="rent_dt_div2" style="margin: -25px 0 -10px 0;">
				<input type="hidden" value="<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>">		
				<small>작성일 : <fmt:formatDate value="${dateStr}" pattern="yyyy년 MM월 dd일"/></small><br/>
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
							<h4 style="text-align: left;">
								<span class="title-num"></span>
								&nbsp;대여차량								
							</h4>
						</td>
						<td width="50%" style="text-align: right;">
							<c:if test="${data.ECO_E_TAG=='1'}">
								<c:choose>
									<%-- <c:when test="${mainData.JG_G_7 eq 3 || ecarFlag eq 3 || jgData.JG_G_7 eq 3 || mainData.JG_G_7 eq 4 || ecarFlag eq 4 || jgData.JG_G_7 eq 4}"> --%>
									<c:when test="${jgData.JG_B eq 5 || jgData.JG_B eq 6}">
										<c:choose>
											<c:when test="setRegLocSt()==0"><!-- 실등록지가 서울 -->
												※ 맑은서울스티커(남산터널 이용 전자태그) 발급
											</c:when>
											<c:otherwise><!-- 실등록지가 서울 -->
												※ 맑은서울스티커(남산터널 이용 전자태그) 발급불가
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
				</table>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="110px;"/>
					</colgroup>			
					<tr>
						<th class='text-center'>제조사</th>
						<td>&nbsp;${detailData.CAR_COMP_NM}</td>
						<th class="text-center">금액</th>
					</tr>
					<tr>
						<th class='text-center'>차종(차량모델명)</th>
						<td class="print-primary">
							<%-- <a class="print-primary" href="https://www.amazoncar.co.kr/home/acar/main_car_hp/opt.jsp?est_id=${param.estimateId}" target="_blank">${detailData.CAR_NM} --%>
							<div class="print-primary detail-page" id="carDetail" style="cursor: pointer;" onmouseover="carUnderlineOn()" onmouseleave="carUnderlineOff()">&nbsp;${detailData.CAR_NM}
								<c:if test="${detailData.CAR_NM ne detailData.CAR_NAME}">
									&nbsp;${detailData.CAR_NAME}
								</c:if>
								 <!-- 현재 년도가 모델 년도보다 이후면 출력하지 않는다(올해 차 이하는 출력 X) -->
								<fmt:formatDate value="${todayYear}" pattern="yyyy" var="year"/> 
								<c:if test="${year <= detailData.CAR_Y_FORM}">
									[${detailData.CAR_Y_FORM}년형]						
								</c:if><!-- </a> -->
							</div>
						</td>
						<td class="text-right"><fmt:formatNumber value="${data.CAR_AMT}" pattern="#,###"/> 원</td>
					</tr>
					<tr>
						<th class='text-center'>옵션</th>
						<td class="print-primary">
							<div class="print-primary detail-page" id="optDetail" style="cursor: pointer;" onmouseover="optUnderlineOn()" onmouseleave="optUnderlineOff()">&nbsp;${data.OPT}</div>
						</td>
						<td class="text-right">&nbsp;<fmt:formatNumber value="${data.OPT_AMT}" pattern="#,###"/> 원</td>
					</tr>
					<c:if test="${!empty data.COL}">
						<tr>
							<th class='text-center'>색상</th>
							<td>&nbsp;
								<span class="badge" style="font-size:7px;">외장</span> ${data.COL} &nbsp;&nbsp;&nbsp;
								<c:if test="${!empty data.IN_COL}">
									<span class="badge" style="font-size:7px;">내장</span> ${data.IN_COL}
								</c:if>
							<td class="text-right"><fmt:formatNumber value="${data.COL_AMT}" pattern="#,###"/> 원</td>
						</tr>
					</c:if>
					<c:if test="${!empty data.CONTI_RAT}">
						<tr>
							<th class='text-center'>연비</th>
							<td>
								<span id="contiRatDesc">&nbsp;${data.CONTI_RAT}</span>
							</td>
							<td class=""></td>
						</tr>
					</c:if>
					<tr>
						<th class='text-center'>기타</th>
						<td>&nbsp;
							<c:if test="${data.DC_AMT > 0}">제조사D/C (<span id='dc_mon'></span>월 출고조건)</c:if>
							<c:if test="${data.DC_AMT > 0 && data.ETC != '' && data.ETC != null}"><br></c:if>
							<c:if test="${data.ETC != '' && data.ETC != null}">${data.ETC}</c:if>
						</td>
						<td class="text-right"><c:if test="${data.DC_AMT > 0}">-<fmt:formatNumber value="${data.DC_AMT}"  pattern="#,###"/> 원</c:if></td>
					</tr>
					<!-- 친환경 차량 -->
					<c:if test="${data.TAX_DC_AMT > 0}">
						<tr>
							<th class='text-center'>개소세 감면</th>
							<td>&nbsp;개별소비세 및 교육세 감면</td>
							<td class="text-right">-<fmt:formatNumber value="${data.TAX_DC_AMT}" pattern="#,###"/> 원</td>
						</tr>
					</c:if>
					<tr>
						<th class='text-center'>차량가격</th>
						<td>
							<div id="fee_add_text_div"></div>
						</td>
						<td class="print-primary text-right"><fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + data.COL_AMT - data.DC_AMT - data.TAX_DC_AMT}" pattern="#,###" /> 원</td>
					</tr>
				</table>
				<!-- 단산 된 차종일경우 문구 표현하기(2017.11.07) -->
				<c:if test="${mainData.END_DT=='N'}">
					<div style="text-decoration: underline; margin-bottom: 5px;"><small style="font-weight: bold;">※ 생산 중단된 차종입니다. 아마존카 담당자를 통해서 재고 유무를 확인하고 진행하시기 바랍니다.</small></div>
				</c:if>
				<div class="col-md-12" style="padding: 0px; margin-bottom: 10px;">
					<div class="col-md-6 col-xs-6" style="text-align: left; padding: 0px;">
						<c:choose>
							<c:when test="${mainData.JG_G_7 eq 3 || ecarFlag eq 3 || jgData.JG_G_7 eq 3 }">
								<!-- 전기차일경우 --><!-- 2018년 지자체 구매보조금 산출방식 변경 작업완료에 따라 소스변경(2018.02.07)  -->
								<c:choose>
									<c:when test="${data.ECAR_LOC_ST eq '0'}">
										<!-- <small>※ 서울 구매보조금 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '1'}"> <!-- 인천,경기 --> <!-- 2018년 인천,경기지역 지원 대수 초과로 서울로 통합 -->
										<!-- <small>※ 서울 구매보조금 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '2'}"> <!-- 강원 --> <!-- 지역주차장 문제로 서울에서 관리(멘트같음) -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '3'}"> <!-- 대전 --> 
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '4'}"> <!-- 광주,전남,전북 -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '5'}"> <!-- 대구 --> <!-- 지역주차장 문제로 서울에서 관리(멘트같음) --> 
										<!-- <small>※ 고객 사업장 또는 주소지 대구 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담	</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담	</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '6'}"> <!-- 부산 --> <!-- 지역주차장 문제로 서울에서 관리(멘트같음) -->
										<!-- <small>※ 고객 사업장 또는 주소지 부산 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '7'}"> <!-- 세종,충남,충북(대전제외) -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '8'}"> <!-- 경북(대구제외) --> 
										<!-- <small>※ 대구 구매보조금 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
									<c:when test="${data.ECAR_LOC_ST eq '9'}"> <!-- 울산/경남(부산제외) --> 
										<!-- <small>※ 대구 구매보조금 기준 견적. 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small> -->
										<small>※ 고정형 충전기 선택시 정부지원금을 초과하는 금액은 고객부담</small>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${mainData.JG_G_7 eq 4 || ecarFlag eq 4 || jgData.JG_G_7 eq 4 }">
							<!-- 수소차일경우 20190211-->
								<%-- <c:choose>
									<c:when test="${data.HCAR_LOC_ST eq '0'}"> <!-- 서울,경기 -->
										<small>※ 서울 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '1'}"> <!-- 인천 -->
										<small>※ 인천 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '2'}"> <!-- 강원 --> 
										<small>※ 서울 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '3'}"> <!-- 대전 --> 
										<c:choose>
											<c:when test="${data.A_A eq '22' || data.A_A eq '21'}"><!-- 렌트 -->
												<small>※ 서울 구매보조금 기준 견적.</small>
											</c:when>
											<c:when test="${data.A_A eq '12' || data.A_A eq '11'}"><!-- 리스 -->
												<small>※ 대전 구매보조금 기준 견적.</small>
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '4'}"> <!-- 광주,전남,전북 -->
										<small>※ 광주 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '5'}"> <!-- 대구,경북 -->  
										<small>※  서울 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '6'}"> <!-- 부산,울산,경남 -->
										<small>※ 부산 구매보조금 기준 견적.</small>
									</c:when>
									<c:when test="${data.HCAR_LOC_ST eq '7'}"> <!-- 세종,충남,충북(대전제외) --> 
										<small>※ 서울 구매보조금 기준 견적.</small>
									</c:when>
								</c:choose> --%>
							</c:when>					
							<c:otherwise>
								<small>* 이용 지역
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
									 기준 월대여료
								</small>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-6 col-xs-6" style="text-align: right; padding: 0px;">
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
			
			<!-- <div class="print-inline"> -->
			<div class="print-info">
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
										<th class='text-center'>대인배상</th>
										<th class='text-center'>대물배상</th>
										<th class='text-center'>자기신체사고</th>
										<th class='text-center'>자차면책금</th>
										<th class='text-center'>무보험차상해</th>
										<th class='text-center'>운전자연령</th>
										<th class='text-center'>긴급출동</th>
									</tr>
									<tr>	
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
									</tr>
								</c:when>
								<c:when test="${data.CAR_COMP_ID > 5 && data.A_A == 11 }">
									<tr>
										<th class='text-center'>대인배상</th>
										<th class='text-center'>대물배상</th>
										<th class='text-center'>자기신체사고</th>
										<th class='text-center'>자차면책금</th>
										<th class='text-center'>무보험차상해</th>
										<th class='text-center'>운전자연령</th>
										<th class='text-center'>긴급출동</th>
									</tr>
									<tr>	
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
										<td class="text-center">보험미반영</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th class='text-center'>대인배상</th>
										<th class='text-center'>대물배상</th>
										<th class='text-center'>자기신체사고</th>
										<th class='text-center'>자차면책금</th>
										<th class='text-center'>무보험차상해</th>
										<th class='text-center'>운전자연령</th>
										<th class='text-center'>긴급출동</th>
									</tr>
									<tr>	
										<td class='text-center'>무한(대인 I, II)</td>
										<td class='text-center'>
											<c:if test="${data.INS_DJ == 1}">5천만원/</c:if>
											<c:if test="${data.INS_DJ == 2}">1억원</c:if>
											<c:if test="${data.INS_DJ == 3}">5억원</c:if>
											<c:if test="${data.INS_DJ == 4}">2억원</c:if>
											<c:if test="${data.INS_DJ == 8}">3억원</c:if>
										</td>
										<td class='text-center'>
											<c:if test="${data.INS_DJ == 1}">5천만원</c:if>
											<c:if test="${data.INS_DJ ne 1}">1억원</c:if>					
										</td>
										<td class='text-center'><fmt:formatNumber value="${data.CAR_JA}" pattern="#,###"/>원</td>
										<td class='text-center'>1인당 최고 2억원</td>
										<td class='text-center'>
											만
											<c:if test="${data.INS_AGE == 1}">26</c:if>
											<c:if test="${data.INS_AGE == 2}">21</c:if>
											<c:if test="${data.INS_AGE == 3}">24</c:if>
											세 이상					
										</td>
										<td class='text-center'>가입</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<tr>
								<th class='text-center'>대인배상</th>
								<th class='text-center'>대물배상</th>
								<th class='text-center'>자기신체사고</th>
								<th class='text-center'>자차면책금</th>
								<th class='text-center'>무보험차상해</th>
								<th class='text-center'>운전자연령</th>
								<th class='text-center'>긴급출동</th>
							</tr>
							<tr>	
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
								<td class="text-center">보험미반영</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div>
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
			
			<div>
				<h4><span class="title-num"></span>&nbsp;대여조건</h4>
				<table class="print-table table table-condensed table-bordered">
					<colgroup>
						<col width="4%"/>
						<col width="20%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
					</colgroup>			
					<tr>
						<th class="text-center" colspan="2">구분</th>
						<th class="text-center">견적1</th>
						<th class="text-center">견적2</th>
						<th class="text-center">견적3</th>
						<th class="text-center">견적4</th>
					<tr>
					<tr>
						<th class="text-center" colspan="2">인수/반납 유형</th>
						<th class="text-center">
							<c:if test="${data1.RETURN_SELECT eq '0'}">인수/반납 선택형</c:if>
							<c:if test="${data1.RETURN_SELECT eq '1'}">반납형</c:if>
							<c:if test="${data1 == null}">인수/반납 선택형</c:if>
						</th>
						<th class="text-center">
							<c:if test="${data2.RETURN_SELECT eq '0'}">인수/반납 선택형</c:if>
							<c:if test="${data2.RETURN_SELECT eq '1'}">반납형</c:if>
						</th>
						<th class="text-center">
							<c:if test="${data3.RETURN_SELECT eq '0'}">인수/반납 선택형</c:if>
							<c:if test="${data3.RETURN_SELECT eq '1'}">반납형</c:if>
						</th>
						<th class="text-center">
							<c:if test="${data4.RETURN_SELECT eq '0'}">인수/반납 선택형</c:if>
							<c:if test="${data4.RETURN_SELECT eq '1'}">반납형</c:if>
						</th>
					</tr>
					<tr>
						<th class="text-center" colspan="2">대여상품명</th>
						<td class="text-center">
							<c:if test="${data1.A_A eq '11'}">리스 일반식</c:if>
							<c:if test="${data1.A_A eq '12'}">리스 기본식</c:if>
							<c:if test="${data1.A_A eq '21'}">장기렌트 일반식</c:if>
							<c:if test="${data1.A_A eq '22'}">장기렌트 기본식</c:if>
							<c:if test="${data1 == null}">
								<c:if test="${data2.A_A eq '11'}">리스 일반식</c:if>
								<c:if test="${data2.A_A eq '12'}">리스 기본식</c:if>
								<c:if test="${data2.A_A eq '21'}">장기렌트 일반식</c:if>
								<c:if test="${data2.A_A eq '22'}">장기렌트 기본식</c:if>
							</c:if>
						</td>
						<td class="text-center">
							<c:if test="${data2.A_A eq '11'}">리스 일반식</c:if>
							<c:if test="${data2.A_A eq '12'}">리스 기본식</c:if>
							<c:if test="${data2.A_A eq '21'}">장기렌트 일반식</c:if>
							<c:if test="${data2.A_A eq '22'}">장기렌트 기본식</c:if>
						</td>
						<td class="text-center">
							<c:if test="${data3.A_A eq '11'}">리스 일반식</c:if>
							<c:if test="${data3.A_A eq '12'}">리스 기본식</c:if>
							<c:if test="${data3.A_A eq '21'}">장기렌트 일반식</c:if>
							<c:if test="${data3.A_A eq '22'}">장기렌트 기본식</c:if>
						</td>
						<td class="text-center">
							<c:if test="${data4.A_A eq '11'}">리스 일반식</c:if>
							<c:if test="${data4.A_A eq '12'}">리스 기본식</c:if>
							<c:if test="${data4.A_A eq '21'}">장기렌트 일반식</c:if>
							<c:if test="${data4.A_A eq '22'}">장기렌트 기본식</c:if>
						</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">대여기간</th>
						<c:if test="${data1.EST_ID ne null}"><td class="text-right">${data1.A_B}개월</td></c:if>
						<c:if test="${data1 == null}"><td class="text-center">미운영</td></c:if>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}">${data2.A_B}개월</c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}">${data3.A_B}개월</c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}">${data4.A_B}개월</c:if></td>
					</tr>
					<tr>
						<th style="border-bottom:0px;"></th>
						<th class="text-center">공급가</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}"><fmt:formatNumber value="${data1.FEE_S_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}"><fmt:formatNumber value="${data2.FEE_S_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}"><fmt:formatNumber value="${data3.FEE_S_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}"><fmt:formatNumber value="${data4.FEE_S_AMT}" pattern="#,###" /> 원</c:if></td>
					</tr>
					<tr>
						<th style="border-bottom:0px;border-top:0px;"></th>
						<th class="text-center">부가세</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}"><fmt:formatNumber value="${data1.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}"><fmt:formatNumber value="${data2.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}"><fmt:formatNumber value="${data3.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}"><fmt:formatNumber value="${data4.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
					</tr>
					<tr>
						<th style="border-top:0px; border-right:0px;"></th>
						<th class="text-center" style="border-left:0px;">월대여료</th>
						<td class="print-primary text-right"><c:if test="${data1.EST_ID ne null}"><fmt:formatNumber value="${data1.FEE_S_AMT + data1.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data2.EST_ID ne null}"><fmt:formatNumber value="${data2.FEE_S_AMT + data2.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data3.EST_ID ne null}"><fmt:formatNumber value="${data3.FEE_S_AMT + data3.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data4.EST_ID ne null}"><fmt:formatNumber value="${data4.FEE_S_AMT + data4.FEE_V_AMT}" pattern="#,###" /> 원</c:if></td>
					</tr>
					<tr>
						<th style="border-bottom:0;"></th>
						<th class="text-center">보증금</th>
						<td class="text-right">
						<c:if test="${data1.EST_ID ne null}">
							${data1.RG_8}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data1.RG_8_AMT}" pattern="#,###" /> 원
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data2.EST_ID ne null}">
							${data2.RG_8}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data2.RG_8_AMT}" pattern="#,###" /> 원
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data3.EST_ID ne null}">
							${data3.RG_8}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data3.RG_8_AMT}" pattern="#,###" /> 원
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data4.EST_ID ne null}">
							${data4.RG_8}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data4.RG_8_AMT}" pattern="#,###" /> 원
						</c:if>	
						</td>
					</tr>
					<tr>
						<th style="border-top:0;border-bottom:0;"></th>
						<th class="text-center">선납금(VAT포함)</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}"><fmt:formatNumber value="${data1.PP_AMT}" pattern="#,###"/> 원</c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}"><fmt:formatNumber value="${data2.PP_AMT}" pattern="#,###"/> 원</c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}"><fmt:formatNumber value="${data3.PP_AMT}" pattern="#,###"/> 원</c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}"><fmt:formatNumber value="${data4.PP_AMT}" pattern="#,###"/> 원</c:if></td>
					</tr>
					<tr>
						<th style="border-top:0;border-bottom:0;"></th>
						<th class="text-center">개시대여료(VAT포함)</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}">${data1.IFEE_S_AMT + data1.IFEE_V_AMT} 원</c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}">${data2.IFEE_S_AMT + data2.IFEE_V_AMT} 원</c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}">${data3.IFEE_S_AMT + data3.IFEE_V_AMT} 원</c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}">${data4.IFEE_S_AMT + data4.IFEE_V_AMT} 원</c:if></td>
					</tr>
					<tr>
						<th style="border-top:0;border-right:0;"></th>
						<th class="text-center" style="border-left:0;">초기납입금 합계</th>
						<td class="print-primary text-right"><c:if test="${data1.EST_ID ne null}"><fmt:formatNumber value="${data1.RG_8_AMT + data1.PP_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data2.EST_ID ne null}"><fmt:formatNumber value="${data2.RG_8_AMT + data2.PP_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data3.EST_ID ne null}"><fmt:formatNumber value="${data3.RG_8_AMT + data3.PP_AMT}" pattern="#,###" /> 원</c:if></td>
						<td class="print-primary text-right"><c:if test="${data4.EST_ID ne null}"><fmt:formatNumber value="${data4.RG_8_AMT + data4.PP_AMT}" pattern="#,###" /> 원</c:if></td>
					</tr>
				</table>
				
				<table class="print-table table table-condensed table-bordered" style="margin-top:3px;">
					<colgroup>
						<col width="4%"/>
						<col width="20%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
					</colgroup>			
					<tr>
						<th class="text-center" colspan="2">매입옵션 가격(VAT포함)</th>
						<td class="text-right">
						<c:if test="${data1.EST_ID ne null}">
							<c:if test="${data1.RETURN_SELECT eq 0}"> 
								${data1.RO_13}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<fmt:formatNumber value="${data1.RO_13_AMT}" pattern="#,###" /> 원
							</c:if>
							<c:if test="${data1.RETURN_SELECT eq 1}"> 
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입옵션없음
							</c:if>
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data2.RETURN_SELECT eq 0}"> 
							${data2.RO_13}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data2.RO_13_AMT}" pattern="#,###" /> 원
						</c:if>
						<c:if test="${data2.RETURN_SELECT eq 1}"> 
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입옵션없음
						</c:if>
						</td>
						<td class="text-right">
						<c:if test="${data3.RETURN_SELECT eq 0}"> 
							${data3.RO_13}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data3.RO_13_AMT}" pattern="#,###" /> 원
						</c:if>
						<c:if test="${data3.RETURN_SELECT eq 1}"> 
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입옵션없음
						</c:if>
						</td>
						<td class="text-right">
						<c:if test="${data4.RETURN_SELECT eq 0}"> 
							${data4.RO_13}% &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatNumber value="${data4.RO_13_AMT}" pattern="#,###" /> 원
						</c:if>
						<c:if test="${data4.RETURN_SELECT eq 1}"> 
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입옵션없음
						</c:if>
						</td>
					</tr>
				</table>
				
				<table class="print-table table table-condensed table-bordered" style="margin-top:3px;">
					<colgroup>
						<col width="4%"/>
						<col width="20%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
					</colgroup>	
					<tr>
						<th class="text-center" colspan="2">연간 약정운행거리</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}"><span class="print-primary"><fmt:formatNumber value="${data1.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span></c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}"><span class="print-primary"><fmt:formatNumber value="${data2.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span></c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}"><span class="print-primary"><fmt:formatNumber value="${data3.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span></c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}"><span class="print-primary"><fmt:formatNumber value="${data4.AGREE_DIST}" pattern="#,###" /> km 이하 / 1년</span></c:if></td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">초과운행대여료(VAT별도)</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}">초과 1km당&nbsp;&nbsp;<span class="print-primary">${empty data1.OVER_RUN_AMT ? 0 : data1.OVER_RUN_AMT}원</span></c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}">초과 1km당&nbsp;&nbsp;<span class="print-primary">${empty data2.OVER_RUN_AMT ? 0 : data2.OVER_RUN_AMT}원</span></c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}">초과 1km당&nbsp;&nbsp;<span class="print-primary">${empty data3.OVER_RUN_AMT ? 0 : data3.OVER_RUN_AMT}원</span></c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}">초과 1km당&nbsp;&nbsp;<span class="print-primary">${empty data4.OVER_RUN_AMT ? 0 : data4.OVER_RUN_AMT}원</span></c:if></td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">매입옵션 행사시 초과운행대여료</th>
						<td class="text-right">
						<c:if test="${data1.EST_ID ne null}">
							<%-- <c:if test="${data1.A_A eq 22 || data1.A_A eq 12}">면제</c:if>
							<c:if test="${data1.A_A eq 21 || data1.A_A eq 11}">매입옵션 없음</c:if> --%>
							<c:if test="${data1.RETURN_SELECT eq 0}">면제</c:if>
							<c:if test="${data1.RETURN_SELECT eq 1}">매입옵션 없음</c:if>
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data2.EST_ID ne null}">
							<%-- <c:if test="${data2.A_A eq 22 || data2.A_A eq 12}">면제</c:if>
							<c:if test="${data2.A_A eq 21 || data2.A_A eq 11}">매입옵션 없음</c:if> --%>
							<c:if test="${data2.RETURN_SELECT eq 0}">면제</c:if>
							<c:if test="${data2.RETURN_SELECT eq 1}">매입옵션 없음</c:if>
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data3.EST_ID ne null}">
							<%-- <c:if test="${data3.A_A eq 22 || data3.A_A eq 12}">면제</c:if>
							<c:if test="${data3.A_A eq 21 || data3.A_A eq 11}">매입옵션 없음</c:if> --%>
							<c:if test="${data3.RETURN_SELECT eq 0}">면제</c:if>
							<c:if test="${data3.RETURN_SELECT eq 1}">매입옵션 없음</c:if>
						</c:if>	
						</td>
						<td class="text-right">
						<c:if test="${data4.EST_ID ne null}">
							<%-- <c:if test="${data4.A_A eq 22 || data4.A_A eq 12}">면제</c:if>
							<c:if test="${data4.A_A eq 21 || data4.A_A eq 11}">매입옵션 없음</c:if> --%>
							<c:if test="${data4.RETURN_SELECT eq 0}">면제</c:if>
							<c:if test="${data4.RETURN_SELECT eq 1}">매입옵션 없음</c:if>
						</c:if>	
						</td>
					</tr>
				</table>
				
				<table class="print-table table table-condensed table-bordered" style="margin-top:3px;">
					<colgroup>
						<col width="4%"/>
						<col width="20%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
						<col width="19%"/>
					</colgroup>
					<tr>
						<th class="text-center" colspan="2">중도해지 위약금</th>
						<td class="text-right"><c:if test="${data1.EST_ID ne null}">잔여기간 대여료의 <span class="print-primary">${data1.CLS_PER}%</span></c:if></td>
						<td class="text-right"><c:if test="${data2.EST_ID ne null}">잔여기간 대여료의 <span class="print-primary">${data2.CLS_PER}%</span></c:if></td>
						<td class="text-right"><c:if test="${data3.EST_ID ne null}">잔여기간 대여료의 <span class="print-primary">${data3.CLS_PER}%</span></c:if></td>
						<td class="text-right"><c:if test="${data4.EST_ID ne null}">잔여기간 대여료의 <span class="print-primary">${data4.CLS_PER}%</span></c:if></td>
					</tr>
				</table>
				<!-- <small>* 초기납입금은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다. (고객신용도에 따른 최소 초기납입금 규정이 있습니다)</small> -->
				<!-- 문구VV -->
				<small>※ ①보증금은 계약기간 만료 후 환불해 드립니다. [보증금 100만원을 증액하면, 월대여료 4,620원(VAT포함)이 인하됩니다. (년리 5.5% 효과)]</small><br>
				<small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;②선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.</small><br>
				<small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 세금계산서는 계약이용기간 동안 매월 균등 발행 또는 납부시 일시 발행 중 선택가능</small><br>
				<small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;③개시대여료는 마지막 (${data.G_10})개월치 대여료를 선납하는 것입니다.</small><br>
				<small>※ 약정운행거리를 줄이면 대여요금이 인하되고, 약정운행거리를 늘리면 대여요금이 인상됩니다.</small>
			</div>
			
			<div>
				<c:if test="${detailData.JG_CODE < 1000000 && (detailData.JG_CODE > 6999 || detailData.JG_CODE < 2000)}">
					<small>	* 대여료(월대여료,선납금)가 업무용으로 손비처리 가능할 경우 부가세는 매입세액공제(환급)받으실 수 있습니다.</small><br/>
				</c:if>
				<c:if test="${detailData.JG_CODE > 1000000 && (detailData.JG_CODE > 6999999 || detailData.JG_CODE < 2000000)}">
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
			</div>
			
			<div>
				<h4>
					<span class="title-num"></span>&nbsp;차량관리 서비스 제공 범위
					<small>
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
						<th class="text-center"><input type="checkbox" id="2" style="display:none;"/> <span class="bold">기본식</span> (정비서비스 미포함 상품)</th>
						<th class="text-center"><input type="checkbox" id="1" style="display:none;" /> <span class="bold">일반식</span> (정비서비스 포함 상품)</th>
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
					<li>등록, 자동차세 납부<c:if test="${data.CAR_COMP_ID ne 56}">, 정기검사</c:if> 등도 아마존카에서 처리(고객 비용 부담 없음)</li>
					<li>FMS(Fleet Management System)을 통해서 차량유지관리내역 제공(www.amazoncar.co.kr)</li>
					<li>대여기간 만료시에는 인수/반납 선택형의 경우 차량반납, 연장이용(할인요금 적용), 매입옵션 행사(매입옵션 있을 경우) 중 선택 가능하고,<br>
						반납형의 경우 차량반납, 연장이용(할인요금 적용) 중 선택가능.</li>
					<%-- <li>계약기간 동안 아래금액의 이행(지급)보증보험 가입조건(신용우수업체 면제)</li>
					<li>
						<span class="primary-orange">보증보험 가입 금액 :</span>
						0원 &nbsp;&nbsp;&nbsp;&nbsp;
						<span class="primary-orange">보증보험료(${data.A_B}개월치) : </span>
						0원
					</li> --%>
				</ul>
			</div>
			<div class="text-right" style="margin-top: -30px;">
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
							<th rowspan="2" width="6%">&nbsp;</th>
							<th rowspan="2" width="21%"><span>개인</span></th>
							<th rowspan="2" width="24%"><span>개인사업자</span></th>
							<th colspan="2" height="30"><span>법인</span></th>
						</tr>
						<tr>
							<th width="24%" height="45"><span>대표이사 자필 서명이<br>가능할 경우</span></th>
							<th width="25%"><span>대표이사 자필 서명이<br>불가능할 경우</span></th>
						</tr>
						<tr>
							<th align="center"><span>제<br>출<br>서<br>류</span></th>
							<td valign="top"><br><span>①운전면허증 사본<br>②자동이체통장 사본</span></td>
							<td valign="top"><br><span>①사업자등록증 사본<br>②신분증 사본<br>③자동이체통장 사본<br>④주운전자 면허증 사본 <br><br>
								※ 불가피한 사정으로 계약자의 직원이 계약을 대리해야할 경우에는 계약자의 개인인감도장을 날인하고 개인인감증명서(최근
								3개월이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다.</span></td>
							<td valign="top"><br><span>①사업자등록증 사본<br>②대표이사 신분증 사본<br>③자동이체통장 사본<br>④주운전자 면허증 사본</span></td>
							<td valign="top"><br><span>①사업자등록증 사본<br>②법인인감증명서 1통<br>③대표이사 신분증 사본<br>④대표이사 인감증명서 1통<br>⑤자동이체통장 사본<br>⑥주운전자 면허증 사본<br>
								<br>※ 인감증명서는 최근 3개월이내 발급된 것이라야 합니다.<br><br>※ 대표이사가 연대보증을 서지 않을 경우에는 대표이사 신분증 사본과 개인인감증명서는 제출하지 않습니다.</span></td>
						</tr>
						<tr>
							<th rowspan="2" align="center"><span>신용<br>심사<br>참고<br>서류</span></th>
							<td><br><span>·재직증명서<br>·소득증빙자료<br>&nbsp;(원천징수영수증등)</span></td>
							<td><span>·매출증빙자료</span></td>
							<td colspan="2"><span>·재무제표 (대차대조표, 손익계산서 등)</span></td>
						</tr>
						<tr>
							<td colspan="4" height="30"><span>※ 신용 심사에 필요할 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</span></td>
						</tr>
					</tbody>
				</table>     
				<br/>
				<h4>계약서 작성 시</h4>
				<table width="515" border="0" cellspacing="1" cellpadding="0" class="table table-condensed table-bordered print-table">
        			<tbody>
        				<tr>
        						<th align="center" width="13%"><span>개인</span></th>
        						<td colspan="2" height="30">&nbsp;<span>계약자 자필서명</span></td>
        				</tr>
        				<tr>
        						<th bgcolor="#e7ece1" align="center"><span>개인사업자</span></th>
        						<td colspan="2" height="30">&nbsp;<span>명판 날인후 계약자 자필서명</span></td>
        				</tr>
        				<tr>
        						<th bgcolor="#e7ece1" rowspan="2" align="center"><span>법인</span></th>
        						<th width="25%" align="center"><span align="center">대표이사 자필 서명이<br>가능할 경우</span></th>
        						<td height="45">&nbsp;<span>·계약자란: 명판, 법인명의 도장 날인후 대표이사 자필서명<br>
        						    &nbsp;·연대보증인란: 연대보증을 서는 대표이사 자필서명</span></td>
        				</tr>
        				<tr>
        						<th align="center"><span align="center">대표이사 자필 서명이<br>불가능할 경우</span></th>
        						<td height="45">&nbsp;<span>·계약자란: 명판, 법인인감도장 날인<br>
        								&nbsp;·연대보증인란: 연대보증을 서는 대표이사 개인인감도장 날인</span></td>
        				</tr>
        			</tbody>
        		</table>   
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