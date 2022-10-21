//옵션 체크될 때마다 가격 변경되기 
$(document).on("change","input[name='carOption'], input[name='car-color']",function(){
	var carAmt = parseInt($('#carAmt').val());
	var optionAmt = 0;
	var dcAmt = parseInt($("#dcAmt").val());	//주석해제
	var taxAmt = parseInt($("#taxAmt").val());
	var colorAmt = parseInt($("#colorAmt-display").text().replace(/,/g,"").replace("원",""));
	
	//체크된 옵션에 따라 차가 구하기 
	$("input[name='carOption']:checked").each(function(){
		optionAmt += parseInt($(this).parents().next().attr("param"));
	});
	var totalAmt = parseInt(carAmt + optionAmt + colorAmt);
	//var totalAmt = parseInt(carAmt + optionAmt + colorAmt - taxAmt);
	//var totalAmt = parseInt(carAmt + optionAmt - taxAmt + colorAmt - dcAmt);
	$("#totalAmt").val(totalAmt);
	
	//옵션 선택에 따라 개별소비세 감면액 실시간 변경되게 처리(2017.06.02)	
	var jg_w = $("#jg_w").val();
	var jg_g_7 = $("#jg_g_7").val();
	var jg_2 = $("#jg_2").val();	
	var sh_code = $("#sh_code").val();
	var carAmt1 = $("#carAmt").val();
	var carAmtTotal = parseInt(carAmt1) + parseInt(optionAmt) + parseInt(colorAmt);
	$("#carAmtRe").val(carAmtTotal);
	
	if(jg_3 == null || jg_3 == '' || jg_3 == 'undefined'){
		var jg_3 = $("#jg_3re").val();
	}
	
	//개소세 감면액 다시 계산(2017.06.02)
	getTaxDcAmt(jg_w, jg_g_7, jg_2, jg_3, sh_code);
	
	//dc 먼저 계산하고 난 뒤 이후 차가 계산 
	$.when(calculateDcAmt()).done(function(){
		
		var dcAmt = parseInt($("#dcAmt").val());
		
		//옵션 선택에 따라 개별소비세 감면액 실시간 변경되게 처리(2017.06.02)
		if(taxAmt != $("#taxAmt").val()){
			var taxAmt = parseInt($("#taxAmt").val());			
		}
		
		totalAmt = parseInt(carAmt + optionAmt + colorAmt - dcAmt - taxAmt);
		
		
		$("#totalDisplayAmt").text(numberWithCommas(totalAmt)+"원");
		$("#optionAmt").val(optionAmt);
		
		//$(".option-sum").text("("+numberWithCommas(optionAmt)+"원)");
		$(".option-sum").text(numberWithCommas(optionAmt)+"원");
		
		//보증금, 선납금 액수에 변경된 차가를 반영하여 재계산한다
		$('select.percent-select-box').each(function(){
			var disabled = $(this).next("input").attr("disabled");
			if(disabled == "disabled"){ //직접입력이 아닌 경우에만 금액 변경을 반영한다
				var selectedValue = $(this).find("option:selected").val();
				
				//VV옵션선택후 보증금 변경시 보증금을 정확히 불러오지못하던것을 수정(2017.06.30)(문제시 삭제할것)
				$("#totalAmt").val(totalAmt);
				
				changeSubPrice(selectedValue,totalAmt,$(this).attr("id"));
			}
		});
	});
	
	$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
})

