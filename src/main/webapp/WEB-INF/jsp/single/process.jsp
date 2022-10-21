<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<div class="accordion-container">
	<h2 class="primary">이용 절차</h2>
	<div role="tabpanel">	
		<br/>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#long-process" aria-controls="long-process" role="tab" data-toggle="tab">장기렌트/리스</a></li>
			<li role="presentation"><a href="#secondhand-process" aria-controls="secondhand-process" role="tab" data-toggle="tab">재렌트/재리스</a></li>
			<li role="presentation"><a href="#month-process" aria-controls="month-process" role="tab" data-toggle="tab">월렌트</a></li>
		</ul>
		<br/><br/>
		<div class="tab-content">
			<!-- 장기렌트 -->
			<div role="tabpanel" class="tab-pane active" id="long-process">
				<div class="panel-group" id="long-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body1" aria-expanded="true" aria-controls="long-body1">
					        		STEP1.견적 확인 (월대여료 및 대여조건)
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head1">
							<div class="panel-body">
						 		<h5>주요차종 월대여료 리스트 보기</h5>
						 		<p class="desc-paragraph">
						 			- <span class="primary bold">홈페이지 > 장기렌트/리스 </span>의 차량리스트에서 원하는 차종을 클릭하신 후 견적서보기 또는 맞춤견적내기를 통해<br/>&nbsp;&nbsp;월대여료 및  대여조건을 확인하실 수 있으며 상담 요청이 가능합니다.<br/>
						 			- 상담요청시 아마존카 영업 담당 직원이 확인 후 최대한 빠른 시간내에 연락을 드립니다. 
						 		</p>
						 		<br/>
						 		<h5>실시간 견적내기</h5>
						 		<p class="desc-paragraph">
						 			- <span class="primary bold">홈페이지 > 실시간견적</span> 에서 고객님이 원하는 차종, 옵션, 조건으로 견적을 내시면, 바로 견적서 확인이 가능하며 상담요청을 하실 수 있습니다. <br/>
									- 상담요청시 아마존카 영업 담당 직원이 확인 후 최대한 빠른 시간내에 연락을 드립니다. 
						 		</p>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body2" aria-expanded="true" aria-controls="long-body2">
					        		STEP2.이용 상담
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head2">
							<div class="panel-body">
								<h5>상담 요청</h5>
						 		<p class="desc-paragraph">
						 			- STEP1의 견적확인 후 상담요청시 아마존카 영업 담당 직원이 빠른 시간내에 연락을 드립니다.
						 		</p>
						 		<h5>전화 상담</h5>
						 		<p class="desc-paragraph">
						 			- 가장 가까운 아마존카 지점으로 전화주시면, 영업 담당 직원이 친절히 상담해 드립니다.<br/>
						 			- <span class="primary bold">홈페이지 > 전화상담</span> 에서 각 지점의 위치와 연락처를 확인할 수 있습니다.
						 		</p>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body3" aria-expanded="true" aria-controls="long-body3">
					        		STEP3.신용 심사
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head3">
							<div class="panel-body">
								<ul>
									<li>안정적인 채권관리를 위해 신용심사를 실시합니다.</li>
									<li>
										신용등급에 따른 월대여료 차등은 없으며, 보증금 비율 및 보증보험 가입액만 달라집니다.<Br/>
										(보증금을 납부하는 경우, 납부액의 년 5.5%만큼 월대여료(vat 포함) 감액)
									</li>
									<li>신용심사 시 필요한 구비서류는 다음과 같습니다.</li>
								</ul>
								<br/>
								<h5>제출 서류</h5>
								<table class="table table-bordered desc-table">
									<tr>
										<th>개인</th>
										<td>재직증명서, 소득증빙자료(원천징수영수증 등), 개인신용정보 조회동의서</td>
									</tr>
									<tr>
										<th>개인사업자</th>
										<td>
											사업자등록증 사본, 매출증빙자료(부가세과세증명원/소득증명원 등), 개인신용정보 조회동의서<br/>
											<small>※매출증빙자료 - 국세청 홈텍스(https://www.hometax.go.kr/) 민원증명에서 프린트 가능</small>
										</td>
									</tr>
									<tr>
										<th>법인</th>
										<td>
											사업자등록증 사본, 재무제표(대차대조표, 손익계산서 등), 개인신용정보 조회동의서(신용이 우수한 법인의 경우 미제출 가능)
										</td>
									</tr>
								</table>
								<small>※ 신용심사에 필요한 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</small>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body4" aria-expanded="true" aria-controls="long-body4">
					        		STEP4.계약 체결 및 서류 접수
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head4">
							<div class="panel-body">
								<ul>
									<li>아마존카 직원이 고객을 직접 방문하여 계약서를 작성합니다.</li>
									<li>계약서 작성시 필요한 구비서류는 다음과 같습니다.</li>
								</ul>
								<br/>
								<h5>계약 준비 서류</h5>
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th width="*" rowspan="2">&nbsp;</th>
											<th width="22%" rowspan="2">개 인</th>
											<th width="25%" rowspan="2">개인사업자</th>
											<th colspan="2">법 인</th>
										</tr>
										<tr>
											<th width="23%">대표이사 자필 서명이<br /> 가능한 경우</th>
											<th width="25%">대표이사 자필 서명이<br /> 불가능한 경우</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>제<br />출<br />서<br />류</th>
											<td>- 운전면허증 사본<br />
												- 자동이체통장 사본</td>
											<td>- 사업자등록증 사본<br />
												- 신분증 사본<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /><br />
												※ 불가피한 사정으로 계약자의 직원이 계약을 대리해야 할 경우에는 계약자의 개인인감도장을 날인하고 개인인감증명서(최근 3개월 이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다.</td>
											<td>- 사업자등록증 사본<br />
												- 대표이사 신분증 사본<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /></td>
											<td>- 사업자등록증 사본<br />
												- 법인인감증명서 1통<br />
												- 대표이사 신분증 사본<br />
												- 대표이사 인감증명서 1통<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /><br />
												※ 인감증명서는 최근 3개월 이내 발급된 것이라야 합니다.<br /><br />
												※ 대표이사가 연대보증을 서지 않을 경우에는 대표이사 신분증 사본과 개인인감증명서는 제출하지 않습니다.</td>
										</tr>
										<tr>
											<th rowspan="2">신용<br />심사<br />참고<br />서류</th>
											<td>- 재직증명서<br />
												- 소득증빙자료<br />
												&nbsp;&nbsp;(원천징수영수증 등)</td>
											<td>- 매출증빙자료</td>
											<td colspan="2">- 재무제표<br />
												&nbsp;&nbsp;(대차대조표, 손익계산서 등)</td>
										</tr>
									</tbody>
								</table>
								<small>※ 신용심사에 필요한 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</small>
								<br/>
								<h5>계약서 작성 시</h5>
								<table class="table table-bordered desc-table">
									<tbody>
										<tr>
											<th width="12%">개 인</th>
											<td colspan="2">계약자 자필서명</td>
										</tr>
										<tr>
											<th>개인사업자</th>
											<td colspan="2">명판 날인후 계약자 자필서명</td>
										</tr>
										<tr>
											<th rowspan="2">법 인</th>
											<th  width="18%">대표이사 자필 서명이<br /> 가능할 경우</th>
											<td>계약자란 : 명판, 법인명의 도장 날인후 대표이사 자필서명<br />
												연대보증인란 : 연대보증을 서는 대표이사 자필서명</td>
										</tr>
										<tr>
											<th>대표이사 자필 서명이<br /> 불가능할 경우</th>
											<td>계약자란 : 명판, 법인인감도장 날인<br />
												연대보증인란 : 연대보증을 서는 대표이사 개인인감도장 날인</td>
										</tr>
									</tbody>
								</table>
								<small>※ 본인 확인 시 신분증 실물 대조 필수</small>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head5">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body5" aria-expanded="true" aria-controls="long-body5">
					        		STEP5.초기 납입금 납부
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head5">
							<div class="panel-body">
								<ul>
									<li>신차 출고 2일 전까지는 계약 시 약정한 초기납입금(보증금, 선납금 또는 개시대여료)을 납부하셔야 합니다.</li>
									<li>차량출고가 지연되는 경우 고객요청 시 출고지연 대차 서비스를 제공합니다. (장기대여 기준의 저렴한 대여요금 적용)</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head5">
					    	<h5 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body6" aria-expanded="true" aria-controls="long-body6">
					        		STEP6.차량 등록 후 인도
					      		</a>
					    	</h5>
					    </div>
					    <div id="long-body6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head6">
							<div class="panel-body">
								<ul>
									<li>차량이 출고됨과 동시에 보험가입 및 등록절차가 마무리되며, 출고 당일 고객이 원하는 장소로 차량을 인도해 드립니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head7">
					    	<h5 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body7" aria-expanded="true" aria-controls="long-body7">
					        		STEP7.차량 이용
					      		</a>
					    	</h5>
					    </div>
					    <div id="long-body7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head7">
							<div class="panel-body">
								<ul>
									<li>약정된 계약기간 동안 본인이 선택한 차량정비 서비스(일반식 또는 기본식)를 받으며 내 차처럼 차량을 이용하게 됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head8">
					    	<h5 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body8" aria-expanded="true" aria-controls="long-body8">
					        		STEP8.차량 반납, 기간 연장 또는 매입옵션 행사
					      		</a>
					    	</h5>
					    </div>
					    <div id="long-body8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head8">
							<div class="panel-body">
								<ul>
									<li>계약기간이 종료되면 차량은 아마존카로 반납하거나 기간을 연장하여 계속 사용할 수 있습니다. (연장이용 시 할인요금 적용)</li>
									<li>단, 계약 시 매입옵션을 약정한 경우 차량을 매입해 가실 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>					
			</div>
			
			<!-- 재리스/재렌트 -->
			<div role="tabpanel" class="tab-pane" id="secondhand-process">
				<div class="panel-group" id="secondhand-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body1" aria-expanded="true" aria-controls="secondhand-body1">
					        		STEP1.차량 선택 및 견적서 보기
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head1">
							<div class="panel-body">
								<p class="desc-paragraph">
									- <span class="primary bold">홈페이지 > 재렌스/재리스</span> 의 차량리스트에서 원하는 차량을 클릭하신 후 견적서보기 또는 맞춤견적내기를 통해<br/>
									&nbsp;&nbsp;월대여료 및대여조건을 확인하실 수 있으며 상담 요청이 가능합니다.<br/>
									- 상담 요청시 아마존카 영업 담당자가 확인 후 최대한 빠른 시간내에 연락을 드립니다. 
								</p>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body2" aria-expanded="true" aria-controls="secondhand-body2">
					        		STEP2.이용 상담
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head2">
							<div class="panel-body">
								<ul>
									<li>선택한 차량에 대해서 아마존카 담당자와 상담합니다.</li>
									<li>'홈페이지 > 상담'에서 본인의 위치와 가장 가까운 지점을 확인하신 후에 전화를 주시면 됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body3" aria-expanded="true" aria-controls="secondhand-body3">
					        		STEP3.신용 심사
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head3">
							<div class="panel-body">
								<ul>
									<li>안정적인 채권관리를 위해 신용심사를 실시합니다.</li>
									<li>신용등급에 따른 월대여료 차등은 없으며, 보증금 비율 및 보증보험 가입액만 달라집니다.<br/>(보증금을 납부하는 경우, 납부액의 년 5.5%만큼 월대여료(vat 포함) 감액)</li>
									<li>신용심사 시 필요한 구비서류는 다음과 같습니다.</li>
								</ul>
								<br/>
								<h5>제출 서류</h5>
								<table class="table table-bordered desc-table">	
									<tr>
										<th>개인</th>
										<td>재직증명서, 소득증빙자료(원천징수영수증 등), 개인신용정보 조회동의서</td>
									</tr>
									<tr>
										<th>개인사업자</th>
										<td>
											사업자등록증 사본, 매출증빙자료(부가세과세증명원/소득증명원 등), 개인신용정보 조회동의서<br/>
											<small>※매출증빙자료 - 국세청 홈텍스(https://www.hometax.go.kr/) 민원증명에서 프린트 가능</small>
										</td>
									</tr>
									<tr>
										<th>법인</th>
										<td>
											사업자등록증 사본, 재무제표(대차대조표, 손익계산서 등),<br/>
											개인신용정보 조회동의서(신용이 우수한 법인의 경우 미제출 가능)
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body4" aria-expanded="true" aria-controls="secondhand-body4">
					        		STEP4.차량 확인
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head4">
							<div class="panel-body">
								<ul>
									<li>아마존카 담당자와 협의 후 차고지에 방문하여 해당 차량 실물을 확인합니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head5">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body5" aria-expanded="true" aria-controls="secondhand-body5">
					        		STEP5.계약 체결 후 서류 접수
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head5">
							<div class="panel-body">
								<ul>
									<li>아마존카 직원이 고객을 직접 방문하여 계약서를 작성합니다.</li>
									<li>계약서 작성시 필요한 구비서류는 다음과 같습니다.</li>
								</ul>
								<br/>
								<h5>계약 준비 서류</h5>
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th width="*" rowspan="2">&nbsp;</th>
											<th width="22%" rowspan="2">개 인</th>
											<th width="25%" rowspan="2">개인사업자</th>
											<th colspan="2">법 인</th>
										</tr>
										<tr>
											<th width="23%">대표이사 자필 서명이<br /> 가능한 경우</th>
											<th width="25%">대표이사 자필 서명이<br /> 불가능한 경우</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>제<br />출<br />서<br />류</th>
											<td>- 운전면허증 사본<br />
												- 자동이체통장 사본</td>
											<td>- 사업자등록증 사본<br />
												- 신분증 사본<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /><br />
												※ 불가피한 사정으로 계약자의 직원이 계약을 대리해야 할 경우에는 계약자의 개인인감도장을 날인하고 개인인감증명서(최근 3개월 이내 발급된 것)를 첨부하여 계약을 체결할 수 있습니다.</td>
											<td>- 사업자등록증 사본<br />
												- 대표이사 신분증 사본<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /></td>
											<td>- 사업자등록증 사본<br />
												- 법인인감증명서 1통<br />
												- 대표이사 신분증 사본<br />
												- 대표이사 인감증명서 1통<br />
												- 자동이체통장 사본<br />
												- 주운전자 면허증 사본<br /><br />
												※ 인감증명서는 최근 3개월 이내 발급된 것이라야 합니다.<br /><br />
												※ 대표이사가 연대보증을 서지 않을 경우에는 대표이사 신분증 사본과 개인인감증명서는 제출하지 않습니다.</td>
										</tr>
										<tr>
											<th rowspan="2">신용<br />심사<br />참고<br />서류</th>
											<td>- 재직증명서<br />
												- 소득증빙자료<br />
												&nbsp;&nbsp;(원천징수영수증 등)</td>
											<td>- 매출증빙자료</td>
											<td colspan="2">- 재무제표<br />
												&nbsp;&nbsp;(대차대조표, 손익계산서 등)</td>
										</tr>
									</tbody>
								</table>
								<small>※ 신용심사에 필요한 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</small>
								<br/>
								<h5>계약서 작성 시</h5>
								<table class="table table-bordered desc-table">
									<tbody>
										<tr>
											<th width="12%">개 인</th>
											<td colspan="2">계약자 자필서명</td>
										</tr>
										<tr>
											<th>개인사업자</th>
											<td colspan="2">명판 날인후 계약자 자필서명</td>
										</tr>
										<tr>
											<th rowspan="2">법 인</th>
											<th  width="18%">대표이사 자필 서명이<br /> 가능할 경우</th>
											<td>계약자란 : 명판, 법인명의 도장 날인후 대표이사 자필서명<br />
												연대보증인란 : 연대보증을 서는 대표이사 자필서명</td>
										</tr>
										<tr>
											<th>대표이사 자필 서명이<br /> 불가능할 경우</th>
											<td>계약자란 : 명판, 법인인감도장 날인<br />
												연대보증인란 : 연대보증을 서는 대표이사 개인인감도장 날인</td>
										</tr>
									</tbody>
								</table>
								<small>※ 본인 확인 시 신분증 실물 대조 필수</small>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head6">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body6" aria-expanded="true" aria-controls="secondhand-body6">
					        		STEP6.초기 납입금 납부
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head6">
							<div class="panel-body">
								<p class="desc-paragraph">
									- 차량 정비 및 수리 개시 전 계약시 약정한 초기납입금(보증금, 선납금 또는 개시대여료)을 납부하셔야 합니다.
								</p>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head7">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body7" aria-expanded="true" aria-controls="secondhand-body7">
					        		STEP7.차량 이용
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head7">
							<div class="panel-body">
								<ul>
									<li>차량 정비 및 수리가 완료되면 차량을 인도 받고 약정된 계약기간 동안 내 차처럼 이용하시면 됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="secondhand-head8">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#secondhand-accordion" href="#secondhand-body8" aria-expanded="true" aria-controls="secondhand-body8">
					        		STEP8.차량 반납, 기간 연장 또는 매입옵션 행사
					      		</a>
					    	</h4>
					    </div>
					    <div id="secondhand-body8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="secondhand-head8">
							<div class="panel-body">
								<p class="desc-paragraph">
									- 계약기간이 종료되면 차량은 아마존카로 반납하거나 기간을 연장하여 계속 사용할 수 있습니다. (연장이용 시 할인요금 적용)<br/>
									- 단, 계약 시 매입옵션을 약정한 경우 차량을 매입해 가실 수 있습니다.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 월렌트 -->
			<div role="tabpanel" class="tab-pane" id="month-process">
				<div class="panel-group" id="month-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="month-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#month-accordion" href="#month-body1" aria-expanded="true" aria-controls="month-body1">
					        		STEP1.차량 선택 및 견적서 보기
					      		</a>
					    	</h4>
					    </div>
					    <div id="month-body1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="month-head1">
							<div class="panel-body">
								<p class="desc-paragraph">
									- <span class="primary bold">홈페이지 > 월렌트</span> 의 차량리스트에서 원하는 차량을 클릭하신 후 견적서보기를 통해<br/>
									&nbsp;&nbsp;월 대여료 및 대여조건을 확인하실 수 있으며 상담요청이 가능합니다.<br/>
									- 상담 요청시 아마존카 영업 담당 직원이 확인 후 최대한 빠른 시간내에 연락을 드립니다. 
								</p>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="month-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#month-accordion" href="#month-body2" aria-expanded="true" aria-controls="month-body2">
					        		STEP2.예약 및 이용 상담
					      		</a>
					    	</h4>
					    </div>
					    <div id="month-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="month-head2">
							<div class="panel-body">
								<p class="desc-paragraph">
									① <span class="primary bold">홈페이지 > 월렌트</span> 의 차량리스트에서 원하는 차량을 선택하신 후, 차량예약을 합니다.<br/>
									② 고객님께서 차량예약을 해주시면 아마존카 영업 담당 직원이 빠른 시간내에 연락을 드립니다.
								</p>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="month-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#month-accordion" href="#month-body3" aria-expanded="true" aria-controls="month-body3">
					        		STEP3.계약서 작성, 결제 및 차량 인수
					      		</a>
					    	</h4>
					    </div>
					    <div id="month-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="month-head3">
							<div class="panel-body">
								<ul>
									<li>예약 기한은 근무일 기준 익일 16시까지며, 반드시 '계약자 본인 또는 계약서상 차량운전자'가 차고지에 방문하여 차량을 확인하고<br>계약서를 작성합니다</li>
									<li>차고지 방문은 평일 오전 9시 ~ 11시 30분, 오후 1시 ~ 5시 내에만 가능합니다.</li>
									<li>첫회차 대여료는 계약자 본인 명의(법인의 경우 법인 명의)의 신용카드(체크카드 불가)로, 2회차 부터는 자동이체(계좌이체)로 출금됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="month-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#month-accordion" href="#month-body4" aria-expanded="true" aria-controls="month-body4">
					        		STEP4.차량 반납
					      		</a>
					    	</h4>
					    </div>
					    <div id="month-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="month-head4">
							<div class="panel-body">
								<ul>
									<li>차량 이용 후 계약만료일에는 반드시 차고지에 차량을 반납해야 합니다.</li>
									<li>차고지 방문은 평일 오전 9시~11시 30분, 오후 1시 ~5시 내에만 가능합니다.(단, 설날 및 추석 당일은 차량반납이 되지 않습니다.)</li>
									<li>탁송으로 반납하는 경우에는 근무일 기준 2일 전에 시간과 장소를 미리 예약해야 하며 추가요금이 부가됩니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="month-head5">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#month-accordion" href="#month-body5" aria-expanded="true" aria-controls="month-body5">
					        		STEP5.연장 이용
					      		</a>
					    	</h4>
					    </div>
					    <div id="month-body5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="month-head5">
							<div class="panel-body">
								<ul>
									<li>연장계약은 계약만료 7일 전까지 당사에 유선상 연락을 취하여 연장승인을 받은 후, 연장대여료를 결제해야 확정됩니다.</li>
									<li>연장대여료는 자동이체(계좌이체)로만 결제가 가능합니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
</t:genericpage>