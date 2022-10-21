// 차종선택 카운트
var default_count = 0;

/* Detail 에서 넘어왔을 때 최초 정보를 받아서 미리 셋팅한다*/
function setDefaultInfo(){

	var foreignFlag = $("#foreignFlag").val();
	var carCompId = $("#carCompId").val();
	var carCode = $("#carCode").val();
	var carName = $("#carDetailName").val();
	
	setCountry(foreignFlag);
	setCarName(carCompId);
	setCarDetail($("#carCode").val());

	$("#compSelectBox option[value='"+carCompId+"']").prop("selected", true); // 제조사 셋팅 
	$(".carNameSelectBox option[value='"+carCode+"']").prop("selected", true); // 차명 셋팅
	$(".carNameSelectBox").attr("id",carCompId); //차명 셀렉트박스 ID에 제조사코드 삽입
	$(".selectedCarDetail").val(carName); // 차종명 셋팅
	
	var carSeq = $('#carSeq').val();
	var carId = $('#carId').val();
	var carAmt = $('#carAmt').val();
	
	//차가, 총차량가격 display
	$(".carAmt").text(numberWithCommas(carAmt)+"원");
	$("#displayCarName").text($("#carName").val() + " " + carName);
	//차 정보 세팅
	$.when(setCarInfo(carSeq, carId, carName, carAmt)).done(calculateFinalAmt());	
	
	$("#gubunSelectBox option[value='"+$("#gubun-detail").val()+"']").prop("selected",true); //대여상품 셋팅
			
	/*if(($("#ecarFlag").val() == "3" || $("#ecarFlag").val() == "4") && ($("#carCompId").val() != "0056" && $("#sh_code").val() != "9133")){	
		$("#view_price_eh_car").css("display","block");
		$("#view_price_other_car").css("display","none");
		if ($("#gubunSelectBox option:selected").val() == "22" || $("#gubunSelectBox option:selected").val() == "12" ) {
			//$(".ecar-selling-area").show();
			$(".view_sellingOpt_on").css("display","block");
			$(".view_sellingOpt_off").css("display","none");
		} else {
			//$(".ecar-selling-area").hide();
			$(".view_sellingOpt_on").css("display","none");
			$(".view_sellingOpt_off").css("display","block");
		}
	} else {*/
		$("#view_price_eh_car").css("display","none");
		$("#view_price_other_car").css("display","block");
		//$(".ecar-selling-area").hide();
	//}
	
	/*if (carCompId == "0056") {
		$("#periodSelectBox").attr("disabled", true);
		$("#agreeDistSelectBox").attr("disabled", true);
	} else {
		$("#periodSelectBox").attr("disabled", false);
		$("#agreeDistSelectBox").attr("disabled", false);
	}*/
	
	$("#periodSelectBox option[value='"+$("#period-detail").val().replace("개월","")+"']").prop("selected",true); //대여기간 셋팅
	$("#agreeDistSelectBox option[value='"+$("#agreeDist-detail").val()+"']").prop("selected",true);
	$("#gubunSelectBox").trigger("change"); //대여상품 셋팅 후 이후 change action 트리거
	
	default_count = 1;
}	


/* 차량을 다시 선택했을 때를 대비하여, 선택사항을 모두 refresh 해준다 */
function refreshOptionTable(){
	$(".gubun-info").hide();
	$("#gubunSelectBox option").each(function(){
		$(this).removeAttr("disabled");
	})
	$("#gubunSelectBox option[value='22']").prop("selected",true);
	$("#selling-info").text("");
	$("#color-jg-name, #color-jg-info").hide();
	$(".color-hide-tr").hide();
	$('.label-warning').hide();
	$(".import-lease-info").hide();
	
	//대여상품 셋팅
	if($("#countrySelectBox option:selected").val() == "2"){
		$("#gubunSelectBox option[value='11']").prop("disabled", true);
		$("#gubunSelectBox option[value='21']").prop("disabled", true);
	}
	
	//옵션이랑 색상 가격 0원으로 변경
	$("#colorAmt-display").text("0원");
	$("#colorAmt").val("0");
	$("#optAmt").val("0");
	$("#optAmt_m").val("0");
	$(".option-sum").text("0원");
	$("#colorName").val("");
	//잔가 정보 변경
	$("#jg_opt_st").val("");
	$("#jg_col_st").val("");
	
	
}

//국산, 수입 여부 셋팅
function setCountry(foreignFlag){
	var domesticList = [{name:"",value:""},{name:"현대자동차(주)",value:"0001"},{name:"기아자동차(주)",value:"0002"},
	                    {name:"르노삼성자동차",value:"0003"},{name:"한국GM(쉐보레)",value:"0004"},{name:"쌍용자동차",value:"0005"}];
	
	var importList = [{name:"",value:""},{name:"BMW",value:"0013"},{name:"아우디자동차",value:"0018"},{name:"메르세데스-벤츠",value:"0027"},{name:"렉서스",value:"0044"},
					  {name:"혼다",value:"0025"},{name:"도요타",value:"0007"},{name:"랜드로버",value:"0049"},
	                  {name:"지프",value:"0047"},{name:"포드자동차",value:"0021"},{name:"폭스바겐",value:"0011"},{name:"푸조",value:"0034"},{name:"볼보",value:"0006"},
	                  {name:"재규어",value:"0052"},{name:"미니",value:"0050"},{name:"링컨",value:"0051"},{name:"테슬라",value:"0056"}];
	                  /*{name:"인피니티",value:"0048"},{name:"북기은상",value:"0055"},{name:"닛산자동차",value:"0033"}*/
	                  
	
	$("#compSelectBox option").remove();
	//수입차면
	if(foreignFlag == "true" || foreignFlag == "2"){
		$("#countrySelectBox option[value='2']").prop("selected",true); //수입으로 선택
		
		//자차면책금 셋팅
		$("#carJaSelectBox option[class!='import']").attr("disabled","disabled").hide(); //자차면책금 다른 옵션 삭제
		$("#carJaSelectBox option.import").show().prop("selected",true); //자차면책금 50만원 고정
		$("#carJaSelectBox").attr("disabled", true);
		
		//회사명 셋팅 
		$.each(importList, function(index,item){
			$("#compSelectBox").append("<option value='"+item.value+"'>"+item.name+"</option>");
		})
		
	}else{ //국산차면
		$("#countrySelectBox option[value='1']").prop("selected",true); //국산으로 선택
		
		//자차면책금 셋팅
		$("#carJaSelectBox option[class!='import']").removeAttr("disabled").show();
		$("#carJaSelectBox option.import").attr("disabled","disabled").hide(); //자차면책금 50만원 disabled
		$("#carJaSelectBox option[value='300000']").prop("selected",true);
		$("#carJaSelectBox").attr("disabled", false);
		//회사명 셋팅
		$.each(domesticList, function(index,item){
			$("#compSelectBox").append("<option value='"+item.value+"'>"+item.name+"</option>");
		})
		
		//대여상품 셋팅
		$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='21']").removeAttr("disabled");
	}
}

