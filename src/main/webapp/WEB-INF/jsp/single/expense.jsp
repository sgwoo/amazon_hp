<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:genericpage>
<script src="/resources/js/tab-common.js"></script>
	<h2 class="primary">업무용승용차 손비처리 기준</h2>
	<div role="tabpanel">	
		<br/>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">개요</a></li>
			<li role="presentation"><a href="#enterprise" aria-controls="profile" role="tab" data-toggle="tab">법인 (상세안내)</a></li>
			<li role="presentation"><a href="#business" aria-controls="messages" role="tab" data-toggle="tab">개인사업자 (상세안내)</a></li>
		</ul>
		
		<div class="tab-content">
			<!-- 개요 -->
			<div role="tabpanel" class="tab-pane active" id="home">
				<br/><br/>
<!-- 				2016년부터 적용되기 시작한 업무용승용차 손비처리 기준[2021년1월 현재기준]은 아래와 같습니다.<br/><br/> -->
				업무용 승용차 손비처리 기준은 아래와 같습니다.<br/><br/>
				<h3>1. 적용대상차량</h3>
				<p class="desc-paragraph">
					소형승용, 중형승용, 대형승용, 8인승이하 RV, LPG 전용 일반승용차<br/>
					(경차, 9인승이상 차량, 화물은 제외 → 2016년 세법개정전과 동일한 방법으로 손비처리 가능)<br/>
					※ 렌트, 리스, 자가소유 차량 모두 해당됨.
				</p>
				
				<br/>
				<h3>2. 업무용승용차 관련비용</h3>
				<p class="desc-paragraph">
					감가상각비, 임차료, 유류비, 보험료, 수선비, 자동차세, 통행료 및 금융리스부채에 대한 이자 비용 등 업무용승용차의 취득, 유지를 위하여 지출한 비용
				</p>
				<br/>
				
				<h3>3. 비용 인정 기준</h3>
				<h4 class="desc-paragraph">① 업무전용자동차보험</h4>
				<table class="table desc-table table-bordered">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="30%"/>
						<col width="20%"/>
					</colgroup>
					<tr>
						<th rowspan="2"></th>
						<th rowspan="2">법인</th>
						<th colspan="2">개인 사업자</th>
					</tr>
					<tr>
						<th>성실신고확인대상자, 전문직업종(*) 사업자</th>
						<th>그 외 사업자</th>
					</tr>
					<tr>
						<th>보험 가입 상품</th>
						<td>
							<span class="primary-orange">업무전용자동차보험 가입</span><br/>
							미가입시 비용처리 불인정<br/>
							(단, 업무전용자동차보험을 일부 기간만 가입한 경우 가입한 일수만큼만 손비처리 가능)
						</td>
						<td>
							<span class="primary-orange">2021년1월1일 이후부터는 보유 업무용 승용차 중 1대를 제외한 나머지 차량은 업무전용자동차보험 가입</span><br/>
							미가입시 업무용승용차 업무사용 비율 금액의 50%만 필요 경비 인정 (단, 업무전용자동차보험을 일부 기간만 가입한 경우 가입한 일수만큼만 손비처리 가능)<br/>
						</td>
						<td rowspan="2" style="vertical-align: middle; text-align: center;">
							<span class="primary-orange">업무전용자동차보험<br/>가입할 필요 없음</span>
						</td>
					</tr>
					<tr>
						<th>운전자 범위(보험 보상 여부)</th>
						<td>
							업무전용자동차보험 가입 시<br>
							해당 법인의 임직원 또는 계약에 따라 해당 법인의 업무를 위하여 운전하는 사람, 해당 법인의 운전자 채용을 위한 면접에 응시한 지원자로 한정<br/>
							법인의 업무와 무관한 제3자(가족포함)는 운전 불가
						</td>
						<td>
							업무전용자동차보험 가입 시<br/>
							해당 사업자 및 직원 또는 계약에 따라 해당 사업과 관련한 업무를 위하여 운전하는 사람, 해당 사업과 관련한 업무상 운전자를 채용하기 위한 면접에 응시한 지원자로 한정<br/>
							업무전용자동차보험 가입시 업무와 무관한 제3자(가족포함)는 운전 불가
						</td>
					</tr>
				</table>
				<div style="text-align: left;">
					* 전문직업종 : 부가가치세 간이과세 배제 대상 업종(변호사업, 회계사업, 변리사업, 세무사업 등), 의료업, 수의업, 약사업 등
				</div>
				<br/>
				<div style="float: left;"><h4 class="desc-paragraph">② 운행기록부 작성</h4></div>
				<div style="text-align:right; position:relative; bottom:-15px;">※ 1년(12개월) 보유 또는 임차 기준</div>
				<table class="table desc-table table-bordered">
					<colgroup>
						<col width="50%"/>
						<col width="50%"/>
					</colgroup>
					<tr>
						<th>관련 비용 1500만원 이하</th>
						<th>관련 비용 1500만원 초과</th>
					</tr>
					<tr>
						<td style="vertical-align: middle;">
							작성하지 않아도 전액 비용처리 가능
						</td>
						<td>
							· 미작성시<br/>
							   1500만원 비용처리 가능(1500만원 초과분 비용처리 불가)<br/><br/>
							
							· 작성시<br/>
							   업무사용비율 (업무사용거리 ÷ 총주행거리)만큼 비용인정<br/>
							   ※ 계산된 비용인정금액이 1500만원 보다 적으면, 미작성 기준으로 비용처리 하는 것이 유리함<br/>
						</td>
					</tr>
					<tr>
						<td colspan="2">단, 손비처리가능 금액 중 감가상각비(감가상각비 상당액)는 해당사업연도에 800만원까지만 손금산입 가능, 
						초과금액은 이월하여 손금에 산입</td>
					</tr>

				</table>
				<br/>
				
				<h3>4. 업무용 승용차로 손금 인정을 못 받는 부분</h3>
				<p class="desc-paragraph">
					① 법인 : 차량이용자에게 상여 등으로 소득처분 (상여 등으로 소득처분한 금액은 사외유출로 보아
						법인의 손금으로 산입하지 않음)<br/>
					② 개인사업자 : 손비인정되지 않아 소득세 상승 효과 발생<br/>		
				</p><br><br>
				<span>※ 자세한 내용은 상단에 법인(상세안내), 개인사업자(상세안내) 탭을 참고하시기 바랍니다.</span>
			</div>
			
			<!-- 법인 -->
			<div role="tabpanel" class="tab-pane" id="enterprise">
				<br/><br/>
