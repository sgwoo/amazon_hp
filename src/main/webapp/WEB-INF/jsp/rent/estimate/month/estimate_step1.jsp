<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<t:blankpage>
<link rel="stylesheet" href="/resources/stylesheets/estimate.css"/>
<script src="/webjars/jquery-cookie/1.4.1-1/jquery.cookie.js"></script>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<!-- http >> https 로 서버 바꾸면서 다음우편번호 검색 api js주소도 변경 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script> -->
<script src='https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js'></script>
<script src="/resources/js/esti-common.js"></script>
<script src="/resources/js/common.js"></script>
<%@include file="/WEB-INF/jsp/common/login-modal.jsp"%> <!-- 로그인 모달 -->
<%@include file="/WEB-INF/jsp/common/register-modal.jsp"%> <!-- 회원가입 모달 -->
<!-- 구글 소셜로그인 연동 -->
<meta name="google-signin-client_id" content="87064886185-9k4to29khedjjpa71638ombcphn2754c.apps.googleusercontent.com"></meta>
<script src="https://apis.google.com/js/client:platform.js"></script>
<script>
$(document).ready(function(){
	//서버정비관련 상담요청 및 예약 제한(2018.01.20 ~)
	/* alert("현재, 서버 정비작업으로 인해 월렌트 예약이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
	$("#no-submitReserveBtn").click(function(){
		alert("현재, 서버 정비작업으로 인해 월렌트 예약이 불가능 합니다.\n\n(견적 및 조회 등은 가능)\n\n빠른 시일내로 정상서비스 제공을 위해 노력하겠습니다.\n\n예상작업 시간 : 2018-01-19 18:00 ~ 2018-01-22 09:00\n\n- 아마존카 -");
		return false;
	}); */ 
	
	//개인정보 동의 체크 확인용 변수
	var agreeChkAll = false;
	
	//이미 예약된 차량이면 팝업닫음
	if($("#reserveFlag").val() == 0){
		alert("차량이 이미 예약되었습니다");
		opener.location.reload();
		window.close();
	}
	
	//차량예약시 이메일을 로그인한 이메일로 세팅
	var loginEmail = $("#loginEmail").val();
	if(loginEmail != ""){
		$("#hpKey").val(loginEmail);
	}	
	
	//로그인한 경우 부모창 리로드
	if(loginEmail != ""){
		//$('#pre-check-modal').css("display", "none");
		//opener.location.reload();		//<-- IE에서 location객체를 인식못해서 스크립트에러 발생. 주석처리.
	}else{
		$('.pre-check-div').css("display", "none");
		//$("#loginModalDiv").css("display", "block");
		alert("로그인이 필요한 서비스 입니다.");
		/* $("#from_page").val(); */
		//opener.parent.location="/login";
		opener.parent.location.reload();
		//opener.parent.location=$("#from_page").val();
		window.close();
	}
	
	//처음에는 스크롤바 금지 
	$('body').css("overflow","hidden");	
	
	//페이지 로딩시 차량이용지 주소 기본값
	selectCarUseAddr("1");
	
	//페이지 로딩시 월렌트값에 따른 checkbox 보여주기 유무
	var tempMonthPay = $("#monthPay").val();
	var monthPayIndex = tempMonthPay.lastIndexOf(".");
	var monthPay;
	if (monthPayIndex == -1) {
		monthPay = Number(tempMonthPay);
	} else {
		monthPay = Number(tempMonthPay.substring(0, monthPayIndex));
	}
	
	if (monthPay >= 750000) {
		$('#monthCheck').show();
	} else {
		$('#monthCheck').hide();
	}
	
	//사전에 차량예약 필수조건 확인하기
	$("input[name='pre-check-box']").change(function(){
		
		var checkCnt = 0;
		$("input[name='pre-check-box']").each(function(){
			if($(this).prop("checked") == true){
				checkCnt++;				
			}
		});
		
		if (monthPay > 750000) {
			if(checkCnt == 6){
				$('#pre-check-btn').show();
			}else{
				$('#pre-check-btn').hide();
			}
		} else {
			if(checkCnt == 5){
				$('#pre-check-btn').show();
			}else{
				$('#pre-check-btn').hide();
			}
		}
	})
	
	//필수조건 확인 버튼 클릭 시
	$('#pre-check-btn').click(function() {
	   
		$('.pre-check-div').css("display", "none");		
		var loginEmail = $("#loginEmail").val();
		
		if (loginEmail == "" || loginEmail == null) {
			$("#loginModalDiv").css("display", "block");
			
		} else {			
			$(".pre-check-modal").css("display", "none");			
			var url = "/reserve/auth/check";
			var email = $("#loginEmail").val();
			var param = {
		    	email: $("#loginEmail").val()
		    };
			
			$.ajax({
				contentType:'application/json',
				dataType:'json',
				/* data:email, */
				data:JSON.stringify(param),
				url:url,
				type:'POST',
				success:function(response) {
					if (response.flag) {
						$('.pre-check-content').slideUp(500, function() {
							$('.pre-check-modal').hide();
						});
						$('body').css("overflow", "auto");
						$("#loginEmail").val(email);
						//$.cookie('estEmail',email,{path:'/', expires:1, domain:'www.amazoncar.co.kr' });
					} else {
						alert(response.message);
						window.close();
					}
				},
				error:function(request,status,error) {
					alert(response.message);
				}
			});			
		}
	})
	
	//다음지도 API
	$('#zipcodeBtn, #zipcodeBtn_personal').click(function(){
		var attrId = "";
		if($(this).attr("id") == "zipcodeBtn_personal"){
			attrId += "_personal";
		}
		
		new daum.Postcode({
		    oncomplete: function(data) {
		    	var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                $('#zipcode' + attrId).val(data.zonecode);                
                $('#addr1'+attrId).val(fullAddr);
                $('#estArea').val(fullAddr.split(" ")[0].substring(0,2) +"/"+ fullAddr.split(" ")[1]);                
                $('#addr2'+attrId).focus();
		    }
		}).open();
	});
	
	//다음지도 API-2
	$('#zipcodeBtn_car_use').click(function(){
		var attrId = "_car_use";
		
		new daum.Postcode({
		    oncomplete: function(data) {
		    	var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                $('#zipcode_car').val(data.zonecode);                
                $('#addr1_car_use').val(fullAddr);
                $('#addr2_car_use').focus();
		    }
		}).open();
	});
	
	$(".car-option-table tr[class='option-info']").css("display","none");
	
	$("span[name='folding-control']").click(function(){
		$(".car-option-table tr[class='option-info']").toggle();
		$("span[name='folding-control']").toggle();
	})
	
	//첫화면로딩시 운전자선택 세팅
	$("input[name='addDriver'][value='0']").prop("checked",true);
	
	//사업자 구분에 따른 폼 변경
    $("input[name='estGubun']").click(function(){
    	var selectedValue = $(this).val();
    	if(selectedValue == 3){ //개인
    		$('.personal').show();
    		$('.business, .business2').hide();
    		//추가	(step2_per : 개인고객, step2_busi : 개인사업자, step2_busi2 : 법인사업자)
    		$(".step2_per").show();
    		$(".step2_busi, .step2_busi2, .employee-1, .extra-driver-busi, .extra-driver-busi2").hide();
    		$("input[name='addDriver'][value='0']").prop("checked",true);
    	}else if(selectedValue == 2){ //개인사업자
    		$('.personal').hide();
    		$(".business, .business2").show();
    		//추가
    		$(".step2_busi").show();
    		$(".step2_per, .step2_busi2, .extra-driver-per, .extra-driver-busi2, .info_e1").hide();
    		$("input[name='addDriver'][value='2']").prop("checked",true);
    	}else{ //법인사업자
    		$('.personal, .business2').hide();
    		$('.business').show();
    		//추가
    		$(".step2_busi2").show();
    		$(".step2_per, .step2_busi, .extra-driver-per, .employee-1, .extra-driver-busi").hide();
    		$("input[name='addDriver'][value='5']").prop("checked",true);
    	}
    })
    
    //계약자 외 추가 운전자 있으면
	  $("input[name='addDriver']").change(function(){
		  var checkedVal = $("input[name='addDriver']:checked").val();
		  if(checkedVal == "1"){	//개인고객- 운전자 2명
			  $('.extra-driver-per').show();
			  $(".employee-1, .extra-driver-busi, .extra-driver-busi2").hide();			  
			  $("#driverCount").val("2");
		  }else if(checkedVal == "2"){	//개인사업자- 운전자 1명(사업자본인)
			  $('.per-busi, .info_e2').show();
			  $(".extra-driver-per, .extra-driver-busi, .extra-driver-busi2, .employee-1, .info_e1, .info_e3").hide();
			  $("#driverCount").val("1");
		  }else if(checkedVal == "3"){	//개인사업자- 운전자 1명(직원)+ 개인사업자의 주민번호도 받음 --> driverCount = 2 
			  $('.employee-1, .per-busi, .info_e1, .info_e3').show();
			  $(".extra-driver-per, .extra-driver-busi, .extra-driver-busi2, .info_e2" ).hide();
			  $("#driverCount").val("2");
		  }else if(checkedVal == "4"){	//개인사업자- 운전자 2명(사업자본인+직원)
			  $('.per-busi, .info_e2').show();
			  $('.extra-driver-busi').show(); 	
			  $(".extra-driver-per, .employee-1, .extra-driver-busi2, .info_e1, .info_e3").hide();
			  $("#driverCount").val("2");
		  }else if(checkedVal == "5"){	//법인사업자- 운전자 1명
			  $(".extra-driver-per, .employee-1, .extra-driver-busi, .extra-driver-busi2").hide();
			  $("#driverCount").val("1");
		  }else if(checkedVal == "6"){	//법인사업자- 운전자 2명
			  $('.extra-driver-busi2').show();
			  $(".extra-driver-per, .employee-1, .extra-driver-busi").hide();
			  $("#driverCount").val("2");
		  }else if(checkedVal == "0"){	//개인고객- 운전자 1명			  
			  $(".extra-driver-per, .employee-1, .extra-driver-busi, .extra-driver-busi2").hide();
			  $("#driverCount").val("1");
		  }
	  })
    
    //은행 직접 입력 선택 시 SELECT -> INPUT 으로 변경함
    /* $('#bankSelectBox').change(function(){
    	if($('#bankSelectBox option:selected').val() == 'bankDirectInput'){
    		$('#bankSelectBox').hide();
    		$("input[name='bank']").show();
    		$("input[name='bank']").focus();
    	}
    	if($('#bankSelectBox option:selected').val() == '기업은행'){
    		alert("기업은행의 경우, 휴대폰 번호로 생성된 계좌는 사용하실 수 없습니다");
    	}
    }) */
    
    //차량예약하기 버튼 클릭시, 먼저 차량 예약가능 유무부터 체크한다.
    //예약하기 버튼을 여러번 누를시 다중 예약 되는것 방지
	$("#submitReserveBtn").on("click", function() {
		if (agreeChkAll == false) {
			alert("개인(신용)정보 수집 · 이용 · 제공 · 조회 전체를 체크해 주세요.");
			return false;
		}
		var data= {};
		data["carManagedId"] = $("#carManagedId").val();
		data["rentManagedId"] = $("#rentManagedId").val();
		data["rentLocationCode"] = $("#rentLocationCode").val();
		var url = "/reserve/car/check";
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			data:JSON.stringify(data),
			url:url,
			type:'POST',
			success:function(response) {
				if (response == 0) {
					alert("해당 차량은 이미 예약 되었습니다.\n\n마이페이지 > 견적/상담/예약 이력 에서 확인하세요.");
					return false;
				} else {
					//차량 예약가능 상태 확인후에 사용자가 현재 예약 상태인지 또 체크
					var url = "/reserve/auth/check";
					var param = {
				    	email: $("#loginEmail").val()
				    };
					$.ajax({
						contentType:'application/json',
						dataType:'json',						
						data:JSON.stringify(param),
						url:url,
						type:'POST',
						success:function(response) {
							if (response.flag) {	//차량 예약가능, 고객 예약가능 최종적으로 둘다 체크한 후 이상없으면 예약 단계로!!
								$("#realSRBtn").click();
							} else {	//예약 상태이면 메세지 후 강제종료
								alert(response.message);
								return false;
							}
						},
						error:function(request,status,error){
							alert(response.message);
						}
					});
				}
			},
			error:function(request,status,error){
				alert("차량 예약 중 오류 발생! 관리자에게 문의하세요.");
			}
		});				
	}); 
    
	$('#step2form').validate({
        errorClass:"errClass",
		rules:{
			estName:{required:true},
			estTel:{required:true},
			estEmail:{required:true, email:true},
			estSSN:{required:true},
			agree:{required:true},
			addr1:{required:true},
			addr2:{required:true},
		//	account:{required:true},
			car_use_addr1:{required:true},
			car_use_addr2:{required:true}
		},
		messages:{
			estName:{  
				required:"상호명 또는 이름을 입력해주세요"	
			},
			estTel:{
				required:"전화번호는 필수 항목입니다"
			},
			estEmail:{
				required:"이메일은 필수 항목입니다",
				email:"이메일 주소를 올바르게 입력해주세요"
			},
			estSSN:{	
				required:"생년월일(사업자번호)은 필수 항목입니다"
			},
			agree:{	
				required:"전체 동의에 체크 해주세요" 
			},
			addr1:{ 
				required:"우편번호 찾기를 클릭하여 주소를 검색해주세요" 
			},
			addr2:{ 
				required:"상세주소를 입력해 주세요"
			},
			//account:{ required:"계좌 번호는 필수 항목입니다" },
			car_use_addr1:{ 
				required:"우편번호 찾기를 클릭하여 차량이용지 주소를 검색해주세요" 
			},
			car_use_addr2:{ 
				required:"차량이용지 상세주소를 입력해 주세요"
			}
		},
		submitHandler:function(form) {
			//차량이용지 주소 체크
			/* if($('#car_use_addr option:selected').val() == '1'){
				if($('input:radio[name="estGubun"]:checked').val()=='3'){
					$("#addr1_car_use").val($("#addr1_personal").val());
					$("#addr2_car_use").val($("#addr2_personal").val());
				}else{
					$("#addr1_car_use").val($("#addr1").val());
					$("#addr2_car_use").val($("#addr2").val());
				}
			} */
			
			//특수문자 방지 밸리데이션
			var vali_chk = false;
			var cnt_total = 0;
			var cnt_chk   = 0;
			//input[name='estEmail'],	
			$("input[name='estName'],	input[name='estCEO'],		input[name='estSSN'],"+
			  "input[name='estCompTel'],input[name='estCompCel'],	input[name='addr2'],	input[name='estUrgen'],"+
			  "input[name='estTel'],	input[name='zipcode_car'],	input[name='car_use_addr2'],"+
			  "input[name='estAgent'], 	textarea[id='etcMemo'],		input[id='d_name1'],	input[id='d_cell1'],"+
			  "input[id='d_name3'],		input[id='d_cell3'],		input[id='d_name4'],	input[id='d_cell4'],"+
			  "input[id='d_name5'],		input[id='d_cell5'],		input[id='d_name6'],	input[id='d_cell6']"
			  ).each(function(){
				  
	    		if ($(this).val() != null && $(this).val() != "") {
	    			cnt_total ++;
		    		//if (scriptValidation($(this).val())==true) {
		    		if (scriptValidationOrigin($(this).val()) == true) {
		    			cnt_chk ++;
		    		} else {
		    			return false; 
		    		}
	    		}
	    	})
	    	
	    	if (cnt_total == cnt_chk) {
	    		vali_chk = true;
	    	}
			
			if (vali_chk == true) {
				var estGubun = $('input:radio[name="estGubun"]:checked').val();
			 	var addDriver = $('input:radio[name="addDriver"]:checked').val();
				//운전자 정보 담는 변수들
			 	var d_num0 = $("#d_num0").val();	
			 	var d_num1 = $("#d_num1").val();
			 	var d_name1 = $("#d_name1").val();
			 	var d_cell1 = $("#d_cell1").val();
			 	var d_num2 = $("#d_num2").val();
			 	var d_num3 = $("#d_num3").val();
			 	var d_name3 = $("#d_name3").val();
			 	var d_cell3 = $("#d_cell3").val();
			 	var d_num4 = $("#d_num4").val();
			 	var d_name4 = $("#d_name4").val();
			 	var d_cell4 = $("#d_cell4").val();
			 	var d_num5 = $("#d_num5").val();
			 	var d_name5 = $("#d_name5").val();
			 	var d_cell5 = $("#d_cell5").val();
			 	var d_num6 = $("#d_num6").val();
			 	var d_name6 = $("#d_name6").val();
			 	var d_cell6 = $("#d_cell6").val();
				
			 	if(estGubun=="3"){	//개인고객
		 			$("#driverNumber1").val(d_num0);
			 		if(addDriver=="1"){	
			 			$("#driverNumber2").val(d_num1);
			 			$("#driverName2").val(d_name1);
			 			$("#driverCell2").val(d_cell1);
			 		}
			 	}else if(estGubun=="2"){	//개인사업자
			 		if(addDriver=="2"){	//1명(본인)
			 			$("#driverNumber1").val(d_num2);
			 		}else if(addDriver=="3"){	//1명 (직원)		 			
			 			$("#driverNumber1").val(d_num2);
			 			$("#driverNumber2").val(d_num3);
			 			$("#driverName2").val(d_name3);
			 			$("#driverCell2").val(d_cell3);
			 		}else{	//2명(본인 + 직원)
			 			$("#driverNumber1").val(d_num2);
			 			$("#driverNumber2").val(d_num4);
			 			$("#driverName2").val(d_name4);
			 			$("#driverCell2").val(d_cell4);
			 		}
			 	}else{	//법인사업자
			 		$("#driverNumber1").val(d_num5);	//1명
		 			$("#driverName1").val(d_name5);
		 			$("#driverCell1").val(d_cell5);
			 		if(addDriver=="6"){
			 			$("#driverNumber2").val(d_num6); //2명
			 			$("#driverName2").val(d_name6);
			 			$("#driverCell2").val(d_cell6);
			 		} 
			 	}
			 	
				//운전자 정보 발리데이션 체크		 	
				var message = "차량을 예약하시겠습니까?";
				var inputFlag = false;
				
				var dn1 = $("#driverNumber1").val();	
	 			var dnm1 = $("#driverName1").val();
				var dc1 = $("#driverCell1").val();
				var dn2 = $("#driverNumber2").val();	
	 			var dnm2 = $("#driverName2").val();
				var dc2 = $("#driverCell2").val(); 
				
			 	if(estGubun=="3"){	//개인고객	 				 			
		 			if(addDriver=="1"){
		 				if(dn2!=null && dn2!='' && dnm2!=null && dnm2!='' && dc2!=null && dc2!='' && dn1!=null && dn1!=''){
		 					inputFlag = true;
		 				}
		 			}else if(addDriver=="0"){
		 				if(dn1!=null && dn1!=''){
		 					inputFlag = true;
		 				}
		 			}
			 	}else if(estGubun=="2"){	//개인사업자
			 		if(addDriver=="2"){
			 			if(dn1!=null && dn1!=''){
		 					inputFlag = true;
		 				}
			 		}else if(addDriver=="3"){
			 			if(dn1!=null && dn1!='' && dn2!=null && dn2!='' && dnm2!=null && dnm2!='' && dc2!=null && dc2!=''){
		 					inputFlag = true;
		 				}
			 		}else if(addDriver=="4"){
			 			if(dn2!=null && dn2!='' && dnm2!=null && dnm2!='' && dc2!=null && dc2!='' && dn1!=null && dn1!=''){
		 					inputFlag = true;
		 				}
			 		}		 			
			 	}else if(estGubun=="1"){	//법인사업자
			 		if(addDriver=="5"){
			 			if(dn1!=null && dn1!='' && dnm1!=null && dnm1!='' && dc1!=null && dc1!=''){
		 					inputFlag = true;
		 				}
			 		}else if(addDriver=="6"){
			 			if(dn1!=null && dn1!='' && dnm1!=null && dnm1!='' && dc1!=null && dc1!='' && dn2!=null && dn2!='' && dnm2!=null && dnm2!='' && dc2!=null && dc2!=''){
		 					inputFlag = true;
		 				}
			 		}
			 	}
			 	
			 	if(inputFlag==false){
			 		alert("운전자 정보를 모두 입력해주세요.");
			 		return false;
			 	}
			 	
			 	//운전면허번호 자리수체크
			 	if(dn1 !=null && dn1!=''){
			 		var validationTarget = dn1.replace(/[- ]/g,'');
					if(validationTarget.length != 12){
						alert("운전면허번호를 정확히 입력해주세요.(공백없이 12자리)");
						inputFlag = false;
						return false;
					}
			 	}
				if(dn2 !=null && dn2!=''){
			 		var validationTarget2 = dn2.replace(/[- ]/g,'');
					if(validationTarget2.length != 12){
						alert("운전면허번호를 정확히 입력해주세요.(공백없이 12자리)");
						inputFlag = false;
						return false;
					}
			 	}
			 	
			 	//운전면허번호 취득 후 3년 경과 체크
			 	for(var i=0; i<=6; i++){
				 	var d_n_ch_result = $("#d_n_chk_result"+i).val();
				 	if(d_n_ch_result==1){	alert("운전면허 취득(재취득) 후 만 3년이 경과한 경우에 월렌트 이용이 가능합니다.\n\n면허취득 후 경과 기간을 확인해 주세요.");	return false; }
			 	}
			 	
			 	//면허취득날짜를 입력 받아야하는 경우 체크
			 	for(var i=0; i<=6; i++){
				 	var get_d_n_date_chk = $("#get_d_n_date_chk"+i).val();
				 	if(get_d_n_date_chk==2){	alert("면허취득일자를 바르게 입력해 주세요.\n\n예) 2012-07-23 또는 20120723");	return false; }
				 	if(get_d_n_date_chk==1){	alert("운전면허 취득(재취득) 후 만 3년이 경과한 경우에 월렌트 이용이 가능합니다.\n\n면허취득 후 경과 기간을 확인해 주세요.");	return false; }
			 	}
			 	
				//필드 검사			
				if(inputFlag == true){
					//크롬일부버전에서 예약확인창이 뜨자마자 취소되는 현상때문에 소스추가(임시방편..)(20180920)
					var agent = navigator.userAgent.toLowerCase();
				 	if (agent.indexOf("chrome") != -1) {
				 		/* alert(""); */	
				 	}
				 	
					if(confirm(message)){
						//사업자상호, 개인의 이름 input name이 같아서 첫번째꺼로 들어감. 앞에서 validation 했으므로 value가 없는 input field는 삭제
				    	$("input[name='estName'],input[name='estEmail'],input[name='estSSN'],input[name='addr1'],input[name='addr2'],input[name='zipcode'],input[name='estTel']").each(function(){
				    		if($(this).val() == null || $(this).val() == ""){
				    			$(this).remove();
				    		}
				    	})
				    	
						//문의사항 셋팅
			        	var inquiry = $('#etcMemo').val();
			        	$('#etc').val(inquiry);
						
					    form.submit(); //예약확인 페이지로 넘어간다.
					}else{
						return false;
					}
				}else{
					return false;
			 	}
			}
		}
	});
	
	//개인정보 관련 팝업을 안 켜고 체크하려 할때 
	/* $("#agree-privacy").change(function(){
		if(!$(".show-privacy").hasClass("showed")){
			alert("개인(신용)정보 동의서를 확인해주세요");
			$("#agree-privacy").prop("checked",false);
		}
	}) */
	
	//개인정보 관련 팝업 켜졌을 때 class에 추가하기
	$('#privacy-modal').on('hidden.bs.modal', function (e) {
		$(".show-privacy").addClass("showed");
	});
	
	//"대표자와 동일" 체크박스 체크 했을 때
	$("#data-copy").change(function(){
		$("#estAgent").val($("#estCEO").val());
		$("#estTel2").val($("#estCompCel").val());
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
	
	//차량예약전 필수내용확인 - 상세안내 버튼처리
	$(".detail_info").on("click", function(){
		var d_i_v = $("#detail_info_val").val();
		if(d_i_v=='1'){
			$(".pre-check-content").css("height","700px");
			$("#detail_info_on").css("display", "none");
			$("#detail_info_off").css("display", "block");
			$("#detail_info_div").css("display","block");
			$("#detail_info_val").val("2");
		}else if(d_i_v=='2'){
			$(".pre-check-content").css("height","470px");
			$("#detail_info_on").css("display", "block");
			$("#detail_info_off").css("display", "none");
			$("#detail_info_div").css("display","none");
			$("#detail_info_val").val("1");
		}
	});
	
	//전체동의 체크
	$("input[id='agree-privacy-all']").change(function(){
		if($(this).prop("checked") == true){
			$("input[name='agree']").prop("checked",true);
		}else{
			$("input[name='agree']").prop("checked",false);
		}
	}); 
	
	//개인정보관련 동의 체크
	$("input[name='agree']").change(function(){
		var checkCnt = 0;
		$("input[name='agree']").each(function(){
			if($(this).prop("checked") == true){
				checkCnt++;				
			}
		});
		//1,2,3,4 체크시 전체체크 자동체크됨
		if($("input[id='agree-privacy-1']").prop("checked")==true && $("input[id='agree-privacy-2']").prop("checked")==true && 
		   $("input[id='agree-privacy-3']").prop("checked")==true && $("input[id='agree-privacy-4']").prop("checked")==true
		   && $("input[id='agree-privacy-5']").prop("checked")==true ){
			$("input[id='agree-privacy-all']").prop("checked",true);
			checkCnt = 5;
		}else{	//하나라도 체크x시 자동체크도 해제
			$("input[id='agree-privacy-all']").prop("checked",false);
		}
		
		if(checkCnt == 5){
			agreeChkAll = true;
		}else{
			agreeChkAll = false;
		}
	});
});

