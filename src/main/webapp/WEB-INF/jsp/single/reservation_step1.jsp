<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
<style>
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    background-color: #5cb85c !important;
    color: #FFF !important;
}
.tab_size {
	width: 160px;
}
.row_tab {
	padding-top: 30px;
	padding-bottom: 20px;
}
.row_margin_left {
	margin-left: 0px !important;
}
.margin_left15 {
	margin-left: 15px !important;
}
.p_padding_top5 {
	padding-top: 5px;
}
.div_top_layout {
	background-color: #E6E6E6;
	height: 30px;
	border: 1px solid #b3b3b3;
	border-radius: 5px;
}
.div_top_layout2 {
	width: 150px !important;
	height: 30px;
	color: #4a4a4a;
	font-size: 13px;
	background-color: #E6E6E6;
	border: 1px solid #b3b3b3;
	border-radius: 5px;
}
.select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    font-family: inherit;
    background: url(/resources/images/button_arrow.png) no-repeat 95% 50%;
    background-color: #E6E6E6;
    border: 1px solid #b3b3b3;
    border-radius: 4px;
    padding: 5px;
    font-size: 13px;
    color: #4a4a4a;
    width: 150px;
    text-align: center;
  	text-align-last: center;
  	-moz-text-align-last: center;
}
.select::-ms-expand { 
	display: none;
}
option {
	background-color: #FFF;
}
.desc {
	line-height: 25px;
	font-size: 15px;
}
.car_nm_radio {
	padding-left: 5px !important;
	padding-right: 20px !important;
}
</style>

