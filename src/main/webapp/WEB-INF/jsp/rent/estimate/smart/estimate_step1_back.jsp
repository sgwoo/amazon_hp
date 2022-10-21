<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!-- <link rel="stylesheet" href="/resources/stylesheets/login.css"/> -->
<t:blankpage>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css" />
<script src="/resources/js/esti-smart.js"></script>
<script src="/resources/js/esti-common.js"></script>
<script src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/jsp/common/login-modal.jsp"%> <!-- 로그인 모달 -->
<%@include file="/WEB-INF/jsp/common/register-modal.jsp"%> <!-- 회원가입 모달 -->
<!-- 구글 소셜로그인 연동 -->
<meta name="google-signin-client_id" content="87064886185-9k4to29khedjjpa71638ombcphn2754c.apps.googleusercontent.com"></meta>
<script src="https://apis.google.com/js/client:platform.js"></script>
<script>
//모바일 리다이렉트
if (navigator.userAgent.match(/iPhone/) || navigator.userAgent.match(/iPad/) || navigator.userAgent.match(/Android/)) {
	location.replace("https://www.amazoncar.co.kr/home/mobile/smart_esti.jsp");
}
//신차 공식
function changeSellingOption(){
	var fuelCode = $("#fuelCode").val();
	var gubun = $('#gubunSelectBox option:selected').val();
	var gubun2 = gubun.substr(1,1);
	var period = $("#periodSelectBox option:selected").val();
	
	//재렌트 공식
	if(gubun2 == "1"){ //일반식이면
		$("#sellingOption").val("없음");
		$("#sellingOption").attr("param","0");
		$(".selling-info").text("※일반식(정비 포함) 상품에는 매입옵션이 주어지지 않습니다.");
	}else{ 		
		$("#sellingOption").attr("param","1");
		$("#sellingOption").val("있음");
		$(".selling-info").text("※ 매입옵션 유무에 따른 대여요금 변동이 없습니다. ");
	}	
}

