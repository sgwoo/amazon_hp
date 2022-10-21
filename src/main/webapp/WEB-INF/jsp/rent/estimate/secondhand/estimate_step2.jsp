<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<t:blankpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/esti-common.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script>
$(document).ready(function(){
	// jjlim 삭제
	//$("input[name='estEmail']").val($.cookie("estEmail")); //최초 들어왔을 때 이메일 주소 셋팅
	
	$(".car-option-table tr[class='option-info']").css("display","none"); //차량 옵션 정보 기본적으로 접어놓기
	$("span[name='folding-control']").click(function(){  //차량 옵션 정보 펼치기 클릭하면 펼치기 
		$(".car-option-table tr[class='option-info']").toggle();
		$("span[name='folding-control']").toggle();
	})
	
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
    		$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    	})
    })
    
    $("input[name='estGubun']").click(function(){
    	var selectedValue = $(this).val();
    	if(selectedValue == 3){
    		$('.personal').show();
    		$('.business').hide();
    	}else{
    		$('.personal').hide();
    		$('.business').show();
    	}
    })
    
    $("input[name='estGubun']:first").trigger("click");
   
  	$('#step3form').validate({
        errorClass:"errClass",
		rules:{
			estName:{required:true},
			estTel:{required:true},
			estEmail:{required:true, email:true},
			birth:{number:true,maxlength:6},
			agree:{required:true}
		},
		messages:{
			estName:{
				required:"상호명 또는 이름을 입력해주세요"
			},
			estTel:{
				required:"전화번호는 필수 항목입니다",
			},
			estEmail:{
				required:"이메일은 필수 항목입니다",
				email:"이메일 주소를 올바르게 입력해주세요"
			},
			birth:{
				number:"숫자만 입력해주세요 ex)570101",
				maxlength:"여섯자리 숫자만 입력 가능합니다 ex)570101"
			},
			agree:{
				required:"(개인정보 수집·이용에 동의해주세요)"
			}
		},
		submitHandler:function(form){
			
			//지역 이름 셋팅
	    	var sido = $('#sido option:checked').val();
	    	var gugun = $('#gugun option:checked').val();
	    	var areaName = sido + "/" + gugun;
	    	$('#estArea').val(areaName);
	    	
	    	//사업자상호, 개인의 이름 input name이 같아서 첫번째꺼로 들어감. 앞에서 validation 했으므로 value가 없는 input field는 삭제
	    	$("input[name='estName'],input[name='estSSN']").each(function(){
	    		if($(this).val() == null || $(this).val() == ""){
	    			$(this).remove();
	    		}
	    	})
	    	
	    	//문의사항 셋팅
	    	var inquiry = $('textarea').text();
	    	$('#etc').val(inquiry);
	    	
	    	form.submit();
		}
	});
	
	
	/* $('#step2_btn').click(function(){
		$('#step3form').submit();	
	}) */
	
	//견적서보기 클릭시
    $("#step2_print").click(function(){
    	var url = $("#printUrl").val();
		window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");
    })	
	    
  	//상담 요청하기 클릭 시
	$('#step2_btn').click(function(){
		
		//업종
		var estBusiness = $("#estBusiness option:selected").val();
		//업력
		var estBusinessYear = $("#estBusinessYear option:selected").val();
		//사업자상호
		var estName = $("#estName").val();
		//담당자이름
		var estName2 = $("#estName2").val();
		//전화번호
		var estTel = $("#estTel").val();
		//이메일
		var estEmail = $("#estEmail").val();
		//사업자 담당자 이름
		var estAgent = $("#estAgent").val();
		
		//시도
		var sido = $("#sido option:selected").val();
		//구군
		var gugun = $("#gugun option:selected").val();
		
		var etc = $("#etc-textarea").val();
		
		//regExp
		var num_regex = /^[0-9]+$/g;
    	var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\''\"]/gi;
		
		//개인 고객일 경우 생년월일 validation 추가
		if ($("input[name='estGubun']:checked").val() == "3") { //개인 고객이면 생년월일 validation 추가
			var birth = $("#estSSN2");
			var birthDate = birth.val();
			if (estName2 == "") {
				alert("이름을 입력해 주세요.");
				return false;
			} else if (regExp.test(estName2)) {
	        	alert("이름에는 특수문자를 제외하고 입력해주세요.");
	        	return false;
			} else if (birthDate.length > 6) {
				if (birthDate.substring(0,2) == "19" && birthDate.length == "8") {
					birth.val(birthDate.substring(2,8));
				} else {
					birth.val(birthDate.substring(0,6));
				}
				alert("생년월일은 YYMMDD(연월일) 형식으로 입력하셔야 합니다. ex) 790101");
			} else if (birthDate.length < 6) {
				birth.val("");
				alert("생년월일은 YYMMDD(연월일) 형식으로 입력하셔야 합니다. ex) 790101");
				return false;			
			} else if (sido == "") {
				alert("시/도를 선택해주세요.");
				return false;
			} else if (gugun == "" || gugun == "구/군") {
				alert("구/군을 선택해주세요.");
				return false;
			} else if (estTel == "") {
				alert("전화번호를 입력해 주세요.");
				return false;
			} else if (!num_regex.test(estTel)) {
	        	alert("전화번호는 기호없이 숫자로만 입력해주세요.");
	        	return false;
			} else if (estEmail == "") {
				alert("이메일주소를 입력해 주세요.");
				return false;
			} else if (email_regex.test(estEmail) == false) {
	    	    alert("잘못된 이메일 형식입니다.");
	    	    return false;
// 			} else if (regExp.test(etc)) {
// 				alert("기타 문의사항에는 특수문자를 사용하실 수 없습니다.");
// 				return false;
			} else if ($("input[name='agree']").is(":checked") == false) {
				alert("개인정보 수집이용에 동의를 체크해 주세요.");
				return false;
			} else {
				
				//지역 이름 셋팅
		    	var sido = $('#sido option:checked').val();
		    	var gugun = $('#gugun option:checked').val();
		    	var areaName = sido + "/" + gugun;
		    	$('#estArea').val(areaName);
		    	
		    	//문의사항 셋팅
		    	var inquiry = etc;
		    	$('#etc').val(inquiry);
				
				$('#step3form').submit();
			}
		 	
		} else if ($("input[name='estGubun']:checked").val() != "3") { //개인 고객아니면 사업자번호 validation 추가
			var birth = $("#estSSN");
			var birthDate = birth.val();
			if (estName == "") {
				alert("사업자 상호를 입력해주세요.");
				return false;
			} else if (regExp.test(estName)) {
	        	alert("사업자 상호에는 특수문자를 제외하고 입력해주세요.");
	            return false;
			} else if (birthDate.length != 10) {
				birth.val(birthDate.substring(0,10));
				alert("사업자번호 10자리를 입력해주세요.");
				return false;			
			} else if (sido == "") {
				alert("시/도를 선택해주세요.");
				return false;
			} else if (gugun == "" || gugun == "구/군") {
				alert("구/군을 선택해주세요.");
				return false;
			} else if (estAgent == "") {
				alert("담당자 이름을 입력해주세요.");
				return false;
			} else if (regExp.test(estAgent)) {
	        	alert("담당자 이름에는 특수문자를 제외하고 입력해주세요.");
	            return false;
			} else if (estTel == "") {
				alert("연락처를 입력해 주세요.");
				return false;
			} else if (!num_regex.test(estTel)) {
	        	alert("연락처는 기호없이 숫자로만 입력해주세요.");
	        	return false;
			} else if (estEmail == "") {
				alert("이메일주소를 입력해 주세요.");
				return false;
			} else if (email_regex.test(estEmail) == false) {
	    	    alert("잘못된 이메일 형식입니다.");
	    	    return false;	    	    
// 			} else if (regExp.test(etc)) {
// 				alert("기타 문의사항에는 특수문자를 사용하실 수 없습니다.");
// 				return false;
			} else if ($("input[name='agree']").is(":checked") == false) {
				alert("개인정보 수집이용에 동의를 체크해 주세요.");
				return false;
			} else {
				
				//지역 이름 셋팅
		    	var sido = $('#sido option:checked').val();
		    	var gugun = $('#gugun option:checked').val();
		    	var areaName = sido + "/" + gugun;
		    	$('#estArea').val(areaName);
		    	
		    	//문의사항 셋팅
		    	var inquiry = etc;
		    	$('#etc').val(inquiry);
				
				$('#step3form').submit();
			}
		}
		
	})
	
})
</script>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">실시간 견적 문의</h2>
		<div class="process-item done">STEP 1:실시간 견적</div>
		<div class="process-item done">STEP 2:상담 요청</div>
		<div class="process-item">STEP 3:상담 정보 확인</div>
	</div>