<!-- 				2016년부터 적용되기 시작한 업무용승용차 손비처리 기준[2021년1월 현재기준]은 아래와 같습니다.<br/><br/> -->
					업무용 승용차 손비처리 기준은 아래와 같습니다.<br/><br/>
				<h2>법인 고객</h2>
				<br/>
				<h3>1. 적용대상차량</h3>
				<p class="desc-paragraph">
					소형승용, 중형승용, 대형승용, 8인승이하 RV, LPG 전용 일반승용차<br/>
					(경차, 9인승이상 차량, 화물은 제외 → 2016년 세법개정전과 동일한 방법으로 손비처리 가능)<br/>
					※ 렌트, 리스, 자가소유 차량 모두 해당됨.
				</p>
				<br/>
				<h3>2. 업무용승용차 관련비용</h3>
				<p class="desc-paragraph">
					감가상각비, 임차료, 유류비, 보험료, 수선비, 자동차세, 통행료 및 금융리스부채에 대한 이자비용 등<br/>업무용 승용차의 취득, 유지를 위하여 지출한 비용(법인세법 시행령 제50조의2 제2항)
				</p>
				<br/>
				<h3>3. 비용 인정 기준</h3>
				<h4 class="desc-paragraph">(1) 업무전용자동차보험 가입</h4>
				<h5 class="desc-paragraph primary-orange">① 업무전용자동차보험에 가입하여야 비용처리가 가능합니다.</h5>
				<p class="desc-paragraph">
					- 법인 자가 소유차량 : 해당 사업연도 중 보유한 기간동안 가입<br/>
    				- 장기렌트, 리스차량 : 해당 사업연도 중 임차한 기간동안 가입<br/>
					단, 업무전용자동차보험을 일부 기간만 가입한 경우 가입한 일수만큼만 손비처리 가능
				</p>
				<br/>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트 이용 시 업무전용자동차보험에 가입하면 운전자 범위는 어떻게 되나요?</div>
					<div class="panel-body">
						① 임차 법인 소속의 임원 또는 직원<br/>
						② 계약에 따라 해당 법인의 업무를 위하여 운전하는 사람<br/>
						③ 해당 법인의 운전자 채용을 위한 면접에 응시한 지원자<br/>
						* 리스나 법인 자가 소유차량의 경우에도 운전자 범위는 동일합니다.
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 1년을 장기렌트로 이용하던 중 200일 동안만 업무전용자동차보험에 가입한 경우 비용처리는 어떻게 되나요?</div>
					<div class="panel-body">
						업무전용자동차보험을 사업연도 중 일부 기간만 가입한 경우에 해당 사업연도의 업무용승용차 관련비용에 업무전용자동차보험 의무가입일수에서 업무전용자동차보험 실제 가입일수가 차지하는 비율을 곱한 금액을 업무사용금액으로 비용처리 가능합니다. (법인세법 시행령 제50조의 2 제9항)<br/>
						* 업무사용금액 = 업무용승용차 관련비용 × 업무사용비율 × 200일/365일

					</div>
				</div>
				<p class="desc-paragraph">
					② 업무전용자동차보험에 가입하지 않은 경우에는 업무용 승용차 관련비용의 손비처리가 불가능합니다.
				</p>
				<br/>
				<h4 class="desc-paragraph">(2) 운행기록부 작성</h4>
				<h5 class="desc-paragraph">① 작성한 경우</h5>
				<p class="desc-paragraph">
					 국세청 고시 양식에 따라 운행기록부를 작성할 경우에는 총 주행거리 중 업무용 사용거리 비율만큼 손금산입<br/>
					 ※ 업무용 사용거리 : 제조·판매시설 등 해당 법인의 사업장 방문, 거래처·대리점 방문, 회의참석, 판촉활동, 출·퇴근등 직무와 관련된 업무수행을 위하여 주행한 거리<br/>
				</p>
				<h5 class="desc-paragraph">② 작성하지 않은 경우</h5>
				<p class="desc-paragraph">
					- 관련비용 총액이 연간 1천5백만원 이하인 경우에는 전액 비용처리 가능<br/>
    				- 관련비용 총액이 연간 1천5백만원을 넘는 경우에는 [1천5백만원 ÷ 총비용]을 업무용 사용비율로 보며 1천5백만원까지만 손금 산입함<br/>
    				※ 차량 운행기록부 작성없이 손금인정이 가능한 업무용승용차 관련비용 기준 상향 조정 : 연간 1000만원 限 → 연간 1500만원 限 [법인세법 시행령 제50조의2제7항 개정 2020.2]
				</p>
				<br/>
				<h4 class="desc-paragraph">(3) 해당사업연도의 업무용승용차 보유기간 또는 임차기간 월수에 따른 손금 인정 한도</h4>
				<p class="desc-paragraph">
					- 업무용승용차 비용처리 관련하여 운행기록 등을 작성하지 아니한 경우 손금인정 한도(1500만원限) 및 감가상각에 대한 손금산입 한도(800만원限)에 대해 해당사업연도의 업무용 차량 보유기간 또는 임차기간 월수를 고려하여 계산<!--  [법인세법 제27조의2 제3항, 개정2017.12.19],  [법인세법 시행령 제50조의2 제7항, 개정 2018.2.13] -->
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 운행기록부를 작성하지 않는 회사인데, 해당 사업연도 중 7월1일부터 12월31일까지 장기렌트 이용했을 경우 업무용승용차 손금인정 한도는 어떻게 되나요?</div>
					<div class="panel-body">
						* 업무용승용차 관련비용 한도 : 1500만원限 × 6개월/12개월 → 750만원 限<br/>
						* 업무용승용차 관련비용 중 감가상각비 상당액에 대한 손금산입 한도: 800만원限 × 6개월/12개월 → 400만원 限
					</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(4) 업무용승용차 감가상각 년한 의무화 (구입의 경우에 적용됨)</h4>
				<p class="desc-paragraph">
					2016년 1월 1일 이후 구입한 승용차는 내용년수 5년, 정액법으로 감가상각
				</p>
				<br/>
				<h4 class="desc-paragraph">(5) 임차료 중 감가상각비 상당액 산정 기준 (장기렌트, 리스)</h4>
				<p class="desc-paragraph">
					- 장기렌트 : 임차료의 70%<br/>
					- 캐피탈사 리스 : 리스료에서 보험료, 자동차세, 수선유지비를 차감한 금액.<br/>
					※ 아마존카 리스 : 임차료의 70%
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 감가상각비 상당액은 무엇인가요?</div>
					<div class="panel-body">
						감가상각비에 준하는 금액이라는 말입니다. 구입의 경우에는 자동차를 재무제표상 자산으로 잡고, 매년 감가상각비만큼 손비처리합니다.<br/>
						장기렌트나 리스의 경우에는 임차료 중 감가상각비가 얼마나 되는지 명확하지 않은 상태로 임차료 총액을 손비처리하고 있었습니다.<br/>
						세법개정(감가상각비는 연간 최대 800만원까지만 손금산입 가능)으로 장기렌트나 리스의 경우에도 임차료 중 감가상각비 비중이 얼마나 되는지 산정할 필요가 생겨서 만든 개념입니다.
					</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(6) 감가상각비(감가상각비 상당액) 손금산입 한도: 연간 800만원</h4>
				<p class="desc-paragraph">
					손비처리가능 금액 중 감가상각비(감가상각비 상당액)는 매년 800만원까지만 손금산입하고, 초과금액은 이월하여 손금산입
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트(해당사업연도 1년 전체기간 동안 임차 & 업무전용자동차보험 가입)의 연간 감가상각비 상당액이 1200만원(연간 임차료총액(1714만원)×70%)일 경우, 업무사용비율이 80%인 경우 이월되는 감가상각비 상당액은 얼마인가요?</div>
					<div class="panel-body">
						※ 구체적인 계산사례는 첨부한 업무용승용차 관련비용 손금산입 사례를 참고&nbsp;&nbsp;
						<a href="/resources/files/handle_exp_ex4.pdf" target="_new"><span class="label label-success" style="font-size:12px;font-weight:300;">손금산입 사례보기</span></a><br/>
						 ① 먼저 손비처리 가능한 감가상각비 상당액을 계산합니다.<br/>
						(연간 감가상각비 상당액 × 업무사용비율 : 1200만원 × 80% = 960만원)<br/>
						 ② 손비처리 가능한 감가상각비 상당액 960만원 중 800만원은 당해에 손비처리하고, 160만원은 차기 년도로 이월하여 손비처리합니다.
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 이월된 감가상각비 상당액 한도 초과금 160만원은 어떻게 비용처리 되나요?</div>
					<div class="panel-body">
						이월된 160만원을 다음연도 해당차량의 손비처리 가능한 감가상각비 상당액에 포함하여 800만원까지만 비용처리 되고, 초과금은 그 다음연도로 이월됩니다.
					</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(7) 부동산임대업을 주된 사업으로 하는 내국법인 손금산입 범위 제한</h4>
				<p class="desc-paragraph">
					부동산임대업을 주업으로 하는 특정법인의 업무용승용차 관련비용 손금산입 범위를 제한하기 위하여 해당 법인이 업무용승용차 운행기록을 작성하지 아니하는 경우 손금산입 한도를 1천5백만원에서 500만원으로 축소하고, 감가상각비(감가상각비 상당액)의 한도와 업무용승용차 처분손실 손금산입 한도를 각각 800만원에서 400만원으로 축소함.<br/><!--  법인세법 제27조의2 제5항[신설 2016.12.20], 법인세법 시행령 제50조의2 제15항[신설 2017.2.3] -->
					* 부동산임대업을 주업으로 하는 특정법인의 요건은 법인세법 시행령 제39조제3항<!-- [신설 2017.2.3] --> 참조
				</p>
				<br/>
				<h4 class="desc-paragraph">(8) 업무용승용차 관련비용 명세서 제출</h4>
				<p class="desc-paragraph">
					업무용승용차 관련비용을 손금에 산입하는 경우 매년 세무서에 제출<br/>
					※ 서식은 법인세법 시행규칙 [별지 제29호서식] 참조
				</p>
				<br/>
				<h3>4. 업무용승용차로 손금인정을 못 받는 부분은</h3>
				<p class="desc-paragraph">
					사적 사용분으로 보아 사용자에게 상여 등으로 소득처분<br/>
					(상여 등으로 소득처분한 금액은 사외유출로 보아 법인의 손금으로 산입하지 않음)<br/>
					※ 법인세법 시행령 제106조 제1항 제1호
				</p>
				<br/>
				<h3>5. 업무용승용차 관련비용 손금 산입 사례</h3>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트를 이용할 경우, 감가상각비 상당액을 포함한 관련비용의 처리는 어떻게 해야 하나요?</div>
					<div class="panel-body">
						업무용승용차 관련비용 손금산입 사례를 참고하시면 됩니다.&nbsp;&nbsp;
						<a href="/resources/files/handle_exp_ex4.pdf" target="_new"><span class="label label-success" style="font-size:12px;font-weight:300;">손금산입 사례보기</span></a>
					</div>
				</div>
				<p class="desc-paragraph">
					※ 관련 법령의 유권 해석은 본 안내문과 일부 차이가 있을 수 있습니다.<br/>
					※ 구체적으로 어떻게 손비처리할 지에 대해서는 회사 담당회계사에게 문의해 주시기 바랍니다.
				</p>
			</div>
			
			<!-- 개인사업자 -->
			<div role="tabpanel" class="tab-pane" id="business">
				<br/><br/>