$(document).ready(function(){
	
	//개인 고객일 경우 생년월일 validation 추가
	$("input[name='estSSN']").focusout(function(){
		if($("input[name='estGubun']:checked").val() == "3"){ //개인 고객이면 생년월일 validation 추가
			var birthDate = $(this).val();
			if(birthDate.length > 6){
				if(birthDate.substring(0,2) == "19" && birthDate.length == "8"){
					$(this).val(birthDate.substring(2,8));
				}else{
					$(this).val(birthDate.substring(0,6));
				}
				alert("생년월일은 YYMMDD(연월일) 형식으로 입력하셔야 합니다.\nex) 790101");
			}else if(birthDate.length < 6){
				$(this).val("");
				alert("생년월일은 YYMMDD(연월일) 형식으로 입력하셔야 합니다.\nex) 790101");
				return false;
			}
			var path =  window.location.pathname;
			if(path != "/estimate/smart/step2" && path != "/estimate/secondhand/step2"){
				//만 26세 이상인지 체크
				var curY = new Date().getFullYear();
				var curM = new Date().getMonth() +1;
				var curD = new Date().getDate();
				if(curM<10){	curM = "0" + curM;	}
				if(curD<10){	curD = "0" + curD;	}
				if($(this).val().length==6){	
					if($(this).val().substr(0,2) > 40){	
						var b_date = "19"+$(this).val();
					}else{
						var b_date = "20"+$(this).val();
					}	
				}
				if((curY+""+curM+""+curD) - b_date < 259999){
					alert("만 26세 이상 이어야 월렌트를 예약하실 수 있습니다.");
					$(this).val("");
					return false;
				}
			}
		 	
		}else if($("input[name='estGubun']:checked").val() != "3"){ //개인 고객아니면 사업자번호 validation 추가
			var birthDate = $(this).val();
			if(birthDate.length != 10){
				$(this).val(birthDate.substring(0,10));
				alert("사업자번호 10자리를 입력해주세요.");
				return false;
			}
		}
	})
	
	$('.pre-esti-btn').click(function(){
		
		//var url = "/estimate/auth/check";
		//if($(this).hasClass("pre-rsv-btn")){
		//	url = "/reserve/auth/check";
		//}
		var url = "/reserve/auth/check";
		
		//var email = $('#authEmail').val();
		//var email = $("#loginEmail").val();
		//var flag = emailValidation(email);
		var param = {		        
	       // data: {
	            email: $("#loginEmail").val()
	       // }
	    };
		//if(flag){
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				/*data:email,*/
				data: JSON.stringify(param),
				url:url,
				type:'POST',
				success:function(response){
					if(response.flag){
						$('.pre-check-content').slideUp(500,function(){
							$('.pre-check-modal').hide();
						});
						$('body').css("overflow","auto");
						$("#loginEmail").val(email);
						$.cookie('estEmail',email,{path:'/', expires:1, domain:'www.amazoncar.co.kr' });
					}else{
						alert(response.message);
					}
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});
		//}
	})
	
	$('.pre-auth-btn').click(function(){
		
		$(this).prop("disabled",true); //중복 실행 방지
		
		var email = $('#authEmail').val();
		var flag = emailValidation(email);
	    
		if(flag){
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				data:email,
				url:'/estimate/auth',
				type:'POST',
				success:function(response){
					if(response.flag){
						$('.auth-email').text(response.data);
						$('.pre-auth-info').fadeIn();
					}else{
						alert(response.message);
					}
					$('.pre-auth-btn').prop("disabled",false);
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});
		}else{
			
		}
		
	})
	
	//매입옵션 selectbox 변경시
