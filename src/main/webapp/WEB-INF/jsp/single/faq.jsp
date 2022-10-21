<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<div class="accordion-container">
	<h2 class="primary">자주 묻는 질문</h2>
	<div role="tabpanel">	
		<br/>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#long" aria-controls="long" role="tab" data-toggle="tab">장기대여 관련</a></li>
			<!-- <li role="presentation"><a href="#lpg" aria-controls="lpg" role="tab" data-toggle="tab">LPG차량 이용</a></li> -->
			<li role="presentation"><a href="#green" aria-controls="green" role="tab" data-toggle="tab">친환경차</a></li>
			<li role="presentation"><a href="#evaluate" aria-controls="evaluate" role="tab" data-toggle="tab">심사 관련</a></li>
			<li role="presentation"><a href="#money" aria-controls="money" role="tab" data-toggle="tab">초기 납입금</a></li>
			<li role="presentation"><a href="#succession" aria-controls="succession" role="tab" data-toggle="tab">승계</a></li>
			<li role="presentation"><a href="#car" aria-controls="car" role="tab" data-toggle="tab">대차</a></li>
			<li role="presentation"><a href="#insure" aria-controls="insure" role="tab" data-toggle="tab">보험</a></li>
			<li role="presentation"><a href="#stop" aria-controls="stop" role="tab" data-toggle="tab">중도해지</a></li>
			<li role="presentation"><a href="#option" aria-controls="option" role="tab" data-toggle="tab">매입옵션</a></li>
			<li role="presentation"><a href="#system" aria-controls="system" role="tab" data-toggle="tab">시스템</a></li>
		</ul>
		<br/><br/>
		
		<div class="tab-content">
			<!-- 장기대여 관련 -->
			<div role="tabpanel" class="tab-pane active" id="long">
				<div class="panel-group" id="long-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body1" aria-expanded="true" aria-controls="long-body1">
					        		Q. 장기대여란 무엇인가?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="long-head1">
							<div class="panel-body">
						 		자동차 대여회사가 고객에게 차량을 장기간 대여해 주는 것으로,<br/>
						 		크게 나누어 장기렌트, 리스, 재렌트/재리스 3가지 상품으로 나눌 수 있습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body2" aria-expanded="true" aria-controls="long-body2">
					        		Q. 자동차 장기대여를 하면 좋은 점은 무엇입니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head2">
							<div class="panel-body">
						 		초기 비용이 많이 들어가는 고가(高價)의 자동차를 직접 구매하지 않고 자동차 대여 업체를 통해 이용함으로써 얻어 지는 편리성은 다양합니다.<br/>
						 		자동차를 직접 구매하여 소유하시면 사고나 정비 등 차량관리에 들어가는 시간과 수고가 만만치 않습니다.<br/>
						 		자동차 장기대여 회사가 차량관리를 전담함으로써 이러한 수고를 덜어 드리고,<br/>
						 		복잡한 회계처리 없이 매월 납부하는 대여료를 손쉽게 손비처리하여 절세효과까지 누릴 수 있습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body3" aria-expanded="true" aria-controls="long-body3">
					        		Q. 장기렌트와 자동차 리스의 차이점은 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head3">
							<div class="panel-body">
						 		장기렌트와 리스에 제공되는 서비스 내용은 동일합니다.<br/>
						 		차이점은 리스의 경우 일반 자가용번호가, 장기렌트의 경우 ‘허', '하', '호’번호가 부여된다는 점이 가장 두드러진 차이이며,<br/>
						 		대여료에 있어서는 장기렌트가 리스대비 10%정도 저렴합니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body4" aria-expanded="true" aria-controls="long-body4">
					        		Q. 재렌트/재리스란 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head4">
							<div class="panel-body">
						 		중도해지 또는 만기반납 등의 이유로 반납된 아마존카 보유차량 중에서 고객이 원하는 차량을 일정기간 대여해 드리는 서비스입니다.<Br/>
						 		상태가 우수하며, 신차대비 15%~40%이상 저렴한 가격으로 이용가능하다는 장점이 있습니다. 
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head5">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body5" aria-expanded="true" aria-controls="long-body5">
					        		Q. 가능한 계약기간은 얼마나 되나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head5">
							<div class="panel-body">
								<h5>신차</h5>
								<p>
									장기렌트 : 12~60개월(전 개월 견적가능)<br/>
								           리스 : 12~60개월(전 개월 견적가능)
								</p>
								<h5>보유차</h5>
								<p>
									재렌트 : 6~48개월<br/>
								           재리스 : 12~48개월
								</p><br/>
								<h5>위 상품 모두 연장이용이 가능합니다</h5>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="long-head6">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#long-accordion" href="#long-body6" aria-expanded="true" aria-controls="long-body6">
					        		Q. 계약기간이 종료되면 차는 어떻게 해야 하나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="long-body6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="long-head6">
							<div class="panel-body">
						 		기본적으로 계약종료 후 차량은 반납하셔야 하지만,<br/>
						 		기본식 상품은 이용하던 차량에 대한 구매의사가 있는 경우 매입옵션 가격에 매입할 수 있도록 해드리고 있습니다.<br/><br/>

								* 기본식 상품(정비서비스 미포함 상품): 반납, 매입옵션행사, 연장이용 중 선택 가능<br/>
								* 일반식 상품(정비서비스 포함 상품): 반납, 연장이용 중 선택 가능
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- LPG 차량 이용 관련 -->
			<%-- <div role="tabpanel" class="tab-pane" id="lpg">
				<div class="panel-group" id="lpg-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default"> 
						<div class="panel-heading" role="tab" id="lpg-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#lpg-accordion" href="#lpg-body2" aria-expanded="true" aria-controls="lpg-body2">
					        		Q. LPG 차량은 대여 기간이 끝난 후에 구매가 가능합니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="lpg-body2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="lpg-head2">
							<div class="panel-body">
						 		① 아마존카는 LPG차량 신차 장기렌트 기본식(정비미포함) 상품의 경우 매입옵션(계약 만료시 구입할 수 있는 권리)을 드립니다.<br/><br/>
						 		② 신차등록일로부터 만 5년이 경과하지 않은 LPG차량의 경우에는 법률의 규정에 따라 국가유공자나 장애인 등 일정한 자격이 <br/>
						 		&nbsp;&nbsp;&nbsp;&nbsp;있는자만 매입(매입옵션행사)이 가능합니다.<br/><br/>
						 		③ 신차등록일로부터 만 5년이 경과한 LPG차량은 누구나 매입(매입옵션이 주어진 경우) 가능합니다. (법 개정으로 2017년 1월 1일부터 가능)<br/><br/>
						 		④ 일반인이 LPG차량 장기렌트 이용 후 매입을 원하시는 경우에는 처음부터 60개월을 계약 이용하거나 또는 처음에 36, 48개월 계약 이용 후<br/>
						 		&nbsp;&nbsp;&nbsp;&nbsp;연장계약을 통하여 60개월 이상 이용하시면 됩니다.<br/>
						 		<h5>※상품별 매입옵션 부여 여부(LPG차량)</h5>
						 		<table class="desc-table table-bordered text-center" >
						 			<tr>
						 				<th rowspan="2">구분</th>
						 				<th colspan="2">신차</th>
						 				<th colspan="2">재렌트</th>
						 			</tr>
						 			<tr>
						 				<th>기본식<br/>(정비미포함)</th>
						 				<th>일반식<br/>(정비포함)</th>
						 				<th>기본식<br/>(정비미포함)</th>
						 				<th>일반식<br/>(정비포함)</th>
						 			</tr>
						 			<tr>
						 				<th style="height:70px;">매입옵션</th>
						 				<td>부여</td>
						 				<td>미부여</td>
						 				<td>미부여</td>
						 				<td>미부여</td>
						 			</tr>
						 		</table>
						 	</div>
					  	</div>
					</div>
				</div>
			</div> --%>
		
			<!-- 친환경차 관련 -->
			<div role="tabpanel" class="tab-pane" id="green">
				<a href="/rent/green/desc#tab_benefit" target="_blank"><h4><i class="glyphicon glyphicon-hand-right"></i>&nbsp;친환경차 바로가기</h4></a>
			</div>
		
			<!-- 심사 관련 -->
			<div role="tabpanel" class="tab-pane" id="evaluate">
				<div class="panel-group" id="eval-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="eval-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#eval-accordion" href="#eval-body1" aria-expanded="true" aria-controls="eval-body1">
					        		Q. 자동차 리스 시 신용심사기준이 까다롭다는데 아마존카는 어떤가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="eval-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="eval-head1">
							<div class="panel-body">
						 		아마존카 심사기준은 까다롭지 않습니다.<br/>
						 		일반 캐피탈 회사나 렌터카 회사의 경우 신용이 부족한 업체에 대표자이외의 추가 연대보증인의 입보를 요구함으로 곤란한 상황이 발생할 수도 있습니다.<br/> 
						 		이와 달리 아마존카는 신용에 특별한 결격 사유가 없는 이상 신설법인이나 소규모 기업에게도 까다롭지 않은 심사기준을 적용하여 쉽게 아마존카 장기대여를 이용하실 수 있는 기회를 제공하고 있습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="eval-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#eval-accordion" href="#eval-body2" aria-expanded="true" aria-controls="eval-body2">
					        		Q. 신용이 미약한 소규모 기업이나 신설 법인도 아마존카를 이용할 수 있나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="eval-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="eval-head2">
							<div class="panel-body">
						 		물론 아마존카에서는 융통성 있고 탄력적인 심사기준을 적용하여, 신설법인이나 소규모 기업도 장기대여를 쉽게 이용할 수 있도록 하고 있습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="eval-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#eval-accordion" href="#eval-body3" aria-expanded="true" aria-controls="eval-body3">
					        		Q. '보증보험'이란 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="eval-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="eval-head3">
							<div class="panel-body">
						 		장기대여 계약 체결에 따른 대여료 및 위약금을 보증보험사가 지급보증하는 보험상품으로,<br/>
						 		고객은 보증금을 납부하지 않는 대신 보증보험증권 가입을 하게 됩니다.<br/>
						 		이를 통해 고객은 자금 활용에 여유를 가질 수 있게 되고, 대여회사는 위험부담을 줄일 수 있게 됩니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="eval-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#eval-accordion" href="#eval-body4" aria-expanded="true" aria-controls="eval-body4">
					        		Q. 계약 체결 시 제출해야 하는 서류는 무엇입니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="eval-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="eval-head4">
							<div class="panel-body">
						 		장기대여 계약 시 제출해야 할 서류는 다음과 같습니다.<br/>
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th rowspan="2"></th>
											<th width="22%" rowspan="2">개 인</th>
											<th width="25%" rowspan="2">개인사업자</th>
											<th colspan="2">법 인</th>
										</tr>
										<tr>
											<th width="22%">대표이사 자필 서명이<br /> 가능한 경우</th>
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
										<tr>
											<td colspan="4" >※ 신용심사에 필요한 경우 계약자 또는 연대보증인의 주민등록등본 제출을 요청할 수 있습니다.</td>
										</tr>
									</tbody>
								</table>
								<table class="table table-bordered desc-table">
									<tbody>
									<caption>계약서 작성시</caption>
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
						 	</div>
					  	</div>
					</div>
				</div>
			</div>

			<!-- 초기 납입 -->
			<div role="tabpanel" class="tab-pane" id="money">
				<div class="panel-group" id="money-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="money-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#money-accordion" href="#money-body1" aria-expanded="true" aria-controls="money-body1">
					        		Q. 장기대여(장기렌트/리스) 계약 시 초기에 납입할 금액이 있습니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="money-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="money-head1">
							<div class="panel-body">
						 		초기에 납입해야할 금액으로는 보증금,선납금,개시대여료가 있으며, 초기 납입금액은 고객의 신용도와 요청에 따라 달라집니다. 기본적으로 차량가격의 20~25%의 금액을 초기에 납부하는 “보증금”제도가 주로 이용되고 있지만, 고객의 신용도에 따라 면제 또는 더 많은 보증금을 요청하는 경우도 있습니다. 또한 고객의 신용도와 요청에 따라 보증금을 보증보험증권으로 대체하는 방법도 가능합니다.<br/>
						 		※보증금은 계약기간 만료 후 환불해 드립니다. 보증금 100만원을 증액하면, 월대여료 4,620원(VAT포함)이 인하됩니다.(년리 5.5% 효과) 
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="money-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#money-accordion" href="#money-body3" aria-expanded="true" aria-controls="money-body3">
					        		Q. '선납금'이란 무엇인가요
					      		</a>
					    	</h4>
					    </div>
					    <div id="money-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="money-head3">
							<div class="panel-body">
						 		초기 납임금의 한 형태로 매월 납부해야 할 대여료 일부를 초기에 납부하는 것이며,<br/>
						 		향후 이용기간 동안 매월 일정 금액씩 공제되므로 월대여료 감액 효과를 볼 수 있습니다.(년리 6% 적용됨)<br/>
						 		선납금은 월대여료에서 공제되므로 계약기간이 종료되어도 환불되지 않습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="money-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#money-accordion" href="#money-body2" aria-expanded="true" aria-controls="money-body2">
					        		Q. '개시 대여료'란 무엇인가요
					      		</a>
					    	</h4>
					    </div>
					    <div id="money-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="money-head2">
							<div class="panel-body">
						 		초기 납임금의 한 형태로, 마지막 3개월치 대여료를 대여개시 전에 미리 납부하는 것을 말합니다.<br/>
						 		계약기간이 36개월인 경우 월대여료를 33회까지만 납부하게 되며) 34~36회차는 대여료 납부 없이 차량을 운행하게 됩니다.<BR/><BR/>
						 		※ 초기납입금에 년리 6%를 적용하여 월대여료가 감액됩니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="money-head4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#money-accordion" href="#money-body4" aria-expanded="true" aria-controls="money-body4">
					        		Q. 보증금과 선납금의 차이점은 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="money-body4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="money-head4">
							<div class="panel-body">
						 		<table class="desc-table table-bordered">
						 			<colgroup>
						 				<col width="20%"/>
						 				<col width="40%"/>
						 				<col width="40%"/>
						 			</colgroup>
						 			<tr>
						 				<th></th>
						 				<th>보증금</th>
						 				<th>선납금</th>
						 			</tr>
						 			<tr>
						 				<th>특징</th>
						 				<td class="text-center bold">계약만료후 환불</td>
						 				<td class="text-center bold">매월 일정 금액씩 공제되어<br/>계약만료시 환불금액 없음</td>
						 			</tr>
						 			<tr>
						 				<th>월대여료<br/>감액효과</th>
						 				<td class="text-center">1000만원 납입 시, 월 대여료 55,000원(VAT 포함) 감액<BR/>(계약기간에 상관없이 같은 금액 감액, 36개월 기준 총 1,980,000원 감액)</td>
						 				<td class="text-center">36개월 계약, 1000만원 납입시 월대여료 304,700원 감액<br/>(월대여료 10,969,200원 감액, 총 납입액 969,200원 감액)</td>
						 			</tr>
						 			<tr>
						 				<th>적용이자율<br/>(년리)</th>
						 				<td class="text-center">6.0%,<br/>부가세(VAT) 효과를 포함하면 실제로는 6.6% 감액효과 있음</td>
						 				<td class="text-center">6.0%</td>
						 			</tr>
						 		</table>
						 		<br/>
						 		<h5>월대여료 감액효과 예(例)</h5>
						 		*그랜저IG LPG 렌터카 모던, 36개월 계약<span class="bold" style="float:right;">VAT포함 기준</span>
						 		<table class="desc-table table table-bordered">
						 			<colgroup>
						 				<col width="20%"/>
						 				<col width="13%"/>
						 				<col width="13%"/>
						 				<col width="13%"/>
						 				<col width="20%"/>
						 				<col width="20%"/>
						 			</colgroup>
						 			<tr>
						 				<th></th>
						 				<th>월대여료</th>
						 				<th>월대여료 총액</th>
						 				<th>선납금</th>
						 				<th>대여료 총액<br/>(월대여료 총액 + 선납금)</th>
						 				<th class="bold">감액효과<br/>(초기납입금 0원 대비)</th>
						 			</tr>
						 			<tr>
						 				<th>초기납입금 0원</th>
						 				<td class="text-right">660,000원</td>
						 				<td class="text-right">23,760,000원</td>
						 				<td class="text-right">0원</td>
						 				<td class="text-right">23,760,000원</td>
						 				<td class="text-right bold">0원</td>
						 			</tr>	
						 			<tr>
						 				<th>선납금 1000만원</th>
						 				<td class="text-right">355,300원</td>
						 				<td class="text-right">12,790,800원</td>
						 				<td class="text-right">10,000,000원</td>
						 				<td class="text-right">22,790,800원</td>
						 				<td class="text-right bold">-969,200원</td>
						 			</tr>
						 			<tr>
						 				<th>보증금 1000만원(VAT 없음)</th>
						 				<td class="text-right">605,000원</td>
						 				<td class="text-right">21,780,000원</td>
						 				<td class="text-right">0원</td>
						 				<td class="text-right">21,780,000원</td>
						 				<td class="text-right bold">-1,980,000원</td>
						 			</tr>
						 		</table>
						 		※보증금/선납금 납입시 월대여료 산출은 위 표 참조
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 승계  -->
			<div role="tabpanel" class="tab-pane" id="succession">
				<div class="panel-group" id="succession-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="succession-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#succession-accordion" href="#succession-body1" aria-expanded="true" aria-controls="succession-body1">
					        		Q. 승계는 어떻게 해야되나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="succession-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="succession-head1">
							<div class="panel-body">
						 		계약을 승계받을 고객은 임차인이 찾으셔야 하며, 계약승계를 승인할 지 여부는 아마존카가 종합적으로 판단하여 결정합니다.<br/>
						 		 승계수수료는 [ 제조사 가격표상 신차 소비자가격의 0.8% ] (부가세포함)로 합니다. <br/> <br/>
						 		 ※ 중고차매매상에게 또는 계약만료 3개월이내에는 계약승계가 불가합니다.
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 대차 -->
			<div role="tabpanel" class="tab-pane" id="car">
				<div class="panel-group" id="car-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="car-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#car-accordion" href="#car-body1" aria-expanded="true" aria-controls="car-body1">
					        		Q. 대차 서비스는 언제 받을 수 있나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="car-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="car-head1">
							<div class="panel-body">
						 		<h5>사고대차서비스</h5>
						 		<p>
						 			월렌트를 제외한 모든 상품 (장기렌트, 리스, 재렌트, 재리스)에 사고대차서비스(자차사고 포함)가 제공됩니다.<br/>
						 			캐피탈사 장기렌트는 사고대차서비스가 기본이 아닌 옵션이거나 제공이 되지 않습니다.
						 		</p>
						 		<h5>정비대차서비스</h5>
						 		<p>
						 			- 일반식 (정비서비스 포함) 상품에만 제공<br/>
						 			- 4시간 이상 정비공장 입고시 제공
						 		</p>
						 		※ 사고·정비 대차서비스를 받으실 때 고객이 원하는 장소에서 차량을 인도받으실 수 있습니다. 
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="car-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#car-accordion" href="#car-body2" aria-expanded="true" aria-controls="car-body2">
					        		Q. 대차 서비스를 받는 경우 별도로 금액을 지불해야 합니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="car-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="car-head2">
							<div class="panel-body">
						 		별도로 지불해야 할 금액이 전혀 없습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="car-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#car-accordion" href="#car-body3" aria-expanded="true" aria-controls="car-body3">
					        		Q. 출고 지연 대차는 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="car-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="car-head3">
							<div class="panel-body">
						 		장기대여 계약을 한 차종의 출고가 예상보다 지연되는 경우 동급의 차량을 신차 출고 시점까지 이용할 수 있도록 대차를 해드리는 것입니다.<br/>
						 		비용은 별도로 청구되지만, 장기대여의 연장 선상으로 보기 때문에 대여료는 일반 단기대여료보다 훨씬 저렴하게 청구됩니다.<br/>
						 		출고 지연 대차는 본 장기대여 계약기간에 포함되지 않습니다.
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 보험 -->
			<div role="tabpanel" class="tab-pane" id="insure">
				<div class="panel-group" id="insure-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="insure-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#insure-accordion" href="#insure-body1" aria-expanded="true" aria-controls="insure-body1">
					        		Q. 운전자 연령은 어떻게 됩니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="insure-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="insure-head1">
							<div class="panel-body">
								<h5>장기렌트(신차,재렌트)</h5>
						 		<p>
						 			대부분 만26세 이상으로 계약이 이루어지고 있고, 홈페이지 월대여료도 만26세 이상 기준으로 제시하고 있습니다.<br/>
						 			만21세 이상 만26세 미만도 이용이 가능하나 대여료는 만26세 기준 월 대여료 보다 훨씬 높습니다.<br/>
						 			따라서 만21세 이상 만26세 미만 운전자는 보험연령에 맞는 견적을 별도로 산출해봐야 하며, 심사를 통해서 대여가능여부를 <br/>
						 			확인하셔야 합니다.
						 		</p>
						 		<h5>리스 (신차,재리스)</h5>
						 		<p>
						 			장기렌트와 비슷하지만 리스(재리스)는 만 24세 이상 운전가능 보험도 있습니다.
						 		</p>
						 		<h5>월렌트</h5>
						 		<p>
						 			만26세 이상, 국내 면허취득 3년 이상인 경우만 가능합니다.
						 		</p>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="insure-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#insure-accordion" href="#insure-body2" aria-expanded="true" aria-controls="insure-body2">
					        		Q. 자차 면책금이란 무엇입니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="insure-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="insure-head2">
							<div class="panel-body">
						 		자동차 보험의 "자기차량손해"에 해당하는 것으로, 고객의 과실로 인해 차량의 전부 또는 일부 손/망실시 면책받을 수 있는 제도입니다.<br/>
						 		약정한 자차 면책금이 30만원(수입차 50만원)일 경우 자차 사고 발생에 따른 <br/><br/>
						 		▶ 차량정비 및 수리관련 비용이 30만원(수입차는 50만원) 미만이면, 그 금액만큼만 고객이 부담합니다.<br/>
						 		▶ 차량정비 및 수리관련 비용이 30만원(수입차 50만원) 이상이면, 30만원만 고객이 부담하고 초과 비용부분은 아마존카에서 부담합니다.<br/><br/>
						 		※ 자차면책금은 세금계산서 발행이 불가합니다. (면책금은 재화나 용역의 공급거래가 아니고 단지 과실발생에 대해 약정에 따라 내는 금액이기 때문)<br/>
						 		※ 자차면책금 약정 금액<br/>
						 		국산차 : 30만원, 20만원 중 선택가능 (10만원 선택은 아마존카 사전승인 필요)<br/>
						 		수입차 : 50만원
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="insure-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#insure-accordion" href="#insure-body3" aria-expanded="true" aria-controls="insure-body3">
					        		Q. 보험 사고 등의 사고 처리는 누가 합니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="insure-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="insure-head3">
							<div class="panel-body">
						 		<h5> 1. 대인, 대물, 자손 사고 처리 (가해사고, 피해사고 및 쌍방사고)</h5>
						 		<p>
						 			 - 차량이용자는 사고발생시 보험회사로 직접 보험접수하셔야 하며, 사후처리는 보험회사 직원이 진행합니다.<br/>
						 			 - 차량이용자는 먼저 보험회사로 보험접수후 아마존카 담당자에게 사고발생 내용을 알려주셔야 합니다.<br/>
						 			 - 아마존카 담당자는 보험사와 과실비율 협의, 대차서비스 제공 및 사후처리 업무를 진행합니다.<br/>
						 			 ※ 아마존카의 승인없는 임차인의 임의적인 사고차량수리는 인정되지 않습니다.
						 		</p>
						 		<h5>2. 자차사고 처리 (자차 단독사고)</h5>
						 		<p>
						 			- 차량이용자는 자차사고 발생시 아마존카 담당자에게 사고발생 내용을 알려주셔야 합니다.<br/>
						 			- 자차사고 수리는 아마존카 지정 정비공장에서 진행합니다.<br/>
						 			- 사고 차량 수리기간 동안에는 사고대차서비스가 무료로 제공됩니다.<br/>
						 			※ 아마존카의 승인없는 임차인의 임의적인 사고차량수리는 인정되지 않습니다.
						 		</p>
						 	</div>
					  	</div>
					</div>			
				</div>
			</div>
			
			<!-- 중도해지 -->
			<div role="tabpanel" class="tab-pane" id="stop">
				<div class="panel-group" id="stop-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="stop-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#stop-accordion" href="#stop-body1" aria-expanded="true" aria-controls="stop-body1">
					        		Q. 계약을 중도에 해약하는 경우 위약금이 있습니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="stop-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="stop-head1">
							<div class="panel-body">
						 		약정한 계약기간을 다 채우지 못하고 차량을 반납, 계약을 중도해지하는 경우 고객은 중도해지 위약금을 부담하게 됩니다.<br/>
						 		해지 위약금은 잔여기간 대여료 공급가 총액에서 계약서에 기재된 위약금율을 곱하여 결정합니다.
						 	</div>
					  	</div>
					</div>
					<!-- <div class="panel panel-default">
						<div class="panel-heading" role="tab" id="stop-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#stop-accordion" href="#stop-body2" aria-expanded="true" aria-controls="stop-body2">
					        		Q. 계약 중도 해지 시 매입 옵션은 어떻게 됩니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="stop-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="stop-head2">
							<div class="panel-body">
						 		중도해지와 더불어 계약당시 부여된 차량구매에 대한 매입옵션 권리는 자연히 소멸됩니다. <br/><br/>
						 		※ 고객님이 중도 매입옵션행사를 원하실 경우에는 아래 조건으로 인수가 가능합니다.<br/>
						 		-  적용기간 : <br/>
						 		&nbsp;&nbsp;&nbsp;&nbsp;장기렌트: 대여개시후 계약기간의 50%이상 경과시<br/>
						 		&nbsp;&nbsp;&nbsp;&nbsp;리스: 대여개시후 1년이상 경과시<br/>
						 		- 계산방법: 잔여기간 대여료에서 이자,보험료,자동차세를 공제한 금액 + 매입옵션 금액의 인수시점 현재가치
						 	</div>
					  	</div>
					</div> -->
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="stop-head3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#stop-accordion" href="#stop-body3" aria-expanded="true" aria-controls="stop-body3">
					        		Q. 중도 해지 시 보증금 등 초기 납입금을 환불 받을 수 있습니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="stop-body3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="stop-head3">
							<div class="panel-body">
						 		중도해지 정산시 발생한 위약금과 기타 미납금을 초기납입금에서 차감한 후 환불금이 생기면 고객에게 돌려드립니다.<br/>
						 		반대로 선납하신 금액보다 위약금이 초과하는 경우에는 고객이 더 부담하셔야 합니다.
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 매입옵션 -->
			<div role="tabpanel" class="tab-pane" id="option">
				<div class="panel-group" id="option-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="option-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#option-accordion" href="#option-body1" aria-expanded="true" aria-controls="option-body1">
					        		Q. 매입옵션이란 무엇인가요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="option-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="option-head1">
							<div class="panel-body">
						 		장기대여 기간이 만료된 후 이용하던 차량을 고객이 직접 구입할 수 있는 권리를 드리는 것으로, 최초 계약 당시 매입옵션율을 정할 수 있습니다.<Br/>
						 		매입옵션은 기본식 상품(장기렌트 기본식, 리스 기본식)에서 제공되며 매입옵션율은 이용기간과 차종에 따라 차등이 있습니다.
						 		<!-- <br/><br/> -->
						 		<!-- ※ LPG차량 매입옵션 관련 내용은 'LPG차량 이용' 탭에서 확인가능합니다. -->
						 	</div>
					  	</div>
					</div>		
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="option-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#option-accordion" href="#option-body2" aria-expanded="true" aria-controls="option-body2">
					        		Q. 매입옵션이 없는 일반식 상품을 이용하는 경우 차량 구입 시 전혀 혜택이 없나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="option-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="option-head2">
							<div class="panel-body">
						 		별도로 규정된 매입옵션은 없지만, 계약 시점에 미리 아마존카와 협의하여 매입옵션 금액을 약정해두면 계약만료 후 약정금액에 매입옵션을 행사할 수 있습니다.
						 	</div>
					  	</div>
					</div>	
				</div>
			</div>
			
			<!-- 시스템 -->
			<div role="tabpanel" class="tab-pane" id="system">
				<div class="panel-group" id="system-accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="system-head1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#system-accordion" href="#system-body1" aria-expanded="true" aria-controls="system-body1">
					        		Q. 아마존카 자체 프로그램이라고 하는 FMS는 무엇입니까?
					      		</a>
					    	</h4>
					    </div>
					    <div id="system-body1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="system-head1">
							<div class="panel-body">
						 		FMS는 Fleet Management System의 약자로 차량관리, 경영시스템을 의미하지만, 당사 직원과 고객 간의 소통을 대신할 창구의 기능을 <br/>
						 		하기도 합니다.<br/>
						 		인터넷을 통해 FMS에 접속(아마존카 홈페이지)하면 계약정보, 대여료 스케줄, 세금계산서, 보험정보, 사고처리, 정비이력, 과태료관련 등 <br/>
						 		현재 이용중인 차량에 대한 정보를 실시간으로 확인할 수 있습니다.  
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="system-head2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#system-accordion" href="#system-body2" aria-expanded="true" aria-controls="system-body2">
					        		Q. FMS는 어떻게 이용할 수 있나요?
					      		</a>
					    	</h4>
					    </div>
					    <div id="system-body2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="system-head2">
							<div class="panel-body">
						 		FMS에 접속하려면 우선 아마존카로부터 임시 아이디와 비밀번호를 부여받은후  원하는 아이디와 비밀번호로 변경하셔야 합니다.<br/>
						 		자세한 문의는 담당 직원을 통하거나, 혹은 아마존카 본사로 연락하면 됩니다. (TEL. 02-757-0802(영업팀), 02-392-4243(전산팀))
						 		<BR/><BR/>
						 		<a href="https://fms.amazoncar.co.kr/service/index.jsp" target="_blank"><h4><i class="glyphicon glyphicon-hand-right"></i>&nbsp;고객FMS 바로가기</h4></a>
						 	</div>
					  	</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</div>
</t:genericpage>

