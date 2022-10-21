<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<style>
label#agree-error {
	width: 250px !important;
    max-width: 250px !important;
}

/* placeholder 감추기  */
input:focus::-webkit-input-placeholder, 
textarea:focus::-webkit-input-placeholder { /* WebKit browsers */ color:transparent; } 
input:focus:-moz-placeholder, 
textarea:focus:-moz-placeholder { /* Mozilla Firefox 4 to 18 */ color:transparent; }
input:focus::-moz-placeholder, 
textarea:focus::-moz-placeholder { /* Mozilla Firefox 19+ */ color:transparent; } 
input:focus:-ms-input-placeholder, 
textarea:focus:-ms-input-placeholder { /* Internet Explorer 10+ */ color:transparent; }

</style>
<script>
$( document ).ready(function() {
	
	/* var privacy_text = "개인(신용)정보 수집·이용·제공·조회 동의\n\n"+ */
	var privacy_text = "개인정보 수집·이용 동의\n\n"+
	"(주)아마존카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수하고 있습니다. \n\n"+
	"1. 개인정보의 수집 및 이용목적\n\n견적신청에 대한 상담 및 견적제시 목적\n*상기 목적외의 용도로 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.\n\n"+
	"2. 수집하는 개인정보 항목\n\n필수항목 : 고객명, 연락처, 지역, 이메일주소\n\n"+
	"3. 개인정보의 보유 및 이용기관\n\n개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.\n"+
	"* 최대 보유기간 : 수집 후 6개월 (수집 후 6개월 이후에는 무조건 파기)\n\n"+
	"4. 동의 거부권 및 불이익\n\n개인정보 수집·이용에 관한 동의를 거부할 권리가 있으나, 동의 거부시 스마트 견적 상담이 불가합니다.";
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
    	$.each(cnt[index], function(inx, value) {
    		if (inx == 0) {
    			$('#gugun').append("<option value=''>"+cnt[index][inx]+"</option>");
    		} else {
    			$('#gugun').append("<option value='"+cnt[index][inx]+"'>"+cnt[index][inx]+"</option>");
    		}
    	})
    })    
    
    // validation
    $("#simple-est-submit").bind("click", function() {
    	var policy_chk = $("#agree").is(":checked");
		if (policy_chk == true) {
			consultRequest();
		} else {
			alert('개인정보 수집·이용에 동의해 주세요');
		}
  	});	
	
	function consultRequest() {
    	
    	//고객정보
        var estName = $("#estName").val();
    	var estTel = $("#estTel").val();
    	var estEmail = $("#estEmail").val();
    	
    	//지역 이름 셋팅
    	var sido = $('#sido option:checked').val();
    	var gugun = $('#gugun option:checked').val();
    	var areaName = sido + "/" + gugun;
    	
    	//상담신청내용
    	var etc = $("#etc-textarea").val();
    	
    	//지역 이름 셋팅
    	var sido = $('#sido option:checked').val();
    	var gugun = $('#gugun option:checked').val();
    	var areaName = sido + "/" + gugun;
    	$('#estArea').val(areaName);
    	
    	//문의사항 셋팅
    	var inquiry = $('#etc-textarea').val();
    	$('#etc').val(inquiry);
    	
        //regExp
    	var num_regex = /^[0-9]+$/g;
    	var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\''\"]/gi;
        
        if (estName == "") {
            alert("고객명을 입력해주세요");
            $("#estName").focus();
            return;
        }
        if (regExp.test(estName)) {
        	alert("고객명에는 특수문자를 제외하고 입력해주세요.");
            $("#estName").focus();
            return;
    	}
        if (estTel == "") {
            alert("연락처를 입력해주세요");
            $("#estTel").focus();
            return;
        }
        if (!num_regex.test(estTel)) {
        	alert("연락처는 기호없이 숫자로만 입력해주세요.");
        	$("#estTel").focus();
        	return;
        }
        if (sido == "0" || sido == "") {
            alert("시/도를 선택해주세요");
            return;
        }
        if (gugun == "0" || gugun == "") {
            alert("구/군을 선택해주세요");
            return;
        }
        if (estEmail == "") {
            alert("이메일을 입력해주세요");
            $("#estEmail").focus();
            return;
        }
        if (email_regex.test(estEmail) == false) {
    	    alert("잘못된 이메일 형식입니다.");
    	    $("#estEmail").focus();
    	    return;
    	}
        if (etc == "") {
            alert("기타문의사항을 입력해주세요.");
            $("#estArea").focus();
            return;
        }
        if (regExp.test(etc)) {
        	alert("기타문의사항에는 특수문자를 제외하고 입력해주세요.");
        	$('#estArea').focus();
            return;
    	}
    	
        var data = {};
		data["estArea"] = $('#estArea').val().trim();
		data["estName"] = $('#estName').val().trim();
		data["estTel"] = $('#estTel').val().trim();
		data["estEmail"] = $('#estEmail').val().trim();
		data["hpKey"] = $('#hpKey').val().trim();
		data["estGubun"] = "PC4";
		data["etc"] = $('#etc').val().trim();
		data["cType"] = "pc";
		
		var result = "";
		$.ajax({
			contentType: 'application/json',
			data: JSON.stringify(data),
			url: '/estimate/simple2',
			async: false,
			type: 'POST',
			success: function(response) {
				result = response;
				alert(result);
				$("#simple-esti-modal2 .close").click();
			}
		});
		
    }
    
});

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

