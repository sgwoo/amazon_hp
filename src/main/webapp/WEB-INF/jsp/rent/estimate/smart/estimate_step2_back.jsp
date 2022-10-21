<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>

<t:blankpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script src="/resources/js/esti-common.js"></script>
<!-- <script src="/resources/js/common.js"></script> -->
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script>
$(document).ready(function(){

	// jjlim 제거
    //$("input[name='estEmail']").val($.cookie("estEmail")); //최초 들어왔을 때 이메일 주소 셋팅
	
	$(".car-option-table tr[class='option-info']").css("display","none");
	$("span[name='folding-control']").click(function(){
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
    		if(inx == 0){
    			$('#gugun').append("<option value=''>"+cnt[index][inx]+"</option>");
    		}else{
    			$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
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
    
    $(".submit-btn").click(function(){
    	
    })
    
    //견적서보기 클릭시
    $("#step2_print").click(function(){
    	var url = $("#printUrl").val();		
		window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");
    })
    
  	$('#step3form').validate({
        errorClass:"errClass",
		rules:{
			estName:{required:true},
			estTel:{required:true},
			estSSN:{required:true},
			estEmail:{required:true, email:true},
			estSido:{required:true},
			estGugun:{required:true},
			birth:{required:true,maxlength:6},
			agree:{required:true}
		},
		messages:{
			estName:{
				required:"상호명 또는 이름을 입력해주세요"
			},
			estTel:{
				required:"전화번호는 필수 항목입니다"
			},
			estSSN:{
				required:"사업자번호 또는 생년월일은 필수 항목입니다"
			},
			estEmail:{
				required:"이메일은 필수 항목입니다",
				email:"이메일 주소를 올바르게 입력해주세요"
			},
			estSido:{
				required:"시/도는 필수 항목입니다"
			},
			estGugun:{
				required:"구/군은 필수 항목입니다"
			},
			birth:{
				required:"생년월일은 필수입니다",
				maxlength:"여섯자리 숫자만 입력 가능합니다 ex)570101"
			},
			agree:{
				required:"(개인정보 수집·이용에 동의해주세요)"
			}
		},
		submitHandler:function(form){
			$(".submit-btn").button('loading');
			$(this).prop("disabled",true); 
			
			//특수문자 방지 밸리데이션
			var vali_chk = false;
			if(scriptValidation($('#estName1').val())==true && scriptValidation($('#estName2').val())==true &&
			   scriptValidation($('#estSSN1').val())==true && scriptValidation($('#estSSN2').val())==true &&		
			   scriptValidation($('#estAgent').val())==true && scriptValidation($('#estTel').val())==true &&
			   scriptValidation($('#estFax').val())==true && scriptValidation($('#estEmail').val())==true &&
			   scriptValidation($('textarea').val())==true ){
				vali_chk = true;
			}
			if(vali_chk == true){
				//지역 이름 셋팅
		    	var sido = $('#sido option:checked').val();
		    	var gugun = $('#gugun option:checked').val();
		    	var areaName = sido + "/" + gugun;
		    	$('#estArea').val(areaName);
		    	
		    	//문의사항 셋팅
		    	var inquiry = $('textarea').text();
		    	$('#etc').val(inquiry);
	
		    	//사업자상호, 개인의 이름 input name이 같아서 첫번째꺼로 들어감. 앞에서 validation 했으므로 value가 없는 input field는 삭제
		    	$("input[name='estName'],input[name='estSSN']").each(function(){
		    		if($(this).val() == null || $(this).val() == ""){
		    			$(this).remove();
		    		}
		    	})
		    	form.submit();
			}else{
				$(".submit-btn").button('reset');
				$(this).prop("disabled",false); 
			}
				
		}
	}); 
	
})
</script>
<div class="estimate-header">
	<div class="process-tab">
		<h2 class="primary">실시간 견적내기 및 상담요청</h2>
		<div class="process-item done">STEP 1:실시간 견적</div>
		<div class="process-item done">STEP 2:상담 요청</div>
		<div class="process-item">STEP 3:상담 정보 확인</div>
	</div>
</div>
<form id="step3form" method="post" action="/estimate/smart/step3">
	<div class="estimate-body">
		<div class="car-info">
			<table class="car-info-table">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">차량 선택</th>
					</tr>
					<tr>
						<td class="option-title">차량모델명</td>
						<td>
							${paramData.carName}
							<c:if test="${paramData.carName ne paramData.carDetailName}">
								${paramData.carDetailName}
							</c:if>
						</td>
						<td class="text-right">
							<fmt:formatNumber value="${data.O_1 - data.OPT_AMT - data.COL_AMT}" pattern="#,###"/>원
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">옵션</td>
						<td>${fn:replace(data.OPT,'+',' ')}</td>
						<td class="text-right">
							<fmt:formatNumber value="${data.OPT_AMT}" pattern="#,###"/>원
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">색상</td>
						<td>
							${fn:replace(data.COL,'+',' ')}
						</td>
						<td class="text-right"><fmt:formatNumber value="${data.COL_AMT}" pattern="#,###"/>원</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">차량가격</td>
						<td></td>
						<td class="text-right primary">
							<fmt:formatNumber value="${data.O_1}" pattern="#,###"/>원
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<table class="car-option-table step2">
				<colgroup>
					<col width="17%"/>
					<col width="33%"/>
					<col width="17%"/>
					<col width="33%"/>
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4">
							대여조건 선택
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
						<td colspan="3">
							<c:if test="${data.A_A eq 21}">	장기렌트 일반식 (정비 포함)	</c:if>
							<c:if test="${data.A_A eq 22}">	장기렌트 기본식 (정비 미포함)</c:if>
							<c:if test="${data.A_A eq 11}">	자동차리스 일반식 (정비 포함) </c:if>
							<c:if test="${data.A_A eq 12}">	자동차리스 기본식 (정비 미포함)</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">매입옵션</td>
						<td colspan="3">
							<c:if test="${data.OPT_CHK == 1}">있음</c:if>
							<c:if test="${data.OPT_CHK == 0}">없음</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">연간약정운행거리</td>
						<td colspan="3">
							<fmt:formatNumber value="${data.AGREE_DIST}" pattern="#,###" />km
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">보증금</td>
						<td colspan="3">
							[${data.RG_8}%] <fmt:formatNumber value="${data.RG_8_AMT}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">선납금</td>
						<td colspan="3">
							[${data.PP_PER}%] <fmt:formatNumber value="${data.PP_AMT}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">운전자 연령</td>
						<td colspan="3">
							만
							<c:if test="${data.INS_AGE == 1}">26</c:if>
							<c:if test="${data.INS_AGE == 2}">21</c:if>
							<c:if test="${data.INS_AGE == 3}">24</c:if>
							세 이상
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">대물</td>
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
						<td colspan="3">
							<fmt:formatNumber value="${data.CAR_JA}" pattern="#,###" />원
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">차량용품</td>
						<td colspan="3">
							<c:if test="${data.TINT_S_YN == 'Y'}">전면 선팅</c:if>
							<c:if test="${data.TINT_N_YN == 'Y'}">거치형 내비게이션</c:if>
							<c:if test="${data.TINT_EB_YN == 'Y'}">이동형 충전기</c:if>
						</td>
					</tr>
					<tr class="option-info">
						<td class="option-title">차량 인도지역</td>
						<td colspan="3">
							<c:if test="${data.LOC_ST == 1}">서울</c:if>
							<c:if test="${data.LOC_ST == 2}">인천/경기</c:if>
							<c:if test="${data.LOC_ST == 3}">강원</c:if>
							<c:if test="${data.LOC_ST == 4}">충청</c:if>
							<c:if test="${data.LOC_ST == 5}">전라</c:if>
							<c:if test="${data.LOC_ST == 6}">대구/경북</c:if>
							<c:if test="${data.LOC_ST == 7}">부산/울산/경남</c:if>
						</td>
					</tr>
					<tr class="step2-price">
						<td>대여기간</td>
						<td><span>${data.A_B}개월</span></td>
						<td>월대여료</td>
						<td>
							<div style="width:255px">
								공급가 
								<span style="float:right"><fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###" />원</span>
							</div>
						</td>
					</tr>
					<tr class="step2-price">
						<td></td>
						<td></td>
						<td></td>
						<td>
							<div style="width:255px">
								부가세 
								<span style="float:right"><fmt:formatNumber value="${data.FEE_V_AMT}" pattern="#,###" />원</span>
							</div>
						</td>
					</tr>
					<tr class="step2-price">
						<td></td>
						<td></td>
						<td>합계</td>
						<td>
							<div class="total-price">${data.totalPrice}원</div>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" value="${paramData.companyName}" name="companyName">
			<input type="hidden" value="${paramData.carKind}" name="carKind">
			<input type="hidden" value="${paramData.carName}" name="carName">
			<input type="hidden" value="${paramData.carDetailName}" name="carDetailName">
			<input type="hidden" value="${paramData.carDiesel}" name="carDiesel">
			<input type="hidden" value="${data.REG_CODE}" name="regCode" id="regCode"/>
			<input type="hidden" value="${data.EST_ID}" name="estId" id="estId"/>
			<input type="hidden" value="" name="estArea" id="estArea"/>
			<input type="hidden" value="${paramData.carName}${paramData.carDetailName}" name="carName" id="carName"/>
			<input type="hidden" value="" name="etc" id="etc"/>
			<input type="hidden" value="${paramData.printUrl}" name="printUrl" id="printUrl"/>
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
						<td>
							<input type="radio" name="estGubun" value="3" id="gubun-personal">
							<label for="gubun-personal">개인</label>&nbsp;&nbsp;
							<input type="radio" name="estGubun" value="2" id="gubun-business">
							<label for="gubun-business">개인사업자</label>&nbsp;&nbsp;
							<input type="radio" name="estGubun" value="1" checked id="gubun-enterprise">
							<label for="gubun-enterprise">법인사업자</label>&nbsp;&nbsp;
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">
							업종<span style="color: red;">*</span>
						</td>
						<td>
							<select name="estBusiness">
								<option selected disabled>선택하세요</option>
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
							<select name="estBusinessYear">
								<option selected disabled>선택하세요</option>
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
							사업자 상호<span style="color: red;">*</span>
						</td>
						<td class="business">
							<input type="text" name="estName" id="estName1" class="business-customer"/>
						</td>
						<td class="option-title business">
							사업자 번호<span style="color: red;">*</span>
						</td>
						<td class="business">
							<input type="text" name="estSSN" id="estSSN1" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>							
						</td>
					</tr>
					<tr class="business">
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"><span>- 제외한 숫자 10자리</span></td>
					</tr>
					<tr>
						<td colspan="4"><hr/></td>
					</tr>
					<tr>
						<td class="option-title business">담당자 이름<span style="color: red;">*</span></td>
						<td class="business">
							<%-- <input type="text" name="estAgent" value="<sec:authentication property="principal.name" />" /> --%>
							<input type="text" name="estAgent" id="estAgent" value="" />
						</td>
						<td class="business"></td>
						<td class="business"></td>
						<td class="option-title personal" style="display:none;">이름<span style="color: red;">*</span></td>
						<td class="personal" style="display:none;">
							<%-- <input type="text" name="estName" value="<sec:authentication property="principal.name" />" /> --%>
							<input type="text" name="estName" id="estName2" value="" />
						</td>
						<td class="option-title personal" style="display:none;">생년월일<span style="color: red;">*</span></td>
						<td class="personal" style="display:none;">
							<%-- <input type="text" name="estSSN" placeholder="ex)570101(숫자 6자리)" value="<sec:authentication property="principal.birth" />" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/> --%>
							<input type="text" name="estSSN" id="estSSN2" value="" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
							<!-- <span>예) 570101(숫자 6자리)</span> -->
						</td>
					</tr>
					<tr class="personal" style="display: none;">
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"></td>
						<td style="height: 10px;"><span>예) 790101(생년월일 숫자 6자리)</span></td>
					</tr>
					<tr>
						<td class="option-title">전화번호<span style="color: red;">*</span></td>
						<td>
							<%-- <input type="text" name="estTel" id="estTel" value="<sec:authentication property="principal.tel" />" /> --%>
							<input type="text" name="estTel" id="estTel" value="" />
						</td>
						<td class="option-title">팩스번호</td>
						<td>
							<input type="text" name="estFax" id="estFax" />
						</td>
					</tr>
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
							<select name="estGugun" id="gugun" style="width:49%;">
								<option value="">구/군</option>
							</select>
						</td>
						<td>
							
						</td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">이메일주소<span style="color: red;">*</span></td>
						<td>
							<%-- <input type="text" name="estEmail" id="" value="<sec:authentication property="principal.email" />" /> --%>
							<sec:authorize access="isAuthenticated()">
								<input type="hidden" name="hpKey" id="hpKey" value="<sec:authentication property="principal.email" />" />
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<input type="hidden" name="hpKey" id="hpKey" value="" />
							</sec:authorize>
							<input type="text" name="estEmail" id="estEmail" value="" />
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td class="option-title">기타 문의사항</td>
						<td colspan="3">
							<textarea style="width:800px;height:110px;"></textarea><br><br>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="estimate-footer">
		<div class="footer-left">
			<span style="color: red;">*</span> 항목은 필수 입력 항목 입니다.<br><br>
			입력 항목은 견적산출을 위해서만 사용되며<br/>고객정보 보호를 위해 다른 목적으로 정보를 이용하지 않습니다.
		</div>
		<div class="footer-right">
			<input type="checkbox" id="agree" name="agree"/>
			<label for="agree">개인정보 수집·이용에 동의합니다.</label>
			<span id="privacy-rule" data-toggle="modal" data-target="#privacy-modal">개인정보 수집·이용 동의 전문보기</span>	
			<button type="submit" class="submit-btn" data-loading-text="<i class='fa fa-circle-o-notch fa-spin'></i>상담 접수 중">상담 요청하기</button>
		</div>
	</div>
</form>
<%@include file="/WEB-INF/jsp/common/privacy-modal.jsp"%>
</t:blankpage>
