<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<div class="accordion-container">
	<h2 class="primary">장기렌트 이용 팁</h2>
	<div role="tabpanel">	
		<br/>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#tip" aria-controls="tip" role="tab" data-toggle="tab">Useful Tips</a></li>
			<li role="presentation"><a href="#law" aria-controls="law" role="tab" data-toggle="tab">도로교통법</a></li>
			<li role="presentation"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">교통생활정보</a></li>
			<li role="presentation"><a href="#lpg" aria-controls="lpg" role="tab" data-toggle="tab">전국 LPG 충전소 안내</a></li>
		</ul>
		<br/><br/>
		<div class="tab-content">
			<!-- Useful Tips -->
			<div role="tabpanel" class="tab-pane active" id="tip">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
					        		저렴한 보유차 장기 대여를 이용해 보세요!
					      		</a>
					    	</h4>
					    </div>
					    <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
							<div class="panel-body">
						 		월대여료가 부담되신다면, 아마존카의 보유차 장기대여를 이용해 보세요.<br/>
								신차를 대여하는 것보다 10~40%까지 저렴하게 이용하실 수 있습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="true" aria-controls="collapse2">
					        		대여기간 내내 진짜 내 차처럼- 매입옵션 제공!
					      		</a>
					    	</h4>
					    </div>
					    <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2">
							<div class="panel-body">
						 		아마존카 장기대여를 통해 대여한 차라도 오랜기간 이용하시다 보면 내 차처럼 정이듭니다.<br/>
								계약만료 후에 차량 명의이전을 원하신다면 매입옵션을 제공하는 기본식 상품을 선택하세요!
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="true" aria-controls="collapse3">
					        		아마존카의 '카매니저'가 제공하는 One Stop Service
					      		</a>
					    	</h4>
					    </div>
					    <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
							<div class="panel-body">
						 		아마존카의 전문 '카메니저(Car Manager)'가 고객의 현상황과 요구를 파악하여<br/>
						 		차량 선택에서부터 차량 관리까지 모든 것을 Onestop으로 처리해 드립니다.<br/>
						 		여러 경로를 거치지 않고 업무를 빠르게 처리해 드릴 수 있도록 고객창구를 일원화 하였습니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
					        		고객 편의를 위한 다양한 대차 서비스
					      		</a>
					    	</h4>
					    </div>
					    <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
							<div class="panel-body">
						 		차량사고 및 정비로 인해 차량을 운행 못하시는 경우는 절대 발생하지 않습니다.<br/>
						 		아마존카가 무상으로 제공하는 최고의 대차서비스를 통해 업무 공백을 없앨 수 있습니다.<br/>
						 		물론 신차 출고가 지연되는 경우에도 동급 차량을 지원하는 '출고지연 대차서비스'를 제공합니다.
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="heading5">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
					        		신설 법인도 아마존카 상품을 쉽게 이용할 수 있습니다!
					      		</a>
					    	</h4>
					    </div>
					    <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
							<div class="panel-body">
						 		소규모 기업이나 신설법인, 개인사업자, 개인도 아마존카의 오토리스, 장기렌트 상품을 쉽게 이용하실 수 있도록 문을 넓혔습니다.
						 	</div>
					  	</div>
					</div>
				</div>
			</div>
			
			<!-- 도로교통법 -->
			<div role="tabpanel" class="tab-pane" id="law">
				<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="law-heading1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion2" href="#law-collapse1" aria-expanded="true" aria-controls="law-collapse1">
					        		운전 면허 행정 처분 일반 기준
					      		</a>
					    	</h4>
					    </div>
					    <div id="law-collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="law-heading1">
							<div class="panel-body">
						 		<table class="table desc-table table-bordered">
									<thead>
										<tr>
											<th width="20%" scope="row">항 목</th>
											<th colspan="2" scope="row">내 용</th>
											<th width="20%"  scope="row">비 고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>면허정지</th>
											<td colspan="2" >법규위반 또는 교통사고로 인하여 운전면허의 처분 벌점이 40점 이상이 되었을 때</td>
											<td>1점을 1일씩 계산 집행</td>
										</tr>
										<tr>
											<th  rowspan="2" >누적점수 초과로 인한<br /> 면허취소기준</th>
											<td width="30%">기간</td>
											<td width="*">벌점 또는 누산점수</td>
											<td rowspan="2">3년간 관리<br />(당해 위반 또는 사고가<br /> 있었던 날을 기준으로 함)</td>
										</tr>
										<tr>
											<td>1년간<br />2년간<br />3년간</td>
											<td>121점 이상<br />201점 이상<br />271점 이상 기간</td>
										</tr>
										<tr>
											<th>처분벌점의 소멸<br />(무위반 및 무사고자<br /> 특혜부여)</th>
											<td colspan="2">처분 벌점이 40점 미만일 경우에 최종 위반일·사고일로부터 1년을 무위반·무사고로 경과한 때</td>
											<td>누산점수에서 공제</td>
										</tr>
										<tr>
											<th>도주차량 검거로 인한<br /> 누산점수공제 (특혜부여)</th>
											<td colspan="2">도주차량(인적피해)을 검거하거나 신고하여 검거하게 한때에는 기간에 관계없이<br /> 40점의 특혜점수를 부여</td>
											<td>정지 또는 취소처분을<br /> 받게 될 경우<br /> 누산점수에서 공제</td>
										</tr>
										<tr>
											<th>모범운전자<br /> 정지처분집행일수 감경</th>
											<td colspan="2">모범운전자(무사고 운전자 : 10년이상 무사고·유공운전자의 표시장을 받고 종사중인 자)<br />에게는 면허 정지처분 집행기간을 1/2로 감경</td>
											<td>사고야기로 인한<br /> 벌점이 있는 경우 제외</td>
										</tr>
										<tr>
											<th>교통소양교육을 이수한 때<br /> 정지처분집행일수 감경</th>
											<td colspan="2">정지처분 20일 감경<br />(실제 정지 집행일수는 감경해 주나 본인의 누산점수에서는 공제하지 않음)</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<th rowspan="4" >운전면혀취소 개별기준</th>
											<td colspan="2">술에 취한 상태의 인명사고(혈중알콜농도 0.05% 이상)</td>
											<td rowspan="4">전체 16개 항목 중에<br /> 특히 주요항목</td>
										</tr>
										<tr>
											<td colspan="2">술에 만취된 상태의 운전(혈중알콜농도 0.1% 이상)</td>
										</tr>
										<tr>
											<td colspan="2">교통사고 야기도주</td>
										</tr>
										<tr>
											<td colspan="2">단속 경찰관 등 폭행(구속된 때)외 12건</td>
										</tr>
									</tbody>
								</table>
						 	</div>
					  	</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="law-heading2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion2" href="#law-collapse2" aria-expanded="true" aria-controls="law-collapse2">
					        		교통법규 위반 시 벌점 항목
					      		</a>
					    	</h4>
					    </div>
					    <div id="law-collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="law-heading2">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th width="*">위반사항</th>
											<th colspan="2" >벌점</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1. 면허증 갱신기간 만료일 다음 날부터 면허증 갱신을 받지 아니하고 1년을 경과한 때</td>
											<td colspan="2" >110점</td>
										</tr>
										<tr>
											<td>1-2. 술에 취한 상태의 기준을 넘어서 운전한 때(혈중알콜농도 0.05% 이상 0.1% 미만)</td>
											<td width="10%" >100점</td>
											<td width="13%" rowspan="2">형사입건</td>
										</tr>
										<tr>
											<td>2. 운전자가 단속경찰공무원 등에 대한 폭행으로 형사입건된 때</td>
											<td>90점</td>
										</tr>
										<tr>
											<td>2-2. 정차, 주차위반에 대한 조치위반<br />(단체에 소속되거나 다수인에 포함되어 경찰 공무원의 3회 이상의 이동명령에 따르지 아니하고<br /> 교통을 방해한 경우에 한한다)</td>
											<td rowspan="3" >40점</td>
											<td rowspan="3" >범칙금 부과</td>
										</tr>
										<tr>
											<td> 2-3. 안전운전 의무위반<br /> (단체에 소속되거나 다수인에 포함되어 경찰공무원의 3회 이상의 안전운전 지시에 따르지 아니하고<br /> 타인에게 위험과 장해를 주는 속도나 방법으로 운전한 경우에 한한다)</td>
										</tr>
										<tr>
											<td>2-4. 승객의 차내 소란행위 방치 운전</td>
										</tr>
										<tr>
											<td>3. 출석기간 또는 범칙금 납부기간 만료일로부터 60일이 경과될 때까지 즉결심판을 받지 아니한 때</td>
											<td colspan="2" >40점(누산점수 제외)</td>
										</tr>
										<tr>
											<td>4. 통행구분 위반(중앙선 침범에 한함)</td>
											<td rowspan="5" >30점</td>
											<td rowspan="4" >범칙금 부과</td>
										</tr>
										<tr>
											<td> 4-2. 속도위반(40km/h 초과)</td>
										</tr>
										<tr>
											<td>4-3. 철길건널목 통과방법 위반</td>
										</tr>
										<tr>
											<td> 5. 고속도로 갓길통행 또는 버스전용차로·다인승 전용차로 통행 위반</td>
										</tr>
										<tr>
											<td>6. 운전면허증 제시의무 위반</td>
											<td>즉심회부</td>
										</tr>
										<tr>
											<td>7. 신호 또는 지시에 따를 의무 위반</td>
											<td rowspan="6" >15점</td>
											<td rowspan="6" >범칙금 부과</td>
										</tr>
										<tr>
											<td>8. 속도위반(20km/h초과 40km/h이하)</td>
										</tr>
										<tr>
											<td>9. 앞지르기 금지 위반</td>
										</tr>
										<tr>
											<td>10. 운전 중 휴대용전화 사용금지의 위반</td>
										</tr>
										<tr>
											<td>10-2. 운행기록계 미설치차량 운전금지 등의 위반</td>
										</tr>
										<tr>
											<td>10-3. 어린이 통학버스 운전자의 의무 위반</td>
										</tr>
										<tr>
											<td>11. 통행구분 위반(보도침범, 보도횡단방법 위반)</td>
											<td rowspan="10" >10점</td>
											<td rowspan="10" >범칙금 부과</td>
										</tr>
										<tr>
											<td>12. 차로에 따른 통행위반(진로변경 금지장소에서의 진로변경 포함)</td>
										</tr>
										<tr>
											<td>13. 일반도로 버스전용차로 통행위반</td>
										</tr>
										<tr>
											<td> 14. 안전거리 확보 불이행(진로변경방법 위반 포함)</td>
										</tr>
										<tr>
											<td>15. 앞지르기방법 위반</td>
										</tr>
										<tr>
											<td> 16. 보행자 보호의무 불이행(정지선 위반 포함)</td>
										</tr>
										<tr>
											<td>17. 승객 또는 승·하차자 추락 방지조치 위반</td>
										</tr>
										<tr>
											<td>19. 안전운전의무 위반</td>
										</tr>
										<tr>
											<td>20. 노상시비·다툼 등으로 차마의 통행 방해행위</td>
										</tr>
										<tr>
											<td>20-2. 어린이 통학버스 특별보호 위반</td>
										</tr>
									</tbody>
                  				</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="law-heading3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion2" href="#law-collapse3" aria-expanded="true" aria-controls="law-collapse3">
					        		교통법규 야기 시 벌점 기준
					      		</a>
					    	</h4>
					    </div>
					    <div id="law-collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="law-heading3">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th colspan="2">구 분</th>
											<th>벌점</th>
											<th width="*">내 용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="4" width="20%">인적피해</td>
											<th width="25%">사망 1명당</th>
											<td width="8%">90점</td>
											<td>사고발생시부터 72시간내에 사망한 때</td>
										</tr>
										<tr>
											<th>중상 1명당</th>
											<td>15점</td>
											<td>3주이상 치료를 요하는 진단이 있는 부상</td>
										</tr>
										<tr>
											<th>경상 1명당</th>
											<td>5점</td>
											<td>3주미만 5일이상의 치료를 요하는 진단이 있는 부상</td>
										</tr>
										<tr>
											<th>부상 1명당</th>
											<td>2점</td>
											<td>5일미만의 치료를 요하는 진단이 있는 부상</td>
										</tr>
										<tr>
											<td rowspan="3" >교통사고야기시 조치<br />(사상자구호 등) 불이행</td>
											<th>자진신고 지연(인사사고)</th>
											<td>60점</td>
											<td rowspan="3" >형사입건</td>
										</tr>
										<tr>
											<th>시한 내 자진신고(인사사고)</th>
											<td>30점</td>
										</tr>
										<tr>
											<th>물적피해 야기후 도주</th>
											<td>15점</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="law-heading4">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion2" href="#law-collapse4" aria-expanded="true" aria-controls="law-collapse4">
					        		범칙 행위 및 금액표
					      		</a>
					    	</h4>
					    </div>
					    <div id="law-collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="law-heading4">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th>구 분</th>
											<th colspan="2" width="30%">벌점</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1. 속도위반(40km/h 초과)</td>
											<td rowspan="2" colspan="2">승합 등 : 100,000원<br />
											승용 등 : 90,000원<br />
											이륜 등 : 60,000원<br /></td>
										</tr>
										<tr>
											<td>1-2. 승객의 차내 소란행위 방치 운전</td>
										</tr>
										<tr>
											<td>1-3. 신호·지시 위반</td>
											<td rowspan="17" colspan="2">승합 등 : 70,000원<br />
											승용 등 : 60,000원<br />
											이륜 등 : 40,000원<br />
											자전거 등 : 30,000원<br /></td>
										</tr>
										<tr>
											<td>2. 중앙선 침범·통행구분 위반</td>
										</tr>
										<tr>
											<td>3. 속도위반(20km/h초과 40km/h이하)</td>
										</tr>
										<tr>
											<td>4. 횡단·유턴·후진 위반</td>
										</tr>
										<tr>
											<td>5. 앞지르기 방법 위반</td>
										</tr>
										<tr>
											<td>6. 앞지르기 금지시기 위반</td>
										</tr>
										<tr>
											<td>7. 금지장소에서의 앞지르기</td>
										</tr>
										<tr>
											<td>8. 철길건널목 통과방법 위반</td>
										</tr>
										<tr>
											<td>9. 횡단보도 보행자 횡단방해<br />
											(신호 또는 지시에 따라 횡단하는 보행자 통행방해 포함)</td>
										</tr>
										<tr>
											<td> 9-2. 보행자 전용도로 통행위반(보행자 전용 도로 통행방법 위반 포함)</td>
										</tr>
										<tr>
											<td> 10. 승차인원 초과·승객 또는 승하차자 추락 방지조치 위반</td>
										</tr>
										<tr>
											<td>11. 어린이·맹인 등의 보호 위반</td>
										</tr>
										<tr>
											<td>11-2. 운전중 휴대용전화 사용</td>
										</tr>
										<tr>
											<td>11-3. 운행기록계 미설치 자동차 운전금지 등의 위반</td>
										</tr>
										<tr>
											<td>11-4. 어린이 통학버스 운전자의 의무 위반</td>
										</tr>
										<tr>
											<td>11-5. 어린이 통학버스 운행자의 의무 위반</td>
										</tr>
										<tr>
											<td>12. 고속도로 갓길통행 또는 버스전용차로·다인승전용차로 통행 위반</td>
										</tr>
										<tr>
											<td>13. 통행금지·제한 위반</td>
											<td rowspan="21" colspan="2">승합 등 : 50,000원<br />
											승용 등 : 40,000원<br />
											이륜 등 : 30,000원<br />
											자전거 등 : 20,000원<br /></td>
										</tr>
										<tr>
											<td>14. 일반도로 버스전용차로 통행 위반</td>
										</tr>
										<tr>
											<td>15. 고속도로·자동차 전용도로 안전거리 미확보</td>
										</tr>
										<tr>
											<td>16. 앞지르기 방해금지 위반</td>
										</tr>
										<tr>
											<td>17. 교차로 통행방법 위반</td>
										</tr>
										<tr>
											<td>18. 직진·우회전차의 진행방해</td>
										</tr>
										<tr>
											<td>19. 보행자 통행방해 또는 보호 불이행</td>
										</tr>
										<tr>
											<td>20. 긴급자동차에 대한 피양·일시정지 위반</td>
										</tr>
										<tr>
											<td>21. 정차·주차 금지 위반</td>
										</tr>
										<tr>
											<td>22. 주차 금지 위반</td>
										</tr>
										<tr>
											<td>23. 정차·주차방법 위반</td>
										</tr>
										<tr>
											<td>24. 정차·주차위반에 대한 조치 불응</td>
										</tr>
										<tr>
											<td>25. 적재제한위반, 적재물 추락 방지 위반 또는 유아나 동물을 안고 운전하는 행위</td>
										</tr>
										<tr>
											<td>26. 안전운전 의무 위반(난폭운전 포함)</td>
										</tr>
										<tr>
											<td>27. 노상 시비·다툼 등으로 차마의 통행방해행위</td>
										</tr>
										<tr>
											<td>28. 급발진·급가속·엔진 공회전 또는 반복적·연속적 경음기 울림으로 소음 발생행위</td>
										</tr>
										<tr>
											<td>30. 고속도로 지정차로 통행 위반</td>
										</tr>
										<tr>
											<td>31. 고속도로·자동차전용도로 횡단·유턴·후진 위반</td>
										</tr>
										<tr>
											<td>32. 고속도로·자동차전용도로 정차·주차 금지 위반</td>
										</tr>
										<tr>
											<td>33. 고속도로 진입 위반</td>
										</tr>
										<tr>
											<td>34. 고속도로·자동차전용도로 고장 등의 경우 조치 불이행</td>
										</tr>
										<tr>
											<td>35. 혼잡완화 조치 위반</td>
											<td rowspan="15" colspan="2">승합 등 : 30,000원<br />
											승용 등 : 30,000원<br />
											이륜 등 : 20,000원<br />
											자전거 등 : 10,000원<br /></td>
										</tr>
										<tr>
											<td>36. 지정차로 통행 위반, 차로폭보다 넓은 차 통행금지 위반<br />  (진로변경 금지장소에서의 진로변경 포함)</td>
										</tr>
										<tr>
											<td>37. 속도 위반(20km/h 이하)</td>
										</tr>
										<tr>
											<td>38. 진로변경 방법 위반</td>
										</tr>
										<tr>
											<td>39. 급제동 금지 위반</td>
										</tr>
										<tr>
											<td>40. 끼어들기 금지 위반</td>
										</tr>
										<tr>
											<td>41. 서행의무 위반</td>
										</tr>
										<tr>
											<td>42. 일시정지 위반</td>
										</tr>
										<tr>
											<td>43. 방향전환·진료변경시 신호불이행</td>
										</tr>
										<tr>
											<td>45. 운전석 이탈시 안전확보 불이행</td>
										</tr>
										<tr>
											<td>46. 승차자 등의 안전을 위한 조치 위반</td>
										</tr>
										<tr>
											<td>47. 지방경찰청 고시 위반</td>
										</tr>
										<tr>
											<td>48. 좌석안전띠 미착용</td>
										</tr>
										<tr>
											<td>49. 이륜자동차 인명보호장구 미착용</td>
										</tr>
										<tr>
											<td> 49-2. 어린이 통학버스 신고필증 비치의무 위반 또는 어린이 통학버스와 유사한 도장·표지 금지 위반</td>
										</tr>
										<tr>
											<td>50. 통행우선순위 위반</td>
											<td rowspan="9" colspan="2">승합 등 : 20,000원<br />
											승용 등 : 20,000원<br />
											이륜 등 : 10,000원<br />
											자전거 등 : 10,000원<br /></td>
										</tr>
										<tr>
											<td>51. 최저속도 위반</td>
										</tr>
										<tr>
											<td>52. 일반도로 안전거리 미확보</td>
										</tr>
										<tr>
											<td>53. 진로양보의무 불이행</td>
										</tr>
										<tr>
											<td>54. 등화점등·조작 불이행</td>
										</tr>
										<tr>
											<td>56. 고인물 등을 튀게 하는 행위</td>
										</tr>
										<tr>
											<td>57. 짙은 선팅, 불법 부착 장치차 운전</td>
										</tr>
										<tr>
											<td>58. 택시의 합승(장시간 주·정차하여 승객을 유치하는 경우에 한함)·승차거부·부당요금 징수행위</td>
										</tr>
										<tr>
											<td>60. 고속도로·자동차전용도로 운전자 특별준수 사항 위반</td>
										</tr>
										<tr>
											<td>61. 특별한 교통안전교육 미필</td>
											<td rowspan="4">차<br />종<br />구<br />분<br />없<br />이</td>
											<td rowspan="4">
 													<table>
 														<tbody>
 														<tr>
 															<td border="0" colspan="2">61번 : 40,000원<br />62번 : 1종 범칙금, 2종 과태료
 															</td>
 														</tr>
 														<tr>
 															<td>1종</td>
 															<td>3월이하 : 30,000원<br />
 															3월초과 ~ 6월이하 : 40,000원<br />
 															5월초과 ~ 9월이하 : 50,000원<br />
 															9월 초과 : 60,000원
 															</td>
 														</tr>
 														<tr>
 															<td>2종</td>
 															<td>3월이하 : 20,000원<br />
 															3월초과 ~ 6월이하 : 30,000원<br />
 															5월초과 ~ 9월이하 : 40,000원<br />
 															9월 초과 : 50,000원
 															</td>
 														</tr>
 														<tr>
 															<td colspan="2">63번 : 30,000원<br />64번 : 30,000원
 															</td>
 														</tr>
 														</tbody>
 													</table>
											</td>
										</tr>
										<tr>
											<td>62. 적성검사 기간 경과<br /><br />
											* 3월 이하<br />
											* 3월 초과 ~ 6월 이하<br />
											* 6월 초과 ~ 9월 이하<br />
											* 9월 초과</td>
										</tr>
										<tr>
											<td>63. 면허증 휴대의무 위반</td>
										</tr>
										<tr>
											<td>64. 면허증 반납 불이행</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 교통생활정보 -->
			<div role="tabpanel" class="tab-pane" id="info">
				<div class="panel-group" id="accordion3" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="info-heading1">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion3" href="#info-collapse1" aria-expanded="true" aria-controls="info-collapse1">
					        		교통 상황 안내
					      		</a>
					    	</h4>
					    </div>
					    <div id="info-collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="info-heading1">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th >안 내</th>
											<th>전화번호</th>
											<th>안 내</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>통합교통정보</th>
											<td>1333</td>
											<th>TBN 대구 교통제보/안내</th>
											<td>080 - 664 - 8000</td>
										</tr>
										<tr>
											<th>고속도로정보</th>
											<td>1588 - 2505</td>
											<th>TBN 대전 교통제보/안내</th>
											<td>080 - 665 - 8000</td>
										</tr>
										<tr>
											<th>TBS 교통제보/안내</th>
											<td>080 - 800 - 9595</td>
											<th>TBN 인천 교통제보/안내</th>
											<td>080 - 357 - 8000</td>
										</tr>
										<tr>
											<th>TBN 부산 교통제보/안내</th>
											<td>080 - 450 - 8000</td>
											<th>TBN 강원 교통제보/안내</th>
											<td>080 - 363 - 8000</td>
										</tr>
										<tr>
											<th>TBN 광주 교통제보/안내</th>
											<td>080 - 333 - 8000</td>
											<th>TBN 전주 교통제보/안내</th>
											<td>080 - 776 - 8000</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="info-heading2">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion3" href="#info-collapse2" aria-expanded="true" aria-controls="info-collapse2">
					        		자동차 회사 별 긴급출동 안내
					      		</a>
					    	</h4>
					    </div>
					    <div id="info-collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="info-heading2">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th>회사명</th>
											<th>전화번호</th>
											<th>회사명</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>현대자동차</th>
											<td>080 - 600 - 6000</td>
											<th>한국GM(쉐보레)</th>
											<td>080 - 3000 - 5000</td>
										</tr>
										<tr>
											<th>기아자동차</th>
											<td>080 - 200 - 2000</td>
											<th>쌍용자동차</th>
											<td>0080 - 500 - 5582</td>
										</tr>
										<tr>
											<th>르노삼성자동차</th>
											<td>080 - 300 - 3000</td>
											<td colspan="2">&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="info-heading3">
					    	<h4 class="panel-title">
					      		<a data-toggle="collapse" data-parent="#accordion3" href="#info-collapse3" aria-expanded="true" aria-controls="info-collapse3">
					        		보험 회사 별 긴급 출동 안내
					      		</a>
					    	</h4>
					    </div>
					    <div id="info-collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="info-heading3">
							<div class="panel-body">
								<table class="table table-bordered desc-table">
									<thead>
										<tr>
											<th>회사명</th>
											<th>전화번호</th>
											<th>회사명</th>
											<th>전화번호</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>삼성화재</th>
											<td>1588 - 5114</td>
											<th>동부화재</th>
											<td>1588 - 0100</td>
										</tr>
										<tr>
											<th>한화손해보험</th>
											<td>1566 - 8000</td>
											<th>흥국화재</th>
											<td>1688 - 1688</td>
										</tr>
										<tr>
											<th>현대해상</th>
											<td>1588 - 5656</td>
											<th>LIG 손해보험</th>
											<td>1544 - 0114</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 전국 LPG 충전소 안내 -->
			<div role="tabpanel" class="tab-pane text-center" id="lpg">
				지도를 클릭하시면 주유소/충전소 찾기 페이지로 연결됩니다.<br/><br/>
				<a href="http://www.opinet.co.kr/searRgSelect.do" target="_blank"><img src="/resources/images/lpg_map.png"/></a>
			</div>
			
		</div>
	</div>
</div>
</t:genericpage>