//생년월일 숫자만 입력가능하게 처리
function numkeyCheck(e) { 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ){
		return true; 
	}else{
		return false;
	}	
}

//운전면허번호 체크
function chk_d_num(event){
    var dn = event;
    var dn_arr = dn.split("//");
    dn = dn_arr[0];
    var cnt = dn_arr[1];
	var curY = (String)(new Date().getFullYear()).substr(2,2);
 	$("#get_d_n_y"+cnt).css("display", "none");
 	$("#d_n_chk_result"+cnt).val("");	
 	$("#get_d_n_date_chk"+cnt).val("");
 	if(dn !=null && dn!=''){
 		var validationTarget = dn.replace(/[- ]/g,'');
		if(validationTarget.length == 12){
			var dnY = validationTarget.substr(2,2);
			if(dnY <= curY){
				if(curY - dnY == 3){	//만3년 경과 여부 확인을 위해 취득일자와 비교해봐야 하는 경우
					$("#get_d_n_y"+cnt).css("display", "block");
					$("#d_n_chk_result"+cnt).val(2);
					$("#get_d_n_date_chk"+cnt).val(2);
					// $("#d_n_chk_result").val() 설명
					// "" : 입력전(curY - dnY == 3 이 아니면 그냥 통과되는 경우)
					//  0 : 체크 결과 - 월렌트 가능
					//  1 : 체크 결과 - 월렌트 불가
					//  2 : 체크전(curY - dnY == 3 이라서 입력폼은 생성되었으나 입력하지 않은 경우)
				}else if(curY - dnY != 3 && curY - dnY < 3 ){	//취득일자를 받을필요도 없이 아예 월렌트 불가인 경우	
					alert("운전면허 취득(재취득) 후 만 3년이 경과한 경우에 월렌트 이용이 가능합니다.");
					$("#d_n_chk_result"+cnt).val(1);
					return false;
				}else{	//월렌트 가능
					$("#d_n_chk_result"+cnt).val(0);
				}
			}else{	//월렌트 가능
				$("#d_n_chk_result"+cnt).val(0);
			}
			
			//운전면허번호 XXXX-XXXXXX-XX 형식으로 formating(2018.02.06)
			$("#d_num"+cnt).val(validationTarget.substr(0,4)+"-"+validationTarget.substr(4,6)+"-"+validationTarget.substr(10,2));
		}
		
 	} 
}

