<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<style>
.loaderLayer {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0px;
  visibility: hidden;
  background-color: rgba(112, 113, 102, 0.3);
}
.loader {
  position: absolute;
  top: 45%;
  left: 50%;
  z-index: 1;
  border: 8px solid #f3f3f3;
  border-radius: 50%;
  border-top: 8px solid #3498db;
  width: 30px;
  height: 30px;
  /* -webkit-animation: spin 1s linear infinite; */
  /* animation: spin 0.8s linear infinite; */
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
<script src="/resources/js/esti-common.js"></script>
<script src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/jsp/common/login-modal.jsp"%> <!-- 로그인 모달 -->
<%@include file="/WEB-INF/jsp/common/register-modal.jsp"%> <!-- 회원가입 모달 -->
<!-- 구글 소셜로그인 연동 -->
<meta name="google-signin-client_id" content="87064886185-9k4to29khedjjpa71638ombcphn2754c.apps.googleusercontent.com"></meta>
<script src="https://apis.google.com/js/client:platform.js"></script>
<script>
//모든 개월이 '이용불가'인 경우 견적 페이지에서 disable 처리
function checkNoServiceProduct(){
	var rb12 = $("#rb12").val();	if(rb12 == '0' || rb12 == '-1') rb12='이용 불가';
	var rb24 = $("#rb24").val();	if(rb24 == '0' || rb24 == '-1') rb24='이용 불가';
	var rb36 = $("#rb36").val();	if(rb36 == '0' || rb36 == '-1') rb36='이용 불가';
	
	var rs12 = $("#rs12").val(); 	if(rs12 == '0' || rs12 == '-1') rs12='이용 불가';	
	var rs24 = $("#rs24").val();	if(rs24 == '0' || rs24 == '-1') rs24='이용 불가';
	var rs36 = $("#rs36").val();	if(rs36 == '0' || rs36 == '-1') rs36='이용 불가';
	
	var lb12 = $("#lb12").val();	if(lb12 == '0' || lb12 == '-1') lb12='이용 불가';
	var lb24 = $("#lb24").val();	if(lb24 == '0' || lb24 == '-1') lb24='이용 불가';
	var lb36 = $("#lb36").val();	if(lb36 == '0' || lb36 == '-1') lb36='이용 불가';
	
	var ls12 = $("#ls12").val();	if(ls12 == '0' || ls12 == '-1') ls12='이용 불가';
	var ls24 = $("#ls24").val();	if(ls24 == '0' || ls24 == '-1') ls24='이용 불가';	
	var ls36 = $("#ls36").val();	if(ls36 == '0' || ls36 == '-1') ls36='이용 불가';
	
	var rbmax = $("#rbmax").val();	if(rbmax == '0' || rbmax == '-1') rbmax = '이용 불가';
	var rsmax = $("#rsmax").val();	if(rsmax == '0' || rsmax == '-1') rsmax='이용 불가';
	
	var lbmax = $("#lbmax").val();	if(lbmax == '0' || lbmax == '-1') lbmax='이용 불가';
	var lsmax = $("#lsmax").val();	if(lsmax == '0' || lsmax == '-1') lsmax='이용 불가';
	
	if(rb12=='이용 불가' && rb24=='이용 불가' && rb36=='이용 불가' && rbmax=='이용 불가'){$("#gubunSelectBox option[value='22']").remove();}
	if(rs12=='이용 불가' && rs24=='이용 불가' && rs36=='이용 불가' && rsmax=='이용 불가'){$("#gubunSelectBox option[value='21']").remove();}
	
	if(lb12=='이용 불가' && lb24=='이용 불가' && lb36=='이용 불가' && lbmax=='이용 불가'){$("#gubunSelectBox option[value='12']").remove();}
	if(ls12=='이용 불가' && ls24=='이용 불가' && ls36=='이용 불가' && lsmax=='이용 불가'){$("#gubunSelectBox option[value='11']").remove();}
	
	/* var maxMonth = ${data.MAX_USE_MON}+"";
	var maxIdx = parseInt(maxMonth / 12);
	for (var i = maxIdx; i > 0; i--) {
		var rowMonth = i * 12;
		if (Number(rowMonth) >= 12) {
			console.log(i * 12);
		}
	} */
}



function changeSellingOption(){
	var fuelCode = $("#fuelCode").val();
	var gubun = $('#gubunSelectBox option:selected').val();
	var gubun2 = gubun.substr(1,1);
	var period = $("#periodSelectBox option:selected").val();
	var directInputPeriod = $("#directInputPeriod").val().replace("개월",""); 
	var rb_12_val = '${data.RB12}';
	var rb_24_val = '${data.RB24}';
	var rb_36_val = '${data.RB36}';
	
	var rs_12_val = '${data.RS12}';
	var rs_24_val = '${data.RS24}';
	var rs_36_val = '${data.RS36}';
	
	var lb_12_val = '${data.LB12}';
	var lb_24_val = '${data.LB24}';
	var lb_36_val = '${data.LB36}';
	
	var ls_12_val = '${data.LS12}';
	var ls_24_val = '${data.LS24}';
	var ls_36_val = '${data.LS36}';
	
	//재렌트 공식
	if(gubun2 == "1"){ //일반식이면
		$("#sellingOption").val("없음");
		$("#sellingOption").attr("param","0");
		$(".selling-info").text("※일반식(정비 포함) 상품에는 매입옵션이 주어지지 않습니다.");
	}else{
	//	if(fuelCode != "3"){
			if(period < 24){
				$("#sellingOption").val("없음");
				$("#sellingOption").attr("param","0");
				$(".selling-info").text("※재렌트/재리스 매입옵션은 24개월 이상 계약시에만 주어집니다");
			}else if(period =="directInput" && directInputPeriod < 24){
				$("#sellingOption").val("없음");
				$("#sellingOption").attr("param","0");
				$(".selling-info").text("※재렌트/재리스 매입옵션은 24개월 이상 계약시에만 주어집니다");
			}else{
				$("#sellingOption").val("있음");
				$("#sellingOption").attr("param","1");
				$(".selling-info").text("※매입옵션 유무에 따른 대여요금 변동은 없습니다.");
			}
		/* }else{ //재렌트 LPG전용차면
			$("#sellingOption").attr("param","0");
			$("#sellingOption").val("없음");
			$(".selling-info").text("※재렌트 LPG 전용차는 매입옵션이 주어지지 않습니다");
		} */
	}
	
	// 재렌트 > 재리스 용도변경 가능한 차량중 LPG차량이 아니면서, 차령24개월미만, 소형승용차 이상은 24개월이상만 견적가능
	// 이미 조건은 체크해서 DB에는 '이용 불가'로 처리된 상태. (2017.11.23)
	/* if(ls_12_val=="이용 불가" && lb_12_val=="이용 불가" && ls_24_val!="이용 불가" && lb_24_val!="이용 불가"){
		if(gubun=="12" || gubun=="11"){
			if($("#periodSelectBox").val()=="12"){
				$("#periodSelectBox option[value='24'] ").prop("selected", true);
			}
			$("#periodSelectBox option[value='12'] ").prop("disabled", true);
			if(period =="directInput" && directInputPeriod < 24 && directInputPeriod != null){
				alert("본 차량은 재리스로 이용시 최소 24개월 이상만 견적이 가능합니다.");
				$("#directInputPeriod").val("24개월");
				return false;
			}
		}else{
			$("#periodSelectBox option[value='12'] ").prop("disabled", false);
		}
	} 
	else if (ls_12_val=="이용 불가" && lb_12_val=="이용 불가" && ls_24_val=="이용 불가" && lb_24_val=="이용 불가") {
		if (gubun=="22" || gubun=="21") {
			$("#periodSelectBox option[value='12'] ").prop("disabled", true);
			$("#periodSelectBox option[value='24'] ").prop("disabled", true);
			$("#periodSelectBox option[value='directInput'] ").prop("disabled", true);
		}
	} */
	
	//20200511 대여상품에따른 최대개월수 처리
	if (gubun == "12" || gubun == "11") {
		if (gubun2 == "2") {
			if (lb_12_val == "이용 불가") {
				$("#periodSelectBox option[value='12']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='12']").prop("disabled", false);
			}
			if (lb_24_val == "이용 불가") {
				$("#periodSelectBox option[value='24']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='24']").prop("disabled", false);
			}
			if (lb_36_val == "이용 불가") {
				$("#periodSelectBox option[value='36']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='36']").prop("disabled", false);
			}
			/* if (lb_12_val == "이용 불가" || lb_24_val == "이용 불가" || lb_36_val == "이용 불가") {
				$("#periodSelectBox option[value='directInput']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='directInput']").prop("disabled", false);
			} */
			/* if (lb_12_val == "이용 불가" && lb_24_val == "이용 불가" && lb_36_val == "이용 불가") {
				$("#periodSelectBox option:first").prop("selected", true);
				$("#directInputPeriod").val("");
				$("#directInputPeriod").prop("disabled", true);
			} */
		}
		
		if (gubun2 == "1") {
			if (ls_12_val == "이용 불가") {
				$("#periodSelectBox option[value='12']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='12']").prop("disabled", false);
			}
			if (ls_24_val == "이용 불가") {
				$("#periodSelectBox option[value='24']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='24']").prop("disabled", false);
			}
			if (ls_36_val == "이용 불가") {
				$("#periodSelectBox option[value='36']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='36']").prop("disabled", false);
			}
			/* if (ls_12_val == "이용 불가" || ls_24_val == "이용 불가" || ls_36_val == "이용 불가") {
				$("#periodSelectBox option[value='directInput']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='directInput']").prop("disabled", false);
			} */
			/* if (ls_12_val == "이용 불가" && ls_24_val == "이용 불가" && ls_36_val == "이용 불가") {				
				$("#periodSelectBox option:first").prop("selected", true);
				$("#directInputPeriod").val("");
				$("#directInputPeriod").prop("disabled", true);
			} */
		}
		
	} else {
		if (gubun2 == "2") {
			if (rb_12_val == "이용 불가") {
				$("#periodSelectBox option[value='12']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='12']").prop("disabled", false);
			}
			if (rb_24_val == "이용 불가") {
				$("#periodSelectBox option[value='24']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='24']").prop("disabled", false);
			}
			if (rb_36_val == "이용 불가") {
				$("#periodSelectBox option[value='36']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='36']").prop("disabled", false);
			}
			/* if (rb_12_val == "이용 불가" || rb_24_val == "이용 불가" || rb_36_val == "이용 불가") {
				$("#periodSelectBox option[value='directInput']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='directInput']").prop("disabled", false);
			} */
			/* if (rb_12_val == "이용 불가" && rb_24_val == "이용 불가" && rb_36_val == "이용 불가") {				
				$("#periodSelectBox option:first").prop("selected", true);
				$("#directInputPeriod").val("");
				$("#directInputPeriod").prop("disabled", true);
			} */
		} 
		
		if (gubun2 == "1") {
			if (rs_12_val == "이용 불가") {
				$("#periodSelectBox option[value='12']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='12']").prop("disabled", false);
			}
			if (rs_24_val == "이용 불가") {
				$("#periodSelectBox option[value='24']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='24']").prop("disabled", false);
			}
			if (rs_36_val == "이용 불가") {
				$("#periodSelectBox option[value='36']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='36']").prop("disabled", false);
			}
			/* if (rs_12_val == "이용 불가" || rs_24_val == "이용 불가" || rs_36_val == "이용 불가") {
				$("#periodSelectBox option[value='directInput']").prop("disabled", true);
			} else {
				$("#periodSelectBox option[value='directInput']").prop("disabled", false);
			} */
			/* if (rs_12_val == "이용 불가" && rs_24_val == "이용 불가" && rs_36_val == "이용 불가") {
				$("#periodSelectBox option:first").prop("selected", true);
				$("#directInputPeriod").val("");
				$("#directInputPeriod").prop("disabled", true);
			} */
		}
	}
}

function insertFormData(){
	
	//구분,매입옵션,약정운행거리 저장
	$('#a_a').val($("#gubunSelectBox option:selected").val());
	var agreeDist = checkAgreeDistValue(); //약정운행거리 셋팅
	if (agreeDist == false) {
		return false;
	} else {
		$('#agreeDist').val(agreeDist);
	}
	
	var period = checkPeriodValue(); //대여기간 셋팅	
	if (period == false) {
		return false;
	} else {
		$('#a_b').val(period);
	}
	
	$("#optChk").val($("#sellingOption").attr("param")); //매입옵션값 셋팅
	
	//보증금,선납금,보증보험 저장
	$("#rg_8").val($("#depositSelectBox option:selected").val());
	
	if (isNaN($("#preAmt").val().replace("원", "").replace(/\,/g,''))) {
		$("#rg_8_amt").val("0");
	} else {
		$("#rg_8_amt").val($("#depositAmt").val().replace("원", "").replace(/\,/g,""));
	}
	
	$("#pp_per").val($("#preSelectBox option:selected").val());
	
	if (isNaN($("#preAmt").val().replace("원", "").replace(/\,/g,''))) {
		$("#pp_amt").val("0");
	} else {
		$("#pp_amt").val($("#preAmt").val().replace("원","").replace(/\,/g,""));
	}
	
	//기타
	$("#ins_age").val($("#driverAgeSelectBox option:selected").val()); //운전자 연령	
	
	//자차면책금
	if (isNaN($("#preAmt").val().replace("원", "").replace(/\,/g,''))) {
		$("#car_ja").val("0");
	} else {
		$("#car_ja").val($("#carJaSelectBox option:selected").val().replace("원","").replace(/\,/g,""));
	}
	
	$("#ins_dj").val($("#insureUnitSelectBox option:selected").val()); //대물배상
	$("input[name='etc_option']:checked").each(function(){ //차량용품
		var selectedValue = $(this).val();
		$("#"+selectedValue).val("Y");
	});
	//$('#ecarLoc').val($('#ecarLocationSelectBox option:selected').val());
	
	return true;
}


$(document).ready(function(){
	
	
	
	checkNoServiceProduct();
	
	//로그인시 부모창 리로드
	/* if($("#loginEmail").val() != null && $("#loginEmail").val() != ""){
		//opener.location.reload();		//<-- IE에서 location객체를 인식못해서 스크립트에러 발생. 주석처리.
	} else {
		alert("로그인이 필요한 서비스 입니다.");
		opener.parent.location="/login";
		window.close();
	} */
	
	/* 로그인 임시 변경 */
    /* if ($("#loginEmail").val() == null || $('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
        $('body').css("overflow", "hidden");
        //$('.pre-check-modal').show()
        alert("로그인이 필요한 서비스 입니다.");
		//opener.parent.location="/login";
		opener.parent.location.reload();
		//opener.parent.location=$("#from_page").val();
		window.close();
    } */
	
//	if($.cookie("estEmail") == null){
//		//처음에는 스크롤바 금지
//		$('body').css("overflow","hidden");
//		$('.pre-check-modal').show();
//	}else{
//		$("#loginEmail").val($.cookie("estEmail"));
//	}
	
	if($("#agreeDistParam").val() > 0){
		$("#agreeDistSelectBox > option[value='"+$("#agreeDistParam").val()+"']").prop("selected",true);
	}
	//서비스 미제공 상품 disable 처리
	var disableArray = $('#disableProduct').val().split(":");	
	for(var index in disableArray){
		$("#gubunSelectBox option[value='"+disableArray[index]+"']").remove();
	}
	
	//대여 기간 셋팅 (선택한 값을 default로)
	var periodVal = $('#periodParam').val().substring(0,2);
	$("#periodSelectBox option[value='"+periodVal+"']").prop('selected',true);
	
	//대여상품 셋팅
	var gubun = $('#gubunParam').val();
	if(gubun != ""){
		$("#gubunSelectBox > option[value='"+gubun+"']").prop("selected", true);
	}else{
		$("#gubunSelectBox > option:first").prop("selected",true);
	}
	changeSellingOption(); //매입옵션 셋팅
	
	// 화면 load시 운전자 연령과 자차면책금 값에 따른 초기 셋팅
	var ageSelectValue = $('#driverAgeSelectBox').val();
	var carJaSelectValue = $('#carJaSelectBox').val();
	
	if (ageSelectValue == "2" || ageSelectValue == "3" || carJaSelectValue == "200000") {		
		$('#acarText').show();
	} else {
		$('#acarText').hide();
	}
	
	// 운전자 연령 선택 변경시 출력되는 문구
	$('#driverAgeSelectBox').change(function(){
		var ageSelectValue = $('#driverAgeSelectBox').val();
		var carJaSelectValue = $('#carJaSelectBox').val();
		
		if (ageSelectValue == "2" || ageSelectValue == "3" || carJaSelectValue == "200000") {		
			$('#acarText').show();
		} else {
			$('#acarText').hide();
		}
	})	
	
	// 자차 면책금 선택 변경시 출력되는 문구
	$('#carJaSelectBox').change(function(){
		var ageSelectValue = $('#driverAgeSelectBox').val();
		var carJaSelectValue = $('#carJaSelectBox').val();
		
		if (ageSelectValue == "2" || ageSelectValue == "3" || carJaSelectValue == "200000") {		
			$('#acarText').show();
		} else {
			$('#acarText').hide();
		}
	})
	
	function fn_layer_popup(type){  
		var layer = document.getElementById("loader");	
		var layerContent = document.getElementById("loaderContent");	
		if (type == "show") {
			layer.style.visibility="visible"; 
			layerContent.style.animation="spin 0.8s linear infinite"; 
		} else {
			layer.style.visibility="hidden"; 
			layerContent.style.animation=""; 
		}		
	}
	
	//견적 계산하기
	$('.calculate-btn').click(function(){
		
		//친환경차(전기차)는 대여기간이 24개월 이상일 시에만 견적내기 가능
		var period = $("#periodSelectBox option:selected").val();
		//var ecarFlag = $("#ecarFlag").val();
		//VV요청에 대한 분석결과 필요없다고 판단되어 협의 후 주석처리 2017.06.28
		/* if(ecarFlag != "" && period < 24){//친환경차(전기차)는 대여기간이 24개월 이상일 시에만 견적내기 가능			
			alert("친환경차는 대여기간이 24개월 이상일 시에만 견적내기가 가능합니다.");
			return false; 
		} */
		
		//20201117 1년미만 재리스는 일반식으로 운영되기때문에 기본식 직접입력 disabled
		var gubun = $('#gubunSelectBox option:selected').val();
		var directInputPeriod = $("#directInputPeriod").val().replace("개월", "");
		if ($("input[name='car-gubun']:checked").attr("id") == "car-gubun-sh") {
			if (gubun == "12" || gubun == "22") {
				if ($("#periodSelectBox option:selected").val() == "directInput" && Number(directInputPeriod) < 12) {
					alert("※ 재렌트 대여기간 12개월 미만은 일반식(정비 포함) 상품만 가능합니다.\n기본식(정비 미포함) 상품은 12개월 이상부터 가능합니다.");
					return false;
				}
			}
		}
		
		//parseInt($("#depositAmt").val().replace(/,/g,"").replace("원","")); //숫자만 추출하기		
		var depositAmt = $("#depositAmt").val();
		var preAmt = $("#preAmt").val();
		
		if (depositAmt == "") {
			alert("보증금 직접입력시 금액을 입력해주세요.");
			return false;
		}
		
		if (preAmt == "") {
			alert("선납금 직접입력시 금액을 입력해주세요.");
			return false;
		}
		
		//$(this).button('loading');
		fn_layer_popup("show");
		$(this).prop("disabled",true); //계산하는 중에 중복 견적 방지
		
		var checkFlag = insertFormData();
		if(checkFlag == false){
			$('.calculate-btn').prop("disabled",false);
			$('.calculate-btn').button('reset');
			fn_layer_popup("hide");
			return false;
		}
		//form 데이터를 json object 형태로 변환
		var data = $("#calculateFrm").serialize();
		
		//data = decodeURIComponent((data + '').replace(/w+/g,'%20')).split("&"); //한글 깨짐 처리  
		var rule = '/\w/g';
	    data = decodeURIComponent((data + '').replace(rule,'%20')).split("&"); //한글 깨짐 처리 
				
		var obj = {};
		for(var key in data){
			obj[data[key].split("=")[0]] = data[key].split("=")[1];
		}
		
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			data:JSON.stringify(obj),
			url:'/calculate/secondhand',
			type:'POST',
			success:function(response){
				alert("견적 계산이 완료되었습니다");
				
				//월대여료 가격표에 셋팅 
				$('#supplyFee').text(response.supplyAmt+"원");
				$('#vatFee').text(response.vatAmt+"원").focus();
				$('#rentPeriod').text($('#a_b').val()+"개월");
				$('.total-price').text(response.totalPrice+"원");
				$('#estRegCode').val(response.regCode);
				$('#estimateId-print').val(response.estimateId);
				
				$('.total-price').focus();
				
				if(response.totalPrice.indexOf("-") === -1){
					$('.total-price').text(response.totalPrice+"원");
					$(".minus-info").hide();
					$('#print_btn').prop("disabled", false);
					$('#send_btn').prop("disabled", false);
				}else{
					$('.total-price').text("-");
					$(".minus-info").show();
					$('#print_btn').prop("disabled", true);
					$('#send_btn').prop("disabled", true);
				}
				
			},
			error:function(request,status,error){
				alert(response.message);
			},
			complete:function(response){
				$('.calculate-btn').prop("disabled",false);
				fn_layer_popup("hide");
				$('.calculate-btn').button('reset');
			}
		});	

	})
	
	//상담 요청하기 클릭 시
	$('.submit-btn').click(function(){
		//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
		/* alert("현재, 서버 정비작업으로 인해 상담 요청이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false; */ 
		
		var agreeDist = checkAgreeDistValue();
		var id = $("#estRegCode").val();
		var car_gubun = $("#car_gubun").val();
		var leaseYn = $("#leaseYn").val();
		if($("#gubunSelectBox").val()=="22" || $("#gubunSelectBox").val()=="21"){
			$("#leaseYn").val("0");
		}else if($("#gubunSelectBox").val()=="12" || $("#gubunSelectBox").val()=="11"){
			$("#leaseYn").val("1");
		}
		
		$('#carAmt-print').val($('.origin-carAmt').text().replace(/,/g,""));  //월대여 금액
		$('#a_a-print').val($("#gubunSelectBox option:selected").val());
		$('#a_b-print').val($('#periodSelectBox option:selected').val());
		$('#regCode-print').val($('#estRegCode').val());
		
		var url = "/rent/secondhand/print?";
		$('#printForm input').each(function(){
			var name = $(this).attr("name");
			var value = $(this).val();
			if(url.substring(url.length-1,url.length) != "?"){	url += "&"; }
			url += name + "=" + value ;
		})
		$('#printUrl').val(url); //견적서URL
		
		if($('#estRegCode').val() == '' || $('#estRegCode').val() == null){
			alert("견적 계산하기 버튼을 클릭하여 월 대여료를 확인하셔야\n상담 요청이 가능합니다");
			return false;
		}
		if(confirm("최종 계산한 견적 정보로 상담이 요청됩니다.\n상담 요청하시겠습니까?")){
			$('#step2Form').submit();
		}else{
			return false;
		}
	})
	

	$('.print-btn').click(function(){
		
		var agreeDist = checkAgreeDistValue();
		var id = $("#estRegCode").val();
		var car_gubun = $("#car_gubun").val();
		var leaseYn = $("#leaseYn").val();
		if($("#gubunSelectBox").val()=="22" || $("#gubunSelectBox").val()=="21"){
			$("#leaseYn").val("0");
		}else if($("#gubunSelectBox").val()=="12" || $("#gubunSelectBox").val()=="11"){
			$("#leaseYn").val("1");
		}
		
		$('#carAmt-print').val($('.origin-carAmt').text().replace(/,/g,""));  //월대여 금액
		$('#a_a-print').val($("#gubunSelectBox option:selected").val());
		$('#a_b-print').val($('#periodSelectBox option:selected').val());
		$('#regCode-print').val($('#estRegCode').val());
		
		if(id == "" || id == null){
			alert("먼저 견적을 계산하셔야 합니다");	
		}else{
			var url = "/rent/secondhand/print?";
			$('#printForm input').each(function(){
				var name = $(this).attr("name");
				var value = $(this).val();
				if(url.substring(url.length-1,url.length) != "?"){	url += "&"; }
				url += name + "=" + value ;
			})
			window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");	
		}
	})
	
	//차량선택 버튼 클릭 시 리스트 뜨기
	$("#selectCarList").click(function(){
		window.open("/estimate/secondhand/list","listPopup","width=1200,height=800,top=0,left=100,scrollbars=yes");
	})
	
	//로그인 방식 변경(2017.05.26)
	$("#btn_checkEmail").on("click", function(){
		
		$("#email-error").css("display", "none");
		$("#email-error2").css("display", "none");
		
		var checkEmail = $("#checkEmail").val();
		if(checkEmail == "" || checkEmail == null){
			$("#email-error").css("display", "block");	
			return false;
		}
		
		if(checkEmail == "" || checkEmail == null){
			$("#email-error").css("display", "block");			
		}else if(checkEmail.indexOf('@')=='-1' || checkEmail.indexOf('.')=='-1'){				
			$("#email-error2").css("display", "block");					
		}else if(checkEmail.indexOf('@')!='-1' && checkEmail.indexOf('.')!='-1'){
			
			//회원가입여부 체크 Ajax
			var data= {};
			data["email"] = checkEmail;
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				url:'/checkRegEmail',
				type:'POST',
				data:JSON.stringify(data),
				success:function(response){	
					
					if(response == '0'){//회원가입 모달로 이동
						$('.pre-check-modal').css('display','none' ); //모달창 닫기						
					    $('#register-modal').modal({backdrop: 'static', keyboard: false});
					    $("#username2").val(checkEmail);
					}else if(response == '1'){//로그인 모달로 이동										
						$('.pre-check-modal').css('display','none' ); //모달창 닫기						
					    $('#login-modal').modal({backdrop: 'static', keyboard: false});
						$("#username").val(checkEmail);
						$("#resetEmail").val(checkEmail);
					}else{
						alert("로그인 중 오류발생! 관리자에게 문의하세요.");
					} 
				},
				error:function(request,status,error){
					alert("로그인 중 오류발생! 관리자에게 문의하세요.");
				}
			});
		}
	});	
})
</script>
<input type="hidden" id="disableProduct" value="${paramData.disableProduct}"/>
<input type="hidden" id="gubunParam" value="${paramData.a_a}"/>
<input type="hidden" id="periodParam" value="${paramData.a_b}"/>
<input type="hidden" id="agreeDistParam" value="${paramData.dist}"/>
<input type="hidden" id="carAmt" value="${estimateData.O_1}"/>
<input type="hidden" id="fuelCode" value="${data.FUEL_CODE}"/>
<input type="hidden" id="car_comp_id" value="${data.CAR_COMP_ID}"/>
<input type="hidden" id="car_use" value="${data.CAR_USE}"/>
<input type="hidden" id="use_mon" value="${data.USE_MON}"/>
<input type="hidden" id="jg_code" value="${data.JG_CODE}"/>