</div>
<form id="step3form" action="/estimate/secondhand/step3" method="post" >
		<div class="estimate-body">
		<div class="car-info">
			<table class="secondhand-info-table">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="17%"/>
					<col width="33%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">차량기본정보</th>
					</tr>
					<tr>
						<td class="option-title">제조사</td>
						<td>${paramData.companyName}</td>
						<td class="option-title">차명</td>
						<td>${paramData.carName}&nbsp;${paramData.carDetailName}</td>
					</tr>
					<tr>
						<td class="option-title">신차등록일</td>
						<td>${paramData.carRegDate}</td>
						<td class="option-title">배기량</td>
						<td><fmt:formatNumber value="${paramData.carDPM}" pattern="#,###" />cc</td>
					</tr>
					<tr>
						<td class="option-title">연료</td>
						<td>${paramData.fuelKind}</td>
						<td class="option-title">색상</td>
						<td>${paramData.carColor}</td>
					</tr>
					<tr>
						<td class="option-title">모델 연도</td>
						<td>${paramData.carYear}년 형</td>
						<td class="option-title">주행거리</td>
						<td><fmt:formatNumber value="${paramData.carRealKM}" pattern="#,###" />km</td>
					</tr>
					<tr class="last-row">
						<td class="option-title">옵션</td>
						<td colspan="3">${paramData.carOption}</td>
					</tr>
				</tbody>
			</table>
			<table class="car-option-table step2">
				<thead>
					<colgroup>
						<col width="17%"/>
						<col width="33%"/>
						<col width="17%"/>
						<col width="33%"/>
					</colgroup>
				</thead>
				<tbody>
					<tr>
						<th colspan="4">
							선택 항목 확인
							<span name="folding-control" class="th-text-small"  style="display:none;">
								접기
							</span>
							<span name="folding-control" class="th-text-small">
								펼치기
							</span>
							<span id="step2_print" style="margin-right: 30px; float: right; line-height: 22px; background-color: #22B500; color: #FFF; padding: 0px 10px 2px 10px; font-size: 13px; cursor: pointer;">
								견적서 보기
							</span>
						</th>
					</tr>
					<tr class="option-info">
						<td class="option-title">대여상품</td>
						<td>
							<c:if test="${data.A_A eq 21}"> 장기렌트 일반식 (정비 포함)  </c:if>
							<c:if test="${data.A_A eq 22}">	장기렌트 기본식 (정비 미포함) </c:if>
							<c:if test="${data.A_A eq 11}">	자동차리스 기본식 (정비 미포함) </c:if>
							<c:if test="${data.A_A eq 12}">	자동차리스 일반식 (정비 미포함) </c:if>
						</td>
						<td class="option-title">대여기간</td>
						<td>
							${data.A_B}개월
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">표준약정운행거리</td>
						<td>
							<fmt:formatNumber value="${data.B_AGREE_DIST}" pattern="#,###" />km
						</td>
						<td class="option-title">적용약정운행거리</td>
						<td>
							<fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" />km
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">보증금</td>
						<td>
							[${data.RG_8}%] <fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" />원
						</td>
						<td class="option-title">선납금</td>
						<td>
							[${data.PP_PER}%] <fmt:formatNumber value="${data.PP_AMT}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">보증보험</td>
						<td>
							[${data.GI_PER}%] <fmt:formatNumber value="${data.GI_AMT}" pattern="#,###" />원
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="option-info">
						<td class="option-title">운전자 연령</td>
						<td>
							만
							<c:if test="${data.INS_AGE == 1}">26</c:if>
							<c:if test="${data.INS_AGE == 2}">21</c:if>
							<c:if test="${data.INS_AGE == 3}">24</c:if>
							세 이상
						</td>
						<td class="option-title">대물/자손</td>
						<td>
							<c:if test="${data.INS_DJ == 1}">5천만원/5천만원</c:if>
							<c:if test="${data.INS_DJ == 2}">1억원/1억원</c:if>
							<c:if test="${data.INS_DJ == 3}">5억원/1억원</c:if>
							<c:if test="${data.INS_DJ == 4}">2억원/1억원</c:if>
							<c:if test="${data.INS_DJ == 8}">3억원/1억원</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">자차 면책금</td>
						<td>
							<fmt:formatNumber value="${data.CAR_JA}" pattern="#,###" />원
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="option-info">
						<td class="option-title">차량용품</td>
						<td>
							<c:if test="${data.TINT_S_YN == 'Y'}">전면 선팅</c:if>
							<c:if test="${data.TINT_N_YN == 'Y'}">거치형 내비게이션</c:if>
							<c:if test="${data.TINT_EB_YN == 'Y'}">이동형 충전기</c:if>
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="step2-price">
						<td>대여기간</td>
						<td><span>${data.A_B}개월</span></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="step2-price">
						<td>공급가</td>
						<td><span><fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" />원</span></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="step2-price">
						<td>부가세</td>
						<td><span><fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" />원</span></td>
						<td>합계</td>
						<td>
							<div class="total-price"><fmt:formatNumber value="${data.FEE_S_AMT + data.FEE_V_AMT}" pattern="#,###"/>원</div>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" value="" name="estRegCode" id="estRegCode"/>
			<input type="hidden" value="${paramData.companyName}" name="companyName" id="companyName"/>
			<input type="hidden" value="${paramData.carKind}" name="carKind" id="carKind"/>
			<input type="hidden" value="${paramData.carName}" name="carName" id="carName"/>
			<input type="hidden" value="${paramData.carDetailName}" name="carDetailName" id="carDetailName"/>
			<input type="hidden" value="${paramData.fuelKind}" name="fuelKind" id="fuelKind"/>
			<input type="hidden" value="${paramData.carColor}" name="carColor" id="carColor"/>
			<input type="hidden" value="${paramData.carYear}" name="carYear" id="carYear"/>
			<input type="hidden" value="${paramData.carRealKM}" name="carRealKM" id="carRealKM"/>
			<input type="hidden" value="${paramData.carDPM}" name="carDPM" id="carDPM"/>
			<input type="hidden" value="${paramData.carRegDate}" name="carRegDate" id="carRegDate"/>
			<input type="hidden" value="${paramData.carOption}" name="carOption" id="carOption"/>
			<input type="hidden" value="${paramData.carNumber}" name="carNumber" id="carNumber"/>
			<input type="hidden" value="${data.REG_CODE}" name="regCode" id="regCode"/>
			<input type="hidden" value="${data.EST_ID}" name="estId" id="estId"/>
			<input type="hidden" value="" name="estArea" id="estArea"/>
			<input type="hidden" value="" name="etc" id="etc"/>
			<input type="hidden" value="${paramData.printUrl}" name="printUrl" id="printUrl" />
			<table class="customer-info-table">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="17%"/>
					<col width="33%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">고객 정보</th>
					</tr>
					<tr>
						<td class="option-title">
							구분<span style="color: red;">*</span>
						</td>
						<td colspan="3">
							<input type="radio" name="estGubun" value="3" id="gubun-personal">
							<label for="gubun-personal">개인</label>&nbsp;&nbsp;
							<input type="radio" name="estGubun" value="2" id="gubun-business">
							<label for="gubun-business">개인사업자</label>&nbsp;&nbsp;
							<input type="radio" name="estGubun" value="1" checked id="gubun-enterprise">
							<label for="gubun-enterprise">법인사업자</label>&nbsp;&nbsp;
						</td>
					</tr>
					<tr style="display: none;">
						<td class="option-title">
							업종<span style="color: red;">*</span>
						</td>
						<td>
							<select name="estBusiness" id="estBusiness">
								<option value="" selected>선택하세요</option>
								<option value="전문직">전문직</option>
								<option value="공공기관">공공기관</option>
								<option value="제조업">제조업</option>
								<option value="금융업">금융업</option>
								<option value="판매유통업">판매유통업</option>
								<option value="건설업">건설업</option>
								<option value="언론기관">언론기관</option>
								<option value="서비스업">서비스업</option>
								<option value="벤처">벤처</option>
								<option value="기타일반">기타일반</option>
							</select>
						</td>
						<td class="option-title business">
							업력<span style="color: red;">*</span>
						</td>
						<td class="business">
							<select name="estBusinessYear" id="estBusinessYear">
								<option value="" selected>선택하세요</option>
								<option value="2년 미만">2년 미만</option>
								<option value="2~5년">2~5년</option>
								<option value="5~10년">5~10년</option>
								<option value="10~15년">10~15년</option>
								<option value="15~20년">15~20년</option>
								<option value="20년 이상">20년 이상</option>
							</select>
						</td>
						<td style="display:none;" class="personal"></td>
						<td style="display:none;" class="personal"></td>
					</tr>
					<tr>
						<td class="option-title business">
							상호<span style="color: red;">*</span>
						</td>
						<td class="business">
							<input type="text" name="estName" id="estName"/>
						</td>
						<td class="option-title business">
							사업자 번호<span style="color: red;">*</span>
						</td>
						<td class="business">
							<input type="text" name="estSSN" id="estSSN" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/> <!-- placeholder="-제외(숫자 10자리)" -->
							<div style="height: 10px;">
								<span>- 제외한 숫자 10자리</span>
							</div>
						</td>
					</tr>
					<%-- <tr class="business">
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"><span>- 제외한 숫자 10자리</span></td>
					</tr>--%>					 
					<tr class="personal">
						<td class="option-title personal" style="display:none;">이름<span style="color: red;">*</span></td>
						<td class="personal" style="display:none;">
							<%-- <input type="text" name="estName" id="estName2" value="<sec:authentication property="principal.name" />" /> --%>
							<input type="text" name="estName" id="estName2" value="" />
						</td>
						<td class="option-title personal" style="display:none;">생년월일<span style="color: red;">*</span></td>
						<td class="personal" style="display:none;">
							<%-- <input type="text" name="estSSN" id="estSSN2" placeholder="ex)570101(숫자 6자리)" value="<sec:authentication property="principal.birth" />" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/> --%>
							<input type="text" name="estSSN" id="estSSN2" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
							<div style="height: 10px;">
								<span>예) 790101(생년월일 숫자 6자리)</span>
							</div>
						</td>
					</tr>
					<%-- <tr class="personal" style="display: none;">
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"><span>예) 570101(생년월일 숫자 6자리)</span></td>
					</tr> --%>
					<%-- <tr>
						<td colspan="4"><hr/></td>
					</tr> --%>
					<tr>
						<td class="option-title">지역<span style="color: red;">*</span></td>
						<td>
							<select name="estSido" id="sido" style="width:49%;">
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
							<select name="estGugun"  id="gugun" style="width:49%;">
								<option value="">구/군</option>
							</select>
						</td>
						<td colspan="2"></td>
						<%-- <td></td> --%>
					</tr>
					
					<tr>
						<td class="option-title business">담당자 이름<span style="color: red;">*</span></td>
						<td class="business">
							<%-- <input type="text" name="estAgent" id="estAgent" value="<sec:authentication property="principal.name" />" /> --%>
							<input type="text" name="estAgent" id="estAgent" value="" />
						</td>
						<td class="business"></td>
						<td class="business"></td>						
					</tr>
					<tr style='height: 75px;'>
						<td class="option-title">연락처<span style="color: red;">*</span></td>
						<td>
							<%-- <input type="text" name="estTel" id="estTel" value="<sec:authentication property="principal.tel" />" /> --%>
							<input type="text" name="estTel" id="estTel" value=""  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' />
							<div style="height: 10px;">
								<span>- 제외한 숫자만 입력</span>
							</div>
						</td>
						<td class="option-title">이메일주소<span style="color: red;">*</span></td>
						<td>
							<sec:authorize access="isAuthenticated()">
								<input type="hidden" name="hpKey" id="hpKey" value="<sec:authentication property="principal.email" />" />
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<input type="hidden" name="hpKey" id="hpKey" value="" />
							</sec:authorize>
							<input type="text" name="estEmail" id="estEmail" value="" />
						</td>
					</tr>
					<tr style="display: none;">
						<td class="option-title">팩스번호</td>
						<td>
							<input type="text" name="estFax" id="estFax" />
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">기타 문의사항</td>
						<td colspan="3">
							<textarea id="etc-textarea" style="width:800px;height:110px;"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="estimate-footer">
		<div class="footer-left" style="padding-top: 0px !important;">
			<span style="color: red;">*</span> 항목은 필수 입력 항목 입니다.<br><br>
			입력 항목은 견적산출을 위해서만 사용되며<br/>고객정보 보호를 위해 다른 목적으로 정보를 이용하지 않습니다.
		</div>
		<div class="footer-right">
			<input type="checkbox" id="agree" name="agree"/>
			<label for="agree">개인정보 수집·이용에 동의합니다.</label>
			<!-- <span id="privacy-rule" data-toggle="modal" data-target="#privacy-modal">(개인정보 수집·이용에 동의해주세요)</span> -->	
			<span id="privacy-rule" data-toggle="modal" data-target="#privacy-modal">개인정보 수집·이용 동의 전문보기</span>
			<button type="button" id="step2_btn" class="submit-btn">상담 요청하기</button>
		</div>
	</div>
</form>
<%@include file="/WEB-INF/jsp/common/privacy-modal.jsp"%>
</t:blankpage>