<!-- 				2016년부터 적용되기 시작한 업무용승용차 손비처리 기준[2021년1월 현재기준]은 아래와 같습니다.<br/><br/> -->
				업무용 승용차 손비처리 기준은 아래와 같습니다.<br/><br/>
				<h2>개인사업자 고객</h2>
				<br/>
				<h3>1. 적용대상차량</h3>
				<p class="desc-paragraph">
					소형승용, 중형승용, 대형승용, 8인승이하 RV, LPG 전용 일반승용차<br/>
					(경차, 9인승이상 차량, 화물은 제외 → 2016년 세법개정전과 동일한 방법으로 손비처리 가능)<br/>
					※ 렌트, 리스, 자가소유 차량 모두 해당됨.
				</p>
				<br/>
				<h3>2. 업무용승용차 관련비용</h3>
				<p class="desc-paragraph">
					감가상각비, 임차료, 유류비, 보험료, 수선비, 자동차세, 통행료 및 금융리스부채에 대한 이자비용 등 업무용승용차의 취득, 유지를 위하여 지출한 비용<br/>(소득세법 시행령 제78조의3 제2항)
				</p>
				<br/>
				<h3>3. 적용대상 사업자</h3>
				<table class="table desc-table table-bordered">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="50%"/>
					</colgroup>
					<tr>
						<th colspan='2'>사업자 구분</th>
						<th>적용 내용</th>
					</tr>
					<tr>
						<td rowspan='2' style='text-align: center; vertical-align: middle; border-left: 2px solid; border-top: 2px solid; border-bottom: 2px solid;'>복식부기의무자</td>
						<td style='text-align: center; vertical-align: middle; border-top: 2px solid;'>성실신고대상확인자,<br>전문직종 사업자</td>
						<td style='border-top: 2px solid; border-right: 2px solid;'>1. 업무전용자동차보험 가입<br>
						사업자별 1대를 제외한 나머지 차량은 업무전용자동차보험에 가입해야 업무용 사용비율에 따른 업무사용 비율 금액 전부를 필요경비로 인정 받을 수 있고, 업무전용자동차보험 미가입 시에는 업무사용 비율 금액의 50%만 필요경비로 인정됨.<br>
						2. 운행기록부 작성시 업무사용비율만큼 업무용승용차 관련비용 손금 산입<br>
						3. 운행기록부 미작성시 업무용승용차 관련비용은 연간 1500만원까지만 손금 산입 가능
						</td>
					</tr>
					<tr>
						<td style='text-align: center; vertical-align: middle; border-bottom: 2px solid;'>성실신고대상확인자 및<br>전문직종 사업자 <span style='font-weight: bold; font-size: 16px;'>外</span></td>
						<td style='border-bottom: 2px solid; border-right: 2px solid;'>1. 업무전용자동차보험 가입할 필요 없음<br>
						2. 운행기록부 작성시 업무사용비율만큼 업무용승용차 관련비용 손금 산입<br>
						3. 운행기록부 미작성시 업무용승용차 관련비용은 연간 1500만원까지만 손금 산입 가능<br>
						</td>
					</tr>
					<tr>
						<td style='text-align: center; vertical-align: middle;'>복식부기의무자 <span style='font-weight: bold; font-size: 16px;'>外</span></td>
						<td style='text-align: center; vertical-align: middle;'>간편장부 적용대상자,<br>추계신고자</td>
						<td>1. 업무전용자동차보험 가입할 필요 없음<br>
						2. 운행기록부 작성할 필요 없음<br>
						3. 업무용승용차 관련비용 한도 없음<br>
						<span style='font-weight: bold;'>※ 2016년부터 적용되기 시작한 업무용승용차 손비처리 법규 적용대상이 아님</span>
						</td>
					</tr>
				</table>
				
				<p style='margin-top: 30px; font-size: 16px;'>※ 참고</p>
				<div class="panel panel-default">
					<div class="panel-body">
						① 복식부기의무자(직전년도 연간 수입금액이 아래 금액 이상인 사업자)<br/>
						- 농어업, 광업, 도소매업 등: 3억원 이상<br/>
						- 제조업, 숙박업, 음식점업 등: 1.5억원 이상<br/>
						- 부동산업, 서비스업 등: 7500만원 이상<br/>
						<br/>
						
						② 성실신고확인대상자(직전년도 연간 수입금액이 아래 금액 이상인 사업자)<br/>
						- 농어업, 광업, 도소매업 등: 15억원 이상<br/>
						- 제조업, 숙박업, 음식점업 등: 7.5억원 이상<br/>
						- 부동산업, 서비스업 등: 5억원 이상<br/><br/>
						
						③ 전문직업종: 부가가치세 간이과세 배제 대상 업종(변호사업, 회계사업, 변리사업, 세무사업 등), 의료업, 수의업, 약사업 등<br/>
					</div>
				</div>
				<br/>
				<h3>4. 비용 인정 기준</h3>
				<!-- <h4 class="desc-paragraph primary-orange">(1) 개인사업자의 경우 업무전용자동차보험에 가입하지 않아도 손비처리 가능합니다.<br/></h4> -->
				<h4 class="desc-paragraph">(1) 업무전용자동차보험 가입</h4>
				<p class="desc-paragraph">
					<span class="primary-orange">① 성실신고확인대상자, 전문직업종 사업자는 업무전용자동차보험에 가입하여야 합니다.</span><br>
					소득세법 시행령 제78조의3(업무용승용차 관련비용 등의 필요경비 불산입 특례) 제4항 단서 [신설 2020.02]
				</p>
				<h5 class="desc-paragraph"><span class="primary-orange">- 사업자별 1대는 업무전용자동차보험 가입대상에서 제외, 1대를 제외한 나머지 차량 업무전용자동차보험 미가입 시 업무사용 비율 금액의 50%만 인정</span></h5>
				<h5 class="desc-paragraph"><span class="primary-orange">- 시행시기: 2021년 1월 1일 이후 업무용승용차 관련 지출 분부터 적용</span></h5>