//운전면허 신규폼 체크
function drive_num_sum(key, ev) {	
	
	var location = $("#d_num"+key+"_0").val();
	var year = $("#d_num"+key+"_1").val();
	var six_num = $("#d_num"+key+"_2").val();
	var last_num = $("#d_num"+key+"_3").val();
	var temp_num = location+year+"-"+six_num+"-"+last_num;
	$("#d_num"+key).val(temp_num);
	
	var result_num = location+year+"-"+six_num+"-"+last_num+"//"+key;
	
	var dn = result_num;
    var dn_arr = dn.split("//");
    dn = dn_arr[0];
    var cnt = dn_arr[1];
    var validationTarget = dn.replace(/[- ]/g,'');
    
    var regExp = /^[0-9]+$/;
    var regExp_empty = /\s/g;
    
    var temp_val = "";
    
    if (!regExp.test(validationTarget)) {
    	if (location == "경기") {
    		if (year != "") {
	    		if (!regExp.test(year)) {
	    			alert("운전면허번호는 숫자만 가능합니다.");
	    			ev.value = "";
	    			temp_val = $("#d_num"+cnt+"_0").val()+$("#d_num"+cnt+"_1").val()+"-"+$("#d_num"+cnt+"_2").val()+"-"+$("#d_num"+cnt+"_3").val();
	    			//$("#d_num"+cnt).val(dn.replace(/[^0-9 !-]+/g, ""));
	    			$("#d_num"+cnt).val(temp_val);
	    			return;
	    		}
    		}
    		
			if (six_num != "") {
	    		if (!regExp.test(six_num)) {
	    			alert("운전면허번호는 숫자만 가능합니다.");
	    			ev.value = "";
	    			temp_val = $("#d_num"+cnt+"_0").val()+$("#d_num"+cnt+"_1").val()+"-"+$("#d_num"+cnt+"_2").val()+"-"+$("#d_num"+cnt+"_3").val();
	    			//$("#d_num"+cnt).val(dn.replace(/[^0-9 !-]+/g, ""));
	    			$("#d_num"+cnt).val(temp_val);
	    			return;
	    		}
    		}
			
			if (last_num != "") {
	    		if (!regExp.test(last_num)) {
	    			alert("운전면허번호는 숫자만 가능합니다.");
	    			ev.value = "";
	    			temp_val = $("#d_num"+cnt+"_0").val()+$("#d_num"+cnt+"_1").val()+"-"+$("#d_num"+cnt+"_2").val()+"-"+$("#d_num"+cnt+"_3").val();
	    			//$("#d_num"+cnt).val(dn.replace(/[^0-9 !-]+/g, ""));
	    			$("#d_num"+cnt).val(temp_val);
	    			return;
	    		}
    		}
    		ev.value = ev.value.replace(/\s/g, "");
    		$("#d_num"+cnt).val(dn.replace(/\s/g, ""));
    		chk_d_num(result_num);
    	} else {
			alert("운전면허번호는 숫자만 가능합니다.");
			ev.value = "";
			temp_val = $("#d_num"+cnt+"_0").val()+$("#d_num"+cnt+"_1").val()+"-"+$("#d_num"+cnt+"_2").val()+"-"+$("#d_num"+cnt+"_3").val();
			//$("#d_num"+cnt).val(dn.replace(/[^0-9 !-]+/g, ""));
			$("#d_num"+cnt).val(temp_val);
			return;
    	}
	} else {
		ev.value = ev.value.replace(/\s/g, "");
		$("#d_num"+cnt).val(dn.replace(/\s/g, ""));
		chk_d_num(result_num);
	}	
}

