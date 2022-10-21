<%@ page import="java.text.DecimalFormat" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType = "text/html;charset=UTF-8" %>
<t:genericpage>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="/webjars/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="/resources/stylesheets/mypage.css"/>
<%--<link rel="stylesheet" href="/resources/stylesheets/rent.css"/>--%>
<style type="text/css">
	.pagingDiv a {
		text-decoration: none;
				}
	.glyphicon {
		  position: relative;
		  top: 1px;
		  display: inline-block;
		  font-family: 'Glyphicons Halflings';
		  font-style: normal;
		  font-weight: normal;
		  line-height: 1;
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
	}			
				
</style>
<script>
$(document).ready(function(){
    /* $('.mypage-list-row-selectable').bind('click', function() {
        // TODO agreeDist, ecarFlag 도 추가해주자
        //기존것VV
        //var url = "/smart/print?estimateId=" + $(this).attr('id');        
        var url = "/smart/print?estimateId=" + $(this).attr('id');        
        window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");
    }); */
    
    //검색정보 세팅
    var searchTextInfo = $("#searchTextInfo").val();
    var estiTypeInfo = $("#estiTypeInfo").val();
    var estiStatInfo = $("#estiStatInfo").val();
  
    if(searchTextInfo != ""){
	    $("#sch_searchText").val(searchTextInfo);    	
    }
    if(estiTypeInfo != ""){    	
    	$("#sch_esti_type option[value='"+estiTypeInfo+"']").prop("selected", true);
    }
    if(estiStatInfo != ""){    	
    	$("#sch_esti_stat option[value='"+estiStatInfo+"']").prop("selected", true);
    }
    
    $(".viewEstiRM").on("click", function(){
    	var url = "/smart/print?estimateId=" + $(this).closest("tr").attr('id');    	
        window.open(url,"printPopup","width=1010,height=800,top=0,left=100,scrollbars=yes");
    });
    
    //월렌트 예약 취소
    $("#cancel_btn").on("click", function(){
    	var strValue = $(this).val();    	
    	var str = strValue.split("//");    	
    	var data= {};
    	data["car_mng_id"] = str[0];
    	data["seq"] = str[1];    	
    	if(confirm("예약을 취소하시겠습니까?")==true){
	    	$.ajax({
	    		contentType:'application/json',
	    		dataType:'json',
	    		url:'/cancelReservation',
	    		type:'POST',
	    		data:JSON.stringify(data),
	    		success:function(response){	    			
	    			if(response==1){
	    				alert("예약취소 중 오류발생! 관리자에게 문의하세요.");
	    			}else{
	    				alert("예약이 취소되었습니다.");
	    				location.reload();
	    			}
	    		},
	    		error:function(request,status,error){
	    			alert("예약취소 중 오류발생! 관리자에게 문의하세요.");
	    			//alert(response.message);
	    		}
	    	}); 
    	}else{
    		return false;
    	}
    });
    
    //스마트 견적 사용안함 처리
    $("#esti_del_btn").on("click", function(){
    	var est_id = $(this).val();
    	var data= {};
    	data["est_id"] = est_id
    	if(confirm("견적을 삭제하시겠습니까?")==true){
	    	$.ajax({
	    		contentType:'application/json',
	    		dataType:'json',
	    		url:'/deleteMyEstimate',
	    		type:'POST',
	    		data:JSON.stringify(data),
	    		success:function(response){	    			
	    			if(response==1){
	    				alert("견적이 삭제되었습니다.");
	    				location.reload();
	    			}else{
	    				alert("견적삭제 중 오류발생! 관리자에게 문의하세요.");
	    			}
	    		},
	    		error:function(request,status,error){
	    			alert("견적삭제 중 오류발생! 관리자에게 문의하세요.");
	    		}
	    	}); 
    	}else{
    		return false;
    	}
    });
    
    $(".pagingDiv a").on("mouseover", function(){
    	$(this).css("color","green");    	
    });
    $(".pagingDiv a").on("mouseout", function(){
    	$(this).css("color","black");    	
    });
    
    // 선택 삭제
    $("#selected_est_del_btn").on("click", function(){
    	var delete_est_list = new Array();
    	$(".mypage-list tbody tr").map(function(){
    		var checked = $(this).find("input[type=checkbox]");
    		var checked_est = checked.is(":checked");
    		if(checked_est){
	    		var est_id = checked.val();
    			var checked_est_item = {
    				"est_id" : est_id
    			} 
    			delete_est_list.push(checked_est_item);
    		}
    	})
    	if(delete_est_list.length == 0) {
    		alert("선택된 견적이 없습니다. 견적을 체크 해주세요.");
    		return;
    	}
    	if(confirm("견적을 삭제하시겠습니까?")){
    		$.ajax({
    			url: "/deleteSelectedEstimate",
    			contentType: "application/json",
	    		dataType: "json",
	    		type: "POST",
	    		traditional: true,
	    		data: JSON.stringify(delete_est_list),
	    		success: function(response){
	    			if(response>0){
	    				alert("견적이 삭제되었습니다.");
	    				location.reload();
	    			}else{
	    				alert("견적삭제 중 오류발생! 관리자에게 문의하세요.");
	    			}
	    		},
	    		error: function(request, status, error){
	    			alert("견적삭제 중 오류발생! 관리자에게 문의하세요.");
	    		}
    		})
    	}
    })
    
    
})