</script>
<!-- Modal -->
<form id="simple-est-form" method="post" action="">
	<input type="hidden" name="estArea" id="estArea" value="">
	<input type="hidden" name="etc" id="etc" value="">
	<input type="hidden" name="estGubun" id="estGubun" value="">
	<input type="hidden" name="type" id="type" value="new">
	
	<div class="modal fade modal-open" id="simple-esti-modal2" tabindex="-1" role="dialog" aria-labelledby="simple-esti-modal2" aria-hidden="true" style="width: 100%;">
		<div class="modal-dialog modal-lg" id="pc_ver">
		   	<div class="modal-content" id="modal-content" style="width:950px;">
		       	<div class="modal-header">
		       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		       		<h4 class="modal-title" id="myModalLabel" style="color: #22b500;">간편상담신청</h4>
		     	</div>
		     	<div class="modal-body">
		     		<table class="full-width">
						<colgroup>
							<col width="8%"/>
							<col width="28%"/>
							<col width="5%"/>
							<col width="7%"/>
							<col width="28%"/>
						</colgroup>
						<tbody>
							<tr>
								<td><span style="vertical-align: middle;">*</span>고객명</td>
								<td style="padding-left: 10px;">
									<input type="text" name="estName" id="estName" class="full-width form-control input-sm" />
								</td>
								<td></td>
								<td><span style="vertical-align: middle;">*</span>연락처</td>
								<td><input type="text" name="estTel" id="estTel" class="full-width form-control input-sm" /></td>
							</tr>
							<tr>
								<td colspan="5"><br></td>
							</tr>
							<tr>
								<td><span style="vertical-align: middle;">*</span>지역</td>
								<td style="padding-left: 10px;">
									<select name="estSido" id="sido" class="form-control input-sm" style="width:49.4%; display: inline !important;">
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
									<select name="estGugun" id="gugun" class="form-control input-sm" style="width:49.4%; display: inline !important;">
										<option value="">구/군</option>
									</select>
								</td>
								<td></td>									
								<td><span style="vertical-align: middle;">*</span>이메일주소</td>
								<td>
									<sec:authorize access="isAuthenticated()">
										<input type="hidden" name="hpKey" id="hpKey" value="<sec:authentication property="principal.email" />" />
									</sec:authorize>
									<sec:authorize access="isAnonymous()">
										<input type="hidden" name="hpKey" id="hpKey" value="" />
									</sec:authorize>
									<input type="text" name="estEmail" id="estEmail" class="full-width form-control input-sm" />
								</td>
							</tr>
							<tr>
								<td colspan="5"><br /></td>
							</tr>
							<tr>
								<td class="option-title"  colspan="5">
									<div style="padding-bottom: 10px;">
										&nbsp;기타 문의사항
									</div> 
								</td>								
							</tr>
							<tr>
								<td colspan="5">
									<textarea id="etc-textarea" style="height:100px; resize: none;" class="full-width form-control input-sm" placeholder="ex) 그랜저 하이브리드 장기렌트 48개월 견적상담&#13;&#10;ex) 쏘나타LPG 재렌트 24개월 견적상담"></textarea>
								</td>
							</tr>
							<tr><td colspan="5"><br /></td></tr>
							<tr>
								<td colspan="5">
									<textarea id="privacy-area" style="height:150px; resize: none;" class="full-width form-control input-sm" readonly="readonly"></textarea>
									<div style="padding-top: 10px;">
										<label class="checkbox-inline">
											<input type="checkbox" id="agree" name="agree"/>
										</label>
										<label for="agree">개인정보 수집·이용에 동의합니다.</label>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
		   		</div>
		   		
		    	<div class="modal-footer">
					<button type="submit" id= "simple-est-submit" class="btn btn-default-reverse">상담 요청하기</button>
		       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    	</div>
			 </div>
		</div>
	</div>
</form>