//운전면허번호 취득연도 체크
function chk_get_d_n_date(event) {
    var d_date = event;
    var d_date_arr = d_date.split("//");
    d_date = d_date_arr[0];
    var cnt = d_date_arr[1];
	var curY = new Date().getFullYear();
	var curM = new Date().getMonth() +1;
	var curD = new Date().getDate();
	if(curM<10){	curM = "0" + curM;	}
	if(curD<10){	curD = "0" + curD;	}
	
	if (d_date !=null && d_date!='') {
 		var validationTarget = d_date.replace(/[-.]/g,'');
 		var result_year = curY - 3;
 		var result_date = result_year + "" + curM + "" + curD;
		if(validationTarget.length == 8){
			if( Number(validationTarget) > Number(result_date) ){
				alert("운전면허 취득(재취득) 후 만 3년이 경과한 경우에 월렌트 이용이 가능합니다.");
				$("#get_d_n_date_chk"+cnt).val(1);
			}else{
				$("#get_d_n_date_chk"+cnt).val(0);
			}
		}
 	} 	
}

//차량이용지 주소 선택
function selectCarUseAddr(val){
	$("#addr1_car_use").val("");
	$("#addr2_car_use").val("");
	if(val=="1"){		$(".car_use_addr_tr").hide();	}
	else if(val=="2"){	$(".car_use_addr_tr").show();	}
}

</script>

<sec:authorize access="isAuthenticated()">
	<input type="hidden" name="loginEmail" id="loginEmail" value="<sec:authentication property="principal.email" />" />
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<input type="hidden" name="loginEmail" id="loginEmail" value="" />
</sec:authorize>

<input type="hidden" value="${paramData.from_page}" id="from_page" name="from_page"/>