<form id="printForm">
	<input type="hidden" name="carManagedId" value="${paramData.carManagedId}"/>
	<input type="hidden" name="rentManagedId" value="${paramData.rentManagedId}"/>
	<input type="hidden" name="rentLocationCode" value="${paramData.rentLocationCode}"/>
	<input type="hidden" name="a_a" id="a_a-print" value=""/>
	<input type="hidden" name="a_b" id="a_b-print" value=""/>
	<input type="hidden" name="carAmt" id="carAmt-print" value=""/>
	<input type="hidden" name="regCode" id="regCode-print" value=""/>
	<input type="hidden" name="type" id="type" value="secondhand"/>
	<input type="hidden" name="from" value="step1" />
	<input type="hidden" name="estimateId" id="estimateId-print"/>
	<input type="hidden" name="agreeDist" id="agreeDist-print"/>
	<!-- 수입차 리스는 견적서보기에서 보험료미포함 으로 세팅 -->
	<input type="hidden" name="car_gubun" id="car_gubun" value="${paramData.car_gubun}">
	<input type="hidden" name="leaseYn" id="leaseYn" value="">
	<input type="hidden" name="brTo" value="${paramData.brTo}">
	<input type="hidden" name="brFrom" value="${paramData.brFrom}">
</form>
<form id="calculateFrm" method="post">
	<%-- jjlim --%>
	<sec:authorize access="isAuthenticated()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" name="loginEmail" id="loginEmail" value="" />
	</sec:authorize>
	<%--<input type="hidden" name="loginEmail" id="loginEmail" />--%>
	
	<input type="hidden" name="carManagedId" id="carManagedId" value="${paramData.carManagedId}"/>
	<input type="hidden" name="RENT_MNG_ID" id="rentManagedId" value="${paramData.rentManagedId}"/>
	<input type="hidden" name="RENT_L_CD" id="rentLocationCode" value="${paramData.rentLocationCode}"/>
	<input type="hidden" name="estimateId" id="estimateId" value="${estimateData.EST_ID}"/>
	<input type="hidden" name="brTo" id="brTo" value="${paramData.brTo}"/>
	<input type="hidden" name="brFrom" id="brFrom" value="${paramData.brFrom}"/>
	
	<input type="hidden" value="" name="A_A" id="a_a"/> <!-- 상품 구분 -->
	<input type="hidden" value="" name="A_B" id="a_b"/> <!-- 대여기간 -->
	<input type="hidden" value="" name="AGREE_DIST" id="agreeDist"/> <!-- 약정운행거리 -->
	<input type="hidden" value="0" name="optChk" id="optChk"/><!-- 매입옵션 여부 -->
	<input type="hidden" value="1" name="DOC_TYPE" id="doc_type"/>
	<input type="hidden" value="1" name="SPR_YN" id="spr_yn" /> <!-- 신차는 초우량기업인 2, 재리스는 우량기업인  1 -->
	<input type="hidden" value="1" name="INS_PER" id="ins_per" /> <!-- 신차는 초우량기업인 2, 재리스는 우량기업인  1 -->
	<input type="hidden" value="0" name="VALI_TYPE" id="vali_type"/> <!-- 견적유효기간 -->
	
	<input type="hidden" value="" name="RG_8" id="rg_8"/> <!-- 보증금 -->
	<input type="hidden" value="" name="RG_8_AMT" id="rg_8_amt"/> <!-- 보증금 총액  -->
	<input type="hidden" value="" name="PP_PER" id="pp_per"/> <!-- 선납금 -->
	<input type="hidden" value="" name="PP_AMT" id="pp_amt"/> <!-- 선납금 총액  -->
	
	<input type="hidden" value="" name="INS_AGE" id="ins_age"/> <!-- 운전자 연령 -->
	<input type="hidden" value="" name="INS_DJ" id="ins_dj"/> <!-- 대물/자손 -->
	
	<input type="hidden" value="0" name="GI_PER" id="gi_per"/> <!-- 보증보험 비율 -->
	<input type="hidden" value="0" name="GI_AMT" id="gi_amt"/> <!-- 보증보험 총액 -->
	<input type="hidden" value="0" name="GI_FEE" id="gi_amt"/>
	<input type="hidden" value="N" name="GI_YN" id="gi_yn"/> <!-- 보증보험 여부 -->
	<input type="hidden" value="7" name="A_H" id="A_H"/> <!-- 차량인도지역 -->
	
	<input type="hidden" value="" name="reg_dt" id="reg_dt"/>
	<input type="hidden" value="" name="regId" id="regId" />
	
	<input type="hidden" value="" name="TINT_S_YN" id="tint_s_yn"/> <!-- 전면 썬팅 -->
	<input type="hidden" value="" name="TINT_N_YN" id="tint_n_yn"/> <!-- 거치형 네비게이션 -->
	<input type="hidden" value="" name="TINT_B_YN" id="tint_b_yn"/> <!-- 2채널 블랙박스  -->
	<input type="hidden" value="" name="TINT_EB_YN" id="tint_eb_yn"/> <!-- 이동형 충전기  -->
	
	<input type="hidden" value="" name="dcAmt" id="dcAmt"/> <!-- DC가격 -->
	<input type="hidden" value="${estimateData.O_1}" name="totalAmt" id="totalAmt"/> <!-- 차량가격 총액 -->
	<input type="hidden" value="${estimateData.CONTI_RAT}" name="contiRat" id="contiRat" /> <!-- 연비 -->
	<input type="hidden" vlaue="${estimateData.JG_TUIX_ST}" name="jg_tuix_st" id="jg_tuix_st"/><!-- jg_tuix_st 추가 (2017.07.07) -->
	<input type="hidden" vlaue="${estimateData.JG_TUIX_OPT_ST}" name="jg_tuix_opt_st" id="jg_tuix_opt_st"/><!-- jg_tuix_opt_st 추가 (2017.07.07) -->
	<input type="hidden" value="" name="car_ja" id="car_ja"/> <!-- 자차면책금 추가 (2017.10.10)-->