//	$('#sellingSelectBox').change(function(){
//		var gubunSelectedValue = $('#gubunSelectBox option:selected').val();
//		var sellingSelectValue = $('#sellingSelectBox option:selected').val();
//
//		if(gubunSelectedValue.indexOf("1")>=0 && sellingSelectValue == "1"){
//			//alert("대여상품이 일반식(정비 포함)인 경우 매입 옵션 선택이 불가합니다");
//			//changeSellingOption();
//		}
//	})
	

	//보증금,선납금,보증보험 percent 변경 시 금액 재셋팅 
	$('select.percent-select-box').change(function(){
		var selectedValue = $(this).find("option:selected").val();
		if(selectedValue == "directInput"){ //직접 입력 시
			$(this).next("input").removeAttr("disabled");
			$(this).next("input").val("");
			$(this).next("input").attr("placeholder","숫자만 입력해주세요");
			$(this).next("input").focus();
		}else{
			$(this).find("option:last").text("금액직접입력"); //옵션명을 '금액 직접 변경'으로 원복해준다
			$(this).find("option:last").val("directInput");
			var originAmt = $('#totalAmt').val();
			$(this).next("input").attr("disabled",true);
			changeSubPrice(selectedValue,originAmt,$(this).attr("id"));
		}
		$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
	})
	
	//상품 변경 시
	$('#gubunSelectBox').change(function(){
		var gubun = $('#gubunSelectBox option:selected').val();
		var gubun2 = gubun.substr(1,1);
		var country = $("#countrySelectBox option:selected").val();
		$(".import-lease-info").hide();
		if(gubun == "21" || gubun == "22"){
			$("#driverAgeSelectBox option[value='3']").attr('disabled', 'disabled').hide();	//장기렌트 상품인 경우 운전자연령 만 24세 옵션 삭제	
			if($("#driverAgeSelectBox option:selected").val() == '3'){
				$("#driverAgeSelectBox option[value='2']").prop('selected', true);
			}
		}else{  //리스인 경우
			$("#driverAgeSelectBox option[value='3']").removeAttr("disabled").show();	//자동차리스인 경우 만 24세 옵션 보여주기
			var car_comp_id = $("#car_comp_id").val();
			if($("#countrySelectBox option:selected").val() == "2" || car_comp_id > 5){
				$(".import-lease-info").show();
			}
		}
		
		changeSellingOption(); //매입옵션 변경
		
		//제조사 dc도 재계산 후 실시간 반영
		var dcAmt = 0;
		var rentDcAmt = 0;
		var leaseDcAmt = 0;
		var totalAmt = parseInt($("#totalAmt").val());
		if($("#dcAmt").val()!= null && $("#dcAmt").val() != ""){
			dcAmt = parseInt($("#dcAmt").val());
		}
		if($("#rentDcAmt").val()!= null && $("#rentDcAmt").val() !=""){
			rentDcAmt = parseInt($("#rentDcAmt").val());
		}
		if($("#leaseDcAmt").val()!= null && $("#leaseDcAmt").val() !=""){
			leaseDcAmt = parseInt($("#leaseDcAmt").val());
		}
		totalAmt = totalAmt + dcAmt;		
		if(gubun == "21" || gubun == "22"){	//렌트			
			dcAmt = rentDcAmt;
			$("#dcAmt").val(dcAmt);			
		}else{	//리스
			dcAmt = leaseDcAmt;
			$("#dcAmt").val(dcAmt);
		}
		totalAmt = totalAmt - dcAmt;
		$("#totalAmt").val(totalAmt);		
		$("#totalDisplayAmt").text(numberWithCommas(totalAmt)+"원");
		
		if(dcAmt > 0){
			$("#dcAmt").val(dcAmt);
			$("#displayDcAmt").text(numberWithCommas(dcAmt) + "원");
			$(".dcAmt-row").show();
			$("#totalDisplayAmt-info > span:first").show(); //차량가격 옆에 info 보여주기			
		}else{
			$(".dcAmt-row").hide();
			$("#totalDisplayAmt-info > span:first").hide();
		}
		
		//보증금, 선납금 액수에 변경된 차가를 반영하여 재계산한다
		$('select.percent-select-box').each(function(){
			var disabled = $(this).next("input").attr("disabled");
			if(disabled == "disabled"){ //직접입력이 아닌 경우에만 금액 변경을 반영한다
				var selectedValue = $(this).find("option:selected").val();
				changeSubPrice(selectedValue,totalAmt,$(this).attr("id"));
			}
		});
		
		$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
	})
	
	//기간 선택, 약정운행거리 선택 시
	$('#periodSelectBox,#agreeDistSelectBox').change(function(){
		var name = $(this).attr("name");
		var id = $(this).attr("id");
		if($("#" + id + " option:selected").val() == "directInput"){ //직접입력 선택 시
			$("input[name='"+name+"']").removeAttr("disabled");
			$("input[name='"+name+"']").attr("placeholder","숫자만 입력하세요").focus();	
		}else{
			$("input[name='"+name+"']").attr("disabled","disabled");
			$("input[name='"+name+"']").val("");
			$("input[name='"+name+"']").removeAttr("placeholder");
		}
		
		changeSellingOption();
		$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
	})
	
	//보증금, 선납금 직접 입력 시 퍼센트 계산해서 넣어주기
	$("input.percent-select-box").focusout(function(){
		var inputValue = parseInt($(this).val().replace(/,/g,"").replace("원","")); //숫자만 추출하기
		var regExp = /^[0-9]+$/;
		if(!regExp.test(inputValue)){
			alert("금액을 정확히 입력해주세요");
		}else{ //금액이 정확히 입력되어 있으면
			$(this).val(numberWithCommas(priceCutting(inputValue, "R", 100)) + "원");
			var totalAmt = parseInt($("#totalAmt").val()); 
			var percent = inputValue / totalAmt * 100; //입력한 금액의 percent를 구한다
			//보증금 최대입금액 로직 추가(2018.01.12)
			/*if($(this).attr("id")=="depositAmt"){
				var ecarFlag = $("#ecarFlag").val();
				if(ecarFlag == '3'){
					getPerchaseSubsidy($("#jg_w").val(), $("#jg_g_7").val(), $("#jg_2").val(), $("#jg_3").val(), $("#sh_code").val());
					var ecar_pur_sub_amt = $("#ecar_pur_sub_amt").val();
					var maxSubsidyPer = (totalAmt - ecar_pur_sub_amt) / totalAmt * 100;
					if(percent > maxSubsidyPer){
						alert("보증금 "+ numberWithCommas(totalAmt - ecar_pur_sub_amt) +"원 (차량가격-구매보조금) 이내만 납부 가능합니다.\n\n추가로 초기납입금 납부를 원할 경우 선납금으로 납부하시면 됩니다.");
						$(this).val(numberWithCommas(priceCutting(totalAmt - ecar_pur_sub_amt, "F", 100)) + "원");
						percent = maxSubsidyPer;
					}
				}else{
					if(percent > 100){
						alert("차가의 100% 이내만 납부 가능합니다.\n\n추가로 초기납입금 납부를 원할 경우 선납금으로 납부하시면 됩니다.");
						$(this).val(numberWithCommas(totalAmt) + "원");
						percent = 100;
					}
				}
			}*/
			
			//$(this).prev("select").find("option:last").text(percent.toFixed(2)+"%"); //20190517 직접입력시 텍스트 변경X
			$(this).prev("select").find("option:last").val(percent.toFixed(2));
		}
		$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
	})
	
	//대여기간 직접 입력 시 '개월' 붙여 넣어주기
		
	$("input[name='periodSelectBox']").focusout(function(){		
		var value = $(this).val().replace("개월","");
		var valLen = $("#periodSelectBox option").size()-1;
		var minVal = $("#periodSelectBox option:nth-child("+valLen+")").val();	
		var maxMonth = parseInt($("#periodSelectBox option:first").val());
		if($("#minMonth").length){
			minVal = $("#minMonth").val();			
		}
		
		//재렌트는 6개월 이상만 가능, 재리스는 12개월 이상만 가능하게 수정
		var gubunValue = $("#gubunSelectBox option:selected").val();		
		if(gubunValue == 12 || gubunValue == 11){
			minVal = 12;
		}
		
		//if(minVal < 12){ //12개월 이하는 취급X
			//minVal = 12;
		//}
		if($.isNumeric(value)){
			//친환경차(전기차)는 대여기간이 24개월 이상일 시에만 견적내기 가능
			var ecarFlag = $("#ecarFlag").val();
			
			var fuelCode = $("#fuelCode").val();
			var gubun = $('#gubunSelectBox option:selected').val();
			var gubun2 = gubun.substr(1,1);			
			var directInputPeriod = $("#directInputPeriod").val();
			
			if(ecarFlag == "3" && value < 24){			
				alert("전기차의 대여 기간은 최소 24개월 이상이어야 합니다");
				$(this).val("24개월");
				return false; 
			}
			
			if(ecarFlag == "4" && value < 24){			
				alert("수소차의 대여 기간은 최소 24개월 이상이어야 합니다");
				$(this).val("24개월");
				return false; 
			}
				
			if(parseInt(value) < parseInt(minVal)){
				alert("본 차량의 대여 기간은 최소 " + minVal + "개월 이상이어야 합니다");
				value = minVal;
			}else if(maxMonth !=null && maxMonth !="" && (parseInt(value) > parseInt(maxMonth))){
				alert("본 차량의 대여기간은 " + maxMonth + "개월을 초과할 수 없습니다");
				value = maxMonth;
			}else if(parseInt(value) > 60){
				alert("본 차량의 대여기간은 60개월을 초과할 수 없습니다");
				value = 60;
			}
			$(this).val(value + "개월");
			
			//대여기간 직접 입력시에도 매입옵션에 관한 문구 적용 -> estimate_step1에 있는 소스이지만 직접입력 부분은 이곳에 추가!!
			if($("input[name='car-gubun']:checked").val() == "car-gubun-sh"){
				if(gubun2 != "1" && fuelCode != "3" &&directInputPeriod <24){
					$("#sellingOption").val("없음");
					$("#sellingOption").attr("param","0");
					$(".selling-info").text("※재렌트/재리스 매입옵션은 24개월 이상 계약시에만 주어집니다");
				}else{
					changeSellingOption();
				}				
			}
			
		}else{
			alert("대여기간을 정확히 입력해주세요");
			$(this).val("");
			return false; 
		}
	})
	
	$("input[name='agreeDistSelectBox']").focusout(function(){
		var value = $(this).val().replace("km","").replace(",","");
		if($.isNumeric(value)){
			$(this).val(numberWithCommas(value)+"km");
		}else{
			alert("운행거리를 정확히 입력해주세요");
			$(this).val("0km");
			return false;
		}
	})
	
		
	//차량구분 선택 시 화면 바뀌기 
	$("input[name='car-gubun']").change(function(){
		var checkedVal = $("input[name='car-gubun']:checked").attr("id");
		if(checkedVal.indexOf("new") >= 0){
			location.href="/estimate/smart/step1";
		}else{
			location.href="/estimate/secondhand/step1";
		}
	})
	
	$('#driverAgeSelectBox, #insureUnitSelectBox, #carJaSelectBox, #ecarLocationSelectBox, #regionSelectBox').change(function(){
		$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
	})
})

