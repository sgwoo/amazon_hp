/**
 * Rent/Lease 공통 Script
 */

/* DetailFrm 에 파라미터 input 생성하기 */
function appendChildToForm(paramArray){
	$('#detailFrm').empty(); //기존에 있는 input 이 있다면 다 삭제 (초기화)
	$.each(paramArray,function(index,item){
		$('#detailFrm').append("<input type='hidden' name='"+item.name+"' value='"+item.value+"' id='"+item.name+"' />");
	})
}

/* 신차 Detail 넘어가는 function */
function openDetail_NEW(seq, estimateId, url){
	
	
	var agreeDist = $("input[name='agreeDist']:checked").val();
	var paramArray = [
	                  {name:"seq",value:seq},
	                  {name:"estimateId",value:estimateId},
	                  {name:"agreeDist",value:agreeDist}
	                 ];
	appendChildToForm(paramArray);
	if(typeof url != "undefined"){
		$('#detailFrm').attr("action",url);
	}
	$('#detailFrm').submit();
}

/* 재리스 재렌트 Detail 넘어가는 function */
function openDetail_SH(rent_mng_id, rent_locale_cd, car_mng_id, car_gubun, br_to){
	var agreeDist = $("input[name='agreeDist']:checked").val()||"20000";
	var paramArray = [
		{name:"carManagedId", value:car_mng_id},
		{name:"rentManagedId", value:rent_mng_id},
		{name:"rentLocationCode", value:rent_locale_cd},
		{name:"agreeDist", value:agreeDist},
		{name:"car_gubun", value:car_gubun},
		{name:"brTo", value:br_to}
	];
	
	appendChildToForm(paramArray);
	
	$('#detailFrm').attr("action","/rent/secondhand/detail");
	$('#detailFrm').submit();
}

/* 월렌트 Detail 넘어가는 function */
function openDetail_MN(rent_mng_id, rent_locale_cd, car_mng_id, location_id, carStatus){
	var form = $('#detailFrm');
	$('#carManagedId').val(car_mng_id);
	$('#rentManagedId').val(rent_mng_id);
	$('#rentLocationCode').val(rent_locale_cd);
	$('#locationId').val(location_id);
	$('#carStat').val(carStatus);	
	form.target = "_self";
	form.submit();	
}

/* 비교견적 window toggle */
function toggleCompareWindow(){
	$('.compare-window').find('.compare-boxes').toggle();
	$('.compare-window').toggleClass("open");
	$('.compare-submit').toggle();
	$('.compare-window').find('img').toggle();
	$('.compare-box').find('img').toggle();
	if($('.compare-window').hasClass("detail")){
		$('.compare-window').removeClass("detail");
		$('.compare-window .detail-container').hide();
	}
}

/* 비교견적 window 에서 차량 정보 제거 */
function clearWindow(img){
	windowId = $(img).closest('div').parent().attr('id');

	//스타일 원상복귀	
	$('#'+windowId).removeClass('fill');
	$('#'+windowId).css("background-image","none");
	$('#'+windowId).children('.compare-title').remove();

	removeCompareInfoToCookie(windowId);
	insertFillCnt();
}

/* 비교견적 window 에 fill 갯수 count */
function insertFillCnt(){
	var fillCount = $('.fill').length;
	$('#compareCnt').html(fillCount);

}

/* 비교견적 정보를 쿠키에 저장 */
function storeCompareInfoToCookie(boxId,type,carName,carGubun,param,url){
	//쿠키 키값은 div 아이디임
	$.cookie(boxId,[type,carName,carGubun,param,url],{path:'/', expires:1, domain:'www.amazoncar.co.kr' });
}

/* 비교견적 정보를 쿠키에서 삭제 */
function removeCompareInfoToCookie(boxId){
	$.removeCookie(boxId,{path:'/', expires:1, domain:'www.amazoncar.co.kr' });
}

function setSecondhandComparePriceMap(id, data, maxMonth){
	var count = 4;
	var gubun = "";
	var month = "";
	var innerCount = 0;
	
	$.each(data,function(key,value){
		if(innerCount == 4){ //innerCount (렌트기본식/렌트일반식/리스기본식/리스일반식) 4번 돌고나서 count(row)를 1번씩 감해준다. 
			count--;
			innerCount = 0;
		}
		
		//LB-LS-RB-RS 순서로 돈다 ex)LB48->LS48->RB48->RS48->LB36->LS36 ...
		if(key.length >= 4){
			gubun = key.substring(0,2);
			month = key.substring(2,4);
			if(month == "MA"){
				month = maxMonth;
			}
			var spanId = "#" + id + "-" + gubun + count;
			$(spanId).html("<span class='month-unit'>("+month+")</span> "+ value);
			
			innerCount++;
		}
		
	})
}

