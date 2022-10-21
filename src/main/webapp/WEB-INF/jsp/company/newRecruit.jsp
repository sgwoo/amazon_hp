<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:genericpage>
<script src="/resources/js/tab-common.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%-- <link href="<c:url value="/resources/stylesheets/bootstrap.min.css" />" rel="stylesheet"> --%>
<link href="<c:url value="/resources/stylesheets/bootstrap-datepicker.min.css" />" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css" rel="stylesheet"  type='text/css'>
<%-- <link href="<c:url value="/resources/stylesheets/bootstrap.css" />" rel="stylesheet"> --%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<style>
table {
    width: 100%; height: 100%; margin-left: auto; margin-right: auto;
  }
table, tr,th, td {
 	border: 1px solid #ddd; margin-left: auto; margin-right: auto;
  }
th, td{padding:15px 20px; line-height: 22px;}
th{text-align: center; background-color: #eee; }
.th {
    background-color: #0d47a1; color: #ffffff;
  }
h3{
  	padding-top: 10px; padding-bottom:10px; font-weight: bold; font-size: 20px; margin-bottom: 0px;
  }

</style>
<script type="text/javascript">
$(document).ready(function(){

	
});

function onChangeArrowDirection(tag){
	var collapseArrow = tag.querySelector('.collapseArrow');
	collapseArrow.classList.toggle('fa-angle-down');
	collapseArrow.classList.toggle('fa-angle-up');
}
</script>    

<body onload="javascript:pop()">
	<!-- 채용공고 팝업시 index.jsp 1483번째줄 주석제거  -->
	<h2 class="primary">채용공고</h2>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#comInfo" aria-controls="profile" role="tab" data-toggle="tab">회사개요</a></li>
	   	<li role="presentation"><a href="#apply" aria-controls="messages" role="tab" data-toggle="tab">채용공고</a></li>
<!-- 	   	<li role="presentation"><a href="#recruitment" aria-controls="recruitment" role="tab" data-toggle="tab">직무내용</a></li> -->
<!-- 	   	<li role="presentation"><a href="#qualification " aria-controls="qualification " role="tab" data-toggle="tab">지원자격/근무조건</a></li> -->
<!-- 	   	<li role="presentation"><a href="#benefit" aria-controls="benefit" role="tab" data-toggle="tab">복리후생</a></li> -->
	</ul>  
  
	<!-- Tab panes -->
	<div class="tab-content">
	    <!-- 기업정보 -->
	    <div role="tabpanel" class="tab-pane active" id="comInfo" style="margin:0 auto;">
			<h3 class="company-title">■ 회사개요(${comInfo.RC_CUR_DT}년 12월 31일 현재 기준)</h3>
			<table class="rent-list tablesorter sticky-enabled main-list">
				<colgroup>
					<col width="20%"/>
					<col width="40%"/>
					<col width="40%" />
				</colgroup>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">설립일자</th> 
					<td headers="">2000년04월19일</td> 
					<td headers=""></td> 
				</tr>		
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">업종</th> 
					<td headers="">자동차대여업, 자동차임대업</td> 
					<td headers=""></td> 
				</tr>	
				<tr class="rent-list-sub-head rent-list-title">	
					<th scope="row" id="" class="table-light">자본총계</th> 
					<td headers=""><fmt:formatNumber value="${comInfo.RC_TOT_CAPITAL}" pattern="#,###"/>억원</td> 
					<td headers=""></td> 
				</tr>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">자산총계</th> 
					<td headers=""><fmt:formatNumber value="${comInfo.RC_TOT_ASSET}" pattern="#,###"/>억원</td> 
					<td headers=""></td> 
				</tr>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">매출액</th> 
					<td headers=""><fmt:formatNumber value="${comInfo.RC_SALES}" pattern="#,###"/>억원</td> 
					<td headers="">${comInfo.RC_CUR_DT}년 매출총액</td> 
				</tr>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">재직자현황</th> 
					<td headers="">${comInfo.RC_PER_OFF}명</td> 
					<td headers="">10년이상 근속자( ${comInfo.RC_PER_OFF_PER}% )</td> 
				</tr>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">주소/연락처</th> 
					<td colspan='2'>서울시 영등포구 의사당대로 8, 802(여의도동,태흥빌딩) / 02-757-0802</td> 
				</tr>
			</table>
			<br>
			<h3 class="company-title">■ 업계현황(${comInfo.RC_CUR_DT}년 12월 31일 현재 기준)</h3>
			<table class="rent-list tablesorter sticky-enabled main-list">
				<colgroup>
					<col width="20%"/>
					<col width="40%"/>
					<col width="40%" />
				</colgroup>
	
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">전국업체수</th> 
					<td headers="">
					<fmt:formatNumber value="${comInfo.RC_NUM_COM}" pattern="#,###"/>개사
					</td>
					<td headers="">자동차대여사업조합<br>등록회원 기준</td> 
				</tr>		
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" id="" class="table-light">업계순위</th> 
					<td headers="">${comInfo.RC_BUSI_RANK}위</td> 
					<td headers="">전업사/보유대수기준</td> 
				</tr>	
			</table>
	    </div>
	    
	    <!--  모집 요강 -->
	    <div role="tabpanel" class="tab-pane " id="recruitment" style="margin:0 auto;">
	    	
<!-- 	    	<h3 class="company-title">■ 모집요강</h3> -->
			<%-- <table class="rent-list tablesorter sticky-enabled main-list">
				<colgroup>
					<col width="10%"/>
					<col width="18%"/>
					<col width="18%"/>
					<col width="18%"/>
					<col width="18%"/>
					<col width="18%"/>
				</colgroup>
				<tr class="rent-list-sub-head rent-list-title">
					<th rowspan="6" class="table-light">근무<br>예정지</th>
				</tr>
				<tr>
					<th scope="row" id="" class="table-light">지점</th> 
					<td headers="">강서지점</td> 
					<td headers="">부산지점</td> 
					<td headers="">대구지점</td> 
					<td headers="">광주지점</td> 
				</tr>
				<tr>
					<th scope="row" id="" class="table-light">모집직종</th> 
					<td colspan="4" headers="">외근직(고객지원팀)</td> 	
				</tr>
				<tr>
					<th scope="row" id="" class="table-light">채용인원</th> 
					<td colspan="4" headers="">1명</td> 
				</tr>
				<tr>
					<th scope="row" id="" class="table-light">주소</th> 
					<td colspan="4" headers="">서울시 강서구</td> 
				</tr>
				<tr>
					<th scope="row" id="" class="table-light">연락처</th> 
					<td colspan="4" headers="">02-2636-9920</td>	
				</tr>	
			</table> --%>
<!-- 			<br> -->

			<h3 class="company-title">■ 직무내용</h3>
			<c:forEach var='list' items="${recruitmentList}">
				<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					<tr class="rent-list-sub-head rent-list-title">
						<th class="table-light">직종</th> 
						<td>${list.RC_JOB}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th class="table-light">직무내용</th> 
						<td>${list.RC_JOB_CONT}</td> 
					</tr>
				</table>
			</c:forEach>
	    
	    </div>	    
	    
	    <!-- 지원자격 및 근무조건 -->
	    <div role="tabpanel" class="tab-pane" id="qualification" style="margin:0 auto;">
			<h3 class="company-title">■ 지원자격 및 근무조건</h3>
			<c:forEach var='list' items="${qualificationList}">
				<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">학력조건</th> 
						<td headers="">${list.RC_EDU}</td>  
					</tr>		
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">고용형태</th> 
						<td headers="">${list.RC_QF_VAR1}</td>
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">경력조건</th> 
						<td headers="">${list.RC_QF_VAR2}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">임금</th> 
						<td headers="">${list.RC_QF_VAR3}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">초임연봉</th> 
						<td headers="">${list.RC_QF_VAR4}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">근무형태</th> 
						<td headers="">${list.RC_QF_VAR5}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">근로시간</th> 
						<td headers="">${list.RC_QF_VAR6}</td>
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">근무시간</th> 
						<td headers="">${list.RC_QF_VAR7}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">사회보험</th> 
						<td headers="">${list.RC_QF_VAR8}</td> 
					</tr>
					<tr class="rent-list-sub-head rent-list-title">
						<th scope="row" id="" class="table-light">퇴직급여</th> 
						<td headers="">${list.RC_QF_VAR9}</td> 
					</tr>
				</table>
			</c:forEach>
	    </div>
	    
	   	<!-- 복리후생 -->
	    <div role="tabpanel" class="tab-pane" id="benefit" style="margin:0 auto;">
	    	<h3 class="company-title">■ 복리후생</h3>
	    	<c:forEach var='list' items="${benefitList}">
			<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
				<tr class="rent-list-sub-head rent-list-title">
					<th scope="row" class="table-light">${list.RC_NO}</th> 
					<td>
						${list.RC_BENE_CONT}
						<c:if test="${list.RC_BENE_ST eq 'Y'}">
							<br> ※ 외근자 전용
						</c:if>
					</td> 
				</tr>
				
			</table>
			</c:forEach>
	    </div>
	    
	    <!-- 채용공고 -->
	    <div role="tabpanel" class="tab-pane" id="apply" style="margin:0 auto;">
	    	<h3 class="company-title">
				■ 채용공고
			</h3>
			
			<c:if test="${not empty recruitList}">
				<c:forEach var='list' items="${recruitList}" varStatus='status'>
					<div id="description_${status.index}" class="card shadow_cus mt-2" style='margin-bottom: 70px;'>
		           		<div id="descriptionHeader_${status.index}"  title="내용 보기"
		           			style='padding: 0.75rem 1.25rem; margin-bottom: 0; display: flex; justify-content: space-between; border: 1px solid #ddd; border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0; background-color: #eee;'
		           			onClick="javascript: onChangeArrowDirection(this);" data-toggle="collapse" data-target="#descriptionContents_${status.index}" aria-expanded="false" aria-controls="descriptionContents_${status.index}">
		            		<div	style='padding-top: 5px; font-size: 16px; width: 100%; display: flex; justify-content: space-between;'>
		            			<div style='margin-right: 10px; font-weight: bold;'>
		            				<span  style='margin-right: 10px; font-weight: bold;'>${list.IDX}.</span>
			            			<span style='margin-right: 10px; font-weight: bold;'>${list.RC_BRANCH} ${list.RC_NM} ${list.RC_HIRE_PER}명</span> 
		            			</div> 
		            			<div style='margin-right: 30px;'>
		            			<fmt:parseDate value = "${list.RC_APL_ED_DT}" pattern = "yyyyMMdd" var = "rc_apl_ed_dt"/>
		            			접수 마감일: <fmt:formatDate  value="${rc_apl_ed_dt}" pattern="yyyy-MM-dd" />
		            			</div> 
		            		</div>
		           			<i class="fa fa-angle-up collapseArrow" style='font-size: 20px; margin: auto; padding: 5px 0px;' title="내용 보기"></i>
		           		</div>
						<div id="descriptionContents_${status.index}" 
							style='padding: 0.75rem 1.25rem; border: 1px solid #ddd; border-top: none; border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0; margin: 0px;'
							class="row collapse" aria-labelledby="descriptionHeader_${status.index}" data-parent="#description_${status.index}">
							<div style='padding: 10px;'>
								<h5>■ 모집요강</h5>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 20px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" class="table-light">모집직종</th> 
										<td>${list.RC_NM}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" class="table-light">채용인원</th> 
										<td>${list.RC_HIRE_PER}명</td> 
									</tr>
								</table>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 20px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" class="table-light">직무내용</th> 
										<td>${list.RC_JOB_CONT}</td> 
									</tr>
								</table>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" class="table-light">복리후생비</th> 
										<td>${list.RC_BENE_CONT}</td> 
									</tr>
								</table>
								
								<h5>■ 지원자격/근무조건</h5>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">학력조건</th> 
										<td headers="">${list.EDU_NM}</td>  
									</tr>		
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">고용형태</th> 
										<td headers="">${list.RC_QF_VAR1}</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">경력조건</th> 
										<td headers="">${list.RC_QF_VAR2}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">임금</th> 
										<td headers="">${list.RC_QF_VAR3}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">초임연봉</th> 
										<td headers="">${list.RC_QF_VAR4}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">근무형태</th> 
										<td headers="">${list.RC_QF_VAR5}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">근로시간</th> 
										<td headers="">${list.RC_QF_VAR6}</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">근무시간</th> 
										<td headers="">${list.RC_QF_VAR7}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">사회보험</th> 
										<td headers="">${list.RC_QF_VAR8}</td> 
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">퇴직급여</th> 
										<td headers="">${list.RC_QF_VAR9}</td> 
									</tr>
								</table>
								
								<h5>■ 근무예정지</h5>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">지점</th> 
										<td headers="">${list.RC_BRANCH}</td>  
									</tr>		
									<c:if test="${list.RC_BRANCH ne '수도권'}">
										<tr class="rent-list-sub-head rent-list-title">
											<th scope="row" id="" class="table-light">주소</th> 
											<td headers="">${list.BR_ADDR}</td>
										</tr>
										<tr class="rent-list-sub-head rent-list-title">
											<th scope="row" id="" class="table-light">연락처</th> 
											<td headers="">${list.TEL}</td>
										</tr>
									</c:if>
								</table>
								
								<h5>■ 전형방법</h5>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">접수마감일</th> 
										<td headers="">
										<fmt:parseDate value = "${list.RC_APL_ED_DT}" pattern = "yyyyMMdd" var = "rc_apl_ed_dt"/>
										<fmt:formatDate  value="${rc_apl_ed_dt}" pattern="yyyy-MM-dd" />
										</td>  
									</tr>		
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">합격자발표</th> 
										<td headers="">
										<c:if test="${not empty list.RC_PASS_DT}">
											<fmt:parseDate value = "${list.RC_PASS_DT}" pattern = "yyyyMMdd" var = "rc_pass_dt"/>
											<fmt:formatDate  value="${rc_pass_dt}" pattern="yyyy-MM-dd" />
										</c:if>
										</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">전형방법</th> 
										<td headers="">${list.RC_APL_MAT}</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">접수방법</th> 
										<td headers="">E-Mail (현장 및 우편접수 안됨)</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">접수처</th> 
										<td headers="">recruit@amazoncar.co.kr</td>
									</tr>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">제출서류</th> 
										<td headers="">이력서, 자기소개서, 졸업증명서, 기타(본인에게 유리한 모든 서류)</td>
									</tr>
								</table>
								
								<h5>■ 채용담당자</h5>
								<table class="rent-list tablesorter sticky-enabled main-list" style='margin-bottom: 30px;'>
									<colgroup>
										<col width="20%"/>
										<col width="80%"/>
									</colgroup>
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">담당자</th> 
										<td headers="">${list.RC_MANAGER}</td>  
									</tr>		
									<tr class="rent-list-sub-head rent-list-title">
										<th scope="row" id="" class="table-light">연락처</th> 
										<td headers="">${list.RC_TEL}</td>
									</tr>
								</table>
								
	           				</div>
						</div>
					</div>
		    	</c:forEach>
	    	</c:if>
	    	<c:if test="${empty recruitList}">
	    		<div style='font-size: 16px; font-weight: bold; text-align: center; margin: 120px 0px;'>
	    			진행 중인 채용이 없습니다.
	    		</div>
	    	</c:if>
	    </div>
   </div>
	
</body>   
</t:genericpage>