$(document).on("change","input[name='etc_option']",function(){
	$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
})

/* 약정운행거리 값 리턴하기(직접 입력한 거면 숫자 입력됐는지  체크) */
function checkAgreeDistValue(){
	if($("#agreeDistSelectBox option:selected").val() == 'directInput'){ //직접 입력했다면
		var value = $("input[name='agreeDistSelectBox']").val().replace("km","").replace(/,/g,"");
		if(value == ""){
			alert("약정운행거리를 입력해주세요");
			$("input[name='agreeDistSelectBox']").focus();
			return false;
		}else{
			var num_check=/^[0-9]{5,6}$/;
			if(num_check.test(value)){
				if(value > 50000){ //50000 이상 이면
					alert("약정운행거리는 최소 10,000km 이상 최대 50,000km 이하여야 합니다.");
					return false;
				}else{
					return value;
				}
			}else{ 
				alert("약정운행거리를 정확하게 입력해주세요/n약정운행거리는 최소 10,000km 이상 최대 50,000km 이하여야 합니다.");
				return false;
			}
		}
		$("input[name='agreeDistSelectBox']").val();
	}else{
		return $("#agreeDistSelectBox option:selected").val();	
	}
}

/* 대여기간 값 리턴하기 (직접 입력한 거면 숫자 입력됐는지 체크 */
function checkPeriodValue(){
	if($("#periodSelectBox option:selected").val() == 'directInput'){ //직접 입력했다면
		var value = $("input[name='periodSelectBox']").val().replace("개월","");
		if(value == ""){
			alert("대여기간을 입력해주세요");
			$("input[name='agreeDistSelectBox']").focus();
			return false;
		}else{
			var num_check=/^[0-9]{1,2}$/;
			if(num_check.test(value)){
				return value;
			}else{
				alert("대여기간을 정확하게 입력해주세요");
				return false;
			}
		}
		$("input[name='periodSelectBox']").val();
	}else{
		return $("#periodSelectBox option:selected").val();
	}
}
//보증금, 선납금, 보증보험 바꾸기
function changeSubPrice(percent,carAmt,id){
	var changedAmt = 0;
//	changedAmt = Math.round(carAmt * (percent / 100));
	changedAmt = priceCutting(carAmt * (percent / 100), "R", 100);
	$('#'+id).closest("td").find("input").val(changedAmt.toLocaleString()+"원");
}


/* 적용하기 눌렀을 때 차명에 따라 대여상품 내용에 반영 */
function validateProduct(rentFlag, leaseFlag){
	if(rentFlag != 1){ //렌트 상품이 아니면
		$("#gubunSelectBox option[value='21'],#gubunSelectBox option[value='22']").prop("disabled",true);
		$("#gubunSelectBox option[value='12']").prop("selected", true);
		$('.rent-info').show();		
	}
	if(leaseFlag != 1){ //리스 상품이 아니면
		$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='12']").prop("disabled",true);
		$("#gubunSelectBox option[value='22']").prop("selected", true);
		$('.lease-info').show();
	}
}

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