/* 전기차일 때 매입옵션 가격 수정하는 화면 */
$(document).on("click",".compare-title p", function(){
	var param = $(this).attr("param").split(":");
	var type = $(this).text();
	var url = $(this).prev().attr("action");

	if(type.indexOf("신차") >= 0){
		openDetail_NEW(param[0],param[1],url);
	}else{
		openDetail_SH(param[0],param[1],param[2],url);
	}
})

$(document).ready(function(){
	
	//부모 사양 품목 클릭 시
	$('.parent-title').click(function(){
		var id = $(this).attr("id").replace("parent-","");
		$("#body-"+id).toggle();
	})	
	
	//스마트견적관리 라벨 클릭 시 
	$('.label-smart').click(function(){
		window.open('/estimate/smart/step1','popup','width=1200,height=1200,top=0,left=100,scrollbars=yes');
	})

	//모달 버튼 클릭 시 모달팝업 등장 , 정비포함 미포함
	$('.info-modal-btn').click(function(){
		var value = $(this).attr("value");
		$(".modal-table td").removeClass("current");
		$(".modal-table td[name='"+value+"']").addClass("current");
	})	
	
	//차명으로 묶기
	var firstCarName = ""; 
	var rowspan = 1;
	var firstCarRow = "";
	$('tr','.main-list').each(function(row){
		if(row > 2 ){
			var thisTr = $(this);
			var carName = $(':first-child',thisTr).html();
			
			if(firstCarName != carName) {
				rowspan = 1;
				firstCarName = carName;
				firstCarRow = Number(row);
			}else{
				rowspan = Number(rowspan) + 1;
				$(".rent-list tr:eq("+firstCarRow+") > td:first-child").attr("rowspan",rowspan);
				$('td:first-child',thisTr).hide();
			}
		}
	})
	
	$("span.detail-span").click(function(e){		
		//param
		var param = $(this).attr("param").split(":");
		if($(this).hasClass("detail-new")){
			openDetail_NEW(param[0], param[1]);
		}else if($(this).hasClass("detail-sh")){ //재렌트
			openDetail_SH(param[0], param[1], param[2], param[3], param[4]);
		}else{ //월렌트
			openDetail_MN(param[0], param[1], param[2], param[3], param[4]);			
		}
		e.stopPropagation(); //무한루프 방지
	})
	
	//리스트 클릭 시 디테일로 넘어감 ㅡ 무한루프 돔 
	$(".rent-list > tbody > tr").click(function(e){	
		if($(this).find("a").hasClass("van-modal-btn")){			
		}else{
			$(this).find("span.detail-span").click();
		}
		
	})
	
	//리스트 마우스 오버 시 색상 변경
	$(".rent-list tr").hover(
		function(){
			$(this).find("td:not(:first-child)").addClass("hover-style");
		},
		function(){
			$(this).find("td:not(:first-child)").removeClass("hover-style");
		}
	)
	
	//재렌트 재리스 월렌트 리스트 마우스 오버 시 색상 변경
	$("#secondhand-list tr, #month-list tr").hover(
		function(){
			$(this).find("td").addClass("hover-style");
		},
		function(){
			$(this).find("td").removeClass("hover-style");
		}
	)	
	
	//비교견적 요청 시 
	$('.compare-submit').click(function(){
		var newCar = ["seq","estimateId"];
		var secondhand = ["rentManagedId","rentLocationCode","carManagedId"];
		$('.compare-table td span').text('');
		
		$('.fill').each(function(){

			var param = $(this).find("p").attr("param");
			var form = $(this).find("form");
			var type = "";
			var targetArray = newCar;
			var url = form.attr("action");
			var id = $(this).attr("id");
			var agreeDist = $("input[name='agreeDist']:checked").val();
			
			if(form.attr("action").indexOf("secondhand") > 0){	targetArray = secondhand; type = "secondhand"; }
			
			$.each(targetArray,function(index,item){
				form.append("<input type='hidden' name='"+item+"' value='"+param.split(":")[index]+"'/>");
			})
			form.append("<input type='hidden' name='agreeDist' value='"+agreeDist+"'/>");
			
			url = url + "?" + form.serialize();
			
			$.ajax({
				contentType:'application/json',
				url:url,
				type:'post',
				success:function(data){
					$("#"+id+"-comp-name").text(data.companyName); //제조사
					$("#"+id+"-fuel").text(data.carFuel); //연료
					$("#"+id+"-year").text(data.year); //연식
					$("#"+id+"-dpm").text(data.dpm); //배기량
					$("#"+id+"-color").text(data.color); //색상
					$("#"+id+"-dist").text(data.dist); //주행거리
					$("#"+id+"-carAmt").text(numberWithCommas(data.carAmt) + "원"); //신차가격
					$("#"+id+"-deposit").text(numberWithCommas(data.depositAmt) + "원"); //보증금
					$("#"+id+"-agreeDist").text(numberWithCommas(data.agreeDist) + "km"); //약정운행거리
					
					if(type == "secondhand"){ //재리스,재렌트면
						setSecondhandComparePriceMap(id,data.priceMap,data.maxMonth);
					}else{ //신차만
						$("#"+id+"-RB2").html("<span class='month-unit'>(36)</span> "+data.RB36_AMT);
						$("#"+id+"-RB3").html("<span class='month-unit'>(48)</span> "+data.RB48_AMT);
						$("#"+id+"-RB4").html("<span class='month-unit'>(60)</span> "+data.RB60_AMT);
						$("#"+id+"-RS2").html("<span class='month-unit'>(36)</span> "+data.RS36_AMT);
						$("#"+id+"-RS3").html("<span class='month-unit'>(48)</span> "+data.RS48_AMT);
						$("#"+id+"-RS4").html("<span class='month-unit'>(60)</span> "+data.RS60_AMT);
						$("#"+id+"-LB2").html("<span class='month-unit'>(36)</span> "+data.LB36_AMT);
						$("#"+id+"-LB3").html("<span class='month-unit'>(48)</span> "+data.LB48_AMT);
						$("#"+id+"-LB4").html("<span class='month-unit'>(60)</span> "+data.LB60_AMT);
						$("#"+id+"-LS2").html("<span class='month-unit'>(36)</span> "+data.LS36_AMT);
						$("#"+id+"-LS3").html("<span class='month-unit'>(48)</span> "+data.LS48_AMT);
						$("#"+id+"-LS4").html("<span class='month-unit'>(60)</span> "+data.LS60_AMT);
					}
				},
				error:function(request,status,error){
					alert(response.message);
				}
			});	
			
			
		})
		
		$('.compare-window').addClass("detail"); 
		$('.compare-window .detail-container').show();
	})
	
//	//가격이 0원이면 서비스 미제공으로 변경한다
//	$('.price-info > table > tbody > tr').each(function(){
//		var priceVal = $(this).find("td:eq(1) > span").text().replace("원","");
//		if(priceVal <= 0){
//			$(this).find("td:eq(1) > span").text("이용 불가");
//			$(this).find("td:eq(1) > span").removeClass();
//			$(this).find("td:eq(2)").html("");
//			$(this).find("td:eq(3)").html("");
//		}
//	});

	
	//이전에 검색했던 값으로 검색폼 영역에 check/selected 셋팅해주기
	$("input[name='searchCondition']").each(function(){
		if($(this).val() != null){
			var value = $(this).val();
			var id = $(this).attr("id").split("_")[1];			
			$("input[name='"+id+"'][value='"+value+"']").prop("checked",true);
			if(id == "dpm" || id == "carName" || id == "carCompId" || id == "priceStd" || id == "priceSearch" || id == "fuelKd" || id == "brTo"){
				$("select[name='"+id+"'] > option[value='"+value+"']").prop("selected",true);
			}
		}		
	});
	
	//검색폼 값 변경 시 submit하기 
	$('.search-table input, .filter-condition > select').change(function(){
		var selectedCarNameVal = $("select[name='carName']").find("option:selected").val();
		$("select[name='carName']").find("option:selected").val(encodeURIComponent(selectedCarNameVal));
		$('#searchForm').submit();
	});
	
	//재렌트,월렌트 가격 th 클릭 시 소팅하기
	$(".price-sort").click(function(){
		$(this).find("span[name='sorting-arrow']").toggle();
	});
	
	//최초 로딩했을 때 쿠키에 정보 있는 지 보고 있으면 넣어준다 
	$('.compare-box').each(function(){
		var boxId = $(this).attr("id");
		if($.cookie(boxId) != null){
			
			var type = $.cookie(boxId).split(",")[0];
			var carName = $.cookie(boxId).split(",")[1];
			var carGubun = $.cookie(boxId).split(",")[2];
			var param = $.cookie(boxId).split(",")[3]; //디테일조회를 위한 파라미터값을 param 형태로 받는다
			var url = $.cookie(boxId).split(",")[4];
			//var paramMethod = $.cookie(boxId).split(",")[5];
			
			$(this).addClass('fill');
			$(this).append("<div class='compare-title'>\
						   		<a href='javascript:;' onclick='javascript:clearWindow(this);'>\
						   			<img class='windowCloseBtn' src='/resources/images/window_close_btn.png' style='display:block;'/>\
						   		</a>\
						   		<form name='compareFrm' action='"+url+"' method='post'></form>\
						   		<p param='"+param+"'>["+type+"]<br/>"+carName+"&nbsp;"+carGubun+"\
						   		</p>\
						   </div>");
		}
	});
	
	insertFillCnt();
	
	//행에 hover 시 비교견적 버튼 등장
	$('.rent-list tr').hover(function(e) {
		//제목이 있는 tr 라인이면 해당 액션을 실행하지 않는다
		if($(this).has('th').length || $('#month-list').length > 0){
			return false;
		}else{
			var offset = $(this).offset();
			var top = offset.top + 5;
			var right = $(window).width() - (offset.left + $(this).outerWidth()); //오른쪽 위치 구하기
			
			$('.compare-action-btn').css("display","block");
			$('.compare-action-btn').css("top",top);
			$('.compare-action-btn').css("right",right-85);
			
			var thCount = $('thead tr').length-1; //th갯수를 빼고 tr 인덱스를 구한다
			$('.compare-action-btn').attr("id",$('.rent-list tr').index(this)-thCount); //비교견적 아이콘 id에 tr의 index를 담는다.
		}
	});
	
	//비교견적 아이콘 클릭 시 비교견적 창에 해당 정보를 담음
	$('.compare-action-btn').click(function(){
		var index = $('.compare-action-btn').attr("id");
		var row = $(".rent-list tr:nth-child("+index+")");
		
		//cookie data
		var title = "";
		var carGubun = "";
		var type = $('#typeForCookie').val(); 
		var param = row.find("td:first-child").attr("param");
		var url = $('#urlForCookie').val();
		var paramMethod = "";
		
		//detail로 넘어가게 하기 위한 파라미터
		var paramString = ""; 
		if($('#secondhand-list').length <= 0){ //신차면
			title = row.find("td:first-child").text();
			carGubun = row.find("td:eq(1)").text();
			paramMethod = "openDetail_NEW";
			paramString = "'"+param.split(":")[0] + "','" + param.split(":")[1] + "'";
			
		}else{ //재렌트면
			title = row.find("td:nth-child(2)").html();
			param = row.find("td:nth-child(2)").attr("param");
			paramMethod="openDetail_SH";
			paramString = "'"+param.split(":")[0] + "','" + param.split(":")[1] + "','" + param.split(":")[2] +"'";  
		}
		
		//비교견적창이 이미 열려있으면 다시 열지 않기
		if(!$('.compare-window').hasClass('open')){
			toggleCompareWindow();
		}
		
		var count = $('.fill').length;
		if(count == 4){
			alert("비교 견적은 최대 4대까지만 가능합니다.\n다른 차량을 삭제하신 후 다시 넣어주세요.");
		}
		
		$('.compare-box').each(function(index){
			
			if(!$(this).hasClass('fill')){
				
				$(this).addClass('fill');
				$(this).append("<div class='compare-title'>\
							   		<a href='javascript:;' onclick='javascript:clearWindow(this);'>\
							   			<img class='windowCloseBtn' src='/resources/images/window_close_btn.png'/>\
							   		</a>\
							   		<form name='compareFrm' action='"+url+"' method='post'></form>\
							   		<p param='"+param+"'>["+type+"]<br/>"+title+"&nbsp;"+carGubun+"\
							   		</p>\
							   	</div>");
				//쿠키에 저장
				storeCompareInfoToCookie($(this).attr("id"),type,title,carGubun,param,url);
				return false;
			}
			
		});
		insertFillCnt();
	});
	
	
	//테이블헤더 임시소스
	/**
	 * Override jQuery.fn.init to guard against XSS attacks.
	 *
	 * See http://bugs.jquery.com/ticket/9521
	 */
	(function () {
	  var jquery_init = jQuery.fn.init;
	  jQuery.fn.init = function (selector, context, rootjQuery) {
	    // If the string contains a "#" before a "<", treat it as invalid HTML.
	    if (selector && typeof selector === 'string') {
	      var hash_position = selector.indexOf('#');
	      if (hash_position >= 0) {
	        var bracket_position = selector.indexOf('<');
	        if (bracket_position > hash_position) {
	          throw 'Syntax error, unrecognized expression: ' + selector;
	        }
	      }
	    }
	    return jquery_init.call(this, selector, context, rootjQuery);
	  };
	  jQuery.fn.init.prototype = jquery_init.prototype;
	})();

	var Drupal = Drupal || { 'settings': {}, 'behaviors': {}, 'themes': {}, 'locale': {} };

	/**
	 * Set the variable that indicates if JavaScript behaviors should be applied
	 */
	Drupal.jsEnabled = document.getElementsByTagName && document.createElement && document.createTextNode && document.documentElement && document.getElementById;

	/**
	 * Attach all registered behaviors to a page element.
	 *
	 * Behaviors are event-triggered actions that attach to page elements, enhancing
	 * default non-Javascript UIs. Behaviors are registered in the Drupal.behaviors
	 * object as follows:
	 * @code
	 *    Drupal.behaviors.behaviorName = function () {
	 *      ...
	 *    };
	 * @endcode
	 *
	 * Drupal.attachBehaviors is added below to the jQuery ready event and so
	 * runs on initial page load. Developers implementing AHAH/AJAX in their
	 * solutions should also call this function after new page content has been
	 * loaded, feeding in an element to be processed, in order to attach all
	 * behaviors to the new content.
	 *
	 * Behaviors should use a class in the form behaviorName-processed to ensure
	 * the behavior is attached only once to a given element. (Doing so enables
	 * the reprocessing of given elements, which may be needed on occasion despite
	 * the ability to limit behavior attachment to a particular element.)
	 *
	 * @param context
	 *   An element to attach behaviors to. If none is given, the document element
	 *   is used.
	 */
	Drupal.attachBehaviors = function(context) {
	  context = context || document;
	  if (Drupal.jsEnabled) {
	    // Execute all of them.
	    jQuery.each(Drupal.behaviors, function() {
	      this(context);
	    });
	  }
	};

	/**
	 * Encode special characters in a plain-text string for display as HTML.
	 */
	Drupal.checkPlain = function(str) {
	  str = String(str);
	  var replace = { '&': '&amp;', '"': '&quot;', '<': '&lt;', '>': '&gt;' };
	  for (var character in replace) {
	    var regex = new RegExp(character, 'g');
	    str = str.replace(regex, replace[character]);
	  }
	  return str;
	};

	/**
	 * Translate strings to the page language or a given language.
	 *
	 * See the documentation of the server-side t() function for further details.
	 *
	 * @param str
	 *   A string containing the English string to translate.
	 * @param args
	 *   An object of replacements pairs to make after translation. Incidences
	 *   of any key in this array are replaced with the corresponding value.
	 *   Based on the first character of the key, the value is escaped and/or themed:
	 *    - !variable: inserted as is
	 *    - @variable: escape plain text to HTML (Drupal.checkPlain)
	 *    - %variable: escape text and theme as a placeholder for user-submitted
	 *      content (checkPlain + Drupal.theme('placeholder'))
	 * @return
	 *   The translated string.
	 */
	Drupal.t = function(str, args) {
	  // Fetch the localized version of the string.
	  if (Drupal.locale.strings && Drupal.locale.strings[str]) {
	    str = Drupal.locale.strings[str];
	  }

	  if (args) {
	    // Transform arguments before inserting them
	    for (var key in args) {
	      switch (key.charAt(0)) {
	        // Escaped only
	        case '@':
	          args[key] = Drupal.checkPlain(args[key]);
	        break;
	        // Pass-through
	        case '!':
	          break;
	        // Escaped and placeholder
	        case '%':
	        default:
	          args[key] = Drupal.theme('placeholder', args[key]);
	          break;
	      }
	      str = str.replace(key, args[key]);
	    }
	  }
	  return str;
	};

	/**
	 * Format a string containing a count of items.
	 *
	 * This function ensures that the string is pluralized correctly. Since Drupal.t() is
	 * called by this function, make sure not to pass already-localized strings to it.
	 *
	 * See the documentation of the server-side format_plural() function for further details.
	 *
	 * @param count
	 *   The item count to display.
	 * @param singular
	 *   The string for the singular case. Please make sure it is clear this is
	 *   singular, to ease translation (e.g. use "1 new comment" instead of "1 new").
	 *   Do not use @count in the singular string.
	 * @param plural
	 *   The string for the plural case. Please make sure it is clear this is plural,
	 *   to ease translation. Use @count in place of the item count, as in "@count
	 *   new comments".
	 * @param args
	 *   An object of replacements pairs to make after translation. Incidences
	 *   of any key in this array are replaced with the corresponding value.
	 *   Based on the first character of the key, the value is escaped and/or themed:
	 *    - !variable: inserted as is
	 *    - @variable: escape plain text to HTML (Drupal.checkPlain)
	 *    - %variable: escape text and theme as a placeholder for user-submitted
	 *      content (checkPlain + Drupal.theme('placeholder'))
	 *   Note that you do not need to include @count in this array.
	 *   This replacement is done automatically for the plural case.
	 * @return
	 *   A translated string.
	 */
	Drupal.formatPlural = function(count, singular, plural, args) {
	  var args = args || {};
	  args['@count'] = count;
	  // Determine the index of the plural form.
	  var index = Drupal.locale.pluralFormula ? Drupal.locale.pluralFormula(args['@count']) : ((args['@count'] == 1) ? 0 : 1);

	  if (index == 0) {
	    return Drupal.t(singular, args);
	  }
	  else if (index == 1) {
	    return Drupal.t(plural, args);
	  }
	  else {
	    args['@count['+ index +']'] = args['@count'];
	    delete args['@count'];
	    return Drupal.t(plural.replace('@count', '@count['+ index +']'), args);
	  }
	};

	/**
	 * Generate the themed representation of a Drupal object.
	 *
	 * All requests for themed output must go through this function. It examines
	 * the request and routes it to the appropriate theme function. If the current
	 * theme does not provide an override function, the generic theme function is
	 * called.
	 *
	 * For example, to retrieve the HTML that is output by theme_placeholder(text),
	 * call Drupal.theme('placeholder', text).
	 *
	 * @param func
	 *   The name of the theme function to call.
	 * @param ...
	 *   Additional arguments to pass along to the theme function.
	 * @return
	 *   Any data the theme function returns. This could be a plain HTML string,
	 *   but also a complex object.
	 */
	Drupal.theme = function(func) {
	  for (var i = 1, args = []; i < arguments.length; i++) {
	    args.push(arguments[i]);
	  }

	  return (Drupal.theme[func] || Drupal.theme.prototype[func]).apply(this, args);
	};

	/**
	 * Parse a JSON response.
	 *
	 * The result is either the JSON object, or an object with 'status' 0 and 'data' an error message.
	 */
	Drupal.parseJson = function (data) {
	  if ((data.substring(0, 1) != '{') && (data.substring(0, 1) != '[')) {
	    return { status: 0, data: data.length ? data : Drupal.t('Unspecified error') };
	  }
	  return eval('(' + data + ');');
	};

	/**
	 * Freeze the current body height (as minimum height). Used to prevent
	 * unnecessary upwards scrolling when doing DOM manipulations.
	 */
	Drupal.freezeHeight = function () {
	  Drupal.unfreezeHeight();
	  var div = document.createElement('div');
	  $(div).css({
	    position: 'absolute',
	    top: '0px',
	    left: '0px',
	    width: '1px',
	    height: $('body').css('height')
	  }).attr('id', 'freeze-height');
	  $('body').append(div);
	};

	/**
	 * Unfreeze the body height
	 */
	Drupal.unfreezeHeight = function () {
	  $('#freeze-height').remove();
	};

	/**
	 * Wrapper around encodeURIComponent() which avoids Apache quirks (equivalent of
	 * drupal_urlencode() in PHP). This function should only be used on paths, not
	 * on query string arguments.
	 */
	Drupal.encodeURIComponent = function (item, uri) {
	  uri = uri || location.href;
	  item = encodeURIComponent(item).replace(/%2F/g, '/');
	  return (uri.indexOf('?q=') != -1) ? item : item.replace(/%26/g, '%2526').replace(/%23/g, '%2523').replace(/\/\//g, '/%252F');
	};

	/**
	 * Get the text selection in a textarea.
	 */
	Drupal.getSelection = function (element) {
	  if (typeof(element.selectionStart) != 'number' && document.selection) {
	    // The current selection
	    var range1 = document.selection.createRange();
	    var range2 = range1.duplicate();
	    // Select all text.
	    range2.moveToElementText(element);
	    // Now move 'dummy' end point to end point of original range.
	    range2.setEndPoint('EndToEnd', range1);
	    // Now we can calculate start and end points.
	    var start = range2.text.length - range1.text.length;
	    var end = start + range1.text.length;
	    return { 'start': start, 'end': end };
	  }
	  return { 'start': element.selectionStart, 'end': element.selectionEnd };
	};

	/**
	 * Build an error message from ahah response.
	 */
	Drupal.ahahError = function(xmlhttp, uri) {
	  if (xmlhttp.status == 200) {
	    if (jQuery.trim($(xmlhttp.responseText).text())) {
	      var message = Drupal.t("An error occurred. \n@uri\n@text", {'@uri': uri, '@text': xmlhttp.responseText });
	    }
	    else {
	      var message = Drupal.t("An error occurred. \n@uri\n(no information available).", {'@uri': uri, '@text': xmlhttp.responseText });
	    }
	  }
	  else {
	    var message = Drupal.t("An HTTP error @status occurred. \n@uri", {'@uri': uri, '@status': xmlhttp.status });
	  }
	  return message;
	}

	// Global Killswitch on the <html> element
	if (Drupal.jsEnabled) {
	  // Global Killswitch on the <html> element
	  $(document.documentElement).addClass('js');
	  // 'js enabled' cookie
	  document.cookie = 'has_js=1; path=/';
	  // Attach all behaviors.
	  $(document).ready(function() {
	    Drupal.attachBehaviors(this);
	  });
	}

	/**
	 * The default themes.
	 */
	Drupal.theme.prototype = {

	  /**
	   * Formats text for emphasized display in a placeholder inside a sentence.
	   *
	   * @param str
	   *   The text to format (plain-text).
	   * @return
	   *   The formatted text (html).
	   */
	  placeholder: function(str) {
	    return '<em>' + Drupal.checkPlain(str) + '</em>';
	  }
	};
	;
	Drupal.locale = { 'pluralFormula': function($n) { return Number(($n!=1)); }, 'strings': { "Select all rows in this table": " ", "Deselect all rows in this table": " ", "Drag to re-order": " ", "Changes made in this table will not be saved until the form is submitted.": " ", "Split summary at cursor": " ", "Join summary": " " } };;

	Drupal.tableHeaderDoScroll = function() {
	  if (typeof(Drupal.tableHeaderOnScroll)=='function') {
	    Drupal.tableHeaderOnScroll();
	  }
	};

	Drupal.behaviors.tableHeader = function (context) {


	  // Keep track of all cloned table headers.
	  var headers = [];

	  $('table.sticky-enabled thead:not(.tableHeader-processed)', context).each(function () {
	    // Clone thead so it inherits original jQuery properties.
	    var headerClone = $(this).clone(true).insertBefore(this.parentNode).wrap('<table class="sticky-header rent-list"></table>').parent().css({
	      position: 'fixed',
	      top: '0px'
	    });

	    headerClone = $(headerClone)[0];
	    headers.push(headerClone);

	    // Store parent table.
	    var table = $(this).parent('table')[0];
	    headerClone.table = table;
	    // Finish initialzing header positioning.
	    tracker(headerClone);

	    $(table).addClass('sticky-table');
	    $(this).addClass('tableHeader-processed');
	  });

	  // Define the anchor holding var.
	  var prevAnchor = '';

	  // Track positioning and visibility.
	  function tracker(e) {
	    // Save positioning data.
	    var viewHeight = document.documentElement.scrollHeight || document.body.scrollHeight;
	    if (e.viewHeight != viewHeight) {
	      e.viewHeight = viewHeight;
	      e.vPosition = $(e.table).offset().top - 4;
	      e.hPosition = $(e.table).offset().left;
	      e.vLength = e.table.clientHeight - 100;
	      // Resize header and its cell widths.
	      var parentCell = $('th', e.table);
	      $('th', e).each(function(index) {
	        var cellWidth = parentCell.eq(index).css('width');
	        // Exception for IE7.
	        if (cellWidth == 'auto') {
	          cellWidth = parentCell.get(index).clientWidth +'px';
	        }
	        $(this).css('width', cellWidth);
	      });
	      $(e).css('width', $(e.table).css('width'));
	    }

	    // Track horizontal positioning relative to the viewport and set visibility.
	    var hScroll = document.documentElement.scrollLeft || document.body.scrollLeft;
	    var vOffset = (document.documentElement.scrollTop || document.body.scrollTop) - e.vPosition;
	    var visState = (vOffset > 0 && vOffset < e.vLength) ? 'visible' : 'hidden';
	    $(e).css({left: -hScroll + e.hPosition +'px', visibility: visState});

	    // Check the previous anchor to see if we need to scroll to make room for the header.
	    // Get the height of the header table and scroll up that amount.
	    if (prevAnchor != location.hash) {
	      if (location.hash != '') {
	        var offset = $(document).find('td' + location.hash).offset();
	        if (offset) {
	          var top = offset.top;
	          var scrollLocation = top - $(e).height();
	          $('body, html').scrollTop(scrollLocation);
	        }
	      }
	      prevAnchor = location.hash;
	    }
	  }

	  // Only attach to scrollbars once, even if Drupal.attachBehaviors is called
	  //  multiple times.
	  if (!$('body').hasClass('tableHeader-processed')) {
	    $('body').addClass('tableHeader-processed');
	    $(window).scroll(Drupal.tableHeaderDoScroll);
	    $(document.documentElement).scroll(Drupal.tableHeaderDoScroll);
	  }

	  // Track scrolling.
	  Drupal.tableHeaderOnScroll = function() {
	    $(headers).each(function () {
	      tracker(this);
	    });
	  };

	  // Track resizing.
	  var time = null;
	  var resize = function () {
	    // Ensure minimum time between adjustments.
	    if (time) {
	      return;
	    }
	    time = setTimeout(function () {
	      $('table.sticky-header').each(function () {
	        // Force cell width calculation.
	        this.viewHeight = 0;
	        tracker(this);
	      });
	      // Reset timer
	      time = null;
	    }, 250);
	  };
	  $(window).resize(resize);
	};
	;

	Drupal.behaviors.openid = function (context) {
	  var $loginElements = $("#edit-name-wrapper, #edit-pass-wrapper, li.openid-link");
	  var $openidElements = $("#edit-openid-identifier-wrapper, li.user-link");

	  // This behavior attaches by ID, so is only valid once on a page.
	  if (!$("#edit-openid-identifier.openid-processed").size() && $("#edit-openid-identifier").val()) {
	    $("#edit-openid-identifier").addClass('openid-processed');
	    $loginElements.hide();
	    // Use .css("display", "block") instead of .show() to be Konqueror friendly.
	    $openidElements.css("display", "block");
	  }
	  $("li.openid-link:not(.openid-processed)", context)
	    .addClass('openid-processed')
	    .click( function() {
	       $loginElements.hide();
	       $openidElements.css("display", "block");
	      // Remove possible error message.
	      $("#edit-name, #edit-pass").removeClass("error");
	      $("div.messages.error").hide();
	      // Set focus on OpenID Identifier field.
	      $("#edit-openid-identifier")[0].focus();
	      return false;
	    });
	  $("li.user-link:not(.openid-processed)", context)
	    .addClass('openid-processed')
	    .click(function() {
	       $openidElements.hide();
	       $loginElements.css("display", "block");
	      // Clear OpenID Identifier field and remove possible error message.
	      $("#edit-openid-identifier").val('').removeClass("error");
	      $("div.messages.error").css("display", "block");
	      // Set focus on username field.
	      $("#edit-name")[0].focus();
	      return false;
	    });
	};
	;

})



