/* 견적 관리 validation */
function checkCarName(){
	var selectedValue = $('.carNameSelectBox option:selected').val();
	if(selectedValue == '0' || selectedValue == null){
		alert("차명을 먼저 선택해주세요");
		return false;
	}else{
		return true;
	}
}

function checkCarCompany(){
	var selectedValue = $('#compSelectBox option:selected').val();
	if(selectedValue == '0' || selectedValue == null){
		alert("제조사를 선택해주세요");
		return false;
	}else{
		return true;
	}
}

function checkCarDetail(){
	var selectedValue = $('.selectedCarDetail').val();
	if(selectedValue == '' || selectedValue == null){
		alert("차종을 선택해주세요");
		return false;
	}else{
		return true;
	}
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

/* 차량을 다시 선택했을 때를 대비하여, 선택사항을 모두 refresh 해준다 */
function refreshOptionTable(){
	$("#gubunSelectBox > option").each(function(){
		$(this).prop("disabled",false);
	})
	$('.label-warning').hide();
}

/* 약정운행거리 값 리턴하기(직접 입력한 거면 숫자 입력됐는지  체크) */
function checkAgreeDistValue(){
	if($("#agreeDistSelectBox option:selected").val() == 'directInput'){ //직접 입력했다면
		var value = $("input[name='agreeDistSelectBox']").val();
		if(value == ""){
			alert("약정운행거리를 입력해주세요");
			$("input[name='agreeDistSelectBox']").focus();
			return false;
		}else{
			var num_check=/^[0-9]{5,6}$/;
			if(num_check.test(value)){
				return value;
			}else{
				alert("약정운행거리를 정확하게 입력해주세요\n(최소 10000km 이상 이어야 합니다)");
				return false;
			}
		}
		$("input[name='agreeDistSelectBox']").val();
	}else{
		return $("#agreeDistSelectBox option:selected").val();	
	}
	
}

$(document).ready(function(){
	//스마트견적관리 차종 '선택'버튼 클릭시 차명 데이터 있는지 validate
	$('#detail-modal').on('show.bs.modal', function (e) {
		var checkFlag = checkCarName();
		return checkFlag;
	})
	
	//스마트견적관리 '차량적용하기' 버튼 클릭 시 제조사/차명/차종 선택 여부 확인
	$('.apply-btn').click(function(){
		//제조사 체크 
		var checkCompFlag = checkCarCompany();
		if(checkCompFlag){
			//차명 체크
			var checkNameFlag = checkCarName();
			if(checkNameFlag){
				//차종 체크
				var checkDetailFlag = checkCarDetail();
				if(checkDetailFlag){
					refreshOptionTable(); 
					submitCarInfoApply();
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	})
	
	$('#agreeDistSelectBox').change(function(){
		if($('#agreeDistSelectBox option:selected').val() == 'directInput'){
			$('select#agreeDistSelectBox').hide();
			$("input[name='agreeDistSelectBox']").show();
			$("input[name='agreeDistSelectBox']").focus();
		}
	})
	
})