</form>
<form id="step2Form" action="/estimate/secondhand/step2" method="post">
	<input type="hidden" value="" name="estRegCode" id="estRegCode"/>
	<input type="hidden" value="${data.CAR_COMP_NM}" name="companyName" id="companyName"/>
	<input type="hidden" value="${data.CAR_KIND}" name="carKind" id="carKind"/>
	<input type="hidden" value="${data.CAR_JNM}" name="carName" id="carName"/>
	<input type="hidden" value="${data.CAR_NM}" name="carDetailName" id="carDetailName"/>
	<input type="hidden" value="${data.FUEL_KD}" name="fuelKind" id="fuelKind"/>
	<input type="hidden" value="${data.COLO}" name="carColor" id="carColor"/>
	<input type="hidden" value="${data.CAR_Y_FORM}" name="carYear" id="carYear"/>
	<input type="hidden" value="${data.REAL_KM}" name="carRealKM" id="carRealKM"/>
	<input type="hidden" value="${data.DPM}" name="carDPM" id="carDPM"/>
	<input type="hidden" value="${data.INIT_REG_DT}" name="carRegDate" id="carRegDate"/>
	<input type="hidden" value="${data.OPT}" name="carOption" id="carOption"/>
	<input type="hidden" value="${data.CAR_NO}" name="carNumber" id="carNumber"/>
	<input type="hidden" value="" name="printUrl" id="printUrl" />