$(document).ready(function(){
	
	//로그인시 부모창 리로드
	/* if($("#loginEmail").val() != null && $("#loginEmail").val() != ""){
		//opener.location.reload();		//<-- IE에서 location객체를 인식못해서 스크립트에러 발생. 주석처리.
		//window.opener.parent.location.reload();
	} else {
		alert("로그인이 필요한 서비스 입니다.");
		opener.parent.location="/login";
		window.close();
	} */
	
	// jjlim 인증 방식 변경
	if ($("#loginEmail").val() == null || $('#loginEmail').val() === undefined || $('#loginEmail').val() === '') {
	    $('body').css("overflow", "hidden");
	    //$('.pre-check-modal').show()
	    alert("로그인이 필요한 서비스 입니다.");
		//opener.parent.location="/login";
		opener.parent.location.reload();
		//opener.parent.location=$("#from_page").val();
		window.close();
	}
//	var loginEmail = $.cookie("estEmail");
//	if(loginEmail == null){
//		//처음에는 스크롤바 금지
//		$('body').css("overflow","hidden");
//		$('.pre-check-modal').show();
//	}else{
//		$("#loginEmail").val(loginEmail);
//	}
	
	//기본적으로 차량 선택 사항 내용 숨김 
	$(".car-option-table tr[class!='header'],.car-price-table tr[class!='header']").hide();
	$('.calculate-btn, .submit-btn, .print-btn').hide();
	
	//디테일에서 넘어왔으면
	if($("#carCompId").val() != null && $("#carCompId").val() != ""){
		setDefaultInfo();
	}else{
		setCountry("1");
	}
	
	//전기차일 경우 보증금 선택입력시 최대값 계산을 위한 변수 선언
	var ecar_0_yn = '';
	var ecar_1_yn = '';
	var ecar_2_yn = '';
	var ecar_3_yn = '';
	var ecar_4_yn = '';
	var ecar_5_yn = '';
	var ecar_6_yn = '';
	var ecar_7_yn = '';
	var ecar_8_yn = '';
	var ecar_9_yn = '';
	var ecar_0_amt = '';
	var ecar_1_amt = '';
	var ecar_2_amt = '';
	var ecar_3_amt = '';
	var ecar_4_amt = '';
	var ecar_5_amt = '';
	var ecar_6_amt = '';
	var ecar_7_amt = '';
	var ecar_8_amt = '';
	var ecar_9_amt = '';
	
	//국산, 수입 변경할 때마다 제조사 변경하기
	$('#countrySelectBox').change(function(){		
		var value = $(this).find("option:selected").val();
		setCountry(value);
	})
	
	//제조사 선택 시 차명 데이터 갖고 오기
	$('#compSelectBox').change(function(){
		var value = $('#compSelectBox option:selected').val();
		setCarName(value);
		$('.selectedCarDetail').val("");
		$("#carCode").val("");
		$("#carId").val("");
	})
	
	//차명 선택 시 차종 데이터 갖고 오기 
	$('.carNameSelectBox').change(function(){
		$('.selectedCarDetail').val(""); //이미 선택된게 있으면 text 초기화
		var carCode = $('.carNameSelectBox option:selected').val();
		initAmt();
		setCarDetail(carCode);
		$("#totalDisplayAmt-info").hide();
	})
	
	/* 부트스트랩 모달 특성상 event 바인딩하고나면 해제도 해줘야함.. 안그러면 두번 실행됨..*/
	$('#detail-modal').on('shown.bs.modal', function (e) {
		$('span.detail-link').click(function(){ //사양보기 클릭 시 사양 나타남
			$(this).parents("tr").next().toggle();
		})
		
		$('td.title').click(function(){ //차종 명 선택 시 
			
			$('.selectedCarDetail').attr("id",$(this).attr("id"));
			$('.selectedCarDetail').val($(this).text());			
			//견적 계산을 위해 차량 기본 정보 셋팅
			var carSeq = $(this).parents("tr").attr("id");
			var carId = $(this).attr("id");
			var carAmt = $(this).next().text().replace("원","").replace(/,/g,"");
			var carName = $(this).text();
			
			$(".carAmt").text($(this).next().text());
			
			$.when(setCarInfo(carSeq, carId, carName, carAmt)).done(function(){				
				var message = calculateFinalAmt();
				//alert(message);
			});			
			$("#displayCarName").text($('.carNameSelectBox option:selected').text() + " " + carName);
			
			//jg_tuix_st 값 세팅(2017.07.07)
			var jg_tuix_st = $(this).next().next().attr("id");	
			if(jg_tuix_st == "Y"){
				$("#jg_tuix_st").val(jg_tuix_st);				
			}else{
				$("#jg_tuix_st").val("");
			}
			
			$('#detail-modal').modal('hide'); //모달창 닫기
		})
	})	
	
	/* 이벤트 언바인드 하는 jQuery */
	$('#detail-modal').on('hidden.bs.modal',function(e){
		$('span.detail-link').unbind("click");
		$('td.title').unbind("click");
	})

	//견적 계산하기 버튼 클릭 시 
	$('.calculate-btn').click(function(){
		
		//전기차는 대여기간이 24개월 이상일 시에만 견적내기 가능
		var period = $("#periodSelectBox option:selected").val();
		var ecarFlag = $("#ecarFlag").val();		
		if(ecarFlag == '3' && period < 24){//전기차는 대여기간이 24개월 이상일 시에만 견적내기 가능			
			alert("전기차의 대여 기간은 최소 24개월 이상이어야 합니다");
			return false; 
		}
		//고객주소지 변경시 최대보증금 새로 세팅(20180820)
		set_max_deposit_amt();
		
		// jjlim
        var email = $('#loginEmail').val();
		//var email = $.cookie("estEmail");
		
		var insertFlag = insertFormData();
		if(insertFlag){
			$(this).button('loading');
			$(this).prop("disabled",true); //계산하는 중에 중복 견적 방지
			
			//form 데이터를 json object 형태로 변환
			var data = $("#calculateFrm").serialize(); 
			
			//data = decodeURIComponent((data + '').replace(/w+/g,'%20')).split("&"); //한글 깨짐 처리
			var rule = '/\w/g';
		    data = decodeURIComponent((data + '').replace(rule,'%20')).split("&"); //한글 깨짐 처리 
			
			var obj = {};
			for(var key in data){
				obj[data[key].split("=")[0]] = data[key].split("=")[1];
			}
					
			var jg_opt_st = $("#jg_opt_st").val();			
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				data:JSON.stringify(obj),
				url:'/calculate',
				type:'POST',
				success:function(response){
					alert("견적 계산이 완료되었습니다");
					setEstimateInfo(response);								
					$("#initValue").prop("selected", "selected");
					$("#buyText").val("");
					$("#buyPrice").val(response.roAmt.replace(/,/g,""));
					
				},
				error:function(request,status,error){
					alert(response.message);
				},
				complete:function(response){
					$('.calculate-btn').prop("disabled",false);
					$('.calculate-btn').button('reset');
				}
			});	
		}
	})
	
	// 화면 load시 운전자 연령과 자차면책금 값에 따른 초기 셋팅
	var ageSelectValue = $('#driverAgeSelectBox').val();
	var carJaSelectValue = $('#carJaSelectBox').val();
	
	if (ageSelectValue == "2" || ageSelectValue == "3") {		
		$('#acar_age').show();
	} else {
		$('#acar_age').hide();
	}
	
	if (carJaSelectValue == "200000") {		
		$('#acar_price').show();
	} else {
		$('#acar_price').hide();
	}
		
	// 대여상품 선택시 출력되는 문구
	$('#gubunSelectBox').change(function(){
		var gubunSelectValue = $('#gubunSelectBox').val();
		var carCreateCompValue = $('#countrySelectBox').val();
		
		var ageSelectValue = $('#driverAgeSelectBox').val();
		var carJaSelectValue = $('#carJaSelectBox').val();
		
		//$("#txtBox").is(":disabled");
		
		if (gubunSelectValue == "11" || gubunSelectValue == "12") {
			if (carCreateCompValue == "2") {
				$('#acar_age').hide();
				$('#acar_price').hide();
			}			
		} else {
			if (ageSelectValue == "2" || ageSelectValue == "3") {			
				$('#acar_age').show();
				$('#acar_price').css('padding-top', '80px');
			} else {
				$('#acar_age').hide();
				$('#acar_price').css('padding-top', '100px');
			}
			
			if (carJaSelectValue == "200000") {
				$('#acar_price').show();
			} else {
				$('#acar_price').hide();
			}
		}
	})
	
	// 운전자 연령 선택 변경시 출력되는 문구
	$('#driverAgeSelectBox').change(function(){
		var gubunSelectValue = $('#gubunSelectBox').val();
		var carCreateCompValue = $('#countrySelectBox').val();
		
		var ageSelectValue = $('#driverAgeSelectBox').val();
		var carJaSelectValue = $('#carJaSelectBox').val();
		
		//$("#txtBox").is(":disabled");
		
		if (gubunSelectValue == "11" || gubunSelectValue == "12") {
			if (carCreateCompValue == "2") {
				$('#acar_age').hide();
				$('#acar_price').hide();
			} else {
				if (ageSelectValue == "2" || ageSelectValue == "3") {			
					$('#acar_age').show();
					$('#acar_price').css('padding-top', '80px');
				} else {
					$('#acar_age').hide();
					$('#acar_price').css('padding-top', '100px');
				}
				
				if (carJaSelectValue == "200000") {
					$('#acar_price').show();
				} else {
					$('#acar_price').hide();
				}
			}			
		} else {
			if (ageSelectValue == "2" || ageSelectValue == "3") {			
				$('#acar_age').show();
				$('#acar_price').css('padding-top', '80px');
			} else {
				$('#acar_age').hide();
				$('#acar_price').css('padding-top', '100px');
			}
			
			if (carJaSelectValue == "200000") {
				$('#acar_price').show();
			} else {
				$('#acar_price').hide();
			}
		}
	})
	
	// 자차 면책금 선택 변경시 출력되는 문구
	$('#carJaSelectBox').change(function(){
		var gubunSelectValue = $('#gubunSelectBox').val();
		var carCreateCompValue = $('#countrySelectBox').val();
		
		var ageSelectValue = $('#driverAgeSelectBox').val();
		var carJaSelectValue = $('#carJaSelectBox').val();
		
		//$("#txtBox").is(":disabled");
		
		if (gubunSelectValue == "11" || gubunSelectValue == "12") {
			if (carCreateCompValue == "2") {
				$('#acar_age').hide();
				$('#acar_price').hide();
			} else {
				if (ageSelectValue == "2" || ageSelectValue == "3") {			
					$('#acar_age').show();
					$('#acar_price').css('padding-top', '80px');
				} else {
					$('#acar_age').hide();
					$('#acar_price').css('padding-top', '100px');
				}
				
				if (carJaSelectValue == "200000") {
					$('#acar_price').show();
				} else {
					$('#acar_price').hide();
				}
			}
		} else {
			if (ageSelectValue == "2" || ageSelectValue == "3") {			
				$('#acar_age').show();
				$('#acar_price').css('padding-top', '80px');
			} else {
				$('#acar_age').hide();
				$('#acar_price').css('padding-top', '100px');
			}
			
			if (carJaSelectValue == "200000") {
				$('#acar_price').show();
			} else {
				$('#acar_price').hide();
			}
		}
	})
	
	/* 견적서 보기 클릭 시 */
	$('.print-btn').click(function(){
		
		var agreeDist = checkAgreeDistValue();
		var id = $('#estimateId').val();
		var ecarFlag = $("#ecarFlag").val()||0; //친환경차가 아닌 경우 0으로 리턴
		var carIncome = $("#countrySelectBox").val();
		
		if(id == "" || id == null){
			alert("먼저 견적을 계산하셔야 합니다");	
		}else{
			var url = "/smart/print?estimateId=" + id + "&agreeDist=" + agreeDist + "&ecarFlag=" + ecarFlag + "&carIncome=" + carIncome;
			
			window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");	
		}
	})
	
	//상담 요청하기 클릭 시
	$('.submit-btn').click(function(){
		//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
		/* alert("현재, 서버 정비작업으로 인해 상담 요청이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false; */
		
		var id = $('#estimateId').val();
		if(id == "" || id == null){
			alert("먼저 견적을 계산하셔야 합니다");	
		}else{
		    //폼 셋팅
			$('#companyName').val($('#compSelectBox option:selected').text()); //제조사명 셋팅
			$('#carName').val($('.carNameSelectBox option:selected').text()); //차명 셋팅
			$('#carDetailName').val($('.selectedCarDetail').val()); //차종 셋팅
			$('#step2Form').submit();
		} 
	})
	
	//인수가 조정 버튼 클릭 시 
	$(".re-cal-btn").click(function(){
		if($("#chk_change_opt").val()=='1'){
			alert("바뀐 대여조건이 있습니다. 견적내기를 이용해주세요.");		return;
		}
		if($("#buyOption").val()==""){
			alert("매입옵션(인수가) 조정 > 선택창을 선택해주세요.");		return;
		}
		var totalAmt = parseInt($("#totalAmt").val());
		
	//	var roAmt = parseInt($(".ecar-selling-area input").val().replace(/,/g,"").replace("원",""));
		var roAmt = parseInt($(".view_sellingOpt_on input").val().replace(/,/g,"").replace("원",""));
		var roPer =  roAmt / totalAmt * 100;
		var regCode = $("#estRegCode").val();
		var estimateId = $("#estimateId").val();
		
		var data = {"roPer":roPer,"roAmt":roAmt,"regCode":regCode,"estimateId":estimateId};
		
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			data:JSON.stringify(data),
			url:'/recalculate',
			type:'POST',
			success:function(response){
				alert("견적 계산이 완료되었습니다");
				setEstimateInfo(response);
			},
			error:function(request,status,error){
				alert(response.message);
			},
			complete:function(response){
				$('.calculate-btn').prop("disabled",false);
				$('.calculate-btn').button('reset');
			}
		});	
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
	<!-- DC start -->
	<input type="hidden" id="car_d_per" value="0" />
	<input type="hidden" id="car_d_p" value="0" />
	<input type="hidden" id="car_d_p2" value="0" />
	<input type="hidden" id="car_d_per_b" value="0" />
	<input type="hidden" id="car_d_per_b2" value="0" />
	<input type="hidden" id="ls_yn" value="0" />
	<!-- DC end -->
	<input type="hidden" value="${estimateData.CONTI_RAT}"
		id="originContiRat" />
	<input type="hidden" value="${paramData.foreignFlag}" id="foreignFlag" />
	<input type="hidden" value="${paramData.gubun}" id="gubun-detail" />
	<input type="hidden" value="${paramData.period}" id="period-detail" />
	<input type="hidden" value="${paramData.agreeDist}"
		id="agreeDist-detail" />
	<form id="printForm">
		<input type="hidden" value="" name="estimateId" id="estimateId" /> 
		<input type="hidden" id="ecarFlag" name="ecarFlag" />
		<!-- 친환경 차량 여부 -->
	</form>
	<form id="step2Form" method="post" action="/estimate/smart/step2">
		<input type="hidden" value="" name="estRegCode" id="estRegCode" /> 
		<input type="hidden" value="" name="companyName" id="companyName" /> 
		<input type="hidden" value="신차" name="carGubun" id="carGubun" /> 
		<input type="hidden" value="${paramData.carName}" name="carName" id="carName" /> 
		<input type="hidden" value="${paramData.carDetailName}" name="carDetailName" id="carDetailName" /> 
		<input type="hidden" value="" name="carDiesel" id="carDiesel" />
	</form>
	<form id="calculateFrm" method="post" action="/calculate/smart">

		<%-- jjlim --%>
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<input type="hidden" name="loginEmail" id="loginEmail" value="" />
		</sec:authorize>		
		<%--<input type="hidden" name="loginEmail" id="loginEmail" value="" />--%>

		<!-- hidden response Param -->
		<input type="hidden" value="${paramData.carAmt}" name="carAmt" id="carAmt" /> 
		<input type="hidden" value="${paramData.carAmt}" name="totalAmt" id="totalAmt" /> 
		<input type="hidden" value="${estimateData.CONTI_RAT}" name="contiRat" id="contiRat" />
		<!-- 연비 -->
		<input type="hidden" value="${paramData.carCompId}" name="carCompId" id="carCompId" /> 
		<input type="hidden" value="${paramData.carId}" name="carId" id="carId" /> 
		<input type="hidden" value="${paramData.carCode}" name="carCode" id="carCode" /> 
		<input type="hidden" value="${paramData.carSeq}" name="carSeq" id="carSeq" />
		<input type="hidden" value="" name="stdAgreeDist" id="stdAgreeDist" />

		<!-- hidden request Param -->
		<input type="hidden" value="${estimateData.CAR_AMT}" name="o_1"	id="o_1" /><!-- 차량가격(옵션 total) -->
		<input type="hidden" value="" name="optSeq" id="optSeq" /><!-- 옵션아이디 -->
		<input type="hidden" value="" name="optName" id="optName" /><!-- 옵션이름 -->
		<input type="hidden" value="0" name="optAmt" id="optAmt" /><!-- 옵션총액 -->
		<input type="hidden" value="" name="colorId" id="colorId" /><!-- 외장색상 -->
		<input type="hidden" value="" name="colorName" id="colorName" /><!-- 외장색상 -->
		<input type="hidden" value="0" name="colorAmt" id="colorAmt" /><!-- 외장색상 -->
		<!-- <input type="hidden" value="" id="colorId_in"/> --><!-- 내장색상 -->
		<input type="hidden" value="" name="colorName_in" id="colorName_in" /><!-- 내장색상 -->
		<input type="hidden" value="" name="a_a" id="a_a" /><!-- 상품 구분 -->
		<input type="hidden" value="" name="a_b" id="a_b" /><!-- 대여기간 -->
		<input type="hidden" value="7" name="a_h" id="a_h" /><!-- 차량인도지역 -->
		<input type="hidden" value="" name="optChk" id="optChk" /><!-- 매입옵션 -->
		<input type="hidden" value="" name="agreeDist" id="agreeDist" /><!-- 주행거리 -->
		<input type="hidden" value="" name="rg_8" id="rg_8" /><!--보증금 비율 -->
		<input type="hidden" value="0" name="rg_8_amt" id="rg_8_amt" /><!--보증금 총액 -->
		<input type="hidden" value="" name="pp_per" id="pp_per" /><!-- 선납금 비율 -->
		<input type="hidden" value="0" name="pp_amt" id="pp_amt" /><!-- 선납금 총액 -->
		<input type="hidden" value="0" name="gi_per" id="gi_per" /><!-- 보증보험 비율 -->
		<input type="hidden" value="0" name="gi_amt" id="gi_amt" /><!-- 보증보험 총액 -->
		<input type="hidden" value="0" name="gi_yn" id="gi_yn" /> 
		<input type="hidden" value="" name="ins_dj" id="ins_dj" /><!-- 대물 자손-->
		<input type="hidden" value="" name="car_ja" id="car_ja" /><!-- 자차면책금 -->
		<input type="hidden" value="" name="loc_st" id="loc_st" /><!-- 차량인도지역 -->
		<input type="hidden" value="" name="ins_age" id="ins_age" /><!-- 운전자 연령 -->
		<input type="hidden" value="" name="tint_s_yn" id="tint_s_yn" /><!-- 전면 썬팅 -->
		<input type="hidden" value="" name="tint_n_yn" id="tint_n_yn" /><!-- 거치형 네비게이션 -->
		<input type="hidden" value="" name="tint_eb_yn" id="tint_eb_yn" /><!-- 이동형 충전기 -->
		<input type="hidden" value="2" name="spr_yn" id="spr_yn" /><!-- 신차는 초우량기업인 2, 재리스는 우량기업인  1 -->
		<input type="hidden" value="1" name="ins_per" id="ins_per" /> 
		<input type="hidden" value="2016006" name="regId" id="regId" /> 
		<input type="hidden" value="0" name="dcAmt" id="dcAmt" /> 
		<input type="hidden" value="0" name="ecarLoc" id="ecarLoc" /><!-- 전기차 고객주소지 -->
		<input type="hidden" value="0" name="taxAmt" id="taxAmt" /><!-- 개소세 -->
		<input type="hidden" value="0" name="roPer" id="roPer" /><!-- 조정잔가율 -->
		<input type="hidden" value="0" name="roAmt" id="roAmt" /><!-- 조정잔가 -->
		<input type="hidden" value="0" name="originRoAmt" id="originRoAmt" />
		<input type="hidden" value="" name="jg_opt_st" id="jg_opt_st" /><!-- 옵션 잔가 -->
		<input type="hidden" value="" name="jg_col_st" id="jg_col_st" /><!-- 색상 잔가 -->
		<input type="hidden" value="" id="buyPrice" /><!-- 매입옵션 가격을 담기위한 파라미터 -->
		<input type="hidden" value="" name="jg_tuix_st" id="jg_tuix_st" /><!-- jg_tuix_st 값 세팅(2017.07.07) -->
		<input type="hidden" value="" name="jg_tuix_opt_st" id="jg_tuix_opt_st" /><!-- jg_tuix_opt_st 값 세팅(2017.07.07) -->
		<input type="hidden" value="" name="car_etc" id="car_etc" />
		<input type="hidden" value="" name="dc_bigo" id="dc_bigo" />
		<input type="hidden" value="" name="print_type" id="print_type">
	</form>
	<!-- 옵션 선택시 마다 개별소비세 감면액 변경을 위한 세팅-->
	<input type="hidden" id="jg_w" value="">	
	<input type="hidden" id="jg_g_7" value="">
	<input type="hidden" id="jg_g_8" value="">
	<input type="hidden" id="jg_2" value="">
	<input type="hidden" id="jg_3" value="">
	<input type="hidden" id="jg_3re" value="">
	<input type="hidden" id="sh_code" value="">
	<input type="hidden" id="jg_g_15" value="">
	<input type="hidden" id="carAmtRe" value="0">
	
	<!-- 대여상품에 따른 제조사dc 데이터 세팅 -->
	<input type="hidden" id="rentDcAmt" value="0">
	<input type="hidden" id="leaseDcAmt" value="0">	
	
	<!-- 전기차일때 최대 보증금 세팅을 위한 변수 -->
	<input type="hidden" id="ecar_0_yn" value="">
	<input type="hidden" id="ecar_1_yn" value="">
	<input type="hidden" id="ecar_2_yn" value="">
	<input type="hidden" id="ecar_3_yn" value="">
	<input type="hidden" id="ecar_4_yn" value="">
	<input type="hidden" id="ecar_5_yn" value="">
	<input type="hidden" id="ecar_6_yn" value="">
	<input type="hidden" id="ecar_7_yn" value="">
	<input type="hidden" id="ecar_8_yn" value="">
	<input type="hidden" id="ecar_9_yn" value="">
	<input type="hidden" id="ecar_0_amt" value="">
	<input type="hidden" id="ecar_1_amt" value="">
	<input type="hidden" id="ecar_2_amt" value="">
	<input type="hidden" id="ecar_3_amt" value="">
	<input type="hidden" id="ecar_4_amt" value="">
	<input type="hidden" id="ecar_5_amt" value="">
	<input type="hidden" id="ecar_6_amt" value="">
	<input type="hidden" id="ecar_7_amt" value="">
	<input type="hidden" id="ecar_8_amt" value="">
	<input type="hidden" id="ecar_9_amt" value="">
	<input type="hidden" id="ecar_pur_sub_amt" value="">
	<!-- 전기차/수소차 인수가조정견적내기 위한 체크 -->
	<input type="hidden" id="chk_change_opt" value="0">
	
	<div class="pre-check-modal" style="display: none">
		<div class="pre-check-content">
			<div class="pre-check-opening">
				<h4>실시간 견적내기</h4>
				<div class="pre-check-box">
				<br>
					<%-- jjlim --%>
					<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">이메일 주소</span>만으로 실시간 견적이 가능합니다.<br/>
					<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span style="font-weight: bold;">소셜 로그인</span>을 이용하시면 더욱 편리합니다.<br/>
					<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>이메일 주소 입력이나 소셜로그인으로 실시간견적 가능합니다.</span><br/> --> 
					<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>회원가입 후 누구나 모든 차종의 실시간 견적 및 월렌트 예약이 가능합니다.</span> -->
					<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>인증 받으신 분은 기존에 인증 받으신 이메일을 입력하시고 이용하시면 됩니다.</span><br/>--%>
					<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>처음 이용하시는 분은 아래의 <span class="text-bold">이메일 본인인증</span>을 눌러 간단한 인증절차만으로 이용하실 수 있습니다.</span>--%>

				</div>
				
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
						<div class="login-social col-md-2" style="margin-top: -40px;">
							<table>
								<tr>
									<td colspan="2">
										<div class="text-center">소셜로그인</div>
									</td>
								</tr>
								<tr>
									<td width="20%" align="left">
										<div class="text-center" style="margin-left: 33px;">					
											<a onclick="FB_login();" style="cursor: pointer;">					
												<img class="login-social-image"	src="/resources/images/login_facebook.png" width="48" />
											</a> 
										</div>
									</td >
									<td width="80%">
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
				
				<%--<table style="width:630px" class="text-center" class="auth-table">--%>
				<%--<colgroup>--%>
				<%--<col width="20%"/>--%>
				<%--<col width="30%"/>--%>
				<%--<col width="25%"/>--%>
				<%--<col width="25%"/>--%>
				<%--</colgroup>--%>
				<%--<tr>--%>
				<%--<td>이메일</td>--%>
				<%--<td><input type="text" id="authEmail" name="authEmail" class="form-control" style="width:300px;"></td>--%>
				<%--<td><button type="button" class="btn btn-default-reverse pre-esti-btn">실시간 견적</button></td>--%>

				<%--&lt;%&ndash; jjlim &ndash;%&gt;--%>
				<%--<td><button type="button" class="btn btn-default" onclick="location.href='/login'">이메일 회원가입</button></td>--%>
				<%--&lt;%&ndash;<td><button type="button" class="btn btn-default pre-auth-btn">이메일 본인인증</button></td>&ndash;%&gt;--%>

				<%--</tr>--%>
				<%--</table>--%>

			</div>
			<div class="pre-auth-info" style="display: none;">
				<hr />
				인증 메일이 <span class="text-bold auth-email"></span>(으)로 전송되었습니다. 이메일을
				확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.
			</div>
		</div>
	</div>
	<div class="estimate-header">
		<div class="process-tab">
			<h2 class="primary">실시간 견적내기 및 상담 요청</h2>
			<div class="process-item done">STEP 1:실시간 견적</div>
			<div class="process-item">STEP 2:상담 요청</div>
			<div class="process-item">STEP 3:상담 정보 확인</div>
		</div>
	</div>
	<div class="estimate-body">
		<div class="car-info">
			<table class="smart-info-table">
				<colgroup>
					<col width="17%" />
					<col width="38%" />
					<col width="15%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">차량 선택</th>
					</tr>
					<tr>
						<td>차량 구분</td>
						<td colspan="3"><input type="radio" name="car-gubun"
							id="car-gubun-new" checked> <label for="car-gubun-new">신차</label>
							&nbsp;&nbsp;&nbsp; <input type="radio" name="car-gubun"
							id="car-gubun-sh"> <label for="car-gubun-sh">재렌트/재리스</label>
						</td>
					</tr>
					<tr>
						<td>제조사</td>
						<td><select id="countrySelectBox" style="width: 35%;">
								<option value="1">국산</option>
								<option value="2">수입</option>
						</select> <select id="compSelectBox" style="width: 60%; float: right;">
								<option value="0">선택하세요</option>
								<c:forEach var="compData" items="${compList}" varStatus="status">
									<c:if test="${compData.APP_ST eq 1}">
										<option value="${compData.CODE}" class="domestic">${compData.NM}</option>
									</c:if>
									<c:if test="${compData.APP_ST eq 2}">
										<option value="${compData.CODE}" class="import"
											style="display: none;">${compData.NM}</option>
									</c:if>
								</c:forEach>
						</select></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>차명</td>
						<td>
							<select class="carNameSelectBox">
								<option value="0" disable>제조사를 먼저 선택하세요</option>
							</select>
						</td>
						<td colspan="2" style="padding-left: 0px;">
							<button type="button" class="btn btn-default-reverse modal-btn"	data-toggle="modal" data-target="#detail-modal"	style="float: left">차종 선택</button> 
							<input type="text" disabled	style="width: 50%; height: 33px; float: left; margin-left: 14px;" class="selectedCarDetail" />
						</td>
					</tr>
					<tr class="carInfo-row">
						<td>선택차량</td>
						<td><span class="primary bold" style="font-size: 17px;"	id="displayCarName"></span></td>
						<td class="text-right"><span class="carAmt bold">0원</span></td>
						<td></td>
					</tr>
					<!-- 옵션 테이블은 동적 생성한다 (esti-smart.js > setCarOption() 참고)-->
					<tr>
						<td>색상</td>
						<td id="colorText" style="padding-left: 20px !important;"></td>
						<td class="text-right bold">
						(<span id="colorAmt-display" class="bold">0원</span>)
						</td>
						<td>
							<span id="color-jg-name"></span>
							<span id="color-jg-info" style="display: none;"></span>
							<!-- <span id="color-jg-info" style="display: none;"> 선택시 중고차 잔존가치가 높아지기 때문에 월대여료가 소폭 인하됩니다.</span> -->
						</td>
					</tr>
					<tr class="dcAmt-row" style="display: none;">
						<td>제조사 D/C</td>
						<td colspan="2" class="text-right">-<span id="displayDcAmt"
							class="bold">0 원</span></td>
						<td></td>
					</tr>
					<tr class="tax-row" style="display: none;">
						<td>개별소비세 감면액</td>
						<td colspan="2" class="text-right">-<span
							id="displayTaxDcAmt" class="bold">0 원</span></td>
						<td></td>
					</tr>
					<tr class="last-row">
						<td></td>
						<td class="text-right bold" style="font-size: 17px;">차량가격</td>
						<td class="text-right" style="font-size: 17px;"><span
							id="totalDisplayAmt" class="bold">0원</span></td>
						<td style="padding: 0px 0px 0px 12px;"><span
							id="totalDisplayAmt-info"> ( <span>제조사 D/C</span> <span>&nbsp;및&nbsp;</span>
								<span>개별소비세 감면액</span> 반영 후 가격 )
						</span></td>
					</tr>
				</tbody>
			</table>
			<table class="car-option-table">
				<colgroup>
					<col width="17%" />
					<col width="33%" />
					<col width="17%" />
					<col width="33%" />
				</colgroup>
				<tbody>
					<tr class="header">
						<th colspan="4">대여조건 선택</th>
					</tr>
					<tr>
						<td>대여상품</td>
						<td><select id="gubunSelectBox" onchange="javascript:set_max_deposit_amt();">
								<option value="22">장기렌트 기본식 (정비 미포함)</option>
								<option value="21">장기렌트 일반식(정비 포함)</option>
								<option value="12">리스 기본식(정비 미포함)</option>
								<option value="11">리스 일반식(정비 포함)</option>
						</select></td>
						<td colspan="2">
							<span class="foreign-info gubun-info" style="display: none;">※ 수입차의 경우,일반식 상품 선택이 불가합니다</span> 
							<span class="rent-info gubun-info" style="display: none;">※ 본 차량은 렌트 상품 선택이 불가합니다</span> 
							<span class="lease-info gubun-info"	style="display: none;">※ 본 차량은 리스 상품 선택이 불가합니다</span>
						</td>
					</tr>
					<tr>
						<td>매입옵션</td>
						<td><input type="text" id="sellingOption" value="있음" param=""
							disabled /></td>
						<td colspan="2"><span class="selling-info"></span> <!-- 동적으로 안내문구 넣어줌 -->
						</td>
					</tr>
					<tr>
						<td>대여기간</td>
						<td><select id="periodSelectBox" style="width: 48%;"
							name="periodSelectBox">
								<option value="60">60개월</option>
								<option value="48" selected>48개월</option>
								<option value="36">36개월</option>
								<option value="24">24개월</option>
								<option value="12">12개월</option>
								<option value="directInput">직접 입력</option>
						</select> <input type="text" name="periodSelectBox"
							style="width: 48%; float: right;" disabled></td>
						<td colspan="2"><span id="period-info" class="warning"></span>
						</td>
					</tr>
					<tr>
						<td>연간 약정운행거리</td>
						<td><select id="agreeDistSelectBox" style="width: 48%;"
							name="agreeDistSelectBox">
								<!-- script>
								for(i=2;i<=10;i++){
									document.write("<option value='"+i*5000+"'");
									document.write(">"+numberWithCommas(i*5000)+"km</option>");
								}
							</script -->
								<option value="10000">10,000km</option>
								<option value="12000">12,000km</option>
								<option value="15000">15,000km</option>
								<option value="17000">17,000km</option>
								<option value="20000" selected>20,000km</option>
								<option value="22000">22,000km</option>
								<option value="25000">25,000km</option>
								<option value="27000">27,000km</option>
								<option value="30000">30,000km</option>
								<option value="32000">32,000km</option>
								<option value="35000">35,000km</option>
								<option value="40000">40,000km</option>
								<option value="45000">45,000km</option>
								<option value="50000">50,000km</option>
								<option value="directInput">직접 입력</option>
						</select> <input type="text" name="agreeDistSelectBox" value=""
							style="width: 48%; float: right;" disabled></input></td>
						<td colspan="2">※ 약정운행거리가 적을수록 대여요금이 저렴합니다.<br /> ※ 약정운행거리는
							1,000km 단위로 견적가능합니다.
						</td>
					</tr>
					<tr>
						<td colspan="4" class="gubun-line"><hr /></td>
					</tr>
					<tr>
						<td>보증금</td>
						<td><select id="depositSelectBox" class="percent-select-box" 
							style="width: 30%;">
								<script>
								for(i=0;i<=10;i++){
									document.write("<option value='"+i*5+"'");
									if(i == 4){
										document.write(" selected");
									}
									document.write(">"+i*5+"%</option>");
								}
							</script>
								<option value="directInput">금액직접입력</option>
						</select> <input type="text" id="depositAmt" value="" disabled
							style="width: 63%; margin-left: 13px; float: right;"
							class="percent-select-box" onblur="javascript:percent_select_box();" /></td>
						<td colspan="2">
							<div>
								※보증금은 계약기간 만료 후 환불해 드립니다.<small>[보증금 100만원을 증액하면, 월대여료
									5,500원(VAT 포함)이 인하됩니다. (년리 6.6% 효과)]</small>
							</div>
						</td>
					</tr>
					<tr>
						<td>선납금</td>
						<td><select id="preSelectBox" class="percent-select-box"
							style="width: 30%;">
								<script>
								for(i=0;i<=10;i++){
									document.write("<option value='"+i*5+"'");
									if(i == 0){
										document.write(" selected");
									}
									document.write(">"+i*5+"%</option>");
								}
							</script>
								<option value="directInput">금액직접입력</option>
						</select> <input type="text" id="preAmt" value="0원" disabled
							style="width: 63%; margin-left: 13px; float: right;"
							class="percent-select-box" /></td>
						<td colspan="2">
							<div style="margin-top: -22px;">※선납금은 매월 일정 금액씩 공제되어 소멸되는 돈입니다.</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td colspan="2">
							<!-- <div style="margin-top: -25px;">※초기납입금(보증금 및 선납금)은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</div> -->
							<!-- <div style="margin-top: -25px;">※ 고객님의 신용도에 따라 최소 초기납입금(보증금 및 선납금) 규정이 있으며, 초기납입금은 아마존카와 협의를 통하여 보증보험 증권으로 대체 할 수 있습니다. 단, 보증보혐료는 고객부담이고, 초기납입금을 보증보험 증권으로 대체시 초기납입금의 이자효과가 적용되지 않아 월대여료가 상승됩니다.</div> -->
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td colspan="2">
							<!-- <div style="margin-top: -25px;">※초기납입금(보증금 및 선납금)은 고객님의 신용도에 따라 심사과정에서 조정될 수 있습니다.</div> -->
							<div style="margin-top: -55px;">※ 고객님의 신용도에 따라 최소 초기납입금(보증금 및 선납금) 규정이 있으며, 초기납입금은 아마존카와 협의를 통하여 보증보험 증권으로 대체 할 수 있습니다. 
								<small>&nbsp; 단, 보증보험료는 고객부담이고, 초기납입금을 보증보험 증권으로 대체시 초기납입금의 이자효과가 적용되지 않아 월대여료가 상승됩니다.</small></div>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="gubun-line"><hr /></td>
					</tr>
					<tr>
						<td>운전자 연령</td>
						<td class="insure-area"><select id="driverAgeSelectBox">
								<option value="1" selected>만 26세 이상</option>
								<option value="3">만 24세 이상</option>
								<option value="2">만 21세 이상</option>
						</select></td>
						<td rowspan="3" colspan="2">
							<div style="height: 150px; padding-top: 15px; padding-bottom: 15px;">
								<div id="acar_age" style="display: none;">
									<span>※ 운전자 연령은 최종 심사 후 조정 될 수 있습니다.</span>
								</div>
								<div class="import-lease-info" style="display: none;">
									<span class="import-lease-info" style="display: none;"> 좌측의 보험사항은 참고 선택 사항으로 수입차 리스의 경우<br />
										보험료 미포함 견적을 산출합니다.<br /> ※ 계약 진행 시 고객 할인할증율을 적용한 보험료를 산출,<br />대여료에
										합산하여 계약(수입차 리스)<br /><br />
										※ 운전자 연령은 최종 심사 후 조정 될 수 있습니다.
									</span>
									<span id="acarText"></span>
								</div>
								<div id="acar_price" style="display: none; padding-top: 80px;">
									<span>※ 자차 면책금은 최종 심사 후 조정 될 수 있습니다.</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>대물배상</td>
						<td class="insure-area"><select id="insureUnitSelectBox">
								<option value="2" selected>1억원</option>
								<option value="4">2억원</option>
								<option value="8">3억원</option>
						</select></td>
						<%-- <td colspan='2'></td> --%>
					</tr>
					<tr>
						<td>자차 면책금</td>
						<td class="insure-area"><select id="carJaSelectBox">
								<option value="300000">300,000원</option>
								<option value="200000">200,000원</option>
								<option value="500000" class="import">500,000원</option>
						</select></td>
						<td colspan="2"><span
							class="foreign-info label label-warning" style="display: none;"><i
								class="glyphicon glyphicon-info-sign"></i>&nbsp;수입차의 경우,자차 면책금
								최소 금액이 500,000원입니다</span></td>
					</tr>
					<tr>
						<td colspan="4" class="gubun-line"><hr /></td>
					</tr>
					<tr>
						<td>차량용품</td>
						<td>
							<input type="checkbox" name="etc_option" id="etc_sun" value="tint_s_yn"> 
							<label for="etc_sun">전면썬팅</label>
							&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="checkbox" name="etc_option" id="etc_navi" value="tint_n_yn"> 
							<label for="etc_navi">거치형 내비게이션</label>
							<span id="eb_span" style="display: none;">
								<input type="checkbox" name="etc_option" id="etc_eb" value="tint_eb_yn"> 
								<label for="etc_eb">이동형충전기</label>
							</span>
						</td>
						<td colspan="2">※측후면 썬팅 및 2채널 블랙박스는 무상으로 제공됩니다</td>
					</tr>
					<tr class="ecar-area" style="display: none;">
						<td>고객 주소지</td>
						<td><select id="ecarLocationSelectBox" onchange="javascript:autoChangeRegionSel();">
								<option value="0" selected>서울</option>
								<option value="1">인천/경기</option>
								<option value="2">강원</option>
								<option value="3">대전</option>
								<option value="4">광주/전남/전북</option>
								<option value="5">대구</option>
								<option value="6">부산</option>
								<option value="7">세종/충남/충북(대전제외)</option>
								<option value="8">경북(대구제외)</option>
								<option value="9">울산/경남(부산제외)</option>
						</select></td>
					</tr>
					<tr>
						<td>차량인도지역</td>
						<td><select id="regionSelectBox">
								<option value="1">서울</option>
								<option value="2">인천/경기</option>
								<option value="3">강원</option>
								<option value="4">대전/세종/충남/충북</option>
								<option value="5">광주/전남/전북</option>
								<option value="6">대구/경북</option>
								<option value="7">부산/울산/경남</option>
						</select></td>
						<td colspan="2"></td>
					</tr>
				</tbody>
			</table>
			<div class="text-right" style="width: 1018px;">
				<button type="button" class="calculate-btn"
					data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i> 견적 진행 중">견적
					내기</button>
			</div>
			<!-- 전기차/수소차 제외 모든차량들 -->
			<div id="view_price_other_car" style="display: none;">
				<table class="car-price-table">
					<col width="15%" />
					<col width="30%" />
					<col width="18%" />
					<col width="43%" />
					<tbody>
						<tr class="header">
							<th colspan="2">월 대여료(실시간 최종 견적)</th>
							<th colspan="2">
							<small class="bold minus-info" style="color: red; display: none;"><br>&nbsp;
								※월 대여료는 음수값이 나오면 안됩니다.(보증금 및 선납금 확인)</small>
							</th>
						</tr>
						<tr>
							<td class="option-title">대여기간</td>
							<td id="rentPeriod" class="estimate-price"></td>
							<td rowspan="2" colspan="2">
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 30px;"><hr /></td>
						</tr>
						<tr>
							<td class="option-title" class="estimate-price">공급가</td>
							<td id="supplyFee" class="estimate-price"></td>
							<td rowspan="2" style="padding-top: 40px;"></td>
							<td rowspan="2" style="vertical-align: bottom">
							</td>
						</tr>
						<tr>
							<td class="option-title">부가세</td>
							<td id="vatFee" class="estimate-price"></td>
						</tr>
						<tr>
							<td class="option-title"
								style="height: 60px; vertical-align: top; padding-top: 10px;">월 대여료</td>
							<td style="height: 60px; vertical-align: top;">
								<div class="total-price"></div>
							</td>
							<td colspan="2" style="vertical-align: top;"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 전기차/수소차인 경우 -->
			<div id="view_price_eh_car" style="display: none;">
				<table class="car-price-table">
					<col width="15%" />
					<col width="30%" />
					<col width="18%" />
					<col width="43%" />
					<tbody>
						<tr class="header">
							<th colspan="2">월 대여료(실시간 최종 견적)</th>
							<th colspan="2"><span style="font-weight: bold; font-size: 20px;">견적1 : 인수/반납 선택형</span>
							<small class="bold minus-info1" style="color: red; display: none;"><br>&nbsp;
								※월 대여료는 음수값이 나오면 안됩니다.(보증금 및 선납금 확인)</small>
							</th>
						</tr>
						<tr>
							<td class="option-title">대여기간</td>
							<td id="rentPeriod1" class="estimate-price">
								<span class="view_sellingOpt_off">미운영</span>
							</td>
							<td rowspan="2" colspan="2">
								<div class="view_sellingOpt_on">
									<!-- 전기차일때만 나옴 -->
									<span>매입옵션 가격(인수가)</span> <span class="estimate-price"
										style="margin-left: 280px;" id="sellingPrice">0원</span> <br />
									<small>(대여기간 만료시 반납 또는 매입옵션 행사 가능하며, 연장이용도 가능)</small>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 30px;"><hr /></td>
						</tr>
						<tr>
							<td class="option-title" class="estimate-price">공급가</td>
							<td id="supplyFee1" class="estimate-price"></td>
							<td rowspan="2" style="padding-top: 40px;">
								<span class="view_sellingOpt_on">매입옵션(인수가) 조정</span></td>
							<td rowspan="2" style="vertical-align: bottom">
								<div class="view_sellingOpt_on">
									<select style="width: 30%;" id="buyOption">
										<option id="initValue"></option>
										<option value="1">보증금과같게</option>
										<option value="2">금액직접입력</option>
									</select> <input type="text" style="width: 45%;" id="buyText">
									<button type="button" class="btn btn-warning re-cal-btn"
										style="float: right; font-size: 12px; height: 40px; padding-top: 2px;">
										인수가 조정<br />견적 내기
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="option-title">부가세</td>
							<td id="vatFee1" class="estimate-price"></td>
						</tr>
						<tr>
							<td class="option-title"
								style="height: 60px; vertical-align: top; padding-top: 10px;">월
								대여료</td>
							<td style="height: 60px; vertical-align: top;">
								<div class="total-price1"></div>
							</td>
							<td colspan="2" style="vertical-align: top; padding-bottom:10px;">
								<small class="view_sellingOpt_on">※인수가를 하향조정하면 월대여료는 늘어나지만 총비용(월대여료 총액+인수가)은 크게 줄어듭니다.</small><br> 
								<small class="view_sellingOpt_on">※대여기간, 보증금등 대여조건 변경시 상단의 견적내기를 먼저 클릭한 후에 인수가 조정 견적내기를 해야 원하는 조건의 견적을 얻을 수 있습니다.</small>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="car-price-table">
					<col width="15%" />
					<col width="30%" />
					<col width="18%" />
					<col width="43%" />
					<tbody>
						<tr class="header">
							<th colspan="2"></th>
							<th colspan="2">
								<span style="font-weight: bold; font-size: 20px;">견적2 : 반납형</span>
								<small class="bold minus-info2" style="color: red; display: none;">&nbsp;
								※월 대여료는 음수값이 나오면 안됩니다.(보증금 및 선납금 확인)</small>
							</th>
						</tr>
						<tr>
							<td class="option-title">대여기간</td>
							<td id="rentPeriod2" class="estimate-price"></td>
							<td rowspan="2" colspan="2">
								<span style="font-weight: bold; font-size: 16px;">매입옵션 없음</span>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="height: 30px;"><hr /></td>
						</tr>
						<tr>
							<td class="option-title" class="estimate-price">공급가</td>
							<td id="supplyFee2" class="estimate-price"></td>
							<td rowspan="2" style="padding-top: 40px;"></td>
							<td rowspan="2" style="vertical-align: bottom">
							</td>
						</tr>
						<tr>
							<td class="option-title">부가세</td>
							<td id="vatFee2" class="estimate-price"></td>
						</tr>
						<tr>
							<td class="option-title"
								style="height: 60px; vertical-align: top; padding-top: 10px;">월
								대여료</td>
							<td style="height: 60px; vertical-align: top;">
								<div class="total-price2"></div>
							</td>
							<td colspan="2" style="vertical-align: top;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="estimate-footer">
		<button type="button" class="print-btn">견적서 보기</button>
		<button type="button" class="submit-btn">상담 요청하기</button>
	</div>
	<!-- 차종 선택 모달 -->
	<%@include file="/WEB-INF/jsp/common/estimate-modal.jsp"%>
</t:blankpage>