/* 제조사 변경 시 차명 다시 셋팅해주기 */
function setCarName(carCompId){
	$('#carCompId').val(carCompId); 
	var carCode = $("#carCode").val();
	var param = {"carCompId":carCompId};
	
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carName',
		type:'POST',
		success:function(list){
			$('.carNameSelectBox').attr("id",carCompId);
			$('.carNameSelectBox').html("<option value='0' selected disabled></option>");
			$.each(list, function(index, item){
				var appendStr = "<option value='"+item.CODE+"' "; 
				if(carCode != "" && carCode == item.CODE){
					appendStr += "selected";
				}
				appendStr += ">"+item.CAR_NM+"</option>";
				$('.carNameSelectBox').append(appendStr);
			})
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}


/* 차명 선택 시 차종 셋팅 */
function setCarDetail(carCode){
	var compId = $('#carCompId').val();
	$('#carCode').val(carCode); //차명코드 세팅
	
	var param = {'carCompId':compId, 'carCode':carCode};
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carDetail',
		async:false,
		type:'POST',
		success:function(response){
			$("#detailInfo tr[class!='header']").remove();
			var count = 0;
			var count2 = 0;
			//1차 : 면세차가표기차량이 하나라도 있으면 보여주는 로직에서
			//2차 : 과세차가표기차량이 하나라도 있으면 보여주게 수정.(20190510)
			//- 면세차가표기차종 삭제예정.
			//(과세차가, 면세차가와 무관한 차종은 값이 null이라 기존 폼으로 보여짐.)
			//3차 : 면세차가 및 과세차가 표기차량이 둘다 비교해서 하나라도 있으면 보여짐 (20190618)
			for(var i=0; i<response.carNameList.length; i++) {
				if (response.carNameList[i]["DUTY_FREE_OPT"] == "0") {
					count++;
				}
				if (response.carNameList[i]["DUTY_FREE_OPT"] == "1") {
					count2++;
				}
			}
			
			$.each(response.carNameList,function(index,item){
				
				var detailInfo_content = "";
				var detailInfo_content2 = "";
				
				if (count > 0 && count2 > 0) {
					$("#duty_free_opt_count").css("display","");
					$("#duty_free_opt_text").css("display","");
					
					if (item.DUTY_FREE_OPT == "0") {
						if (compId == "0001") {
							detailInfo_content = "<tr id='"+item.SEQ+"'>" +
							"<td id='"+item.ID+"' class='title'>"+item.NM+"</td>" +
							"<td class='price'>"+item.AMT+"원</td>" +
							"<td class='price' style='font-weight:bold;'>"+item.HYUNDAI_DUTY_FREE_AMT+"원</td>" +
							"<td id='"+item.JG_TUIX_ST+"' style='text-align:center !important;'><span class='detail-link'>사양보기</span></td>" +											
							"</tr>"
						} else {
							detailInfo_content = "<tr id='"+item.SEQ+"'>" +
							"<td id='"+item.ID+"' class='title'>"+item.NM+"</td>" +
							"<td class='price'>"+item.AMT+"원</td>" +
							"<td class='price' style='font-weight:bold;'>"+item.DUTY_FREE_AMT+"원</td>" +
							"<td id='"+item.JG_TUIX_ST+"' style='text-align:center !important;'><span class='detail-link'>사양보기</span></td>" +											
							"</tr>"
						}
						
					} else {
						detailInfo_content = "<tr id='"+item.SEQ+"'>" +
						"<td id='"+item.ID+"' class='title'>"+item.NM+"</td>" +
						"<td class='price'>"+item.AMT+"원</td>" +
						"<td class='price' style='font-weight:bold;'>"+item.AMT+"원</td>" +
						"<td id='"+item.JG_TUIX_ST+"' style='text-align:center !important;'><span class='detail-link'>사양보기</span></td>" +											
						"</tr>"
					}
				} else {
					$("#duty_free_opt_count").css("display","none");
					$("#duty_free_opt_text").css("display","none");
					
					detailInfo_content = "<tr id='"+item.SEQ+"'>" +
					"<td id='"+item.ID+"' class='title'>"+item.NM+"</td>" +
					"<td class='price'>"+item.AMT+"원</td>" +
					"<td id='"+item.JG_TUIX_ST+"/"+item.LKAS_YN+"/"+item.LDWS_YN+"/"+item.AEB_YN+"/"+item.FCW_YN+"' style='text-align:center !important;'><span class='detail-link'>사양보기</span></td>" +											
					"</tr>"
				}			
				
				/*
					$('#detailInfo').append(
							"<tr id='"+item.SEQ+"'>" +
								"<td id='"+item.ID+"' class='title'>"+item.NM+"</td>" +
								"<td class='price'>"+item.AMT+"원</td>" +
								"<td class='price'>"+item.AMT+"원</td>" +
								"<td id='"+item.JG_TUIX_ST+"' style='text-align:center !important;'><span class='detail-link'>사양보기</span></td>" +											
							"</tr>"
					); //기본 정보
				*/				
				$('#detailInfo').append(detailInfo_content); //기본 정보
				
				var spec = "";
				if(item.spec != "" && item.spec != null && item.spec != "undefined"){
					spec += "<b>" + item.spec + " 기본사양 외</b><br>";
				}
				//선택사양 표시(2018.01.18)
				var optionList = "";
				$.each(item.optionList,function(index,option){
					optionList += "· " + option.NM + " (" + option.DISPLAY_AMT + "원)<br>";
				})
				
				if (count > 0 && count2 > 0) {
					detailInfo_content2 = "<tr style='display:none;'>" +
					"<td colspan='2' style='vertical-align:top !important;'><pre><div><b>&lt; 기본사양 &gt;</b></div>"+ spec + item.CAR_B+"</pre></td>" +
					"<td colspan='2' style='vertical-align:top !important; padding-left:25px;'><pre style='text-align:left !important;'><div><b>&lt; 선택사양 &gt;</b></div>"+ optionList+"</pre></td>" +
					"</tr>"
				} else {
					detailInfo_content2 = "<tr style='display:none;'>" +
					"<td colspan='2' style='vertical-align:top !important;'><pre><div><b>&lt; 기본사양 &gt;</b></div>"+ spec + item.CAR_B+"</pre></td>" +
					"<td colspan='1' style='vertical-align:top !important; padding-left:25px;'><pre style='text-align:left !important;'><div><b>&lt; 선택사양 &gt;</b></div>"+ optionList+"</pre></td>" +
					"</tr>"
				}
				
				/*
					$('#detailInfo').append(
							"<tr style='display:none;'>" +
								//"<td colspan='3'><pre>"+item.CAR_B+"</pre></td>" +
								"<td colspan='2' style='vertical-align:top !important;'><pre><div><b>&lt; 기본사양 &gt;</b></div>"+ spec + item.CAR_B+"</pre></td>" +
								"<td colspan='2' style='vertical-align:top !important; padding-left:25px;'><pre style='text-align:left !important;'><div><b>&lt; 선택사양 &gt;</b></div>"+ optionList+"</pre></td>" +
							"</tr>"
					); //사양 정보
				*/				
				$('#detailInfo').append(detailInfo_content2); //사양 정보
			})
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}

function setCarInfo(carSeq, carId, carName, carAmt){
	//차량 기본 정보 셋팅	
	$('#carSeq').val(carSeq);
	$('#carId').val(carId);
	$('#carAmt').val(carAmt);
	$("#totalAmt").val(carAmt);
	
	refreshOptionTable(); 
	submitCarInfoApply();
		
} 

function calculateFinalAmt(){
	
	var car_comp_id = parseInt($("#carCompId").val());
	
	//차량 선택내용, 월대여료 표 보여주기 
	$(".car-option-table tr[class!='header'],.car-price-table tr[class!='header']").show();
	$('.calculate-btn, .submit-btn, .print-btn').show();
	
	if (car_comp_id == 56) {
		//차량용품
		$("#car_etc_item").css("display", "none");
		$("input:checkbox[id='etc_sun']").prop("checked", false);
		$("input:checkbox[id='etc_navi']").prop("checked", false);
		$("input:checkbox[id='etc_eb']").prop("checked", false);
		
		//차량인도지역
		$("#regionSelectBox option[value='1']").prop("selected",true); //차량인도지역 서울로 초기화
		/*
		$("#regionSelectBox").prop("disabled", true);
		$("#regionSelectBox").css("background-color", "rgb(235, 235, 228)");
		*/
		$("#regionSelectBox").prop("disabled", false);
		$("#regionSelectBox").css("background-color", "");
		
		//약정운행거리 안내문구 - 20190821
		$("#region_coment_ts1").css("display", "none");
		
		//차량인도지역 안내문구 - 임시주석 20190821
		//$("#region_coment_ts2").css("display", "");
	} else {
		//차량용품
		$("#car_etc_item").css("display", "table-row");
		
		//차량인도지역
		$("#regionSelectBox option[value='1']").prop("selected",true); //차량인도지역 서울로 초기화
		$("#regionSelectBox").prop("disabled", false);
		$("#regionSelectBox").css("background-color", "");
		
		//약정운행거리 안내문구 - 20190821
		$("#region_coment_ts1").css("display", "");
		
		//차량인도지역 안내문구 - 임시주석 20190821
		//$("#region_coment_ts2").css("display", "none");
	}
	
	var carAmt = parseInt($("#carAmt").val()); //차가
	var dcAmt = parseInt($("#dcAmt").val()); //dc금액
	var taxAmt = parseInt($("#taxAmt").val()); //개소세
	
	$('#totalAmt').val(carAmt-dcAmt-taxAmt);
	//$('#totalAmt').val(carAmt-dcAmt);
	
	//보증금 셋팅
	var depositPer = $('#depositSelectBox option:selected').val();
	
	//선납금 셋팅
	var prePer = $('#preSelectBox option:selected').val();
	
	var originAmt = $('#totalAmt').val();

	//기존로직
	/*if(originAmt >= 45000000){
		depositPer = 25;
	}else{
		depositPer = 20;
	}*/
	
	//deatail에서 넘어 온것인지 확인
	var foreignFlag = $("#foreignFlag").val();
	
	//20190517상세에서 넘어오는지 차량선택했는지
	if (default_count <= 1) {
		if (car_comp_id <= 5) {
			depositPer = 20;
		} else {
			depositPer = 25;
		}
	}
	
	//친환경차 적용 -> 테슬라모델X로 인하여 친환경차구분 대신 엔진구분으로 변경 20190619
	/*if($("#ecarFlag").val() == "3" || $("#ecarFlag").val() == "4"){*/
	if (Number($("#jg_b").val()) > 4) {	
		
		if (Number($("#jg_b").val()) == 5) {
			/*if ($("#carCompId").val() != "0056" && $("#sh_code").val() != "9133") {
				$("#view_price_eh_car").css("display","block");
				$("#view_price_other_car").css("display","none");
			} else {*/
				$("#view_price_eh_car").css("display", "none");
				$("#view_price_other_car").css("display", "block");
			//}
		} else {
			$("#view_price_eh_car").css("display", "none");
			$("#view_price_other_car").css("display", "block");
		}
		
		//$(".ecar-area").show();
		//테슬라차량 모델S일때 고객주소지 표시
		if (Number($("#jg_b").val()) == 5) {			
			$(".hcar-area").hide();
			$("#hcarLocationSelectBox option[value='0']").prop("selected", true); //고객주소지 서울로 기본값 set
			if ($("#carCompId").val() == "0056") {
				if ($("#sh_code").val() == "4854" || $("#sh_code").val() == "3871") {
					$(".ecar-area").show();
					$("#ecarLocationSelectBox option[value='0']").prop("selected", true); //고객주소지 서울로 기본값 set
				} else {
					$(".ecar-area").hide();					
					$("#ecarLocationSelectBox option[value='0']").prop("selected", true); //고객주소지 서울로 기본값 set
				}
			} else {
				$(".ecar-area").show();
			}
		} else {
			$(".ecar-area").hide();
			$(".hcar-area").show();
		}
		
		//20190517차량 변경시 퍼센트 유지
		if (default_count <= 1) {
			if (foreignFlag == "") {
				depositPer = depositPer - 10;
			} else {			
				depositPer = depositPer;
			}
		} else {
			depositPer = depositPer;
		}
		
		if ($("#gubunSelectBox option:selected").val() == "22" || $("#gubunSelectBox option:selected").val() == "12" ) {
			$(".view_sellingOpt_on").css("display","block");
			$(".view_sellingOpt_off").css("display","none");
		} else {
			$(".view_sellingOpt_on").css("display","none");
			$(".view_sellingOpt_off").css("display","block");
		}
	}else{
		$("#view_price_eh_car").css("display","none");
		$("#view_price_other_car").css("display","block");
		//$(".ecar-selling-area").hide();
		$(".ecar-area").hide();
		$(".hcar-area").hide();
	}
	
	//보증금 20190517차량 변경시 금액유지
	$("#depositSelectBox option[value='"+depositPer+"']").prop("selected",true);
	//	var depositAmt = originAmt * (depositPer / 100);
	if ($("#depositSelectBox option:selected").text() != "금액직접입력") {
		var depositAmt = priceCutting(originAmt * (depositPer / 100), "R", 100);
		$('#depositAmt').val(depositAmt.toLocaleString()+"원");
	}
	
	//선납금 20190517차량 변경시 금액유지
	$("#preSelectBox option[value='"+prePer+"']").prop("selected",true);
	//	var depositAmt = originAmt * (depositPer / 100);
	if ($("#preSelectBox option:selected").text() != "금액직접입력") {		
		var preAmt = priceCutting(originAmt * (prePer / 100), "R", 100);
		$('#preAmt').val(preAmt.toLocaleString()+"원");
	}
	
	$("#totalDisplayAmt").text(numberWithCommas(carAmt-dcAmt-taxAmt)+"원");
		
	//$("#preSelectBox option:selected").val();
		
	//Ajax 로딩시 운전자연령 24세 제한 유무
	var gubun = $('#gubunSelectBox option:selected').val();
	if(gubun == "21" || gubun == "22"){ 
		$("#driverAgeSelectBox option[value='3']").attr('disabled', 'disabled').hide();	//장기렌트 상품인 경우 운전자연령 만 24세 옵션 삭제
	}else{  //리스인 경우
		$("#driverAgeSelectBox option[value='3']").removeAttr("disabled").show();	//자동차리스인 경우 만 24세 옵션 보여주기
		if($("#countrySelectBox option:selected").val() == "2"){
			$(".import-lease-info").show();
		}
	}
	
	return "차량 정보가 적용되었습니다";
}


/* 색상 정보 리턴 */
//function checkColorName(id){
//	if($("#"+id+" option:selected").text().indexOf("하세요") > 0){
//		return "";
//	}else{
//		return $("#"+id+" option:selected").text().split("(")[0].replace(/ /g,'');
//	}
//}

/* 옵션 셋팅하기 */
function setCarOption(list) {
	$('.option-item').remove(); //기존에 있는 옵션은 삭제한다
	$('.option-item-button').remove(); //기존에 있는 TUIX/TUON버튼 삭제
	var rowspan = list.length +1;
	
	var jg_tuix_st_count = 0;
	
	$.each(list, function(index, item) {
		if (item.JG_TUIX_ST == "Y") {
			jg_tuix_st_count++;
		}
	})
	
	var content = "";		
	var title = "<tr class='option-item'>" +
						"<td colspan='4' style='height: 50px; padding-left: 25px; padding-right: 15px; border-bottom: 1px solid #eee !important;'>옵션</td>" +
					"</tr>";	
	var totalSum = "<tr class='option-item' style='height:45px;;border-bottom:1px solid #eeeeee !important'>" +
						  		/*"<td class='text-right' colspan='4'><span class='bold'>(추가 옵션 금액 합계)</span><span class='option-sum bold' style='padding-left: 10px;'>(0원)</span></td>" +*/
						  		"<td class='text-right' colspan='4'><span class='bold'>옵션가격합계</span><span class='option-sum bold' style='padding-left: 10px;'>(0원)</span></td>" +
						  "</tr>";
	
	$.each(list, function(index, item) {
		if (item.JG_TUIX_ST != "Y") {
			
			content += "<tr class='option-item'>" +
								"<td></td>" +
								"<td colspan='2' style='padding-top: 10px;'>" +
								"<input type='checkbox' id='"+item.ID+"' value='"+item.ID+"' name='carOption'/>" +
								"&nbsp;&nbsp;<label for='"+item.ID+"'>" + item.NM + "</label>";
			
			if (item.OPT_B != null && item.OPT_B != "") { //옵션 비고 있을 때
				content +=  "<img src='/resources/images/icon_op_search.png' class='option-ic' style='padding-left: 10px;'>" +
				"<br/><div class='option-desc' style='display:none;'>"+item.OPT_B+"</div>";
			}
			
			if (item.JG_OPT_ST != null && item.JG_OPT_ST != "") { //잔가 관련 옵션 비고 있을 때				
				if (item.JG_OPT_9 != null && item.JG_OPT_9 != "" && item.JG_OPT_9 != "undefined") { //비고에 undefined 뜨는것 방지
					content += "<div class='option-jg-desc' id='"+item.JG_OPT_ST+"'>"+item.JG_OPT_9+"</div>";
				} else {				
					content += "<div class='option-jg-desc' id='"+item.JG_OPT_ST+"' style='display:none;'></div>";
				}			
			}
			
			//jg_tuix_st 값이 있을때 추가(2017.07.07)
			if (item.JG_TUIX_ST != null && item.JG_TUIX_ST != "") {
				if (item.JG_TUIX_ST == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='jgTuixOptY'></div>"
				}
			}
			
			if (item.LKAS_YN != null && item.LKAS_YN != "") {
				if (item.LKAS_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='lkasOptY'></div>"
				}
			}
			
			if (item.LDWS_YN != null && item.LDWS_YN != "") {
				if (item.LDWS_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='ldwsOptY'></div>"
				}
			}
			
			if (item.AEB_YN != null && item.AEB_YN != "") {
				if (item.AEB_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='aebOptY'></div>"
				}
			}
			
			if (item.FCW_YN != null && item.FCW_YN != "") {
				if (item.FCW_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='fcwOptY'></div>"
				}
			}
			
			if (item.JG_OPT_YN == "N") {
				content += "<div class='jgOptN'></div>"
			}
			
			content += "</td>" + 
							"<td class='option-price' param='"+item.AMT+"' style='padding-left: 0px !important; padding-top: 10px;'>" + 
							item.DISPLAY_AMT + "원" + 
							"</td>" +
						"</tr>";			
		}
		
	})
	
	//tuix옵션이 있을경우에만 보여줌
	if (jg_tuix_st_count > 0) {
		content += "<tr class='option-item-button'>" +
							"<td style='border-bottom: 0px solid #FFF !important;'></td>" +
							"<td colspan='3' style='padding-top: 15px; border-bottom: 0px !important;'>" +
								"<div id='tuix' onclick='tuix_click();'>"+
									"TUIX/TUON 옵션 보기" +
								"</div>" +
							"<td>" +
						"</tr>";
	}
	
	$.each(list, function(index, item) {
		if (item.JG_TUIX_ST == "Y") {
			
			content += "<tr class='option-item option-hide' style='display: none;'>" +
								"<td></td>" +
								"<td colspan='2' style='padding-top: 10px;'>" +
								"<input type='checkbox' id='"+item.ID+"' value='"+item.ID+"' name='carOption'/>" +
								"&nbsp;&nbsp;<label for='"+item.ID+"'>" + item.NM + "</label>";
			
			if (item.OPT_B != null && item.OPT_B != "") { //옵션 비고 있을 때
				content +=  "<img src='/resources/images/icon_op_search.png' class='option-ic' style='padding-left: 10px;'>" +
				"<br/><div class='option-desc' style='display:none;'>"+item.OPT_B+"</div>";
			}
			
			if (item.JG_OPT_ST != null && item.JG_OPT_ST != "") { //잔가 관련 옵션 비고 있을 때
				if (item.JG_OPT_9 != null && item.JG_OPT_9 != "" && item.JG_OPT_9 != "undefined") { //비고에 undefined 뜨는것 방지
					content += "<div class='option-jg-desc' id='"+item.JG_OPT_ST+"'>"+item.JG_OPT_9+"</div>";
				} else {				
					content += "<div class='option-jg-desc' id='"+item.JG_OPT_ST+"' style='display:none;'></div>";
				}			
			}
			
			//jg_tuix_st 값이 있을때 추가(2017.07.07)
			if (item.JG_TUIX_ST != null && item.JG_TUIX_ST != "") {
				if (item.JG_TUIX_ST == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='jgTuixOptY'></div>"
				}
			}
			
			if (item.LKAS_YN != null && item.LKAS_YN != "") {
				if (item.LKAS_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='lkasOptY'></div>"
				}
			}
			
			if (item.LDWS_YN != null && item.LDWS_YN != "") {
				if (item.LDWS_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='ldwsOptY'></div>"
				}
			}
			
			if (item.AEB_YN != null && item.AEB_YN != "") {
				if (item.AEB_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='aebOptY'></div>"
				}
			}
			
			if (item.FCW_YN != null && item.FCW_YN != "") {
				if (item.FCW_YN == "Y") {	//여러개의 옵션 중 하나라도 Y값이 존재하면 견적서(estimate_cu)에는 한번만 Y로 입력.
					content += "<div class='fcwOptY'></div>"
				}
			}
			
			if (item.JG_OPT_YN == "N") {
				content += "<div class='jgOptN'></div>"
			}
			
			content += "</td>" + 
							"<td class='option-price' param='"+item.AMT+"' style='padding-left: 0px !important; padding-top: 10px;'>" + 
							item.DISPLAY_AMT + "원" + 
							"</td>" +
						"</tr>";			
		}
		
	})
	
	//옵션은 없고 색상선택만(가격변동 유) 가능한 차종(예:수입차)의 경우, 색상 선택시 차량가격에 색상잔가가 합산표현 되지않아
	//name='carOption'에 trigger 시키기 위해 빈 히든값을 만들어둔다.(2017.11.24)
	if (list.length==0) {
		content += "<tr class='option-item'>"+
							"<td colspan='4'>"+
								"<input type='hidden' id='' value='' name='carOption'/>"+
							"</td>"+
						"</tr>";
	}
	
	$('.smart-info-table .carInfo-row').after(title + content + totalSum);
	
}

/* TUIX/TUON 접기 펼치기 */
function tuix_click() {
	var plain_text = $("#tuix").text().trim();
	
	if (plain_text == "TUIX/TUON 옵션 보기") {			
		$(".option-hide").show();
		$("#tuix").text("TUIX/TUON 옵션 접기");
	} else {
		$(".option-hide").hide();
		$("#tuix").text("TUIX/TUON 옵션 보기");
	}
}

/* DC 재계산하기 */
function calculateDcAmt(){	
	
	var carAmt = $("#totalAmt").val();	 
	var dcAmt = 0;
	var rentDcAmt = 0;
	var leaseDcAmt = 0;
	
	var car_d_per = parseInt($("#car_d_per").val())||0;
	var car_d_per2 = parseInt($("#car_d_per2").val())||0;
	var car_d_p = parseInt($("#car_d_p").val())||0;
	var car_d_p2 = parseInt($("#car_d_p2").val())||0;
	var car_d_per_b = parseInt($("#car_d_per_b").val())||0;
	var car_d_per_b2 = parseInt($("#car_d_per_b2").val())||0;
	var ls_yn = $("#ls_yn").val();
	
	//D/C율 반영기준 : D/C금액 반영전 차가의
	rentDcAmt = (carAmt*car_d_per/100)+car_d_p;
	if(car_d_per_b == '2'){ //D/C율 반영기준 : D/C금액 반영후 차가의
		rentDcAmt 	= ((carAmt-car_d_p)*car_d_per/100)+car_d_p;
	}
	
	//렌트,리스조건 상이여부 
	if(ls_yn == 'Y'){		
		leaseDcAmt = (carAmt*car_d_per2/100)+car_d_p2;
		if(car_d_per_b2 == '2'){
			leaseDcAmt = ((carAmt-car_d_p2)*car_d_per2/100)+car_d_p2;			
		}
	}else{
		leaseDcAmt = rentDcAmt;
	}
	
	//if($("#gubunSelectBox > option:selected").text().indexOf("리스") && leaseDcAmt > 0){
	if(($("#gubunSelectBox > option:selected").val()=="11" || $("#gubunSelectBox > option:selected").val()=="12" ) && leaseDcAmt > 0){
		dcAmt = leaseDcAmt;		
	}else{
		dcAmt = rentDcAmt;
	}	
	$("#rentDcAmt").val(rentDcAmt);
	$("#leaseDcAmt").val(leaseDcAmt);	
	
	if(dcAmt > 0){
		$("#dcAmt").val(dcAmt);
		$("#displayDcAmt").text(numberWithCommas(dcAmt) + "원");
		$(".dcAmt-row").show();
		$("#totalDisplayAmt-info > span:first").show(); //차량가격 옆에 info 보여주기
		
	}else{
		$(".dcAmt-row").hide();
		$("#totalDisplayAmt-info > span:first").hide();
	}
}

/* DC 셋팅하기 */
function setCarDCAmt(param){
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		async:false,
		data:JSON.stringify(param),
		url:'/control/smart/carDCAmt',
		type:'POST',
		success:function(response){
			if(response.result == 1){
				$("#car_d_per").val(response.CAR_D_PER);
				$("#car_d_per2").val(response.CAR_D_PER2);
				$("#car_d_p").val(response.CAR_D_P);
				$("#car_d_p2").val(response.CAR_D_P2);
				$("#car_d_per_b").val(response.CAR_D_PER_B);
				$("#car_d_per_b2").val(response.CAR_D_PER_B2);
				$("#ls_yn").val(response.LS_YN);
			}else{
				$("#car_d_per").val(0);
				$("#car_d_per2").val(0);
				$("#car_d_p").val(0);
				$("#car_d_p2").val(0);
				$("#car_d_per_b").val(0);
				$("#car_d_per_b2").val(0);
				$("#ls_yn").val(0);
			}
			calculateDcAmt();
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}
/* 색상 셋팅하기  */
function setCarColor(param){
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carColors',
		type:'POST',
		async:true,
		success:function(response){
			$("#colorText").html("");
			var count = 0;
			var appendText = "";
			$.each(response,function(index,item){
				count++;
				appendText = $("#colorText").html();
				/*if (count == 1) {					
					appendText += "<div class='colorBox'><table><tr><td><input type='radio' checked name='car-color' id='car-color-"+count+"' value='" + item.ID + ":"+item.AMT;
				} else {
					appendText += "<div class='colorBox'><table><tr><td><input type='radio' name='car-color' id='car-color-"+count+"' value='" + item.ID + ":"+item.AMT;					
				}*/
				appendText += "<div class='colorBox'><table><tr><td><input type='radio' name='car-color' id='car-color-"+count+"' value='" + item.ID + ":"+item.AMT;
				
				if(typeof item.JG_OPT_ST !== "undefined"){
					appendText += ":" + item.JG_OPT_ST;
					$("#color-jg-name").text("※ "+item.NM).show();
					$("#color-jg-info").text(" "+item.JG_OPT_9).show();
					$(".color-hide-tr").show();
					
					$("#colorTitleRow").css("rowspan", "");
					$("#color-jg-tr").show();
				}
				appendText += "'></td>"; 
				if(item.SAVE_FILE != null){
					appendText += "<td><image src='https://fms3.amazoncar.co.kr" + item.SAVE_FOLDER + item.SAVE_FILE + "'/></td>";
				}
				appendText += "<td><label for='car-color-"+count+"'>" + item.NM + "</label></td>";
				appendText += "</table></div>";
				
				$("#colorText").html(appendText);
				
			})
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}

/* 차량 주요 코드에 따라 상품 및 표준약정운행거리 세팅하기 */
/* 첨단안전사양 초기셋팅 */
function setCarCode(param){
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carCodes',
		async:false,
		type:'POST',
		success:function(response){			
			var jg_h = parseInt(response.JG_H) || 0;
			var jg_i = parseInt(response.JG_I) || 0;
			validateProduct(jg_h, jg_i);
						
			if (response.JG_TUIX_ST == "undefined" || response.JG_TUIX_ST == "") {
				$("#jg_tuix_st").val("");
			} else {
				$("#jg_tuix_st").val(response.JG_TUIX_ST);				
			}
			
			if (response.LKAS_YN == "undefined" || response.LKAS_YN == "") {
				$("#lkas_yn").val("");
			} else{
				$("#lkas_yn").val(response.LKAS_YN);				
			}
			
			if (response.LDWS_YN == "undefined" || response.LDWS_YN == "") {
				$("#ldws_yn").val("");
			} else{
				$("#ldws_yn").val(response.LDWS_YN);				
			}
			
			if (response.AEB_YN == "undefined" || response.AEB_YN == "") {
				$("#aeb_yn").val("");
			} else{
				$("#aeb_yn").val(response.AEB_YN);				
			}
			
			if (response.FCW_YN == "undefined" || response.FCW_YN == "") {
				$("#fcw_yn").val("");
			} else{
				$("#fcw_yn").val(response.FCW_YN);				
			}			
			
			//트럭이면 일반식 상품 금지
			var sh_code = response.SH_CODE;
			if(sh_code > 9120 && sh_code < 9410){
				$("#gubunSelectBox option[value='12']").prop("selected",true);
				$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='21']").prop("disabled",true);
			}
			
			//표준약정운행거리 계산 및 연료 정보 셋팅
			var stdAgreeDist = 30000;
			var fuelName = "휘발유";
			if(response.JG_B == '1'){ stdAgreeDist += 5000; fuelName="경유"; }
			else if(response.JG_B == '2'){ stdAgreeDist += 5000; fuelName="LPG"; }
			$('#stdAgreeDist').val(stdAgreeDist);
			$('#stdAgreeDist-show').val(stdAgreeDist+"km");
			$('#carDiesel').val(fuelName);
			$('#ecarFlag').val(response.JG_G_7); //친환경차량 여부 flag 셋팅
			$('#jg_b').val(response.JG_B); //엔진종류셋팅
			//전기차일경우 이동형충전기 선택가능하게 추가(2018.04.06)
			$("#etc_eb").prop("checked", false);
			if(response.JG_G_7=="3"){
				$("#eb_span").css("display", "none");
			}else{
				$("#eb_span").css("display", "none");
			}
			$("#carAmtRe").val(0);			
						
			/*if ((response.JG_G_7=="3") && (response.CAR_COMP_ID != "0056" && sh_code != "9133")) {
				$("#print_type").val("6");
			} else {
				$("#print_type").val("1");
			}*/
			$("#print_type").val("1");
			
			//$("#print_type").val("1");
			
			$("#jg_w").val(response.JG_W);
			$("#jg_g_7").val(response.JG_G_7);
			$("#jg_g_8").val(response.JG_G_8);
			$("#jg_2").val(response.JG_2);
			$("#jg_3re").val(response.JG_3);
			$("#sh_code").val(sh_code);
			$("#jg_g_15").val(response.JG_G_15);	//	JG_G_15 추가(전기차 구매보조금 관련 변수)(2018.01.31)
			$("#car_etc").val(response.ETC2);		//	견적서에 표기할 차량 비고 존재시 호출(2018.05.08)
			$("#dc_bigo").val(response.BIGO);		//	견적서에 표기할 제조사DC 비고 존재시 호출(2018.05.08)
			$("#duty_free_opt").val(response.DUTY_FREE_OPT);	//면세가표기차량 여부(20190502)
			
			//개소세 감면액 구하기
			getTaxDcAmt(response.JG_W, response.JG_G_7, response.JG_2, response.JG_3, sh_code);
			
			setViewDutyFreeOpt(sh_code);			
			
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}

/* 첨단안전사양 초기셋팅 */
function setCarCodeTuix(param){
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carCodes',
		async:false,
		type:'POST',
		success:function(response){	
						
			if (response.JG_TUIX_ST == "undefined" || response.JG_TUIX_ST == "") {
				$("#jg_tuix_st").val("");
			} else {
				$("#jg_tuix_st").val(response.JG_TUIX_ST);				
			}
			
			if (response.LKAS_YN == "undefined" || response.LKAS_YN == "") {
				$("#lkas_yn").val("");
			} else{
				$("#lkas_yn").val(response.LKAS_YN);				
			}
			
			if (response.LDWS_YN == "undefined" || response.LDWS_YN == "") {
				$("#ldws_yn").val("");
			} else{
				$("#ldws_yn").val(response.LDWS_YN);
			}
			
			if (response.AEB_YN == "undefined" || response.AEB_YN == "") {
				$("#aeb_yn").val("");
			} else{
				$("#aeb_yn").val(response.AEB_YN);
			}
			
			if (response.FCW_YN == "undefined" || response.FCW_YN == "") {
				$("#fcw_yn").val("");
			} else{
				$("#fcw_yn").val(response.FCW_YN);
			}
			
		},
		error:function(request,status,error){
			alert(response.message);
		}
	});	
}

//차량 적용하기
function submitCarInfoApply(){
	var carId = $('#carId').val();
	var carCode = $('#carCode').val();
	var compId = $('#carCompId').val();
	var carSeq = $("#carSeq").val();	
	
	var param = {'carCompId':compId,'carCode':carCode,'carId':carId,'carSeq':carSeq};

	$.ajax({
		contentType:'application/json',
		dataType:'json',
		data:JSON.stringify(param),
		url:'/control/smart/carOptions',
		type:'POST',
		async:false,
		success:function(response) {
			
			setCarOption(response);
			setCarDCAmt(param);
			setCarColor(param);
			setCarCode(param);
			
			default_count++;			
		},
		error:function(request,status,error) {
			alert(response.message);
		}
	});	
	
	//테슬라차량 추가로인하여 대여기간 및 주행거리 기본셋팅
	/*if (compId == "0056") {
		//대여기간 셋팅
		$("#periodSelectBox").attr("disabled", true);
		$("#periodSelectBox").css("background-color", "rgb(235, 235, 228)");
		$("#periodSelectBox option[value='36']").prop("selected",true);
		
		//주행거리 셋팅
		$("#agreeDistSelectBox").attr("disabled", true);
		$("#agreeDistSelectBox").css("background-color", "rgb(235, 235, 228)");
		$("#agreeDistSelectBox option[value='20000']").prop("selected",true);
		
		$("#agree_view").css("display", "none");
	} else {
		//대여기간 셋팅
		$("#periodSelectBox").attr("disabled", false);
		$("#periodSelectBox").css("background-color", "");
		$("#periodSelectBox option[value='48']").prop("selected",true);
		
		//주행거리 셋팅
		$("#agreeDistSelectBox").attr("disabled", false);
		$("#agreeDistSelectBox").css("background-color", "");
		$("#agreeDistSelectBox option[value='20000']").prop("selected",true);
		
		$("#agree_view").css("display", "");
	}*/
	
	var shCode = $("#sh_code").val();
	
	//테슬라차량 대여기간 및 연간약정운행거리 선택 제한
	if (compId == "0056") {
		$("#periodSelectBox option[value='60']").prop("disabled", true);		
		$("#periodSelectBox option[value='48']").prop("disabled", false);			
		/*if (shCode == "5866") {
			$("#periodSelectBox option[value='48']").prop("disabled", false);			
		} else {
			$("#periodSelectBox option[value='48']").prop("disabled", true);			
		}*/
		$("#periodSelectBox option[value='12']").prop("disabled", true);
		$("#periodSelectBox option[value='directInput']").prop("disabled", true);
		
		$("#agreeDistSelectBox").find("option").each(function() {
			if (!(this.value == "10000" || this.value == "15000" || this.value == "20000" || this.value == "25000" || this.value == "30000")) {
				$("#agreeDistSelectBox option[value='"+this.value+"']").prop("disabled", true);
			}
		});
	} else {
		$("#periodSelectBox option[value='60']").prop("disabled", false);
		$("#periodSelectBox option[value='48']").prop("disabled", false);
		$("#periodSelectBox option[value='12']").prop("disabled", false);
		$("#periodSelectBox option[value='directInput']").prop("disabled", false);
		
		$("#agreeDistSelectBox").find("option").each(function() {
			if (!(this.value == "10000" || this.value == "15000" || this.value == "20000" || this.value == "25000" || this.value == "30000")) {
				$("#agreeDistSelectBox option[value='"+this.value+"']").prop("disabled", false);
			}
		});
	}
	
	//대여기간 셋팅
	$("#periodSelectBox").attr("disabled", false);
	$("#periodSelectBox").css("background-color", "");	
	if (compId == "0056") {
		$("#periodSelectBox option[value='48']").prop("selected", true);
		/*if (shCode == "5866") {
			$("#periodSelectBox option[value='48']").prop("selected", true);
		} else {			
			$("#periodSelectBox option[value='36']").prop("selected", true);
		}*/
	} else {
		$("#periodSelectBox option[value='48']").prop("selected", true);		
	}	
	$("#periodSelectBox option:selected").trigger("change");
	
	//주행거리 셋팅
	$("#agreeDistSelectBox").attr("disabled", false);
	$("#agreeDistSelectBox").css("background-color", "");
	$("#agreeDistSelectBox option[value='20000']").prop("selected", true);
	$("#agreeDistSelectBox option:selected").trigger("change");
	
	$("#agree_view").css("display", "");
	
}

/* 폼 데이터 삽입 */
function insertFormData(){
	
	//옵션 코드,이름,가격 저장
	var optionValue = "";
	var optionName = "";
	var optionAmt = 0;
	var optionAmt_m = 0;
	
	optionAmt = Number(optionAmt);
	optionAmt_m = Number(optionAmt_m);
	
	$("#jg_opt_st").val(""); //잔가 정보 초기화
	$("#jg_tuix_st").val("")//tuix 옵션 유무 정보 초기화
	
	$("#lkas_yn_opt_st").val("");//차선이탈 제어형 옵션여부
	$("#ldws_yn_opt_st").val("");//차선이탈 경고형 옵션여부
	$("#aeb_yn_opt_st").val("");//긴급제동 제어형 옵션여부
	$("#fcw_yn_opt_st").val("");//긴급제동 경고형 옵션여부
	
	/* 차종 첨단안전사양 set_start */
	var carId = $('#carId').val();
	var carCode = $('#carCode').val();
	var compId = $('#carCompId').val();
	var carSeq = $("#carSeq").val();
	
	var param = {'carCompId':compId,'carCode':carCode,'carId':carId,'carSeq':carSeq};
	
	setCarCodeTuix(param);
	/* 첨단안전사양_end */
	
	$("input[name='carOption']:checked").each(function(){
		optionValue += $(this).val();
		optionName += "[" + $(this).next("label").text() + "] ";
		optionAmt += parseInt($(this).parent().next(".option-price").attr("param"));
		
		if ($(this).siblings("div").hasClass("jgOptN") == true) {
			optionAmt_m += parseInt($(this).parents().next(".option-price").attr("param"));
		}
		
		//if($(this).next().next("div").hasClass("option-jg-desc")){ //옵션 잔가 넣기
		if($(this).siblings("div").hasClass("option-jg-desc")){ //옵션 잔가 넣기
			//$("#jg_opt_st").val($(this).next().next().attr("id"));
			
			//jg_opt_st 가 fms와 다르게 insert 되고 있어서 수정(2017.06.16)
			var jg_opt_st = $("#jg_opt_st").val();
			if(jg_opt_st==""){
				$("#jg_opt_st").val($(this).siblings(".option-jg-desc").attr("id"));				
			}else{
				var jg_desc = $(this).siblings(".option-jg-desc").attr("id");				
				jg_opt_st = jg_opt_st + "/" + jg_desc; 
				$("#jg_opt_st").val(jg_opt_st);
			}
		}
		//tuix 옵션 추가(2017.07.07)
		var tuixYn = $(this).siblings("div").hasClass("jgTuixOptY");		
		if(tuixYn==true){
			$("#jg_tuix_opt_st").val("Y");
		}
		
		var lkasYn = $(this).siblings("div").hasClass("lkasOptY");		
		if(lkasYn==true){
			$("#lkas_yn_opt_st").val("Y");
		}
		
		var ldwsYn = $(this).siblings("div").hasClass("ldwsOptY");		
		if(ldwsYn==true){
			$("#ldws_yn_opt_st").val("Y");
		}
		
		var aebYn = $(this).siblings("div").hasClass("aebOptY");		
		if(aebYn==true){
			$("#aeb_yn_opt_st").val("Y");
		}
		
		var fcwYn = $(this).siblings("div").hasClass("fcwOptY");		
		if(fcwYn==true){
			$("#fcw_yn_opt_st").val("Y");
		}
		
	});
	
	// 차선이탈 제어, 경고형, 긴급제동 제어, 경고형 옵션에 포함되어 있을 경우 ESTIMATE_CU 테이블 lkas_yn, ldws_yn, aeb_yn, fcw_yn 값을 Y로 설정(2019.07.01)
	if ($("#jg_tuix_opt_st").val() != "" && $("#jg_tuix_opt_st").val() == "Y"){
		$("#jg_tuix_st").val("Y");
	}
	
	if ($("#lkas_yn_opt_st").val() != "" && $("#lkas_yn_opt_st").val() == "Y"){
		$("#lkas_yn").val("Y");
	}
	
	if ($("#ldws_yn_opt_st").val() != "" && $("#ldws_yn_opt_st").val() == "Y"){
		$("#ldws_yn").val("Y");
	}
	
	if ($("#aeb_yn_opt_st").val() != "" && $("#aeb_yn_opt_st").val() == "Y"){
		$("#aeb_yn").val("Y");
	}
	
	if ($("#fcw_yn_opt_st").val() != "" && $("#fcw_yn_opt_st").val() == "Y"){
		$("#fcw_yn").val("Y");
	}
	
	var colorNm = "";
	var colorAmt = 0;
	if(typeof $("input[name='car-color']:checked").val() == "undefined"){
		colorNm = "";
	}else{
		var colorId = $("input[name='car-color']:checked").attr("id");
		colorNm = $("label[for='"+colorId+"']").html();
		$('#colorId').val($("input[name='car-color']:checked").val().split(":")[0]);
		$('#colorName').val(encodeURIComponent(colorNm)); 
		colorAmt = parseInt($("input[name='car-color']:checked").val().split(":")[1]);
	}
	$('#colorAmt').val(colorAmt);
	
	$('#optSeq').val(optionValue);
	$('#optName').val(encodeURIComponent(optionName)); //옵션명은 인코딩해서 보낸다
	$('#contiRat').val(encodeURIComponent($('#originContiRat').val())); //연비 정보도 인코딩해서 보낸다
	$('#optAmt').val(optionAmt);
	$("#optAmt_m").val(optionAmt_m);
	
	//총액 계산 
	$('#o_1').val(parseInt($('#carAmt').val()) + parseInt($('#optAmt').val()) + parseInt($('#colorAmt').val()) - parseInt($('#dcAmt').val()) - parseInt($("#taxAmt").val()) );
	//$('#o_1').val(parseInt($('#carAmt').val()) + parseInt($('#optAmt').val()) + parseInt($('#colorAmt').val())); // - parseInt($('#dcAmt').val()) 20191002 개소세감면액 미반영 차량가격으로 함.
	
	//구분,매입옵션,약정운행거리 저장
	$('#a_a').val($("#gubunSelectBox option:selected").val());
	$('#optChk').val($("#sellingOption").attr("param"));
	
	var agreeDist = checkAgreeDistValue(); //약정운행거리 셋팅
	if(agreeDist == false){	return false; }else{ $('#agreeDist').val(agreeDist); }	
	var period = checkPeriodValue(); //대여기간 셋팅
	if(period == false){	return false; }else{ $('#a_b').val(period); }
	
	//보증금,선납금,보증보험 저장
	$("#rg_8").val($("#depositSelectBox option:selected").val());
	$("#rg_8_amt").val($("#depositAmt").val().replace("원","").replace(/\,/g,''));
	$("#pp_per").val($("#preSelectBox option:selected").val());
	$("#pp_amt").val($("#preAmt").val().replace("원","").replace(/\,/g,''));
	
	//기타
	$("#ins_age").val($("#driverAgeSelectBox option:selected").val()); //운전자 연령
	$("#car_ja").val($("#carJaSelectBox option:selected").val().replace("원","").replace(/\,/g,'')); //자차면책금
	$("#loc_st").val($("#regionSelectBox option:selected").val()); //인도지역
	
	//$("#a_h").val($("#regionSelectBox option:selected").val()); //인도지역
	$("#ins_dj").val($("#insureUnitSelectBox option:selected").val()); //대물자손
	$("input[name='etc_option']").each(function(){ //차량용품
		var selectedValue = $(this).val();
		if($(this).prop("checked")){
			$("#"+selectedValue).val("Y");
		}else{
			$("#"+selectedValue).val("");
		}
	});
	
	//수입차이고 리스인 경우 
	if($("#countrySelectBox option:selected").val() == "2" && $("#gubunSelectBox option:selected").val() == "12"){
		//$("#ins_per").val("2");
		$("#ins_per").val("1");
	}else{
	    $("#ins_per").val("1");
    }
	
	var ecarFlag = $('#ecarFlag').val();
	/*if(ecarFlag > 0){
		$("#ecarLoc").val($("#ecarLocationSelectBox option:selected").val());
	}*/
	if (ecarFlag == 3) {
		$("#ecarLoc").val($("#ecarLocationSelectBox option:selected").val());
	} else if (ecarFlag == 4) {
		$("#hcarLoc").val($("#hcarLocationSelectBox option:selected").val());
	}
	
	if (ecarFlag == 3) { //전기차인 경우
		$("#a_h").val("1");
		//2018.02.08 전기차 고객주소지 변경
		var ecar_loc = $("#ecarLoc").val();
		var a_a = $("#a_a").val();
				 
		if ($("#sh_code").val() == "3871") {//20200221 테슬라 모델3는 실등록지역 서울로 등록
			$("#a_h").val("1");
		} else if ($("#sh_code").val() == "9133" || $("#sh_code").val() == "9237") {//20200221 포터일렉트릭, 봉도EV는 실등록지역 인천 등록
			$("#a_h").val("7");
		} else {
			if (ecar_loc == "0") {			$("#a_h").val("1");	}	//서울은 서울등록
			else if (ecar_loc == "1") {	$("#a_h").val("7");	}	//인천,경기는 인천등록
			else if (ecar_loc == "2") {	$("#a_h").val("1");	}	//강원은 서울등록
			else if (ecar_loc == "3") {	$("#a_h").val("5");	}	//대전은 대전등록
			else if (ecar_loc == "4") { 	$("#a_h").val("1");	}	//광주,전남,전북은 서울등록
			else if (ecar_loc == "5") {	$("#a_h").val("10");	}	//대구는 대구등록
			else if (ecar_loc == "6") {	$("#a_h").val("3");	}	//부산은 부산등록
			else if (ecar_loc == "7") {	$("#a_h").val("1");	}	//세종,충남,충북(대전제외)은 서울등록
			else if (ecar_loc == "8") {	$("#a_h").val("3");	}	//경북(대구제외)는 부산등록
			else if (ecar_loc == "9") {	$("#a_h").val("3");	}	//울산,경남은 부산등록
		}
		
	} else if (ecarFlag == 4) {
		$("#a_h").val("7");
		
	} else {	
		$("#a_h").val("7");
	}
	
	return true;
}

function setEstimateInfo(response){
	
	//친환경차고 매입옵션 있으면
	//if($("#ecarFlag").val() == "3" && $("#optChk").val() == "1"){
	//친환경차일 경우 - (최초 1번 견적낼시 매입옵션값이 null인 이유로 수정. 다른 부분 오류시 확인할것!)
	
	/*if(($("#ecarFlag").val() == "3") && ($("#carCompId").val() != "0056" && $("#sh_code").val() != "9133")){
		
		$("#view_price_eh_car").css("display","block");
		$("#view_price_other_car").css("display","none");
		
		$("#sellingPrice").text(response.roAmt+"원");
		if($("#originRoAmt").val() == 0){ //최초 견적이면
			$("#originRoAmt").val(response.roAmt.replace(/,/g,""));
		}
		
		if ($("#gubunSelectBox option:selected").val() == "22" || $("#gubunSelectBox option:selected").val() == "12" ) {
			$(".view_sellingOpt_on").css("display","block");
			$(".view_sellingOpt_off").css("display","none");
		} else {
			$(".view_sellingOpt_on").css("display","none");
			$(".view_sellingOpt_off").css("display","block");
		}
		
	}else{*/
		$("#view_price_eh_car").css("display","none");
		$("#view_price_other_car").css("display","block");
		
		$("#originRoAmt").val(0);
		$("#a_h").val(7);
		//$(".ecar-selling-area").hide();
	//}
	
	$('#estRegCode').val(response.regCode);
	$('#estimateId').val(response.estimateId);
	$("#chk_change_opt").val("0");	//인수가조정견적 위한 체크값(견적을 내면 0으로 초기화)
	
	if(response.print_type=='6'){
		if(response.estimateId2!=""){
			//월대여료 가격표에 셋팅 
			$('#supplyFee1').text(response.supplyAmt+"원");
			$('#vatFee1').text(response.vatAmt+"원").focus();
			$('#rentPeriod1').text($('#a_b').val()+"개월");
			
			if(response.totalPrice.indexOf("-") === -1){
				$('.total-price1').text(response.totalPrice+"원");
				$(".minus-info1").hide();
				$('#print_btn').prop("disabled", false);
				$('#send_btn').prop("disabled", false);
			}else{
				$('.total-price1').text("-");
				$(".minus-info1").show();
				$('#print_btn').prop("disabled", true);
				$('#send_btn').prop("disabled", true);
			}
			//월대여료 가격표에 셋팅 
			$('#supplyFee2').text(response.supplyAmt2+"원");
			$('#vatFee2').text(response.vatAmt2+"원").focus();
			$('#rentPeriod2').text($('#a_b').val()+"개월");
			
			if(response.totalPrice.indexOf("-") === -1){
				$('.total-price2').text(response.totalPrice2+"원");
				$(".minus-info2").hide();
				$('#print_btn').prop("disabled", false);
				$('#send_btn').prop("disabled", false);
			}else{
				$('.total-price2').text("-");
				$(".minus-info2").show();
				$('#print_btn').prop("disabled", true);
				$('#send_btn').prop("disabled", true);
			}
		}else{
			//월대여료 가격표에 셋팅 
			$('#supplyFee1').text("원");
			$('#vatFee1').text("원").focus();
			$('#rentPeriod1').text("미운영");
			$('.total-price1').text("원");
			$(".minus-info1").hide();	
			$('#print_btn').prop("disabled", false);
			$('#send_btn').prop("disabled", false);
			
			//월대여료 가격표에 셋팅 
			$('#supplyFee2').text(response.supplyAmt+"원");
			$('#vatFee2').text(response.vatAmt+"원").focus();
			$('#rentPeriod2').text($('#a_b').val()+"개월");
			
			if(response.totalPrice.indexOf("-") === -1){
				$('.total-price2').text(response.totalPrice+"원");
				$(".minus-info2").hide();
				$('#print_btn').prop("disabled", false);
				$('#send_btn').prop("disabled", false);
			}else{
				$('.total-price2').text("-");
				$(".minus-info2").show();
				$('#print_btn').prop("disabled", true);
				$('#send_btn').prop("disabled", true);
			}
		}
	}else{
		//월대여료 가격표에 셋팅 
		$('#supplyFee').text(response.supplyAmt+"원");
		$('#vatFee').text(response.vatAmt+"원").focus();
		$('#rentPeriod').text($('#a_b').val()+"개월");
		
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
	}
	
	$('.total-price').focus();
	
}

//개별소비세 감면액 구하기 
function getTaxDcAmt(jg_w, jg_g_7, jg_2, jg_3, sh_code) {
	
	var ch_327 = 0;
	
	//옵션 선택에 따라 개별소비세 감면액 실시간 변경되게 처리(2017.06.02)
	if ($("#carAmtRe").val() != 0) {
		var carAmt = parseInt($("#carAmtRe").val());
	} else {
		var carAmt = parseInt($("#carAmt").val());
	}
	//var car_amt = parseInt($("#carAmt").val());
	
	var ch_315 = carAmt - parseInt($('#dcAmt').val());
	
	var ch_326 = parseFloat(ch_315)/(parseFloat(1)+parseFloat(jg_3));	
	var bk_122 = 0;
	
	if (jg_w != "1" || $.type(jg_w) == 'undefined') {
		if (jg_g_7 == "1" || jg_g_7 == "2" || jg_g_7 == "3" || jg_g_7 == "4") {
			
			//if(jg_2 != null && jg_2 == "1"){ ch_326 = ch_315;} //일반승용LPG일 때 			
			
			if (jg_g_7 == "1") {  bk_122 = 1300000; }
			if (jg_g_7 == "2") {  bk_122 = 1300000; }
			if (jg_g_7 == "3") {  bk_122 = 3900000; }
			if (jg_g_7 == "4") {  bk_122 = 5200000; }
			
			if (ch_315 - ch_326 < bk_122*1.1) {
				ch_327 = ch_315 - ch_326;
			} else {
				ch_327 = bk_122*1.1;
			}
			
			//ch_327 = priceCutting(parseInt(ch_327), "R", 10000); // 10에4제곱
			ch_327 = priceCutting(parseInt(ch_327), "R", 1);     // 10에0제곱(2018.04.10) 
			
			//if(ch_315  == 45795000){ ch_327 = ch_327 - 5000; }
			//if(ch_315  == 40896000){ ch_327 = ch_327 - 4000; }
			
			if (sh_code == '2361') { ch_327 = 0; }//볼트EV
			if (sh_code == '9133') { ch_327 = 0; }//포터일렉
			
			$("#taxAmt").val(ch_327);
			$("#displayTaxDcAmt").text(numberWithCommas(ch_327)+"원");
			//totalDisplayAmt-info에 문구 추가하기 
			$("#totalDisplayAmt-info, #totalDisplayAmt-info span:nth-child(3)").show();
			if ($("#totalDisplayAmt-info span:first").css("display") != "none") { //제조사DC 도 있으면
				$("#totalDisplayAmt-info span:nth-child(2)").show(); //"및" 글자 보여주기
			} else {
				$("#totalDisplayAmt-info span:nth-child(2)").hide(); //"및" 글자 숨기기
			}
			$(".tax-row").show();
		} else {
			$("#totalDisplayAmt-info span:nth-child(3), #totalDisplayAmt-info span:nth-child(2)").hide(); 
			$(".tax-row").hide();
		}
	} else {
		$(".tax-row").hide();
		$("#totalDisplayAmt-info, #totalDisplayAmt-info span:nth-child(3), #totalDisplayAmt-info span:nth-child(2)").hide();
	}
	
	//개소세 한시적 감면 20200301~20200630
  	var bk_175 = 0.7;			//감면율
  	var bk_176 = 1430000;	//개소세 감면 한도(교육세포함,부가세포함)
  	var bk_177 = 0;
  	
  	if (jg_w != "1" || $.type(jg_w) == 'undefined') {  		
		if ($("#duty_free_opt").val() == "1") {
		} else {			
			if (ch_315 < 33471429) {
				bk_177 = ch_326*jg_3*bk_175;	
			} else {
				bk_177 = bk_176;
			}
			//bk_177 = getCutRoundNumber(parseInt(bk_177), -4);
			bk_177 = priceCutting(parseInt(bk_177), "R", 10000);
		}		
  	}
  	
  	var ch327Nbk177 = ch_327;
	
	if (bk_177 > 0) {
		
		if (ch_315-ch_326 < bk_177+(bk_122*1.1)) {
			//ch327Nbk177 = ch_315-ch_326;
			ch327Nbk177 = priceCutting(ch_315-ch_326, "R", 1);
		} else {
			//ch327Nbk177 = bk_177+(bk_122*1.1);
			ch327Nbk177 = priceCutting(bk_177+(bk_122*1.1), "R", 1);
		}
		
		$("#taxAmt").val(ch327Nbk177);
		$("#displayTaxDcAmt").text(numberWithCommas(ch327Nbk177)+"원");
		
		$("#totalDisplayAmt-info, #totalDisplayAmt-info span:nth-child(3)").show();
		if ($("#totalDisplayAmt-info span:first").css("display") != "none") { //제조사DC 도 있으면
			$("#totalDisplayAmt-info span:nth-child(2)").show(); //"및" 글자 보여주기
		} else {
			$("#totalDisplayAmt-info span:nth-child(2)").hide(); //"및" 글자 숨기기
		}		
		$(".tax-row").show();
		
	} else {
		$(".tax-row").hide();
		$("#totalDisplayAmt-info, #totalDisplayAmt-info span:nth-child(3), #totalDisplayAmt-info span:nth-child(2)").hide();
	}  	
}

//정부+지자체 보조금  구하기(2018.01.12)
function getPerchaseSubsidy(jg_w, jg_g_7, jg_2, jg_3, sh_code) {
	
	var bk_128 = 0;
	var bk_129 = 0;
	var ecar_amt = 0;
	
	var ecar_loc_st = $("#ecarLocationSelectBox option:selected").val();
	var a_a = $("#gubunSelectBox option:selected").val().substr(0,1);
	
	setSubsidyParam(a_a);
	
	if (jg_g_7 == "1") {		
		bk_128 = 0;	
	} else if (jg_g_7 == "2") {
		bk_128 = 5000000;	
	} else if (jg_g_7 == "3") {		//	else if(jg_g_7 == "3"){		bk_128 = 12000000;	}
		
		bk_128 = $("#jg_g_15").val(); 	//전기차 구매보조금 관련 변경사항(2018.01.31)
		
		if (ecar_loc_st == "0" && $("#ecar_0_yn").val()=="1") {
			ecar_amt = $("#ecar_0_amt").val();	
		} else if (ecar_loc_st == "1" && $("#ecar_1_yn").val()=="1") {	
			ecar_amt = $("#ecar_1_amt").val();	
		} else if (ecar_loc_st == "2" && $("#ecar_2_yn").val()=="1") {	
			ecar_amt = $("#ecar_2_amt").val();	
		} else if (ecar_loc_st == "3" && $("#ecar_3_yn").val()=="1") {
			ecar_amt = $("#ecar_3_amt").val();	
		} else if (ecar_loc_st == "4" && $("#ecar_4_yn").val()=="1") {	
			ecar_amt = $("#ecar_4_amt").val();	
		} else if (ecar_loc_st == "5" && $("#ecar_5_yn").val()=="1") {	
			ecar_amt = $("#ecar_5_amt").val();	
		} else if (ecar_loc_st == "6" && $("#ecar_6_yn").val()=="1") {	
			ecar_amt = $("#ecar_6_amt").val();	
		} else if (ecar_loc_st == "7" && $("#ecar_7_yn").val()=="1") {
			ecar_amt = $("#ecar_7_amt").val();	
		} else if (ecar_loc_st == "8" && $("#ecar_8_yn").val()=="1") {
			ecar_amt = $("#ecar_8_amt").val();	
		} else if (ecar_loc_st == "9" && $("#ecar_9_yn").val()=="1") {
			ecar_amt = $("#ecar_9_amt").val();	
		}
		
		bk_129 = ecar_amt*10000;
		
	} else if (jg_g_7 == "4") { //20190102 수소차 조건 추가
		bk_128 = $("#jg_g_15").val(); 	//전기차 구매보조금 관련 변경사항(2018.01.31)
		bk_129 = 10000000; //서울 지자체보조금
	}
	
	//정부+지자체 구매보조금 20180109
	var k_cb_5 = 0;
	var k_cb_6 = 0;
	var ecar_pur_sub_amt = 0;	//전기차 구매보조금
	var jg_g_8 = $("#jg_g_8").val();
	
	k_cb_5 = jg_g_8*bk_128;
	ecar_pur_sub_amt = k_cb_5; 
	/*if(jg_g_7=="3"){
		//k_cb_5 = k_cb_5/1.1;
	}*/
	k_cb_6 = bk_129;
	ecar_pur_sub_amt = ecar_pur_sub_amt+k_cb_6;
	/*if(jg_g_7=="3"){
		//k_cb_6 = k_cb_6/1.1;	  	
	}*/
	$("#ecar_pur_sub_amt").val(ecar_pur_sub_amt);
}

//반올림
function getCutRoundNumber(num, place){
	var returnNum;
	var st="1";
	return Math.round( num * Math.pow(10,parseInt(place,10)) ) / Math.pow(10,parseInt(place,10));
}

function initAmt(){
	$("#carAmt").val("0");
	$("#dcAmt").val("0");
	$("#taxAmt").val("0");
	$("#totalAmt").val("0");
	$("#totalDisplayAmt").text("0원");
}


/* 옵션 디테일 창 클릭.. */
$(document).on("click",".option-ic",function(){
	var optionWindow = $(this).siblings(".option-desc");
	if(optionWindow.css("display") == "block"){
		$(this).siblings(".option-desc").hide();
		$(".option-desc").hide();
	}else{
		$(".option-desc").hide();
		$(this).siblings(".option-desc").show();
	}
})

/* 전기차일 때 매입옵션 가격 수정하는 화면 */
//$(document).on("change",".ecar-selling-area select", function(){
$(document).on("change","#view_price_eh_car select", function(){
	var value = $(this).find("option:selected").val();
	var sellingAmt = $(this).next("input");
	if(value == "1"){ //보증금과 같게
		sellingAmt.val($("#depositAmt").val());
	//	$(".ecar-selling-area input").trigger("blur");
		$("#view_price_eh_car input").trigger("blur");
		sellingAmt.attr("disabled",true);
	}else{
		sellingAmt.removeAttr("disabled");
		sellingAmt.val("0원");
		sellingAmt.focus();
	}
})

/* 매입옵션 선택 시 */
//$(document).on("blur",".ecar-selling-area input",function(){
$(document).on("blur","#view_price_eh_car input",function(){
	var inputValue = parseInt($(this).val().replace(/,/g,"").replace("원","")); //숫자만 추출하기
	var regExp = /^[0-9]+$/;
	if(!regExp.test(inputValue)){
		alert("금액을 정확히 입력해주세요");
	}else{ //금액이 정확히 입력되어 있으면
		//var maxPrice = parseInt($("#originRoAmt").val());
		var maxPrice = parseInt($("#buyPrice").val());
		if(maxPrice < inputValue){ //최대잔가보다 높으면
			alert("매입옵션 가격(인수가)은 "+numberWithCommas(maxPrice)+"원을 초과할 수 없습니다");
			$(this).val(numberWithCommas(maxPrice) + "원");
		}else{
			$(this).val(numberWithCommas(inputValue) + "원");
		}
	}
})

/* 색상 선택시*/
$(document).on("change","input[name='car-color']", function(){
	
	var amt = $(this).val().split(":")[1];
	var amt2 = $(this).val().split(":")[2];
	$("#colorAmt-display").text(numberWithCommas(amt) + "원");
	$("input[name='carOption']").trigger("change");		
	//색상 잔가 넣기
	if(amt2=="undefined"){
		$("#jg_col_st").val("");
	}else{
		$("#jg_col_st").val(amt2);
	}
	$("#chk_change_opt").val("1");	//인수가조정견적 위한 체크값(바뀐게 있으면 인수가조정견적못하게처리)
})

/* 정부, 지자체 구매보조금 세팅하기 위한 변수 가져오기*/
function setSubsidyParam(a_a){
	var param = {"a_a":a_a};
	$.ajax({
		contentType:'application/json',
		dataType:'json',
		async:false,
		data:JSON.stringify(param),
		url:'/control/smart/setCarSubsidy',
		type:'POST',
		success:function(response){
			$("#ecar_0_yn").val(response.ECAR_0_YN);
			$("#ecar_1_yn").val(response.ECAR_1_YN);
			$("#ecar_2_yn").val(response.ECAR_2_YN);
			$("#ecar_3_yn").val(response.ECAR_3_YN);
			$("#ecar_4_yn").val(response.ECAR_4_YN);
			$("#ecar_5_yn").val(response.ECAR_5_YN);
			$("#ecar_6_yn").val(response.ECAR_6_YN);
			$("#ecar_7_yn").val(response.ECAR_7_YN);
			$("#ecar_8_yn").val(response.ECAR_8_YN);
			$("#ecar_9_yn").val(response.ECAR_9_YN);
			$("#ecar_0_amt").val(response.ECAR_0_AMT);
			$("#ecar_1_amt").val(response.ECAR_1_AMT);
			$("#ecar_2_amt").val(response.ECAR_2_AMT);
			$("#ecar_3_amt").val(response.ECAR_3_AMT);
			$("#ecar_4_amt").val(response.ECAR_4_AMT);
			$("#ecar_5_amt").val(response.ECAR_5_AMT);
			$("#ecar_6_amt").val(response.ECAR_6_AMT);
			$("#ecar_7_amt").val(response.ECAR_7_AMT);
			$("#ecar_8_amt").val(response.ECAR_8_AMT);
			$("#ecar_9_amt").val(response.ECAR_9_AMT);
		},
		error:function(request,status,error){
			alert("ERROR!!");
		}
	});	
}

//전기차의 경우, 고객 주소지 선택에 따라 차량인도지 변경 되게 처리(수정 2018.04.17)
function autoChangeRegionSel(type){
	var ecar_loc = $("#ecarLocationSelectBox").val();
	var hcar_loc = $("#hcarLocationSelectBox").val();
	var jg_g_7_type = type;
	var region_val = "";							// 전기차 고객주소지  -> 차량인도지역
	
	/*if ($("#carCompId").val() == "0056") {
		region_val = "1"; // 테슬라차량은 서울고정
		
	} else {*/
		if (jg_g_7_type == "3") {			
			if (ecar_loc=="0") {
				region_val = "1";		// 서울 -> 서울 au	
			} else if (ecar_loc=="1") {
				region_val = "2";		// 인천/경기 -> 인천/경기	
			} else if(ecar_loc=="2") {
				region_val = "3";		// 강원 -> 강원
			} else if(ecar_loc=="3") {
				region_val = "4";		// 대전	 -> 대전/세종/충남/충북	
			} else if(ecar_loc=="4") {
				region_val = "5";		// 광주/전남/전북 -> 광주/전남/전북	
			} else if(ecar_loc=="5") {
				region_val = "6";		// 대구 -> 대구/경북	
			} else if(ecar_loc=="6") {
				region_val = "7";		// 부산/울산/경남 -> 부산/울산/경남	
			} else if(ecar_loc=="7") {
				region_val = "4";		// 세종/충남/충북  -> 대전/세종/충남/충북	
			} else if(ecar_loc=="8") {	
				region_val = "6";		// 경북 -> 대구/경북	
			} else if(ecar_loc=="9") {
				region_val = "7";		// 울산/경남(부산제외) -> 대구/경북
			}
		} else if (jg_g_7_type == "4") {
			if (hcar_loc=="0") {
				region_val = "1";		// 서울 -> 서울 au	
			} else if (hcar_loc=="1") {
				region_val = "2";		// 인천/경기 -> 인천/경기	
			} else if(hcar_loc=="2") {
				region_val = "3";		// 강원 -> 강원
			} else if(hcar_loc=="3") {
				region_val = "4";		// 대전	 -> 대전/세종/충남/충북	
			} else if(hcar_loc=="4") {
				region_val = "5";		// 광주/전남/전북 -> 광주/전남/전북	
			} else if(hcar_loc=="5") {
				region_val = "6";		// 대구 -> 대구/경북	
			} else if(hcar_loc=="6") {
				region_val = "7";		// 부산/울산/경남 -> 부산/울산/경남	
			} else if(hcar_loc=="7") {
				region_val = "4";		// 세종/충남/충북  -> 대전/세종/충남/충북	
			} else if(hcar_loc=="8") {	
				region_val = "6";		// 경북 -> 대구/경북	
			} else if(hcar_loc=="9") {
				region_val = "7";		// 울산/경남(부산제외) -> 대구/경북
			}			
		}
	/*}*/
	
	$("#regionSelectBox option[value=" + region_val + "]").prop("selected", true);
	
	set_max_deposit_amt();
}

//고객주소지 변경시 최대보증금 새로 세팅(20180820)
function set_max_deposit_amt(){
	if($("#depositSelectBox option:selected").val() > 50){
		var inputValue = parseInt($("#depositAmt").val().replace(/,/g,"").replace("원","")); //숫자만 추출하기
		var ecarFlag = $("#ecarFlag").val();
		var totalAmt = parseInt($("#totalAmt").val()); 
		var percent = inputValue / totalAmt * 100;
		/*if(ecarFlag == '3'){			
			getPerchaseSubsidy($("#jg_w").val(), $("#jg_g_7").val(), $("#jg_2").val(), $("#jg_3").val(), $("#sh_code").val());
			var ecar_pur_sub_amt = $("#ecar_pur_sub_amt").val();
			var maxSubsidyPer = (totalAmt - ecar_pur_sub_amt) / totalAmt * 100;
			if(percent > maxSubsidyPer){
				alert("보증금 "+ numberWithCommas(totalAmt - ecar_pur_sub_amt) +"원 (차량가격-구매보조금) 이내만 납부 가능합니다.\n\n추가로 초기납입금 납부를 원할 경우 선납금으로 납부하시면 됩니다.");
				$("#depositAmt").val(numberWithCommas(priceCutting(totalAmt - ecar_pur_sub_amt, "F", 100)) + "원");
				percent = maxSubsidyPer;
				$("#depositAmt").prev("select").find("option:last").text(percent.toFixed(2)+"%");
				$("#depositAmt").prev("select").find("option:last").val(percent.toFixed(2));
				return false;
			}
		}else{
			if(percent > 100){
				alert("차가의 100% 이내만 납부 가능합니다.\n\n추가로 초기납입금 납부를 원할 경우 선납금으로 납부하시면 됩니다.");
				$("#depositAmt").val(numberWithCommas(totalAmt) + "원");
				percent = 100;
				$("#depositAmt").prev("select").find("option:last").text(percent.toFixed(2)+"%");
				$("#depositAmt").prev("select").find("option:last").val(percent.toFixed(2));
				return false;
			}
		}*/	
	}
	
	/*if(($("#ecarFlag").val() == "3") && ($("#carCompId").val() != "0056" && $("#sh_code").val() != "9133")){
		$("#view_price_eh_car").css("display","block");
		$("#view_price_other_car").css("display","none");
		if ($("#gubunSelectBox option:selected").val() == "22" || $("#gubunSelectBox option:selected").val() == "12" ) {
			$(".view_sellingOpt_on").css("display","block");
			$(".view_sellingOpt_off").css("display","none");
		} else {
			$("#buyOption").val("");
			$("#buyText").val("");
			$(".view_sellingOpt_on").css("display","none");
			$(".view_sellingOpt_off").css("display","block");
		}
	}else{*/
		$("#view_price_eh_car").css("display","none");
		$("#view_price_other_car").css("display","block");
	//}
}

function setViewDutyFreeOpt(sh_code){	//면세가 표기 여부가 면세가표기차량이면 리스견적불가(20190502)
	if ($("#countrySelectBox option:selected").val() == "1") {		
		if ($("#duty_free_opt").val()=="1") {
			$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='12']").prop("disabled", true);
		} else {
			if (sh_code > 9120 && sh_code < 9410) {
				$("#gubunSelectBox option[value='12']").prop("selected",true);
				$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='21']").prop("disabled", true);
			} else {
				$("#gubunSelectBox option[value='11'],#gubunSelectBox option[value='12']").prop("disabled", false);
			}
		}
	}
}