</form>

<!-- 서비스 이용불가 상품 disable 처리를 위한 세팅 -->
<input type="hidden" id="rb12" value="${data.RB12}">
<input type="hidden" id="rb24" value="${data.RB24}">
<input type="hidden" id="rb36" value="${data.RB36}">

<input type="hidden" id="rs12" value="${data.RS12}">
<input type="hidden" id="rs24" value="${data.RS24}">
<input type="hidden" id="rs36" value="${data.RS36}">

<input type="hidden" id="lb12" value="${data.LB12}">
<input type="hidden" id="lb24" value="${data.LB24}">
<input type="hidden" id="lb36" value="${data.LB36}">

<input type="hidden" id="ls12" value="${data.LS12}">
<input type="hidden" id="ls24" value="${data.LS24}">
<input type="hidden" id="ls36" value="${data.LS36}">

<input type="hidden" id="rbmax" value="${data.RBMAX}">
<input type="hidden" id="rsmax" value="${data.RSMAX}">

<input type="hidden" id="lbmax" value="${data.LBMAX}">
<input type="hidden" id="lsmax" value="${data.LSMAX}">

<%-- <%@include file="/WEB-INF/jsp/common/precheck-modal.jsp"%> <!-- 실시간인증 창 --> --%>
<div class="pre-check-modal" style="display: none">
	<div class="pre-check-content">
		<div class="pre-check-opening">
			<h4>실시간 견적내기</h4>
			<div class="pre-check-box">
				<br>
				<%-- jjlim --%>
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">이메일 주소</span>만으로 실시간 견적이 가능합니다.<br/>
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">소셜 로그인</span>을 이용하시면 더욱 편리합니다.<br/>
				<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>이메일 주소 입력이나 소셜로그인으로 실시간견적 가능합니다.</span><br /> --> 
				<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>회원가입 후 누구나 모든 차종의 실시간 견적 및 월렌트 예약이 가능합니다.</span> -->
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>인증 받으신 분은 기존에 인증 받으신 이메일을 입력하시고 이용하시면 됩니다.</span><br/>--%>
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>처음 이용하시는 분은 아래의 <span class="text-bold">이메일 본인인증</span>을 눌러 간단한 인증절차만으로 이용하실 수 있습니다.</span>--%>

			</div>
			
			<%-- jjlim --%>
			<!-- <p style="margin: 50px; text-align: center;">
				<button class="btn btn-success" onclick="location.href='/login'">로그인 / 회원가입</button>
			</p> -->
			
			<!-- 로그인 방식 변경  2017.05.26-->
			<br>
			<div>
				<div class="form-group">
					<label for="username" class="col-md-1 control-label" style="margin-top: 7px;">Email</label>
					<div class="col-md-4">
						<input type="email" id="checkEmail" name="checkEmail" class="col-md-9 form-control" placeholder="amazoncar@amazoncar.co.kr"/>
						<div style="display: none;" id="email-error">
							<label class="errClass" for="checkEmail">이메일을 입력해주세요</label>
						</div>
						<div style="display: none;" id="email-error2">
							<label class="errClass" for="checkEmail">이메일 형식으로 입력해주세요</label>
						</div>
					</div>
					<div class="col-md-2" align="center">
						<button class="btn btn-success" id="btn_checkEmail" >견적내기</button>
					</div>
					<div class="login-social col-md-2" style="margin-top: -30px;">
						<table>
							<tr>
								<td colspan="3">
									<div class="text-center">소셜로그인</div>
								</td>
							</tr>
							<tr>
								<td width="47%" align="left">
									<div class="text-center">					
										<a onclick="FB_login();" style="cursor: pointer;">					
											<img class="login-social-image"	src="/resources/images/login_facebook.png" width="48" />
										</a> 
									</div>
								</td >
								<td width="6%"></td>
								<td width="47%">
									<div id="GG_login">
										<a onclick="GG_login()" style="cursor: pointer;">					
											<img class="login-social-image"	src="/resources/images/login_google.png" width="48" />
										</a>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-md-3">
					</div>						
				</div>
			</div>
			<!-- 로그인 방식 변경  끝-->
		</div>
		<div class="pre-auth-info" style="display: none;">
			<hr />
			인증 메일이 <span class="text-bold auth-email"></span>(으)로 전송되었습니다. 이메일을	확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.
		</div>
	</div>