<input type="hidden" value="${data.reserveFlag}" id="reserveFlag" />
<div class="pre-check-modal">
	<div class="pre-check-content" style="height:470px;">
		<div class="pre-check-div">
			<h4>차량 예약 전, 아래 필수 내용을 확인해주세요.</h4>
			<div class="pre-check-box">
				<input type="checkbox" name="pre-check-box" id="pre-age" />
				<label for="pre-age">운전자 연령이 <span class="primary">만 26세 이상</span> 입니다.</label><br/>
				<input type="checkbox" name="pre-check-box" id="pre-from" />
				<label for="pre-from">국적이 <span class="primary">대한민국</span> 입니다. (국적이 대한민국이 아닐 경우 월렌트 이용이 불가합니다.)</label><br/>
				<input type="checkbox" name="pre-check-box" id="pre-license" />
				<!-- <label for="pre-license"><span class="primary">운전면허 취득 후 3년 이상</span> 입니다.</label><br/> -->
				<label for="pre-license"><span class="primary">운전면허 취득(재취득) 후 3년 이상</span>입니다. (면허취소, 면허정지 이력 및 기타 운전 부적격 사유가 있을 경우 계약이 거절 될 수 있음)</label><br/>
				<input type="checkbox" name="pre-check-box" id="pre-credit" />
				<label for="pre-credit">
					<!-- <span class="primary">대여료는 계약자 본인 명의(법인의 경우 법인명의)의 신용카드</span>로 결제합니다.(체크카드 불가)<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 법인카드는 기명식 카드(카드에 이용자 개인 이름이 찍혀있는 법인카드)만 가능합니다. -->
					<span class="primary">대여료는 계약자 본인 명의의 신용카드</span>로 결제해야 합니다.(체크카드 불가)<br>
					<div style="float: left; padding-right: 30px;">※ 법인의 경우에는 기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드만 가능합니다.</div>
					<input type="button" class="btn btn-success detail_info" id="detail_info_on" value="상세안내" style="position: relative;">
					<input type="button" class="btn btn-success detail_info" id="detail_info_off" value="닫기" style="display: none;">
					<input type="hidden" id="detail_info_val" value="1">
					<div id="detail_info_div" style="display: none; margin-left: 16px; margin-bottom: -25px;">
						<hr>
						<div>※ 법인의 경우 기명식 법인카드 또는 법인 임직원 개인카드로 결제 받는 이유</div>
						<div>① &nbsp;&nbsp;2회차 부터의 대여요금, 연장대여요금, 중도해지위약금, 면책금 등의 기타 채무는 신용카드로 자동출금 되는데, 기명식이 아닌 법인 공용카드의 경우 신용카드 자동출금이 되지 않습니다.</div>
						<div>② &nbsp;&nbsp;기명식 법인카드가 없을 경우 법인 임직원 개인카드로도 결제가 가능합니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						- 당사는 신용카드 결제 여부와 별개로 세금계산서를 발행하고 있으므로 법인 고객 입장에서 비용처리 하는데 문제가 없고, 임직원 개인카드로 결제하고 법인으로부터 임직원이 카드대금을 
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수령하여도 거래 내용에 관한 실질주의 원칙상 법인에서 일정 소명만 하면 비용처리가 가능합니다.</div>
						<hr>
					</div>
				</label><br/>
				<input type="checkbox" name="pre-check-box" id="pre-driver" />
				<label for="pre-driver">
					<span class="primary">운전자 범위</span>는 아래와 같습니다.<br>
					<span class="desc-paragraph" >일반개인 : 본인만 운전 가능(단, 배우자에 한하여 사전심사 후 추가 가능)<br/></span>
					<span class="desc-paragraph" >개인사업자 : 계약자(개인사업자)및 사전에 면허증이 접수된 직원 1인만 운전 가능<br/></span>
					<span class="desc-paragraph" >법인 : 사전에 면허증이 접수된 직원 2인만 운전 가능</span>					
				</label><br/>
				<!-- 20180515_월대여료가 75만원 이상일경우 문구 추가 -->
				<div id="monthCheck">
					<input type="checkbox" name="pre-check-box" id="pre-month" />
					<label for="pre-month">
						본 차량은 계약자의 <span class="primary">신용등급 조회</span>가 필요한 차량입니다. (신용등급에 따라 계약진행이 불가 할 수도 있습니다.)	
					</label>
				</div>
			</div>
			<h4>위 항목에 <span class="primary-orange">부합하지 않을 시 차량 대여가 불가</span>합니다</h4>
			<br/>
			<button type="button" class="btn btn-default-reverse btn-lg" id="pre-check-btn" style="display:none;">월렌트 예약하러 가기</button>
		</div>
		
		<div class="pre-auth-div" style="display:none;" id="loginModalDiv">
			<h4>차량 예약하기</h4><br/>
			<div class="pre-check-box">
									
				<%-- jjlim --%>
				<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>이메일 주소 입력이나 소셜로그인으로 차량예약 가능합니다.</span><br/>
				<!-- <i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>회원가입 후 누구나 모든 차종의 실시간 견적 및 월렌트 예약이 가능합니다.</span> -->
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>인증 받으신 분은 기존에 인증 받으신 이메일을 입력하시고 이용하시면 됩니다.</span><br/>--%>
				<%--<i class="glyphicon glyphicon-ok"></i>&nbsp;&nbsp;<span>처음 이용하시는 분은 아래의 <span class="text-bold">이메일 본인인증</span>을 눌러 간단한 인증절차만으로 이용하실 수 있습니다.</span>--%>

			</div>
			
			<!-- 로그인 방식 변경  2017.05.26-->
			<br><br>
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
						<!-- 20180515_차량예약을 확인으로 문구 수정 -->
						<button class="btn btn-success" id="btn_checkEmail" >확&nbsp;인</button>
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
					<div class="col-md-3"></div>						
				</div>
			</div>
			<!-- 로그인 방식 변경  끝-->
		</div>
		<div class="pre-auth-info" style="display:none;">
			<hr/>
			인증 메일이 <span class="text-bold auth-email"></span>(으)로 전송되었습니다. 이메일을 확인하고 이메일 내 삽입된 인증 링크를 클릭하시면 절차가 완료됩니다.
		</div>
	</div>