<!-- 				<p class="desc-paragraph">* 전문직업종 : 부가가치세 간이과세 배제 대상 업종(변호사업, 회계사업, 변리사업, 세무사업 등), 의료업, 수의업, 약사업 등</p> -->
				<br>
				<p class="desc-paragraph">
					- 개인사업자 자가 소유차량 : 해당 사업연도 중 보유한 기간동안 가입
					<br>
					- 장기렌트, 리스차량 : 해당 사업연도 중 임차한 기간동안 가입
					<br>
					단, 업무전용자동차보험을 일부 기간만 가입한 경우 가입한 일수만큼만 손비처리 가능	
				</p>
				<br>
				<p class="desc-paragraph">
					※ 2021년限 업무용승용차 보험가입에 관한 특례<br>
					(소득세법 시행령 제 30395호 부칙 제28조의2 신설 2021.2.17)<br>
					① 2021년 1월 1일 이후 기존에 가입했던 자동차 보험의 만기가 도래하여 2021년 1월 1일 이후에 업무전용자동차보험에 가입하게 되는 경우와 
					② 2021년 1월 1일 전에 가입했던 자동차 보험(2021년 1월 1일 이후 만기가 도래하는 보험으로 한정한다)의 만기가 도래하기 이전에 업무용승용차를 처분하거나 임차계약이 종료된 경우
					2021년 1월 1일부터 업무전용자동차보험에 가입한 것으로 본다. 
				</p>
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트 이용 시 업무전용자동차보험에 가입하면 운전자 범위는 어떻게 되나요?</div>
					<div class="panel-body">
						① 임차 사업자 및 그 직원<br/>
						② 계약에 따라 해당 사업과 관련한 업무를 위하여 운전하는 사람<br/>
						③ 해당 사업과 관련한 업무상 운전자를 채용하기 위한 면접에 응시한 지원자<br/>
						* 리스나 개인사업자 자가 소유차량의 경우에도 운전자 범위는 동일합니다.
					</div>
				</div>
				<br/>
				<p class="desc-paragraph">
					<span style='font-weight: bold;'>② 위 해당 사업자를 제외한 나머지 사업자는 기존처럼 업무전용자동차보험에 가입하지 않아도 손비처리 가능합니다.</span>
				</p>
				<br>
				<h4 class="desc-paragraph">(2) 운행기록부 작성</h4>
				<h5 class="desc-paragraph">① 작성한 경우</h5>
				<p class="desc-paragraph">
					 국세청 고시 양식에 따라 운행기록부를 작성할 경우에는 총 주행거리 중 업무용 사용거리 비율만큼 손금산입<br/>
					 ※ 업무용 사용거리 : 제조·판매시설 등 해당 사업자의 사업장 방문, 거래처·대리점 방문, 회의참석, 판촉활동, 출·퇴근등 직무와 관련된 업무수행을 위하여 주행한 거리<br/>
				</p>
				<h5 class="desc-paragraph">② 작성하지 않은 경우</h5>
				<p class="desc-paragraph">
					- 관련비용 총액이 연간 1천5백만원 이하인 경우에는 전액 비용처리 가능<br/>
    				- 관련비용 총액이 연간 1천5백만원을 넘는 경우에는 [1천5백만원 ÷ 총비용]을 업무용 사용비율로 보며 1천5백만원까지만 손금 산입함<br/>
    				※ 차량 운행기록부 작성없이 손금인정이 가능한 업무용승용차 관련비용 기준 상향 조정 : 연간 1000만원 限 → 연간 1500만원 限 [소득세법 시행령 제78조의3 제7항 개정 2020.2]    				
				</p>
				<br/>
				<h4 class="desc-paragraph">(3) 해당사업연도의 업무용승용차 보유기간 또는 임차기간 월수에 따른 손금 인정 한도</h4>
				<p class="desc-paragraph">
					- 업무용승용차 비용처리 관련하여 운행기록 등을 작성하지 아니한 경우 손금인정 한도(1500만원限) 및 감가상각에 대한 손금산입 한도(800만원限)에 대해 해당사업연도의 업무용 차량 보유기간 또는 임차기간 월수를 고려하여 계산<!--  [소득세법 제33조의2 제2항, 2017.12.19 개정], [소득세법 시행령 제78조의3 제6항, 개정 2018.2.13] -->
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 운행기록부를 작성하지 않는 회사인데, 해당 사업년도 중 7월1일부터 12월31일까지 장기렌트 이용했을 경우 업무용승용차 손금인정 한도는 어떻게 되나요?</div>
					<div class="panel-body">
						* 업무용승용차 관련비용 한도 : 1500만원限 × 6개월/12개월 → 750만원 限<br/>
						* 업무용승용차 관련비용 중 감가상각비 상당액에 대한 손금산입 한도: 800만원限 × 6개월/12개월 → 400만원 限</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(4) 업무용승용차 감가상각 년한 의무화 (구입의 경우에 적용됨)</h4>
				<p class="desc-paragraph">
					2016년 1월 1일 이후 구입한 승용차는 내용년수 5년, 정액법으로 감가상각
				</p>
				<br/>
				<h4 class="desc-paragraph">(5) 임차료 중 감가상각비 상당액 산정 기준 (장기렌트, 리스)</h4>
				<p class="desc-paragraph">
					- 장기렌트 : 임차료의 70%<br/>
					- 캐피탈사 리스 : 리스료에서 보험료, 자동차세, 수선유지비를 차감한 금액<br/>
					※ 아마존카 리스 : 임차료의 70%
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 감가상각비 상당액은 무엇인가요?</div>
					<div class="panel-body">
						감가상각비에 준하는 금액이라는 말입니다. 구입의 경우에는 자동차를 재무제표상 자산으로 잡고, 매년 감가상각비만큼 손비처리합니다.<br/>
						장기렌트나 리스의 경우에는 임차료 중 감가상각비가 얼마나 되는지 명확하지 않은 상태로 임차료 총액을 손비처리하고 있었습니다.<br/>
						세법개정(감가상각비는 연간 최대 800만원까지만 손금산입 가능)으로 장기렌트나 리스의 경우에도<br/>임차료 중 감가상각비 비중이 얼마나 되는지 산정할 필요가 생겨서 만든 개념입니다.
					</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(6) 감가상각비(감가상각비 상당액) 손금산입 한도: 연간 800만원</h4>
				<p class="desc-paragraph">
					손비처리가능 금액 중 감가상각비(감가상각비 상당액)는 매년 800만원까지만 손금산입하고, 초과금액은 이월하여 손금산입
				</p>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트(해당사업연도 1년 전체기간 동안 임차)의 연간 감가상각비 상당액이 1200만원(연간 임차료총액(1714만원)×70%)일 경우, 업무사용비율이 80%인 경우 이월되는 감가상각비 상당액은 얼마인가요?</div>
					<div class="panel-body">
						※ 구체적인 계산사례는 첨부한 업무용승용차 관련비용 손금산입 사례를 참고&nbsp;&nbsp;
						<a href="/resources/files/handle_exp_ex4.pdf" target="_new"><span class="label label-success" style="font-size:12px;font-weight:300;">손금산입 사례보기</span></a><br/>
						 ① 먼저 손비처리 가능한 감가상각비 상당액을 계산합니다.<br/>
						(연간 감가상각비 상당액 × 업무사용비율 : 1200만원 × 80% = 960만원)<br/>
						 ② 손비처리 가능한 감가상각비 상당액 960만원 중 800만원은 당해에 손비처리하고, 160만원은 차기 년도로 이월하여 손비처리합니다.
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">Q. 이월된 감가상각비 상당액 한도 초과금 160만원은 어떻게 비용처리 되나요?</div>
					<div class="panel-body">
						이월된 160만원을 다음연도 해당차량의 손비처리 가능한 감가상각비 상당액에 포함하여 800만원까지만 비용처리 되고, 초과금은 그 다음연도로 이월됩니다.
					</div>
				</div>
				<br/>
				<h4 class="desc-paragraph">(7) 업무용승용차 관련비용 명세서 제출</h4>
				<p class="desc-paragraph">
					업무용승용차 관련비용을 손금에 산입하는 경우 매년 세무서에 제출<br/>
					※ 서식은 소득세법 시행규칙 [별지 제63호서식] 참조
				</p>
				<br/>
				<h3>5. 매각이익 과세처분</h3>
				<p class="desc-paragraph">
					구입한 승용차를 손비처리한 경우에는 개인사업자도 해당차량 매각시 매각이익에 대해서 과세처분함 (소득세법 제19조제1항 제20호<!--  신설 -->)<br/> 
					- 복식부기의무자가 사업용 유형고정자산을 양도하는 경우, 차량 및 운반구 등 모든 사업용 유형고정자산(양도소득으로 과세되는 부동산은 제외)의 처분손익을 사업소득으로 과세함<br/>
					※ 매각이익 = 차량매각가격 - 매각시점 장부가격
				</p>
				<br/>
				
				<!-- <h3>5. 시행시기 및 적용대상</h3> -->
				<!-- <h3>5. 적용대상</h3> -->
				<h3>6. 업무용승용차 관련비용 손금 산입 사례</h3>
				<!-- <p class="desc-paragraph">
					성실신고확인대상 개인사업자 : 2016년 1월 1일분부터 적용<br/>
					복식부기의무 개인사업자 : 2017년 1월 1일분부터 적용<br/>
					※ 성실신고확인대상자 (복식부기 의무 개인사업자 중 연간 수입금액이 아래 금액 이상인 사업자)<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 농어업, 광업, 도소매업 등 : 20억원 이상<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 제조업, 숙박업식점업 등 : 10억원 이상<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 부동산업, 서비스업 등 : 5억원 이상<br/>
					※ 복식부기의무자(연간 수입 금액이 아래 금액 이상인 사업자)<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 농어업, 광업, 도소매업 등 : 3억원 이상<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 제조업, 숙박업식점업 등 : 1.5억원 이상<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- 부동산업, 서비스업 등 : 7500만원 이상<br/>
					<span style="font-weight:bold; font-size: 16px;">※ 간편장부 적용대상자, 추계신고자 등 소규모 사업자는 적용 제외</span>
				</p> -->
				<div class="panel panel-default">
					<div class="panel-heading">Q. 장기렌트를 이용할 경우, 감가상각비 상당액을 포함한 관련비용의 처리는 어떻게 해야 하나요?</div>
					<div class="panel-body">
						첨부한 업무용승용차 관련비용 손금산입 사례를 참고하시면 됩니다.&nbsp;&nbsp;
						<a href="/resources/files/handle_exp_ex4.pdf" target="_new"><span class="label label-success" style="font-size:12px;font-weight:300;">손금산입 사례보기</span></a><br/>
					</div>
				</div>
				<p class="desc-paragraph">
					※ 관련 법령의 유권해석은 본 안내문과 일부 차이가 있을 수 있습니다.<br/>
					※ 구체적으로 어떻게 손비처리할지에 대해서는 회사 담당회계사에게 문의해 주시기 바랍니다.
				</p>
			</div>
		</div>
	</div>
</t:genericpage>