</script>
<div class="amazon-detail">

	<div class="amazon-tab-container">
		<div class="amazon-tabs">
			<a href="/mypage/rent/list"><div class="amazon-tab active">견적/상담/예약 이력</div></a>
			<a href="/mypage/info"><div class="amazon-tab">회원정보 변경</div></a>
			<a href="/mypage/feedback/list"><div class="amazon-tab">불편합니다</div></a>
		</div>
	</div>
	<div class="amazon-tap-main">
		<div class="col-md-12" style="margin-bottom: 10px;">
			<input type="hidden" id="searchTextInfo" value="${searchText}">
			<input type="hidden" id="estiTypeInfo" value="${esti_type}">
			<input type="hidden" id="estiStatInfo" value="${esti_stat}">
			<form action="/mypage/rent/list" method="get">
				<div class="col-md-9">
					<span class="glyphicon glyphicon-chevron-down"></span>
					<span>차종/차명</span> &nbsp;
					<input type="text" name="searchText" id ="sch_searchText" value="" style="height: 30px; width: 150px;">
					&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-chevron-down"></span>				
					<span>견적구분</span> &nbsp;
					<select id="sch_esti_type" name="esti_type" style="height: 30px;">				
						<option value="">전체</option>
						<option value="신차">신차</option>
						<option value="월렌트">월렌트</option>
						<option value="재리스">재리스</option>													
					</select>
					&nbsp;&nbsp;&nbsp;
					
					<span class="glyphicon glyphicon-chevron-down"></span>
					<span>진행상태</span> &nbsp;
					<select id="sch_esti_stat" name="esti_stat" style="height: 30px;">
						<option value="">전체</option>
						<option value="견적">견적</option>
						<option value="상담요청">상담요청</option>
						<option value="예약">예약</option>
						<option value="계약">계약</option>				
					</select>
					&nbsp;&nbsp;&nbsp;
					
					<input type="submit" class="btn btn-success" value="검색" style="margin-bottom: 5px; ">
				</div>	
			</form>			
			<div class="col-md-1" >
				<button type="button" class="btn btn-warning" id="selected_est_del_btn" value="" >선택삭제</button>
			</div>
			<div class="col-md-2" align="right" style="margin-top: 15px;">
				<span style="">( 총 &nbsp; ${list_cnt} &nbsp;건 )</span>
			</div>
		</div>
		<table class="mypage-list">
			<colgroup>
				<col width="3%"/>
				<col width="10%"/>
				<col width="14%"/>
				<col width="5%"/>
				<col width="5%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="15%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="6%"/>
			</colgroup>
			<thead>
			<tr>
				<th><input type="checkbox" id ="check_all" name="check_all" ></th>
				<th>차종</th>
				<th>차명</th>
				<th>변속기</th>
				<th>연료</th>
				<th>견적구분</th>
				<th>요청일</th>
				<th>월대여료(VAT별도)</th>
				<th>담당지점</th>
				<th>담당자</th>
				<th>진행상태</th>
				<th>예약취소</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach var="data" items="${list}" varStatus="status">
						<c:if test="${data.FEE_S_AMT!=0 && data.FEE_S_AMT!=-1}">
							<tr class="mypage-list-row-selectable" id="${data.EST_ID}">
								<td>
									<c:if test="${data.ESTI_STAT == '견적' }">
										<input type="checkbox" id ="check_esti" name="check_esti" value="${data.EST_ID}">
									</c:if>
								</td>
								<td class="viewEstiRM">${data.CAR_NM}</td>
								<td class="viewEstiRM">${data.CAR_NAME}</td>
								<td class="viewEstiRM">${data.AUTO}</td>
								<td class="viewEstiRM">${data.FUEL}</td>
								<td class="viewEstiRM">
									${data.ESTI_TYPE}
									<input type="hidden" id="esti_type" value="${data.ESTI_TYPE}">
								</td>
								<td class="viewEstiRM">
									<fmt:parseDate var="dateStr" value="${data.RENT_DT}" pattern="yyyyMMdd"/>
									<fmt:formatDate value="${dateStr}" pattern="yyyy.MM.dd"/>
								</td>
								<td class="viewEstiRM">
									<fmt:formatNumber value="${data.FEE_S_AMT}" pattern="#,###"/>
								</td>
								<td class="viewEstiRM">${data.BR_NM}</td>
								<td class="viewEstiRM">${data.USER_NM}</td>
								<td>${data.ESTI_STAT}</td>
								<c:choose>
									<c:when test="${data.ESTI_STAT=='예약' && data.USER_NM==null && (data.USE_YN=='Y' || data.USE_YN==null)}">
										<td>
											<button type="button" class="btn btn-danger btn-sm" id="cancel_btn" value="${data.CAR_MNG_ID}//${data.SEQ}" >취소</button>										
										</td>
									</c:when>
									<c:when test="${data.ESTI_STAT=='견적' && data.USER_NM==null && data.USE_YN!='N' }">
										<td>
											<button type="button" class="btn btn-warning btn-sm" id="esti_del_btn" value="${data.EST_ID}" >삭제</button>										
										</td>
									</c:when>	
									<c:when test="${data.ESTI_STAT=='예약' && data.USE_YN=='N'}">
										<td class="viewEstiRM">취소</td>
									</c:when>
									<c:otherwise>
										<td class="viewEstiRM"></td>								
									</c:otherwise>
								</c:choose>														
							</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">견적/상담/예약 이력 내역이 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div align="right">※ 견적/상담/예약 이력은 최대 6개월까지만 보관됩니다.</div>
		<!-- S: PAGING -->
		<div class="pagingDiv" style="margin-top: 30px; font-size: 18px; font-weight:bold;" align="center" >
			${pageStr}
		</div>
		<!-- E: PAGING -->
	</div>
</div>
</t:genericpage>