<t:genericpage>
<script type="text/javascript">
$(document).ready(function(){
	
	var privacy_text = "개인정보 수집·이용 동의\n\n"+
	"(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다. \n\n"+
	"1. 개인정보의 수집 및 이용목적\n\n사전예약에 대한 상담 및 견적제시 목적\n*상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.\n\n"+
	"2. 수집하는 개인정보 항목\n\n필수항목 : 고객명, 연락처, 고객주소지\n\n"+
	"3. 개인정보의 보유 및 이용기관\n\n개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.\n"+
	"* 최대 보유기간 : 수집 후 6개월 (수집 후 6개월 이후에는 무조건 파기)\n\n"+
	"4. 동의 거부권 및 불이익\n\n개인정보 수집·이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 사전예약이 불가합니다.";
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
    });   
    
    $("#reservation").click(function() {
    	reservation();
    });
    
    function reservation() {
    	
    	var sido = $('#sido option:checked').val();
    	var gugun = $('#gugun option:checked').val();
    	var areaName = sido + "/" + gugun;
    	
    	var est_st = "";
    	var car_nm = "";
    	var est_area2 = "";
    	
    	var temp_car = $('input:radio[name="car_nm"]:checked').val();
    	if (temp_car == "9") {
    		est_st = "PH9";
    	} else {
    		est_st = "PE9";
    	}
    	
    	var temp_car_nm = $('input:radio[name="car_nm"]:checked').val();
    	if (temp_car_nm == "0") {
    		// car_nm = "코나 일렉트릭";
    		car_nm = "포터 일렉트릭";
    	} else if (temp_car_nm == "1") {
    		car_nm = "니로 EV";
    	} else if (temp_car_nm == "2") {
    		// car_nm = "쏘울 부스터 EV";
    		car_nm = "봉고 EV";
    	} else if (temp_car_nm == "3") {
    		car_nm = "볼트 EV";
    	} else if (temp_car_nm == "4") {
    		car_nm = "아이오닉 일렉트릭";
    	} else if (temp_car_nm == "5") {
    		car_nm = "테슬라(모델S,X)";
    		//car_nm = "테슬라(모델X)";
    	} else if (temp_car_nm == "6") {
//     		car_nm = "테슬라(모델3)";
    		car_nm = "모델3(테슬라)";
    	} else if (temp_car_nm == "7") {
    		car_nm = "포터II 일렉트릭";
    	} else if (temp_car_nm == "8") {
    		car_nm = "봉고Ⅲ EV";
    	} else if (temp_car_nm == "9") {
    		car_nm = "넥쏘";
    	} else if (temp_car_nm == "10") {
    		car_nm = "아이오닉5";
    	} else if (temp_car_nm == "11") {
//     		car_nm = "테슬라(모델Y)";
    		car_nm = "모델Y(테슬라)";
    	} else if (temp_car_nm == "12") {
    		car_nm = "EV6";
    	} else if (temp_car_nm == "13") {
//     		car_nm = "벤츠(EQA)";
    		car_nm = "EQA(벤츠)";
    	} else if (temp_car_nm == "14") {
    		car_nm = "Electrified G80";
    	} else if (temp_car_nm == "15") {
    		car_nm = "볼트EUV(쉐보레)";
    	} else if (temp_car_nm == "16") {
    		car_nm = "GV60";
    	} else if (temp_car_nm == "17") {
    		car_nm = "폴스타2";
    	} else if (temp_car_nm == "18") {
    		car_nm = "Electrified GV70";
    	} else if (temp_car_nm == "19") {
    		car_nm = "니로 SG2 EV";
    	} else if (temp_car_nm == "20") {
    		car_nm = "아이오닉6";
    	}
    	
    	var pattern=/^[0-9]+$/g;
    	
    	if ($("#est_nm").val() == "") {
    		alert("이름을 입력해 주세요.");
    		$("#est_nm").focus();
    		return;
    		
    	} else if ($("#est_tel").val() == "") {
    		alert("휴대전화번호를 입력해 주세요.");
    		$("#est_tel").focus();
    		return;
    		
    	} else if (!pattern.test($("#est_tel").val())) {
   			alert("휴대전화번호는 기호없이 숫자로만 입력해주세요.");
   			$("#est_tel").val("");
   			$("#est_tel").focus();
    		return;
    		
    	} else if ($("#sido option:selected").val() == "") {
   			alert("고객주소지의 시/도를 선택해주세요.");
   			$("#sido").focus();
    		return;
    		
    	} else if ($("#gugun option:selected").val() == "") {
   			alert("고객주소지의 구/군을 선택해주세요.");
   			$("#gugun").focus();
    		return;
    		
    	} else if ($('#agree').is(':checked') == false) {
   			alert("상담신청 등록을 위해서는 개인정보 수집이용 동의가 필요합니다.");
   			$("#agree").focus();
    		return;
    		
		} else {
			
			var data = {};
			data["est_nm"] = $("#est_nm").val();
			data["est_tel"] = $("#est_tel").val();
			data["estArea"] = areaName;
			//data["est_area"] = $('#est_area option:checked').val();
			data["car_nm"] = car_nm;
			data["est_st"] = est_st;
			
			fn_layer_popup("show");
			
			$.ajax({
				contentType:'application/json',
				data:JSON.stringify(data),
				url:'/estimate/reserve',
				type:'POST',
				success:function(data){
					//alert(data);
					fn_layer_popup("hide");
					$('#complete').modal('show');
				}
			});
		}    			
    }
    
    // modal종료시 화면전환    
    $("#redirect_view").click(function() {
    	var car_type = $('input:radio[name="car_nm"]:checked').val();
    	if (car_type == "9") {
    		$('#complete').modal('hide');
    		window.location.href = '/single/reservation?type=hydro_car';
    	} else {
    		$('#complete').modal('hide');
    		window.location.href = '/single/reservation?type=electric_car';
    	}
    })
    
    //logding_indicator
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
	
});
</script>

	<div class="tab-content" style="padding-top: 20px;">
		<!-- 전기차 -->
	    <div role="tabpanel" class="tab-pane active company-tab-panel" id="electric_car" style="margin:0 auto;">
	    	<div class="col-md-12" style="text-align: center; margin-bottom: 40px; font-size: 26px; font-weight: bold;">
	    		2022년 전기차 수소차 아마존카 장기렌트 사전 예약
	    	</div>
	    	<div class="col-md-12" style="text-align: center; margin-bottom: 40px; font-weight: bold;">
	    		2022년 전기차 및 수소차에 대한 장기렌트 사전예약, 지금 바로 상담 신청 받습니다 !!<br><br>
				상담신청 정보를 남기시면 아마존카 담당자가 상세한 안내 하겠습니다.
	    	</div>
			<!-- <p class="desc">
				* 대상 차종<br>
				&nbsp;&nbsp;- 현대 코나 일렉트릭, 기아 니로 EV, 쏘울 부스터 EV, 한국GM 볼트 EV, 아이오닉 일렉트릭, 포터II 일렉트릭, 봉고Ⅲ EV, 현대 넥쏘(수소차), 테슬라(모델3), 테슬라(모델X), 테슬라(모델S, X)<br>
			</p> -->
			<p class="desc">
				* 고려사항<br>
				&nbsp;&nbsp;- 차량별 대여료 등 구체적인 견적은 홈페이지 실시간 견적에서 확인 가능합니다.<br>
				&nbsp;&nbsp;- 모델 별 사정에 따라 출고일정이 다를 수 있고, 지자체 보조금 정책과 제조사 사정에 따라서 차량 공급이 조정될 수 있습니다.<br>
			</p>
			<!-- <p class="desc">
				* 상담신청 정보를 남겨주시면 아마존카 담당자가 연락드리겠습니다.<br><br>
			</p> -->
			
			<div class="col-md-12 col-xs-12" style="padding: 20px 40px 20px 40px;">
				<div class="col-md-12 col-xs-12" style="margin: 0 auto; border: 1px dotted #CCC; border-radius: 10px; padding: 20px 40px 100px 40px;">
				
					<h4>상담신청정보</h4>
					<hr style="border-top: 1px solid #ccc !important; width: 60%; float: left; margin-top: 10px;">
								
					<div class="col-md-12 col-xs-12" style="height: 35px; margin-bottom: 20px; padding-left: 0px;">
						<div class="col-md-2 col-xs-2" style="padding: 5px 0px;">
							<h4 style="margin: 0px !important;">* 이름</h4>		
						</div>
						<div class="col-md-10 col-xs-10" style="padding-right: 0px !important;">
							<input type="text" class="form-control" name="est_nm" id="est_nm" style="width: 40%;">
						</div>
					</div>
					
					<div class="col-md-12 col-xs-12" style="height: 35px; margin-bottom: 20px; padding-left: 0px;">
						<div class="col-md-2 col-xs-2" style="padding: 5px 0px;">
							<h4 style="margin: 0px !important;">* 휴대전화</h4>
						</div>
						<div class="col-md-10 col-xs-10" style="padding-right: 0px !important;">
							<input type="text" class="form-control" name="est_tel" id="est_tel" style="width: 40%; display: inline;">
							<!-- <select name="est_tel_1" id="est_tel_1" class="form-control" style="width:10%; display: inline;">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<input type="text" class="form-control" name="est_tel_2" id="est_tel_2" style="width: 10%; display: inline;">
							<input type="text" class="form-control" name="est_tel_3" id="est_tel_3" style="width: 10%; display: inline;">
							<input type="hidden" name="est_tel" id="est_tel"> -->
						</div>
					</div>
					
					<div class="col-md-12 col-xs-12" style="height: 35px; margin-bottom: 20px; padding-left: 0px;">
						<div class="col-md-2 col-xs-2" style="padding: 5px 0px;">
							<h4 style="margin: 0px !important;">* 고객주소지</h4>
						</div>
						<div class="col-md-10 col-xs-10" style="padding-right: 0px !important;">					
							<!-- type2 -->
							<select name="estSido" id="sido" class="form-control" style="width:25%; display: inline;">
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
							<select name="estGugun" id="gugun" class="form-control" style="width:25%; display: inline;">
								<option value="">구/군</option>
							</select>
							
							<!-- type3 -->
							<!-- <select id="est_area" name="est_area" class="form-control" style="width:25%; display: inline;">
								<option value="S1" selected>서울</option>
								<option value="S1">인천/경기</option>
								<option value="S1">강원</option>
								<option value="D1">대전</option>
								<option value="D1">세종/충남/충북(대전제외)</option>
								<option value="J1">광주/전남/전북</option>
								<option value="G1">대구</option>
								<option value="G1">경북(대구제외)</option>
								<option value="B1">부산/울산/경남</option>
							</select> -->
						</div>
					</div>
					
					<div class="col-md-12 col-xs-12" style="height: 35px; margin-bottom: 20px; padding-left: 0px; padding-right: 0px;">
						<div class="col-md-2 col-xs-2" style="padding: 0px 0px;">
							<h4 style="margin: 0px !important;">* 차량명</h4>		
						</div>
						<div class="col-md-10 col-xs-10" style="padding-right: 0px !important;">
													
							<!-- <input type="radio" name="car_nm" id="car_nm8" value="7">
							<label for="car_nm8" class="radio-inline car_nm_radio">포터II 일렉트릭</label>
							
							<input type="radio" name="car_nm" id="car_nm9" value="8">
							<label for="car_nm9" class="radio-inline car_nm_radio">봉고Ⅲ EV</label> -->

							<input type="radio" name="car_nm" id="car_nm11" value="10" checked>
							<label for="car_nm11" class="radio-inline car_nm_radio">아이오닉5</label>
							
							<input type="radio" name="car_nm" id="car_nm13" value="12">
							<label for="car_nm13" class="radio-inline car_nm_radio">EV6</label>
							
							<input type="radio" name="car_nm" id="car_nm20" value="19">
							<label for="car_nm20" class="radio-inline car_nm_radio">니로 SG2 EV</label>
							
							<input type="radio" name="car_nm" id="car_nm21" value="20">
							<label for="car_nm21" class="radio-inline car_nm_radio">아이오닉6</label>
							
							<input type="radio" name="car_nm" id="car_nm15" value="14">
							<label for="car_nm15" class="radio-inline car_nm_radio">Electrified G80</label>
							
							<input type="radio" name="car_nm" id="car_nm19" value="18">
							<label for="car_nm19" class="radio-inline car_nm_radio">Electrified GV70</label>
							
							<input type="radio" name="car_nm" id="car_nm17" value="16">
							<label for="car_nm17" class="radio-inline car_nm_radio">GV60</label>
							
							<br><br>
							
							<input type="radio" name="car_nm" id="car_nm1" value="0">
							<label for="car_nm1" class="radio-inline car_nm_radio">포터 일렉트릭</label>
							
							<input type="radio" name="car_nm" id="car_nm3" value="2">
							<label for="car_nm3" class="radio-inline car_nm_radio">봉고 EV</label>
							
							<input type="radio" name="car_nm" id="car_nm10" value="9">
							<label for="car_nm10" class="radio-inline car_nm_radio">넥쏘(수소차)</label>
							<!-- <label for="car_nm3" class="radio-inline car_nm_radio">쏘울 부스터 EV</label> -->
							
							<!-- <input type="radio" name="car_nm" id="car_nm7" value="6" checked> -->
							
							<!-- <input type="radio" name="car_nm" id="car_nm6" value="5">
							<label for="car_nm6" class="radio-inline car_nm_radio">테슬라(모델S, X)</label> -->
							<!-- <label for="car_nm6" class="radio-inline car_nm_radio">테슬라(모델X)</label> -->
							
							<br><br>
							
							<input type="radio" name="car_nm" id="car_nm7" value="6">
							<label for="car_nm7" class="radio-inline car_nm_radio">모델3(테슬라)</label>
							
							<input type="radio" name="car_nm" id="car_nm12" value="11">
							<label for="car_nm12" class="radio-inline car_nm_radio">모델Y(테슬라)</label>
							
							<input type="radio" name="car_nm" id="car_nm14" value="13">
							<label for="car_nm14" class="radio-inline car_nm_radio">EQA(벤츠)</label>

							<input type="radio" name="car_nm" id="car_nm16" value="15">
							<label for="car_nm16" class="radio-inline car_nm_radio">볼트EUV(쉐보레)</label>

							<input type="radio" name="car_nm" id="car_nm18" value="17">
							<label for="car_nm18" class="radio-inline car_nm_radio">폴스타2</label>
							
							<!-- <input type="radio" name="car_nm" id="car_nm2" value="1">
							<label for="car_nm2" class="radio-inline car_nm_radio">니로 EV</label> -->
							
							<!-- <input type="radio" name="car_nm" id="car_nm4" value="3">
							<label for="car_nm4" class="radio-inline car_nm_radio">볼트 EV</label> -->
							
							<!-- <input type="radio" name="car_nm" id="car_nm5" value="4">
							<label for="car_nm5" class="radio-inline car_nm_radio">아이오닉 일렉트릭</label> -->
							
							<!-- <br><br>
							<span>모델3(테슬라), 모델Y(테슬라) - 2021년 영업종료, 2022년 영업재개</span> -->
							
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="col-md-12 col-xs-12" style="padding: 0px 40px 20px 40px;">
				<textarea id="privacy-area" style="height:150px; resize: none;" class="full-width form-control input-sm" readonly="readonly"></textarea>
				<div style="padding-top: 10px;">
					<label class="checkbox-inline">
						<input type="checkbox" id="agree" name="agree"/>
					</label>
					<label for="agree">개인정보 수집·이용에 동의합니다.</label>
				</div>			
			</div>
			
			<div class="col-md-12 col-xs-12" style="text-align: center;">
				<button type="button" id="reservation" style="font-weight: 400; color: #FFF; background-color: #5cb85c; padding: 15px 55px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 30px;">상담신청 등록</button>
			</div>
			
			<!-- <div class="col-md-12" id="complete" style="padding-left: 0px; margin-top:20px; display: none;">
				<p class="desc">
					상담신청이 완료되었습니다.
				</p>
				<p class="desc">
					아마존카 담당자가 연락드려서 세부차종 선택 및 향후 진행과정에 대해서 안내드리겠습니다.
				</p>
			</div> -->
	    </div>
    </div>
    
    <!-- Modal --> <!-- $('#complete').modal('show'); -->
	<div class="modal fade" id="complete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body bold center" style="text-align: center; padding: 20 0 20 0">
					<font style="font-weight: bold; font-size: 18px;">상담신청이 완료되었습니다.</font><br><br>
					아마존카 담당자가<br>
					세부차종 선택 및 향후 진행에 대한<br>
					안내를 드리도록 하겠습니다.<br><br>
					감사합니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="redirect_view">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- logding_indicator -->
	<div class="loaderLayer" id="loader">
  		<div class="loader" id="loaderContent"></div>
  	</div>
	
</t:genericpage>