</div>
<div class="pre-check-disable"></div>
<div class="estimate-container">
	<div class="estimate-header">
		<div class="process-tab">
			<h2 class="primary">월렌트 차량 예약</h2>
			<div class="process-item done" style="width: 47.8%;">STEP 1 : 차량 예약하기</div>
			<!-- <div class="process-item">
				STEP 2:차량 예약하기<br/>
				<small>(추가정보 입력 및 구비서류 업로드)</small>
			</div> -->
			<div class="process-item" style="width: 47.8%;">STEP 2 : 예약 결과보기</div>
		</div>
		<form id="step2form" action="/reserve/month" method="post">
			<input type="hidden" name="etc" id="etc" />
			<div class="estimate-body">
				<div class="car-info">
					<table class="secondhand-info-table">
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tbody>
							<tr>
								<th colspan="4">선택차량 기본정보</th>
							</tr>
							<tr>
								<td class="option-title">제조사</td>
								<td colspan="3">${data.CAR_COMP_NM}</td>
							</tr>
							<tr>
								<td class="option-title">차명</td>
								<td colspan="3">${data.CAR_JNM}&nbsp;${data.CAR_NM}</td>
							</tr>
							<tr>
								<td class="option-title">연료</td>
								<td>${data.FUEL_KD}</td>
								<td class="option-title">배기량</td>
								<td>${data.DPM}cc</td>
							</tr>
							<tr>
								<td class="option-title">신차등록일</td>
								<td>${data.INIT_REG_DT}</td>
								<td class="option-title">모델 연도</td>
								<td>${data.CAR_Y_FORM}년형</td>
							</tr>
							<tr>
								<td class="option-title">주행거리</td>
								<td><fmt:formatNumber value="${data.REAL_KM}"
										pattern="#,###" />km</td>
								<td class="option-title">색상</td>
								<td>${data.COLO}</td>
							</tr>
							<tr>
								<td class="option-title">공급가</td>
								<td class="text-right bold" style="padding-right: 230px;">
									<fmt:formatNumber value="${data.RM1}" pattern="#,###" />원
								</td>
								<td colspan="2"></td>
							</tr>
							<tr style="border-top: 0px !important">
								<td class="option-title">부가세</td>
								<td class="text-right bold" style="padding-right: 230px;">
									<fmt:formatNumber value="${data.RM1*0.1}" pattern="#,###" />원
								</td>
								<td colspan="2"></td>
							</tr>
							<tr style="border-top: 0px !important" class="last-row">
								<td class="option-title">월대여료</td>
								<td class="text-right primary bold" style="padding-right: 230px;">
									<input type="hidden" id="monthPay" value="${data.RM1}">
									<fmt:formatNumber value="${data.RM1 + (data.RM1*0.1)}" pattern="#,###" />원</td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="carName" id="carName" value="${data.CAR_JNM} ${data.CAR_NM}" /> 
					<input type="hidden" name="carManagedId" id="carManagedId" value="${paramData.carManagedId}" /> 
					<input type="hidden" name="estArea" id="estArea" /> 
					<input type="hidden" name="reserveRank" id="reserveRank" value="${paramData.reserveRank}}" /> 
					<input type="hidden" name="regCode" id="regCode" value="${regCode}" />
					<input type="hidden" name="rentLocationCode" id="rentLocationCode" value="${rentLocationCode}"/>
					<input type="hidden" name="rentManagedId" id="rentManagedId" value="${rentManagedId}"/>
					<input type="hidden" name="driverCount" id="driverCount" value="1"/>
					<input type="hidden" name="driverNumber1" id="driverNumber1" value=""/>
					<input type="hidden" name="driverName1" id="driverName1" value=""/>
					<input type="hidden" name="driverCell1" id="driverCell1" value=""/>
					<input type="hidden" name="driverNumber2" id="driverNumber2" value=""/>
					<input type="hidden" name="driverName2" id="driverName2" value=""/>
					<input type="hidden" name="driverCell2" id="driverCell2" value=""/>
					<input type="hidden" name="br_id" id="br_id" value="${data.BR_ID}"/>
					<table class="customer-info-table">
						<colgroup>
							<col width="17%" />
							<col width="33%" />
							<col width="17%" />
							<col width="33%" />
						</colgroup>
						<tbody>
							<tr>
								<th colspan="4">고객 정보</th>
							</tr>
							<tr>
								<td class="option-title">구분</td>
								<td>
									<input type="radio" name="estGubun" value="3" checked id="gubun-personal"> 
									<label for="gubun-personal">개인</label>&nbsp;&nbsp;									
									<input type="radio" name="estGubun" value="2" id="gubun-business"> 
									<label for="gubun-business">개인사업자</label>&nbsp;&nbsp;
									<input type="radio" name="estGubun" value="1" id="gubun-enterprise"> 
									<label for="gubun-enterprise">법인사업자</label>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="option-title">업종</td>
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
								<td class="option-title business" style="display:none;">업력</td>
								<td class="business" style="display:none;">
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
								<td class="option-title personal">
									운전경력</td>
								<td class="personal">
									<select	name="driverYear">
										<option selected disabled>선택하세요</option>
										<option value="3~5년">3~5년</option>
										<option value="5~10년">5~10년</option>
										<option value="10~15년">10~15년</option>
										<option value="15~20년">15~20년</option>
										<option value="20년 이상">20년 이상</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="option-title business" style="display:none;">상호</td>
								<td class="business" style="display:none;">
									<input type="text" name="estName" class="business-customer" />
								</td>
								<td class="option-title business" style="display:none;">대표자 성명</td>
								<td class="business" style="display:none;">
									<input type="text" name="estCEO" id="estCEO" class="business-customer">
								</td>
							</tr>
							<tr class="business" style="display:none;">
								<td class="option-title">사업자 번호</td>
								<td>
									<input type="text" name="estSSN" placeholder="-제외(숫자 10자리)" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
								</td>
								<td class="option-title">회사 전화번호</td>
								<td>
									<input type="text" name="estCompTel" id="estCompTel" />
								</td>
							</tr>
							<tr class="business2" style="display: none;">
								<td></td>
								<td></td>
								<td class="option-title">대표자 휴대폰번호</td>
								<td>
									<input type="text" name="estCompCel" id="estCompCel" />
								</td>
							</tr>
							<tr class="business" style="display:none;">
								<td class="option-title" rowspan="2">사업장 소재지</td>
								<td>
									<input type="text" name="zipcode" id="zipcode" placeholder="우편번호" style="width: 160px;" readonly />
									<button type="button" class="btn-default btn" name="zipcodeBtn"	id="zipcodeBtn" style="float: right; height: 40px;">우편번호 찾기</button></td>
								<td></td>
								<td></td>
							</tr>
							<tr class="business" style="display:none;">
								<td>
									<input type="text" name="addr1" id="addr1" placeholder="기본 주소" readonly>
								</td>
								<td colspan="2">
									<input type="text" name="addr2" id="addr2" placeholder="상세 주소" />
								</td>
							</tr>
							
							<tr class="personal">
								<td class="option-title">이름</td>
								<td>
									<input type="text" name="estName" />
								</td>
								<td class="option-title">생년월일</td>
								<td>
									<input type="text" name="estSSN" placeholder="ex)570101(숫자 6자리)" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'/>
								</td>
							</tr>
							<tr class="personal">
								<td class="option-title">휴대폰번호</td>
								<td>
									<input type="text" name="estTel" id="estTel1" />
								</td>
								<td class="option-title">유선번호<br />(직장/집)</td>
								<td>
									<input type="text" name="estUrgen" id="estUrgen" /> 
									<span class="foreign-info label label-warning">
										<i class="glyphicon glyphicon-info-sign"></i>&nbsp;핸드폰 연결이 되지 않으실	때,연락 가능한 번호를 입력해주세요
									</span>
								</td>
							</tr>
							<tr class="personal">
								<td class="option-title" rowspan="2">주소</td>
								<td>
									<input type="text" name="zipcode" id="zipcode_personal"	placeholder="우편번호" style="width: 160px;" readonly />
									<button type="button" class="btn-default btn" name="zipcodeBtn"	id="zipcodeBtn_personal" style="float: right; height: 40px;">우편번호 찾기</button>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr class="personal">
								<td>
									<input type="text" name="addr1" id="addr1_personal"	placeholder="기본 주소" readonly />
								</td>
								<td colspan="2">
									<input type="text" name="addr2"	id="addr2_personal" placeholder="상세 주소" />
								</td>
							</tr>
							<!-- 차량이용지 주소 추가(2018.03.06) -->
							<tr>
								<td class="option-title">차량이용지 주소</td>
								<td>
									<select id="car_use_addr" onchange="javascript:selectCarUseAddr(this.value);">
										<option value="1">상동</option>
										<option value="2">위 주소와 다름(직접입력)</option>
									</select>
								</td>
								<td colspan="2"></td>
							</tr>
							
							<tr class="car_use_addr_tr" >
								<td class="option-title" rowspan="2"></td>
								<td>
									<input type="text" name="zipcode_car" id="zipcode_car"	placeholder="우편번호" style="width: 160px;" readonly />
									<button type="button" class="btn-default btn" name="zipcodeCarUseBtn" id="zipcodeBtn_car_use" style="float: rigth; height: 40px; margin-left: 18px; margin-bottom: 5px;">우편번호 찾기</button>
								</td>
								<td></td>
								<td></td>
							</tr>
							<tr class="car_use_addr_tr" style="display:none;">
								<td>
									<input type="text" name="car_use_addr1" id="addr1_car_use"	placeholder="기본 주소" readonly />
								</td>
								<td colspan="2">
									<input type="text" name="car_use_addr2"	id="addr2_car_use" placeholder="상세 주소" />
								</td>
							</tr>
							<!-- 차량이용지 주소 추가 끝 -->
							<tr>
								<td colspan="4">
									<!-- <hr /> -->
									<div class="business2" style="display: none;">
										<input type="checkbox" name="" id="data-copy" />
										<label for="data-copy" style="font-weight: 600 !important;">&nbsp;대표자와 동일</label>
									</div>
								</td>
							</tr>
							<tr class="business" style="display:none;">
								<td class="option-title">담당자 이름</td>
								<td>
									<input type="text" name="estAgent" id="estAgent" />
								</td>
								<td class="option-title">휴대폰번호</td>
								<td>
									<input type="text" name="estTel" id="estTel2" />
								</td>
							</tr>
							<tr>
								<td class="option-title">이메일주소</td>
								<td>
									<%-- <input type="text" name="estEmail" id="estEmail" value="<sec:authentication property="principal.email" />" readonly="readonly" /> --%> 
									<input type="hidden" name="hpKey" id="hpKey" value="" />
									<input type="text" name="estEmail" id="estEmail" value="" style="margin-top: 10px;"/>
									<!-- <span class="foreign-info label label-warning"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;계약서 발송을 위해 정확한 이메일 주소를 입력해주세요</span> -->
									<span class="foreign-info label label-warning">
										<i class="glyphicon glyphicon-info-sign"></i>&nbsp;다른 이메일 주소로 예약하실 때에는 해당 이메일 주소로 새로 가입해주세요.
									</span>
								</td>
								<td colspan="2"></td>
							</tr>							
							<!--<tr>
							<td class="option-title">자동이체 결제<br/>계좌번호</td>
							<td>
								<select name="bank" id="bankSelectBox">
									<option value="신한은행">신한(조흥)은행</option>
									<option value="우리은행">우리은행</option>
									<option value="하나은행">KEB하나은행</option>
									<option value="기업은행">기업은행</option>
									<option value="국민은행">국민은행</option>
									<option value="SC은행">SC은행(SC제일)</option>
									<option value="씨티은행">한국씨티은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="농협">농협</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="제주은행">제주은행</option>
									<option value="bankDirectInput" id="bankDirectInput">:::::직접 입력하기:::::</option>
								</select>
								<input type="text" name="bank" style="display:none;"/>
							</td>
							<td colspan="2">
								<input type="text" name="account" id="account"/>
							</td>
						</tr>-->
						
					<!-- 채워넣을부분 -->
					<!-- 개인고객 -->
						<tr class="step2_per">
							<td colspan="4">
								<hr />								
							</td>
						</tr>
						<tr class="step2_per">
							<td class="option-title">운전자 선택</td>
							<td colspan="3">
								<input type="radio" name="addDriver" value="0" checked id="extra-driver-0" />
								<label for="extra-driver-0">1명(계약자)</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="1" id="extra-driver-1" />
								<label for="extra-driver-1">2명(계약자+배우자)</label>
								<br/>
								<div class="info extra-driver-per" style="display:none; padding-top:10px;">
									※일반 개인의 경우 계약자 본인만 운전 가능(단, 배우자에 한하여 사전 심사 후 추가 운전자 지정 가능)<br/>
									&nbsp;&nbsp;&nbsp;&nbsp;배우자 추가운전자 지정시 배우자 운전면허증 사본 및 가족관계 증명 서류를 현장에서 제출합니다. 
								</div>
							</td>
						</tr>
						<tr class="option-title step2_per">
							<td class="option-title" rowspan="2">계약자 정보</td>
							<td style="border-bottom:0px;" class="driver-info" colspan="3">	
								<!-- <span style="float: left;">운전면허번호&nbsp;&nbsp;<input type="text" id="d_num0" style="width:150px; margin-right: 20px;" onkeyup="chk_d_num0(this.value);"/></span> -->								
								<input type="hidden" id="d_num0"/>
								<span style="float: left;">운전면허번호&nbsp;
									<select id="d_num0_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('0');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>										
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num0_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('0', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num0_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('0', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num0_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('0', this);"/>
								</span>
								<span style="position: relative; float: left;"><span id="get_d_n_y0" style="display: none;">면허취득일자&nbsp;&nbsp;<input type="text" id="get_d_n_y_t0" style="width:80px;" onkeyup="chk_get_d_n_date(this.value+'//0');" placeholder="숫자 8자리"/></span></span>
								<span style="position: relative;"></span>
							</td>
						</tr>
						<tr class="step2_per">
							<td class="info" colspan="3" style="height:12px; padding-top: 10px;">
								<!-- ※ 운전면허번호는 현재 소지하고 계신 운전면허증의 번호와 동일하게 기재 해주셔야 합니다.<br>
								&nbsp;&nbsp;&nbsp;&nbsp;예) 11-07-111111-10 또는 서울 07-111111-10<br><br> -->
								※ 운전면허번호를 사전에 입력하더라도 차고지 현장 방문 시 계약자는 본인 확인을 위해 운전면허증을 반드시 지참해주셔야 합니다.
							</td>
						</tr>
						<tr class="option-title extra-driver-per" style="display:none;">
							<td class="option-title" style="padding-right: 0px; font-size: 13.5px;">추가운전자(배우자) 정보</td>
							<td colspan="3" class="driver-info" style="padding-top: 20px;">
								<!-- <span style="float: left;">운전면허번호&nbsp;&nbsp;<input type="text" id="d_num1" style="width:150px;margin-right:20px;" onkeyup="chk_d_num1(this.value);"/></span> -->								
								<!--start  -->
								<input type="hidden" id="d_num1"/>
								<span style="float: left;">운전면허번호&nbsp;									
									<select id="d_num1_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('1');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>										
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num1_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('1', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num1_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('1', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num1_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('1', this);"/>
								</span>
								<!--end  -->
								<span id="get_d_n_y1" style="display: none; float: left; position: relative;">
									면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y0" style="width:80px; margin-right:20px;" onkeyup="chk_get_d_n_date(this.value+'//1');" placeholder="숫자 8자리"/>
								</span>
								<span style="float: left; margin-top: 20px; width: 800px;">
									성명&nbsp;&nbsp;
									<input type="text" id="d_name1" style="width:80px; margin-right:20px;" />
									휴대폰번호&nbsp;&nbsp;
									<input type="text" id="d_cell1" style="width:140px;" />
								</span>
							</td>
						</tr>
						<%-- <tr>
							<td></td>	
						</tr> --%>
						<%-- <tr class="last-row step2_per">
							<td class="option-title" rowspan="2">자동이체 계좌번호</td>
							<td colspan="3" style="border-bottom:0px !important;">
								<select name="bank" id="bankSelectBox" style="width:150px;">
									<option value="신한은행">신한은행</option>
									<option value="우리은행">우리은행</option>
									<option value="하나은행">KEB하나은행</option>
									<option value="기업은행">기업은행</option>
									<option value="국민은행">국민은행</option>
									<option value="SC은행">SC은행</option>
									<option value="씨티은행">한국씨티은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="농협">농협</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="제주은행">제주은행</option>
									<option value="bankDirectInput" id="bankDirectInput">:::::직접 입력하기:::::</option>
								</select>
								<input type="text" name="bank" style="display:none;"/>
								<input type="text" name="account" id="account-input" style="width:400px;"/>
		                    </td>
						</tr>
						<tr class="step2_per">
							<td colspan="3" class="info">
								- 2회차 연장 시 대여 요금은 위 입력하신 계좌에서 자동이체로 진행됩니다.<br/>
								- 차량을 중도반납하시더라도 사용료 환불을 위하여 계좌번호는 반드시 필요합니다.<br/>
								- 차량이 반납되고 정산이 완료되면 자동이체 계좌번호는 자동 소멸됩니다.							
							</td>
						</tr> --%>
	<!-- 					<tr>
							<td class="option-title" rowspan="2" style="border-bottom:0px;">필요서류 파일 선택 (개인)</td>
							<td style="border-bottom:0px;">
								<input class="upload-name" value="파일 선택" disabled="disabled">
		                        <label for="ex-driver" class="upload-label">파일 선택</label> 
		                        <input type="file" name="uploadfile" id="ex-driver" class="upload-hidden file-upload"> 
		                        <input type="hidden" name="contentSeq" value="${estimateId}-001"/>
								<input type="hidden" name="contentCode" value="ESTI_SPE"/>
							</td>
							<td style="border-bottom:0px;"></td>
						</tr>
					<tr>
							<td class="option-title" style="border-bottom:0px;">필요서류 파일 선택 (개인)</td>
							<td colspan="2" class="info" style="height:12px;">
								- 일반 개인의 경우 차고지 현장 방문 시 현장에서 계약자 본인의 운전면허증을 스캔하여 파일 선택합니다.
								<span class="extra-driver" style="display:none;"><br/>(단, 배우자에 한하여 사전 심사 후 추가운전자로 지정이 가능하며, 배우자 추가운전자 지정 시<br/>배우자 운전면허증 사본 및 가족관계 증명 서류를 현장에서 제출합니다.)</span>
							</td>
						</tr>	-->	
	
					<!-- 개인사업자 -->
						<tr class="step2_busi" style="display:none;">
							<td colspan="4">
								<hr />								
							</td>
						</tr>
						<tr class="step2_busi" style="display:none;">
							<td class="option-title">운전자 선택</td>
							<td colspan="3">
								<input type="radio" name="addDriver" value="2" checked id="extra-driver-01" />
								<label for="extra-driver-01">1명[계약자(개인사업자)]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="3" id="extra-driver-02" />
								<label for="extra-driver-02">1명[직원]</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="4" id="extra-driver-03" />
								<label for="extra-driver-03">2명[계약자(개인사업자)+직원]</label>
							</td>
						</tr>
						<tr class="option-title step2_busi per-busi" style="display:none;">
							<td class="option-title">계약자(개인사업자)</td>
							<td colspan="3" class="driver-info">
								<!-- <span style="float: left; width: 800px;">
									<input type="text" id="d_num2" style="width:150px; margin-right:20px;" onkeyup="chk_d_num(this.value+'//2');" placeholder=" 지역+숫자 또는 숫자"/>
								</span> -->
								<!-- start -->
								<input type="hidden" id="d_num2"/>
								<span style="float: left;">운전면허번호&nbsp;&nbsp;
									<select id="d_num2_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('2');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>										
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num2_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('2', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num2_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('2', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num2_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('2', this);"/>
								</span>
								<!-- end -->
								<span id="get_d_n_y2" style="display: none; position: relative; float: left;">면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y_t2" style="width:80px;" onkeyup="chk_get_d_n_date(this.value+'//2');" placeholder="숫자 8자리"/>
								</span>
								<span style="position: relative;"></span>
								<div class="info_e1" style="margin-top: 30px; margin-bottom: 10px;"><br>※과태료 납부자 변경을 위해서는 계약자(개인사업자)의 예약 차량 운전 여부와 관계 없이 운전면허번호를 받아야합니다.<br></div>
								<div class="info_e2" style="margin-top: 30px; margin-bottom: 10px;"><br>※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</div>
							</td>
						</tr>
						<tr class="option-title employee-1" style="display:none;">
							<td class="option-title">운전자 정보</td>
							<td colspan="3" class="driver-info">
								<!-- <span style="float: left; width: 800px;">
									<input type="text" id="d_num3" style="width:150px; margin-right:20px;" onkeyup="chk_d_num(this.value+'//3');" placeholder=" 지역+숫자 또는 숫자"/>
								</span> -->
								<!-- start -->
								<input type="hidden" id="d_num3"/>
								<span style="float: left;">운전면허번호&nbsp;&nbsp;
									<select id="d_num3_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('3');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>										
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num3_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('3', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num3_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('3', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num3_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('3', this);"/>
								</span>
								<!-- end -->
								<span id="get_d_n_y3" style="display: none; position: relative; float: left;">면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y_t3" style="width:80px;margin-right:20px;" onkeyup="chk_get_d_n_date(this.value+'//3');" placeholder="숫자 8자리"/>
								</span>
								<span style="position: relative; float: left; width: 800px; padding-top: 10px;">
									성명&nbsp;&nbsp;
									<input type="text" id="d_name3" style="width:80px;margin-right:20px;"/>
									휴대폰번호&nbsp;&nbsp;
									<input type="text" id="d_cell3" style="width:140px;"/>
								</span>
								<span class="info_e3" style="position: relative; float: left; width: 800px; padding-top: 10px;">※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</span>
							</td>
						</tr>
						<tr class="option-title extra-driver-busi" style="display:none;">
							<td class="option-title">추가운전자 정보</td>
							<td colspan="3" class="driver-info">
								<!-- <span style="float: left; width: 800px;">
									<input type="text" id="d_num4" style="width:150px; margin-right:20px;" onkeyup="chk_d_num(this.value+'//4');" placeholder=" 지역+숫자 또는 숫자"/>
								</span> -->
								<!-- start -->
								<input type="hidden" id="d_num4"/>
								<span style="float: left;">운전면허번호&nbsp;&nbsp;
									<select id="d_num4_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('4');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>										
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num4_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('4', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num4_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('4', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num4_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('4', this);"/>
								</span>
								<!-- end -->
								<span id="get_d_n_y4" style="display: none; position: relative; float: left;">면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y_t4" style="width:80px;margin-right:20px;" onkeyup="chk_get_d_n_date(this.value+'//4');" placeholder="숫자 8자리"/>
								</span>
								<span style="position: relative; float: left; width: 800px; padding-top: 10px;">
									성명&nbsp;&nbsp;
									<input type="text" id="d_name4" style="width:80px;margin-right:20px;"/>
									휴대폰번호&nbsp;&nbsp;
									<input type="text" id="d_cell4" style="width:140px;"/></span>
							</td>
						</tr>						
					
					<!-- 법인사업자 -->
						<tr class="step2_busi2" style="display:none;">
							<td colspan="4">
								<hr />								
							</td>
						</tr>
						<tr class="step2_busi2" style="display:none;">
							<td class="option-title ">운전자 선택</td>
							<td colspan="3">
								<input type="radio" name="addDriver" value="5" checked id="extra-driver-04" />
								<label for="extra-driver-04">1명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="addDriver" value="6" id="extra-driver-05" />
								<label for="extra-driver-05">2명</label>
							</td>
						</tr>
						<tr class="option-title step2_busi2" style="display:none;">
							<td class="option-title">운전자1</td>
							<td colspan="3" class="driver-info">
								<!-- <span style="float: left;">운전면허번호&nbsp;&nbsp;
									<input type="text" id="d_num5" style="width:150px;margin-right:20px;" onkeyup="chk_d_num(this.value+'//5');" placeholder=" 지역+숫자 또는 숫자"/>
								</span> -->
								<!-- start -->
								<input type="hidden" id="d_num5"/>
								<span style="float: left;">운전면허번호&nbsp;&nbsp;
									<select id="d_num5_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('5');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num5_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('5', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num5_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('5', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num5_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('5', this);"/>
								</span>								
								<!-- end -->
								<span id="get_d_n_y5" style="display: none; position: relative; float: left;">
									면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y_t5" style="width:80px;margin-right:20px;" onkeyup="chk_get_d_n_date(this.value+'//5');" placeholder="숫자 8자리"/>
								</span>
								<span style="position: relative; float: left; width: 800px; padding-top: 10px;">
									성명&nbsp;&nbsp;<input type="text" id="d_name5" style="width:80px;margin-right:20px;"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" id="d_cell5" style="width:140px;"/>
								</span>
								<br/>
								<span class="info" style="position: relative; float: left; width: 800px; padding-top: 10px; padding-bottom: 10px;">※운전면허번호를 사전에 입력하더라도 차고지 현장 방문시 방문자는 본인 확인을 위해 운전면허증을 반드시 지참해 주셔야 합니다.</span>
							</td>
						</tr>
						<tr class="option-title extra-driver-busi2" style="display:none;">
							<td class="option-title">운전자2</td>
							<td colspan="3" class="driver-info">
								<!-- <span style="float: left;">운전면허번호&nbsp;&nbsp;
									<input type="text" id="d_num6" style="width:150px;margin-right:20px;" onkeyup="chk_d_num(this.value+'//6');" placeholder=" 지역+숫자 또는 숫자"/>
								</span> -->
								<!-- start -->
								<input type="hidden" id="d_num6"/>
								<span style="float: left;">운전면허번호&nbsp;&nbsp;
									<select id="d_num6_0" style="width:100px; margin-right: 10px;" onchange="drive_num_sum('6');">
										<option value="11">서울(11)</option>
										<option value="12">부산(12)</option>
										<option value="경기">경기</option>
										<option value="13">경기(13)</option>
										<option value="28">경기(28)</option>
										<option value="14">강원(14)</option>
										<option value="15">충북(15)</option>
										<option value="16">충남(16)</option>
										<option value="17">전북(17)</option>
										<option value="18">전남(18)</option>
										<option value="19">경북(19)</option>
										<option value="20">경남(20)</option>
										<option value="21">제주(21)</option>
										<option value="22">대구(22)</option>
										<option value="23">인천(23)</option>
										<option value="24">광주(24)</option>
										<option value="25">대전(25)</option>
										<option value="26">울산(26)</option>
									</select>
									&nbsp;&nbsp;<input type="text" id="d_num6_1" maxlength="2" style="width:80px; margin-right: 10px;" placeholder=" 숫자 2자리" onkeyup="drive_num_sum('6', this);"/>
									&nbsp;&nbsp;<input type="text" id="d_num6_2" maxlength="6" style="width:80px; margin-right: 10px;" placeholder=" 숫자 6자리" onkeyup="drive_num_sum('6', this);"/>
									&nbsp;&nbsp;<input type="password" id="d_num6_3" maxlength="2" placeholder=" 숫자 2자리" style="width:80px; height: 40px; margin-right: 10px;" autocomplete="off" onkeyup="drive_num_sum('6', this);"/>
								</span>
								<!-- end -->
								<span id="get_d_n_y6" style="display: none; position: relative; float: left;">
									면허취득일자&nbsp;&nbsp;
									<input type="text" id="get_d_n_y_t6" style="width:80px;margin-right:20px;" onkeyup="chk_get_d_n_date(this.value+'//6');" placeholder="숫자 8자리"/>
								</span>
								<span style="position: relative; float: left; width: 800px; padding-top: 10px;">
									성명&nbsp;&nbsp;<input type="text" id="d_name6" style="width:80px;margin-right:20px;"/>
									휴대폰번호&nbsp;&nbsp;<input type="text" id="d_cell6" style="width:140px;"/>
								</span>
							</td>
						</tr>						
											
					<tr>
						<td colspan="4"><hr></td>
					</tr>
					<tr>
						<td class="option-title">기타 메모</td>
						<td colspan="3">
							<textarea id="etcMemo" style="width:800px;height:110px; resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="height:40px;"></td>
					</tr>
					</tbody>
				</table> <br/>
			</div>
		</div>
		<div class="estimate-footer">
			<div align="right">
				<table border="1">
					<tr>
						<td width="448px;" height="30px;" bgcolor="#eaeaea">
							<input type="checkbox" name="agree" id="agree-privacy-all"  style="margin-left: 30px;">
							<label for="agree-privacy-all"><span style="font-weight: bold;"> &nbsp;&nbsp;전체동의</span></label>		
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="agree" id="agree-privacy-1" style="margin-left: 30px; margin-top: 10px;">
							<label for="agree-privacy-1"> &nbsp;&nbsp;개인정보 수집 · 이용 동의</label><br>
							<input type="checkbox" name="agree" id="agree-privacy-2" style="margin-left: 30px;">
							<label for="agree-privacy-2"> &nbsp;&nbsp;고유식별정보 수집 · 이용 동의</label><br>
							<input type="checkbox" name="agree" id="agree-privacy-3" style="margin-left: 30px;">
							<label for="agree-privacy-3"> &nbsp;&nbsp;개인(신용)정보 제공 동의</label><br>
							<input type="checkbox" name="agree" id="agree-privacy-4" style="margin-left: 30px;">
							<label for="agree-privacy-4"> &nbsp;&nbsp;개인신용정보 조회 동의</label><br>		
							<input type="checkbox" name="agree" id="agree-privacy-5" style="margin-left: 30px; margin-bottom: 10px;">
							<label for="agree-privacy-5"> &nbsp;&nbsp;운전자의 운전자격 있음</label><br>		
						</td>
					</tr>
					<tr>
						<td align="center" height="30px;">
							<span class="show-privacy" data-toggle="modal" data-target="#privacy-modal">개인(신용)정보 수집 · 이용 · 제공 · 조회 동의서 전문 보기</span><br/>		
						</td>
					</tr>
				</table>
			</div>
			<!-- 서버정비관련 상담요청 및 예약 제한(2018.01.20 ~) -->
			<button type="button" class="submit-btn" id="submitReserveBtn" style="margin-bottom: 100px;">차량 예약하기</button>
			<!-- <button type="button" class="submit-btn" id="no-submitReserveBtn" style="margin-bottom: 100px;">차량 예약하기</button> -->
			<button type="submit" id="realSRBtn" style="display: none;"></button>
		</div>
		<input type="hidden" id="d_n_chk_result0" value="">
		<input type="hidden" id="d_n_chk_result1" value="">
		<input type="hidden" id="d_n_chk_result2" value="">
		<input type="hidden" id="d_n_chk_result3" value="">
		<input type="hidden" id="d_n_chk_result4" value="">
		<input type="hidden" id="d_n_chk_result5" value="">
		<input type="hidden" id="d_n_chk_result6" value="">
		<input type="hidden" id="get_d_n_date_chk0" value="">
		<input type="hidden" id="get_d_n_date_chk1" value="">
		<input type="hidden" id="get_d_n_date_chk2" value="">
		<input type="hidden" id="get_d_n_date_chk3" value="">
		<input type="hidden" id="get_d_n_date_chk4" value="">
		<input type="hidden" id="get_d_n_date_chk5" value="">
		<input type="hidden" id="get_d_n_date_chk6" value="">
	</form>
</div>
</div>
<%@include file="/WEB-INF/jsp/common/month-privacy-modal.jsp"%>
</t:blankpage>