</div>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">실시간 견적내기 및 상담요청</h2>
		<div class="process-item done">STEP 1:실시간 견적</div>
		<div class="process-item">STEP 2:상담 요청</div>
		<div class="process-item">STEP 3:상담 정보 확인</div>
	</div>
</div>
<div class="estimate-body">
	<div class="car-info">
		<table class="secondhand-info-table" style="height:80px;">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tr>
				<th colspan="4">차량선택</th>
			</tr>
			<tr>
				<td class="option-title">차량구분</td>
				<td colspan="3">
					<input type="radio" name="car-gubun" id="car-gubun-new">
					<label for="car-gubun-new">신차</label>
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="car-gubun" id="car-gubun-sh" value="car-gubun-sh" checked>
					<label for="car-gubun-sh">재렌트/재리스</label>
				</td>
			</tr>
			<tr class="last-row">
				<td class="option-title">희망차량</td>
				<td colspan="3">
					<input type="button" class="btn btn-default" value="차량선택" id="selectCarList">
					<input type="text" style="width:300px;height:33px;" disabled value="${data.CAR_JNM} ${data.CAR_NM}"/>
				</td>
			</tr>
		</table>
		<table class="secondhand-info-table">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="4">선택 차량 기본정보</th>
				</tr>
				<tr>
					<td class="option-title">제조사</td>
					<td colspan="3">${data.CAR_COMP_NM}</td>
				</tr>
				<tr>
					<td class="option-title">차명</td>
					<td colspan="3">${data.CAR_JNM}&nbsp;${data.CAR_NM}</td>
				</tr>
				<c:if test="${data.OPT ne null}">
					<tr>
						<td class="option-title">선택사양</td>
						<td colspan="3">${data.OPT}</td>
					</tr>
				</c:if>
				<tr>
					<td class="option-title">연료</td>
					<td>${data.FUEL_KD}</td>					
					<td class="option-title">배기량</td>
					<td>
						<c:if test="${data.DPM != null}">
							${data.DPM}cc
						</c:if>
					</td>
				</tr>
				<tr>
					<td class="option-title">신차등록일</td>
					<td>${data.INIT_REG_DT}</td>
					<td class="option-title">모델 연도</td>
					<td>
						<c:if test="${data.CAR_Y_FORM != null}">
							${data.CAR_Y_FORM}년 형
						</c:if>
					</td>
					
				</tr>
				<tr>
					<td class="option-title">주행거리</td>
					<td>
						<c:if test="${data.REAL_KM != null}">
							<fmt:formatNumber value="${data.REAL_KM}" pattern="#,###" />km
						</c:if>
					</td>
					<td class="option-title">색상</td>
					<td>${data.COLO}</td>
				</tr>
				<tr>
					<td class="option-title">신차가격</td>
					<td class="primary">
						<c:if test="${data.CAR_AMT != null}">
							<%-- <fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT}" pattern="#,###" />&nbsp;원 --%>
							<c:choose>
								<c:when test="${data.TAX_DC_AMT ne null && data.TAX_DC_AMT ne 0}">
									<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT - data.TAX_DC_AMT}" pattern="#,###"/>원 (개소세 감면후 차가)
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT}" pattern="#,###"/>원	
								</c:otherwise>
							</c:choose>
						</c:if>						
					</td>
					<td class="option-title">감가상각</td>
					<td class="primary">
						<c:if test="${estimateData.O_1 != null}">
							<%-- -<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT - estimateData.O_1}" pattern="#,###"/>&nbsp;원 --%>
							<c:choose>
								<c:when test="${data.TAX_DC_AMT ne null && data.TAX_DC_AMT ne 0}">
									-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT - estimateData.O_1 - data.TAX_DC_AMT}" pattern="#,###"/>원
								</c:when>
								<c:otherwise>
									-<fmt:formatNumber value="${data.CAR_AMT + data.OPT_AMT + estimateData.COL_AMT - estimateData.O_1}" pattern="#,###"/>원	
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
				<tr class="last-row">
					<td class="option-title">현재 차량가격</td>
					<td class="primary" colspan="3">
						<c:if test="${estimateData.O_1 != null}">
							<fmt:formatNumber value="${estimateData.O_1}" pattern="#,###" />&nbsp;원
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="car-option-table">
			<colgroup>
				<col width="17%"/>
				<col width="33%"/>
				<col width="17%"/>
				<col width="33%"/>
			</colgroup>
			<tbody>
				<tr>
					<th colspan="4">대여조건 선택</th>
				</tr>
				<tr>
					<td class="option-title">대여상품</td>
					<td>
						<select id="gubunSelectBox">
							<option value="22">장기렌트 기본식 (정비 미포함)</option>
							<option value="21">장기렌트 일반식(정비 포함)</option>
							<option value="12">리스 기본식(정비 미포함)</option>
							<option value="11">리스 일반식(정비 포함)</option>
						</select>
						<span class="foreign-info label label-warning" style="display:none;"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;수입차의 경우,일반식 상품 선택이 불가합니다</span>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td class="option-title">매입옵션</td>
					<td>
						<input type="text" id="sellingOption" value="있음" param="" disabled />
					</td>
					<td colspan="2">
						<span class="selling-info"></span> <!-- 동적으로 안내문구 넣어줌 -->
					</td>
				</tr>
				<tr>
					<td class="option-title">대여기간</td>
					<td>
						<input type="hidden" name="minMonth" id="minMonth" value="${minMonth}" />
						<select id="periodSelectBox" style="width:48%;" name="periodSelectBox">
							<option value="${data.MAX_USE_MON}" selected>${data.MAX_USE_MON}개월</option>
							<script>
								var maxMonth = parseInt($("#periodSelectBox option:first").val());
								var maxIdx = parseInt(maxMonth / 12);
								if(maxMonth % 12 == 0) {
									maxIdx = maxIdx - 1;
								}
								for (i = maxIdx; i > 0; i--) {
									var rowMonth = i * 12;
									if (Number(rowMonth) >= 12) {
										document.write("<option value='" + i * 12 + "'");
										document.write(">" + i * 12 + "개월</option>");
									}
								}
								
								/* if ($("#rs12").val()=='이용 불가' && $("#rs24").val()=='이용 불가') {
									if ($("#rs12").val()=='이용 불가') {										
										$("#periodSelectBox option[value='12']").remove();
									}
									if ($("#rs24").val()=='이용 불가') {										
										$("#periodSelectBox option[value='24']").remove();
									}
									if ($("#rs36").val()=='이용 불가') {										
										$("#periodSelectBox option[value='36']").remove();
									}
								}
								
								if ($("#rb12").val()=='이용 불가' && $("#rb24").val()=='이용 불가') {
									if ($("#rb12").val()=='이용 불가') {										
										$("#periodSelectBox option[value='12']").remove();
									}
									if ($("#rb24").val()=='이용 불가') {										
										$("#periodSelectBox option[value='24']").remove();
									}
									if ($("#rb36").val()=='이용 불가') {										
										$("#periodSelectBox option[value='36']").remove();
									}
								}
								
								if ($("#ls12").val()=='이용 불가' && $("#ls24").val()=='이용 불가') {
									if ($("#ls12").val()=='이용 불가') {										
										$("#periodSelectBox option[value='12']").remove();
									}
									if ($("#ls24").val()=='이용 불가') {										
										$("#periodSelectBox option[value='24']").remove();
									}
								}
								
								if ($("#lb12").val()=='이용 불가' && $("#lb24").val()=='이용 불가') {
									if ($("#lb12").val()=='이용 불가') {
										$("#periodSelectBox option[value='12']").remove();
									}
									if ($("#lb24").val()=='이용 불가') {										
										$("#periodSelectBox option[value='24']").remove();
									}
								} */
							</script>
							<option value="directInput">직접 입력</option>
						</select>
						<input type="text" name="periodSelectBox" id="directInputPeriod" style="width:48%;float:right;" disabled>
					</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td class="option-title">연간 약정운행거리</td>
					<td>
						<select id="agreeDistSelectBox" style="width:48%;" name="agreeDistSelectBox">
							<!-- script>
								for(i=2;i<=8;i++){
									document.write("<option value='"+i*5000+"'");
									document.write(">"+numberWithCommas(i*5000)+"km</option>");
								}
							</script -->
							<option value="10000" selected>10,000km</option>
							<option value="12000">12,000km</option>
							<option value="15000">15,000km</option>
							<option value="17000">17,000km</option>
							<option value="20000">20,000km</option>
							<option value="22000">22,000km</option>
							<option value="25000">25,000km</option>
							<option value="27000">27,000km</option>
							<option value="30000">30,000km</option>
							<option value="32000">32,000km</option>
							<option value="35000">35,000km</option>
							<option value="40000">40,000km</option>
							<option value="directInput">직접 입력</option>
						</select>
						<input type="text" name="agreeDistSelectBox" value="" style="width:48%;float:right;" disabled></input>
					</td>
					<td colspan="2" style='padding-left: 0px;'>
						<div style='display: flex;'>
							<div style='font-size: 13px;'>
								<span id="agree_view">
									※ 약정운행거리가 적을수록 대여요금이 저렴합니다.<br />
									<span id="region_coment_ts1">※ 약정운행거리는 1,000km 단위로 견적가능합니다.</span>
								</span>
							</div>
							<div style="cursor: pointer; margin-left: 5px;">
					      		<div style="border: 2px solid #f98460; background-color: #f98460; height: 30px; width: 200px; text-align: center; display: flex; justify-content: center; align-items: center;">
									<a class="minus_mileage" onclick="window.open('/single/minusMileage', 'minusMileagePop', 'height=800, width=850, left=280, top=200');" style="color: #f98460; font-size: 13px; color: #ffffff">약정이하 운행 시 Km당  대여료 환급</a>
								</div>
					       	</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="gubun-line"><hr/></td>
				</tr>				
				<tr>
					<td class="option-title">보증금</td>
					<td>
						<select id="depositSelectBox" class="percent-select-box" style="width:30%;">
							<script>
								for(i=0;i<=10;i++){
									document.write("<option value='"+i*5+"'");
									if(i == 5){
										document.write(" selected");
									}
									document.write(">"+i*5+"%</option>");
								}
							</script>
							<option value="directInput">금액직접입력</option>
						</select>
						<input type="text" id="depositAmt" class="percent-select-box" value='<fmt:formatNumber value="${estimateData.O_1 * 0.25}" pattern="#,###" />원' disabled style="width:63%;margin-left:13px;" />
					</td>
					<td colspan="2">
						<div>※ 보증금은 계약기간 만료 후 환불해 드립니다.<small>[보증금 100만원을 증액하면, 월대여료 5,500원(VAT포함)이 인하됩니다.(년리6.6%효과)]</small></div>						
					</td>
				</tr>
				<tr>
					<td class="option-title">선납금(선납대여료)</td>
					<td>
						<select id="preSelectBox" class="percent-select-box" style="width:30%;">
							<script>
								for(i=0;i<=10;i++){
									document.write("<option value='"+i*5+"'");
									document.write(">"+i*5+"%</option>");
								}
							</script>
							<option value="directInput">금액직접입력</option>
						</select>
						<input type="text" id="preAmt" value="0원" disabled style="width:63%;margin-left:13px;" class="percent-select-box" />
					</td>
					<td colspan="2">						
						<!-- <div style="margin-top: -22px;">※ 선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.</div> -->
						<div>※ 선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.</div>
					</td>					
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="2">
						<!-- <div style="margin-top: -25px;">※초기납입금(보증금 및 선납금)은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</div> -->
						<!-- <div style="margin-top: -55px;">※ 고객님의 신용도에 따라 최소 초기납입금(보증금 및 선납금) 규정이 있으며, 초기납입금은 아마존카와 협의를 통하여 보증보험 증권으로 대체 할 수 있습니다. 단, 보증보혐료는 고객부담이고, 초기납입금을 보증보험 증권으로 대체시 초기납입금의 이자효과가 적용되지 않아 월대여료가 상승됩니다.</div> -->
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td colspan="2">
						<!-- <div style="margin-top: -25px;">※초기납입금(보증금 및 선납금)은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</div> -->
						<div style="margin-top: -60px;">※ 고객님의 신용도에 따라 최소 초기납입금(보증금 및 선납금) 규정이 있으며, 초기납입금은 아마존카와 협의를 통하여 보증보험 증권으로 대체 할 수 있습니다.<br> 
							<small> 단, 보증보험료는 고객부담이고, 초기납입금을 보증보험 증권으로 대체시 초기납입금의 이자효과가 적용되지 않아 월대여료가 상승됩니다.</small>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="gubun-line"><hr/></td>
				</tr>
				<tr>
					<td class="option-title">운전자 연령</td>
					<td>
						<select id="driverAgeSelectBox">
							<option value="1" selected>만 26세 이상</option>
						</select>
					</td>
					<%-- <td colspan="2"></td> --%>
					<td rowspan="3" colspan="2">
						<span class="import-lease-info" style="display: none;"> 
							<!-- 좌측의 보험사항은 참고 선택 사항으로 수입차 리스의 경우<br />
							보험료 미포함 견적을 산출합니다.<br /> ※ 계약 진행 시 고객 할인할증율을 적용한 보험료를 산출,<br />대여료에
							합산하여 계약(수입차 리스) --> 
							<!-- <br />
							※ 운전자 연령 및 자차 면책금은 최종 심사 후 조정 될 수 있습니다. -->
						</span>
						<span id="acarText"></span>
					</td>
				</tr>
				<tr>
					<td class="option-title">대물배상</td>
					<td>
						<select id="insureUnitSelectBox">
							<option value="2" selected>1억원</option>
							<option value="4">2억원</option>
							<option value="8">3억원</option>
						</select>
					</td>
					<%-- <td colspan="2"></td> --%>
				</tr>
				<tr>
					<td class="option-title">자차 면책금</td>
					<td>
						<select id="carJaSelectBox">
							<c:choose>
								<c:when test="${fn:substring(data.CAR_COMP_ID,2,4) <= 5}">
									<option value="300000">300,000원</option>
									<!-- <option value="200000">200,000원</option> --><!-- 20180918 -->
								</c:when>
								<c:otherwise>
									<option value="500000" class="import">500,000원</option>
								</c:otherwise>
							</c:choose>
						</select>
					</td>
					<td colspan="2"></td>
				</tr>
			</tbody>
		</table>
		<div class="text-right" style="width:1018px;">
			<button type="button" class="calculate-btn" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> 견적 진행 중">견적 계산하기</button>
		</div>
		<table class="car-price-table">
			<col width="15%"/>
			<col width="30%"/>
			<col width="18%"/>
			<col width="43%"/>
			<tbody>
				<tr>
					<th colspan="2">월 대여료(실시간 최종 견적)</th>
					<th colspan="2">
					<small class="bold minus-info" style="color: red; display: none;"><br>&nbsp;
						※월 대여료는 음수값이 나오면 안됩니다.(보증금 및 선납금 확인 후 견적내기 필요)</small>
					</th>
				</tr>
				<tr>
					<td class="option-title">대여기간</td>
					<td id="rentPeriod" class="estimate-price"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" style="height:30px;"><hr/></td>
					<td colspan="2"></td>
				</tr>				
				<tr>
					<td class="option-title" class="estimate-price">공급가</td>
					<td id="supplyFee" class="estimate-price"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td class="option-title">부가세</td>
					<td id="vatFee" class="estimate-price"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td class="option-title" style="height:60px;vertical-align:top;padding-top:10px;">월 대여료</td>
					<td style="height:60px;vertical-align:top;">
						<div class="total-price"></div> 
					</td>
					<td colspan="2"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="estimate-footer">
	<button type="button" id="print_btn" class="print-btn">견적서 보기</button>
	<button type="button" id="send_btn" class="submit-btn">상담 요청하기</button>
	<div style="text-align: left; padding-top: 30px; float: right;">
		<span style="font-weight: bold; font-size: 15px; letter-spacing: 0.5px;">
			※ 고객님께서 내신 견적을 저장하여 다시 보고싶거나 상담요청한 내역을 확인하고 싶으면 홈페이지 우측 상단의 로그인 화면에서 간편하게
		</span><br>
		<span style="font-weight: bold; font-size: 15px; letter-spacing: 0.5px; padding-left: 18px;">
			이메일 계정만 등록하고 사용하시면 됩니다.
		</span>
	</div>
</div>
<div class="loaderLayer" id="loader">
	<div class="loader" id="loaderContent"></div>
</div>
</t:blankpage>
