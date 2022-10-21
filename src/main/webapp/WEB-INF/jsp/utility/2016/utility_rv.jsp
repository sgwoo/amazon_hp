<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<script src="/resources/js/tab-common.js"></script>
<div class="desc-container">
	<h2 class="primary">장기렌트 효용지수 <small><span class="glyphicon glyphicon-question-sign info-modal-btn primary" data-toggle="modal" data-target="#utility-modal"></span></small>
	</h2><br/>
	<div class="amazon-tabs">
		<a href="/utility/2016/domestic"><div class="amazon-tab">국산승용차</div></a>
		<a href="/utility/2016/rv"><div class="amazon-tab active">국산 RV차</div></a>
		<a href="/utility/2016/imports"><div class="amazon-tab">수입차</div></a>
	</div>
	<BR/>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#rv1" aria-controls="rv1" role="tab" data-toggle="tab">RV1(소형)</a></li>
		<li role="presentation"><a href="#rv2" aria-controls="rv2" role="tab" data-toggle="tab">RV2(중대형)</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- rv1(소형) -->
		<div role="tabpanel" class="tab-pane active" id="small">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">RV1(소형)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_rv_201606_01.png"/><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">RV1(소형)</span></h3><br/>
			<table class="table desc-table table-bordered">
				<thead>
					<tr>
						<th rowspan="3">순위</th>
						<th rowspan="3">차명</th>
						<th rowspan="3">연료</th>
						<th rowspan="2">차량가격<br/>(가격표 기준)</th>
						<th rowspan="2">제조사 할인</th>
						<th>할인 후 차가</th>
						<th>월 대여료(36개월)</th>
						<th>차가÷<br/>월대여료</th>
						<th>장기렌트 효용지수</th>
					</tr>
					<tr>
						<th>A</th>
						<th>B</th>
						<th>C</th>
						<th>D</th>
					</tr>
					<tr>
						<th colspan="4">단위:만원</th>
						<th>=A÷B</th>
						<th>=(C÷C값 평균)x100</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="3"><b>RV1(소형) 평균</b></td>
						<td class="text-right"><b>2312.9 </b></td>
						<td class="text-right"><b>-56.7</b></td>
						<td class="text-right"><b>2256.3</b></td>
						<td class="text-right"><b>44.3</b></td>
						<td class="text-right"><b>51.0</b></td>
						<td class="text-centerbg02"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td class="">올뉴투싼 1.7 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2408</td>
						<td class="text-right">0</td>
						<td class="text-right">2408</td>
						<td class="text-right">44.1</td>
						<td class="text-right">54.7</td>
						<td class="text-centerbg02">107.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td class="">스포티지 1.7    디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2351</td>
						<td class="text-right">-46</td>
						<td class="text-right">2306</td>
						<td class="text-right">42.2</td>
						<td class="text-right">54.6</td>
						<td class="text-centerbg02">107.2</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td class="">스포티지 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2577</td>
						<td class="text-right">-49</td>
						<td class="text-right">2528</td>
						<td class="text-right">46.5</td>
						<td class="text-right">54.3</td>
						<td class="text-centerbg02">106.6</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td class="">올뉴투싼 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2511</td>
						<td class="text-right">0</td>
						<td class="text-right">2511</td>
						<td class="text-right">46.8</td>
						<td class="text-right">53.7</td>
						<td class="text-centerbg02">105.3</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td class="">올뉴투싼 1.6 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2310</td>
						<td class="text-right">0</td>
						<td class="text-right">2310</td>
						<td class="text-right">44.1</td>
						<td class="text-right">52.4</td>
						<td class="text-centerbg02">102.7</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td class="">QM3 1.5 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2388</td>
						<td class="text-right">-192</td>
						<td class="text-right">2196</td>
						<td class="text-right">42.3</td>
						<td class="text-right">51.9</td>
						<td class="text-centerbg02">101.8</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td class="">티볼리 1.6 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2160</td>
						<td class="text-right">-10</td>
						<td class="text-right">2150</td>
						<td class="text-right">41.5</td>
						<td class="text-right">51.9</td>
						<td class="text-centerbg02">101.7</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td class="">티볼리 1.6 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">1859</td>
						<td class="text-right">-20</td>
						<td class="text-right">1839</td>
						<td class="text-right">37.0</td>
						<td class="text-right">49.7</td>
						<td class="text-centerbg02">97.5</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td class="">올란도 1.6 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2395</td>
						<td class="text-right">-140</td>
						<td class="text-right">2255</td>
						<td class="text-right">46.4</td>
						<td class="text-right">48.7</td>
						<td class="text-centerbg02">95.4</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td class="">코란도C 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2403</td>
						<td class="text-right">-84</td>
						<td class="text-right">2319</td>
						<td class="text-right">48.7</td>
						<td class="text-right">47.6</td>
						<td class="text-centerbg02">93.4</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td class="">QM5 2.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2334</td>
						<td class="text-right">-140</td>
						<td class="text-right">2194</td>
						<td class="text-right">47.3</td>
						<td class="text-right">46.4</td>
						<td class="text-centerbg02">91.0</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td class="">올뉴 카렌스 2.0 LPI(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2062</td>
						<td class="text-right">0</td>
						<td class="text-right">2062</td>
						<td class="text-right">44.8</td>
						<td class="text-right">46.0</td>
						<td class="text-centerbg02">90.3</td>
					</tr>				
				</tbody>
			</table>
			<small>※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년, 홈페이지 월대여료 차종별/엔진별 평균값 기준</small><br/><br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">RV1(소형)</span></h3><br/>
			<table class="table desc-table table-bordered">
				<thead>
					<tr>
						<th rowspan="3">순위</th>
						<th rowspan="3">차명</th>
						<th rowspan="3">연료</th>
						<th rowspan="2">차량가격<br/>(가격표 기준)</th>
						<th rowspan="2">제조사 할인</th>
						<th>할인 후 차가</th>
						<th>월 대여료(36개월)</th>
						<th>차가÷<br/>월대여료</th>
						<th>장기렌트 효용지수</th>
					</tr>
					<tr>
						<th>A</th>
						<th>B</th>
						<th>C</th>
						<th>D</th>
					</tr>
					<tr>
						<th colspan="4">단위:만원</th>
						<th>=A÷B</th>
						<th>=(C÷C값 평균)x100</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="3"><b>RV1(소형) 평균</b></td>
						<td class="text-right"><b>2312.9 </b></td>
						<td class="text-right"><b>-56.7</b></td>
						<td class="text-right"><b>2256.3</b></td>
						<td class="text-right"><b>44.3</b></td>
						<td class="text-right"><b>51.0</b></td>
						<td class="text-center"><b>100.0</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">1</td>
						<td>올뉴투싼 디젤 e-VGT UⅡ-1.7 Style(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2297</td>
						<td class="text-right">0</td>
						<td class="text-right">2297</td>
						<td class="text-right">42.3</td>
						<td class="text-right">54.3</td>
						<td class="text-center bold">106.5</td>
					</tr>
					<tr>
						<td>올뉴투싼 디젤 e-VGT UⅡ-1.7 Modern(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2518</td>
						<td class="text-right">0</td>
						<td class="text-right">2518</td>
						<td class="text-right">45.8</td>
						<td class="text-right">55.0</td>
						<td class="text-center bold">107.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴투싼 1.7 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2408</td>
						<td class="text-right"><span class="text-right">0</span></td>
						<td class="text-right">2408</td>
						<td class="text-right">44.1</td>
						<td class="text-right">54.7</td>
						<td class="text-center bold">107.2</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">2</td>
						<td>스포티지 디젤 U2 1.7 2WD 트렌디</td>
						<td class="text-center">경유</td>
						<td class="text-right">2253</td>
						<td class="text-right">-44</td>
						<td class="text-right">2209</td>
						<td class="text-right">40.7</td>
						<td class="text-right">54.3</td>
						<td class="text-center bold">106.4</td>
					</tr>
					<tr>
						<td>스포티지 디젤 U2 1.7 2WD 노블레스</td>
						<td class="text-center">경유</td>
						<td class="text-right">2449</td>
						<td class="text-right">-47</td>
						<td class="text-right">2402</td>
						<td class="text-right">43.7</td>
						<td class="text-right">55.0</td>
						<td class="text-center bold">107.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">스포티지 1.7 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2351</td>
						<td class="text-right">-46</td>
						<td class="text-right">2306</td>
						<td class="text-right">42.2</td>
						<td class="text-right">54.6</td>
						<td class="text-center bold">107.2</td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">3</td>
						<td>스포티지 디젤 R2.0 2WD 트렌디 A/T</td>
						<td class="text-center">경유</td>
						<td class="text-right">2346</td>
						<td class="text-right">-45</td>
						<td class="text-right">2301</td>
						<td class="text-right">42.8</td>
						<td class="text-right">53.8</td>
						<td class="text-center bold">105.4</td>
					</tr>
					<tr>
						<td>스포티지 디젤 R2.0 2WD 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">2518</td>
						<td class="text-right">-48</td>
						<td class="text-right">2470</td>
						<td class="text-right">45.4</td>
						<td class="text-right">54.4</td>
						<td class="text-center bold">106.7</td>
					</tr>
					<tr>
						<td>스포티지 디젤 R2.0 2WD 노블레스</td>
						<td class="text-center">경유</td>
						<td class="text-right">2601</td>
						<td class="text-right">-49</td>
						<td class="text-right">2552</td>
						<td class="text-right">46.6</td>
						<td class="text-right">54.8</td>
						<td class="text-center bold">107.4</td>
					</tr>
					<tr>
						<td>스포티지 디젤 R2.0 2WD 노블레스 스페셜</td>
						<td class="text-center">경유</td>
						<td class="text-right">2842</td>
						<td class="text-right">-52</td>
						<td class="text-right">2790</td>
						<td class="text-right">51.3</td>
						<td class="text-right">54.4</td>
						<td class="text-center bold">106.7</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">스포티지 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2577</td>
						<td class="text-right">-49</td>
						<td class="text-right">2528</td>
						<td class="text-right">46.5</td>
						<td class="text-right">54.3</td>
						<td class="text-center bold">106.6</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">4</td>
						<td>올뉴투싼 디젤 e-VGT R2.0 Style(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2376</td>
						<td class="text-right">0</td>
						<td class="text-right">2376</td>
						<td class="text-right">44.9</td>
						<td class="text-right">52.9</td>
						<td class="text-center bold">103.8</td>
					</tr>
					<tr>
						<td>올뉴투싼 디젤 e-VGT R2.0 Modern(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2646</td>
						<td class="text-right">0</td>
						<td class="text-right">2646</td>
						<td class="text-right">48.6</td>
						<td class="text-right">54.4</td>
						<td class="text-center bold">106.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴투싼 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2511</td>
						<td class="text-right">0</td>
						<td class="text-right">2511</td>
						<td class="text-right">46.8</td>
						<td class="text-right">53.7</td>
						<td class="text-center bold">105.3</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">5</td>
						<td>올뉴투싼 가솔린 1.6T Style(2WD)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2199</td>
						<td class="text-right">0</td>
						<td class="text-right">2199</td>
						<td class="text-right">42.3</td>
						<td class="text-right">52.0</td>
						<td class="text-center bold">102.0</td>
					</tr>
					<tr>
						<td>올뉴투싼 가솔린 1.6T Modern(2WD)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2420</td>
						<td class="text-right">0</td>
						<td class="text-right">2420</td>
						<td class="text-right">45.9</td>
						<td class="text-right">52.7</td>
						<td class="text-center bold">103.4</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴투싼 1.6 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2310</td>
						<td class="text-right">0</td>
						<td class="text-right">2310</td>
						<td class="text-right">44.1</td>
						<td class="text-right">52.4</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">6</td>
						<td>QM3 SE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2329</td>
						<td class="text-right">-190</td>
						<td class="text-right">2139</td>
						<td class="text-right">41.4</td>
						<td class="text-right">51.7</td>
						<td class="text-center bold">101.3</td>
					</tr>
					<tr>
						<td>QM3 LE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2446</td>
						<td class="text-right">-194</td>
						<td class="text-right">2252</td>
						<td class="text-right">43.2</td>
						<td class="text-right">52.1</td>
						<td class="text-center bold">102.2</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">QM3 1.5 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2388</td>
						<td class="text-right">-192</td>
						<td class="text-right">2196</td>
						<td class="text-right">42.3</td>
						<td class="text-right">51.9</td>
						<td class="text-center bold">101.8</td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">7</td>
						<td>티볼리 디젤 TX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2008</td>
						<td class="text-right">-20</td>
						<td class="text-right">1988</td>
						<td class="text-right">38.2</td>
						<td class="text-right">52.0</td>
						<td class="text-center bold">102.1</td>
					</tr>
					<tr>
						<td>티볼리 에어 AX(A/T)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2106</td>
						<td class="text-right">0</td>
						<td class="text-right">2106</td>
						<td class="text-right">40.7</td>
						<td class="text-right">51.7</td>
						<td class="text-center bold">101.5</td>
					</tr>
					<tr>
						<td>티볼리 에어 IX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2253</td>
						<td class="text-right">0</td>
						<td class="text-right">2253</td>
						<td class="text-right">43.5</td>
						<td class="text-right">51.8</td>
						<td class="text-center bold">101.6</td>
					</tr>
					<tr>
						<td>티볼리 디젤 LX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2273</td>
						<td class="text-right">-20</td>
						<td class="text-right">2253</td>
						<td class="text-right">43.4</td>
						<td class="text-right">51.9</td>
						<td class="text-center bold">101.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">티볼리 1.6 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2160</td>
						<td class="text-right">-10</td>
						<td class="text-right">2150</td>
						<td class="text-right">41.5</td>
						<td class="text-right">51.9</td>
						<td class="text-center bold">101.7</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">8</td>
						<td>티볼리 가솔린 TX A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">1763</td>
						<td class="text-right">-20</td>
						<td class="text-right">1743</td>
						<td class="text-right">35.1</td>
						<td class="text-right">49.7</td>
						<td class="text-center bold">97.4</td>
					</tr>
					<tr>
						<td>티볼리 가솔린 VX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">1954</td>
						<td class="text-right">-20</td>
						<td class="text-right">1934</td>
						<td class="text-right">38.9</td>
						<td class="text-right">49.7</td>
						<td class="text-center bold">97.5</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">티볼리 1.6 가솔린 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">1859</td>
						<td class="text-right">-20</td>
						<td class="text-right">1839</td>
						<td class="text-right">37.0</td>
						<td class="text-right">49.7</td>
						<td class="text-center bold">97.5</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">9</td>
						<td>올란도 1.6 디젤 LS 고급형</td>
						<td class="text-center">경유</td>
						<td class="text-right">2301</td>
						<td class="text-right">-140</td>
						<td class="text-right">2161</td>
						<td class="text-right">44.5</td>
						<td class="text-right">48.6</td>
						<td class="text-center bold">95.2</td>
					</tr>
					<tr>
						<td>올란도 1.6 디젤 LT 프리미엄</td>
						<td class="text-center">경유</td>
						<td class="text-right">2489</td>
						<td class="text-right">-140</td>
						<td class="text-right">2349</td>
						<td class="text-right">48.2</td>
						<td class="text-right">48.7</td>
						<td class="text-center bold">95.6</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올란도 1.6 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2395</td>
						<td class="text-right">-140</td>
						<td class="text-right">2255</td>
						<td class="text-right">46.4</td>
						<td class="text-right">48.7</td>
						<td class="text-center bold">95.4</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">10</td>
						<td>코란도C KX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2312</td>
						<td class="text-right">-81</td>
						<td class="text-right">2231</td>
						<td class="text-right">47.0</td>
						<td class="text-right">47.5</td>
						<td class="text-center bold">93.1</td>
					</tr>
					<tr>
						<td>코란도C RX 고급형</td>
						<td class="text-center">경유</td>
						<td class="text-right">2494</td>
						<td class="text-right">-87</td>
						<td class="text-right">2407</td>
						<td class="text-right">50.4</td>
						<td class="text-right">47.8</td>
						<td class="text-center bold">93.7</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">코란도C 2.2 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2403</td>
						<td class="text-right">-84</td>
						<td class="text-right">2319</td>
						<td class="text-right">48.7</td>
						<td class="text-right">47.6</td>
						<td class="text-center bold">93.4</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">11</td>
						<td>QM5 Neo 가솔린 2.0 2WD SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2334</td>
						<td class="text-right">-140</td>
						<td class="text-right">2194</td>
						<td class="text-right">47.3</td>
						<td class="text-right">46.4</td>
						<td class="text-center bold">91.0</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">QM5 2.0 가솔린 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2334</td>
						<td class="text-right">-140</td>
						<td class="text-right">2194</td>
						<td class="text-right">47.3</td>
						<td class="text-right">46.4</td>
						<td class="text-center bold">91.0</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">12</td>
						<td>올뉴 카렌스 2.0 LPI 7인승 럭셔리</td>
						<td class="text-center">LPG</td>
						<td class="text-right">1958</td>
						<td class="text-right">0</td>
						<td class="text-right">1958</td>
						<td class="text-right">42.5</td>
						<td class="text-right">46.1</td>
						<td class="text-center bold">90.4</td>
					</tr>
					<tr>
						<td>올뉴 카렌스 2.0 LPI 7인승 프레스티지</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2165</td>
						<td class="text-right">0</td>
						<td class="text-right">2165</td>
						<td class="text-right">47.1</td>
						<td class="text-right">46.0</td>
						<td class="text-center bold">90.2</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴 카렌스 2.0 LPI (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2062</td>
						<td class="text-right">0</td>
						<td class="text-right">2062</td>
						<td class="text-right">44.8</td>
						<td class="text-right">46.0</td>
						<td class="text-center bold">90.3</td>
					</tr>					
				</tbody>
			</table>
		</div>
		<!-- rv1(소형) -->
		<div role="tabpanel" class="tab-pane" id="rv2">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">RV2(중대형)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_rv_201606_02.png"/><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">RV2(중대형)</span></h3><br/>
			<table class="table desc-table table-bordered">
				<thead>
					<tr>
						<th rowspan="3">순위</th>
						<th rowspan="3">차명</th>
						<th rowspan="3">연료</th>
						<th rowspan="2">차량가격<br/>(가격표 기준)</th>
						<th rowspan="2">제조사 할인</th>
						<th>할인 후 차가</th>
						<th>월 대여료(36개월)</th>
						<th>차가÷<br/>월대여료</th>
						<th>장기렌트 효용지수</th>
					</tr>
					<tr>
						<th>A</th>
						<th>B</th>
						<th>C</th>
						<th>D</th>
					</tr>
					<tr>
						<th colspan="4">단위:만원</th>
						<th>=A÷B</th>
						<th>=(C÷C값 평균)x100</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="3"><b>RV2(중대형) 평균</b></td>
						<td class="text-right"><b>3194.5</b></td>
						<td class="text-right"><b>-33.3</b></td>
						<td class="text-right"><b>3161.2</b></td>
						<td class="text-right"><b>59.2</b></td>
						<td class="text-right"><b>53.4</b></td>
						<td class="text-centerbg02"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td class="">모하비 3.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4170</td>
						<td class="text-right">0</td>
						<td class="text-right">4170</td>
						<td class="text-right">74.2</td>
						<td class="text-right">56.2</td>
						<td class="text-centerbg02">105.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td class="">올뉴쏘렌토 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2917</td>
						<td class="text-right">0</td>
						<td class="text-right">2917</td>
						<td class="text-right">52.3</td>
						<td class="text-right">55.8</td>
						<td class="text-centerbg02">104.5</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td class="">올뉴카니발 9인승 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3163</td>
						<td class="text-right">0</td>
						<td class="text-right">3163</td>
						<td class="text-right">57.1</td>
						<td class="text-right">55.4</td>
						<td class="text-centerbg02">103.8</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td class="">올뉴쏘렌토 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3007</td>
						<td class="text-right">0</td>
						<td class="text-right">3007</td>
						<td class="text-right">54.8</td>
						<td class="text-right">54.9</td>
						<td class="text-centerbg02">102.8</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td class="">싼타페 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2946</td>
						<td class="text-right">-70</td>
						<td class="text-right">2876</td>
						<td class="text-right">53.1</td>
						<td class="text-right">54.2</td>
						<td class="text-centerbg02">101.4</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td class="">싼타페 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3090</td>
						<td class="text-right">-70</td>
						<td class="text-right">3020</td>
						<td class="text-right">56.5</td>
						<td class="text-right">53.5</td>
						<td class="text-centerbg02">100.1</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td class="">맥스크루즈 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3510</td>
						<td class="text-right">0</td>
						<td class="text-right">3510</td>
						<td class="text-right">67.9</td>
						<td class="text-right">51.7</td>
						<td class="text-centerbg02">96.7</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td class="">코란도 투리스모 9인승  2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3020</td>
						<td class="text-right">-50</td>
						<td class="text-right">2970</td>
						<td class="text-right">58.6</td>
						<td class="text-right">50.7</td>
						<td class="text-centerbg02">94.9</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td class="">캡티바 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2928</td>
						<td class="text-right">-110</td>
						<td class="text-right">2818</td>
						<td class="text-right">58.2</td>
						<td class="text-right">48.4</td>
						<td class="text-centerbg02">90.6</td>
					</tr>				
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년, 홈페이지 월대여료 차종별/엔진별 평균값 기준</small><br/><br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">RV2(중대형)</span></h3><br/>
			<table class="table desc-table table-bordered">
				<thead>
					<tr>
						<th rowspan="3">순위</th>
						<th rowspan="3">차명</th>
						<th rowspan="3">연료</th>
						<th rowspan="2">차량가격<br/>(가격표 기준)</th>
						<th rowspan="2">제조사 할인</th>
						<th>할인 후 차가</th>
						<th>월 대여료(36개월)</th>
						<th>차가÷<br/>월대여료</th>
						<th>장기렌트 효용지수</th>
					</tr>
					<tr>
						<th>A</th>
						<th>B</th>
						<th>C</th>
						<th>D</th>
					</tr>
					<tr>
						<th colspan="4">단위:만원</th>
						<th>=A÷B</th>
						<th>=(C÷C값 평균)x100</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center" colspan="3"><b>RV2(중대형) 평균</b></td>
						<td class="text-right"><b>3194.5</b></td>
						<td class="text-right"><b>-33.3</b></td>
						<td class="text-right"><b>3161.2</b></td>
						<td class="text-right"><b>59.2</b></td>
						<td class="text-right"><b>53.4</b></td>
						<td class="text-center"><b>100</b></td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">1</td>
						<td>모하비 3.0디젤 노블레스 5인승(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4025</td>
						<td class="text-right">0</td>
						<td class="text-right">4025</td>
						<td class="text-right">72.3</td>
						<td class="text-right">55.7</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td>모하비 3.0디젤 노블레스 7인승(2WD)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4089</td>
						<td class="text-right">0</td>
						<td class="text-right">4089</td>
						<td class="text-right">72.5</td>
						<td class="text-right">56.4</td>
						<td class="text-center bold">105.6</td>
					</tr>
					<tr>
						<td>모하비 3.0디젤 VIP 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">4251</td>
						<td class="text-right">0</td>
						<td class="text-right">4251</td>
						<td class="text-right">75.9</td>
						<td class="text-right">56.0</td>
						<td class="text-center bold">104.8</td>
					</tr>
					<tr>
						<td>모하비 3.0디젤 VIP 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">4315</td>
						<td class="text-right">0</td>
						<td class="text-right">4315</td>
						<td class="text-right">76.2</td>
						<td class="text-right">56.6</td>
						<td class="text-center bold">106.0</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">모하비 3.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">4170</td>
						<td class="text-right"><span class="text-right">0</span></td>
						<td class="text-right">4170</td>
						<td class="text-right">74.2</td>
						<td class="text-right">56.2</td>
						<td class="text-center bold">105.2</td>
					</tr>
					<tr>
						<td rowspan="6" class="text-center">2</td>
						<td>올뉴쏘렌토 R2.0 디젤 2WD 디럭스 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2714</td>
						<td class="text-right">0</td>
						<td class="text-right">2714</td>
						<td class="text-right">49.3</td>
						<td class="text-right">55.1</td>
						<td class="text-center bold">103.1</td>
					</tr>
					<tr>
						<td>올뉴쏘렌토 R2.0 디젤 2WD 럭셔리 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2793</td>
						<td class="text-right">0</td>
						<td class="text-right">2793</td>
						<td class="text-right">50.5</td>
						<td class="text-right">55.3</td>
						<td class="text-center bold">103.5</td>
					</tr>
					<tr>
						<td>올뉴쏘렌토 R2.0 디젤 2WD 프레스티지 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2930</td>
						<td class="text-right">0</td>
						<td class="text-right">2930</td>
						<td class="text-right">52.7</td>
						<td class="text-right">55.6</td>
						<td class="text-center bold">104.1</td>
					</tr>
					<tr>
						<td>올뉴쏘렌토 R2.0 디젤 2WD 프레스티지 (7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2994</td>
						<td class="text-right">0</td>
						<td class="text-right">2994</td>
						<td class="text-right">52.9</td>
						<td class="text-right">56.6</td>
						<td class="text-center bold">105.9</td>
					</tr>
					<tr>
						<td>올뉴쏘렌토 R2.0 디젤 2WD 노블레스 (7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3156</td>
						<td class="text-right">0</td>
						<td class="text-right">3156</td>
						<td class="text-right">56.0</td>
						<td class="text-right">56.4</td>
						<td class="text-center bold">105.5</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴쏘렌토 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2917</td>
						<td class="text-right">0</td>
						<td class="text-right">2917</td>
						<td class="text-right">52.3</td>
						<td class="text-right">55.8</td>
						<td class="text-center bold">104.5</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">3</td>
						<td>올뉴카니발 2.2 디젤 9인승 럭셔리</td>
						<td class="text-center">경유</td>
						<td class="text-right">3020</td>
						<td class="text-right">0</td>
						<td class="text-right">3020</td>
						<td class="text-right">54.1</td>
						<td class="text-right">55.8</td>
						<td class="text-center bold">104.5</td>
					</tr>
					<tr>
						<td>올뉴카니발 2.2 디젤 9인승 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">3305</td>
						<td class="text-right">0</td>
						<td class="text-right">3305</td>
						<td class="text-right">60.0</td>
						<td class="text-right">55.1</td>
						<td class="text-center bold">103.1</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴카니발 9인승 2.2 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">3163</td>
						<td class="text-right">0</td>
						<td class="text-right">3163</td>
						<td class="text-right">57.1</td>
						<td class="text-right">55.4</td>
						<td class="text-center bold">103.8</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">4</td>
						<td>올뉴쏘렌토 R2.2 디젤 2WD 프레스티지 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2975</td>
						<td class="text-right">0</td>
						<td class="text-right">2975</td>
						<td class="text-right">54.6</td>
						<td class="text-right">54.5</td>
						<td class="text-center bold">102.0</td>
					</tr>
					<tr>
						<td>올뉴쏘렌토 R2.2 디젤 2WD 프레스티지 (7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3039</td>
						<td class="text-right">0</td>
						<td class="text-right">3039</td>
						<td class="text-right">54.9</td>
						<td class="text-right">55.4</td>
						<td class="text-center bold">103.6</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">올뉴쏘렌토 2.2 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">3007</td>
						<td class="text-right">0</td>
						<td class="text-right">3007</td>
						<td class="text-right">54.8</td>
						<td class="text-right">54.9</td>
						<td class="text-center bold">102.8</td>
					</tr>
					<tr>
						<td rowspan="6" class="text-center">5</td>
						<td>싼타페 디젤 e-VGT R2.0 2WD Smart 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2765</td>
						<td class="text-right">-70</td>
						<td class="text-right">2695</td>
						<td class="text-right">50.4</td>
						<td class="text-right">53.5</td>
						<td class="text-center bold">100.1</td>
					</tr>
					<tr>
						<td>싼타페 디젤 e-VGT R2.0 2WD Modern 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2837</td>
						<td class="text-right">-70</td>
						<td class="text-right">2767</td>
						<td class="text-right">51.5</td>
						<td class="text-right">53.7</td>
						<td class="text-center bold">100.6</td>
					</tr>
					<tr>
						<td>싼타페 디젤 e-VGT    R2.0 2WD Premium 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2930</td>
						<td class="text-right">-70</td>
						<td class="text-right">2860</td>
						<td class="text-right">53.0</td>
						<td class="text-right">54.0</td>
						<td class="text-center bold">101.0</td>
					</tr>
					<tr>
						<td>싼타페 디젤 e-VGT R2.0 2WD Premium 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2994</td>
						<td class="text-right">-70</td>
						<td class="text-right">2924</td>
						<td class="text-right">53.3</td>
						<td class="text-right">54.9</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td>싼타페 디젤 e-VGT R2.0 2WD Exclusive 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">3203</td>
						<td class="text-right">-70</td>
						<td class="text-right">3133</td>
						<td class="text-right">57.3</td>
						<td class="text-right">54.7</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">싼타페 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2946</td>
						<td class="text-right">-70</td>
						<td class="text-right">2876</td>
						<td class="text-right">53.1</td>
						<td class="text-right">54.2</td>
						<td class="text-center bold">101.4</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">6</td>
						<td>싼타페 디젤 e-VGT R2.2 2WD Premium 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">3058</td>
						<td class="text-right">-70</td>
						<td class="text-right">2988</td>
						<td class="text-right">56.3</td>
						<td class="text-right">53.1</td>
						<td class="text-center bold">99.4</td>
					</tr>
					<tr>
						<td>싼타페 디젤 e-VGT R2.2 2WD Premium 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">3122</td>
						<td class="text-right">-70</td>
						<td class="text-right">3052</td>
						<td class="text-right">56.6</td>
						<td class="text-right">53.9</td>
						<td class="text-center bold">100.9</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">싼타페 2.2 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">3090</td>
						<td class="text-right">-70</td>
						<td class="text-right">3020</td>
						<td class="text-right">56.5</td>
						<td class="text-right">53.5</td>
						<td class="text-center bold">100.1</td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">7</td>
						<td>맥스크루즈 디젤 e-VGT R2.2 Exclusive(6인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3294</td>
						<td class="text-right">0</td>
						<td class="text-right">3294</td>
						<td class="text-right">64.6</td>
						<td class="text-right">51.0</td>
						<td class="text-center bold">95.5</td>
					</tr>
					<tr>
						<td>맥스크루즈 디젤 e-VGT R2.2 Exclusive(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3314</td>
						<td class="text-right">0</td>
						<td class="text-right">3314</td>
						<td class="text-right">63.4</td>
						<td class="text-right">52.3</td>
						<td class="text-center bold">97.9</td>
					</tr>
					<tr>
						<td>맥스크루즈 디젤 e-VGT R2.2 Exclusive Special(6인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3706</td>
						<td class="text-right">0</td>
						<td class="text-right">3706</td>
						<td class="text-right">72.5</td>
						<td class="text-right">51.1</td>
						<td class="text-center bold">95.7</td>
					</tr>
					<tr>
						<td>맥스크루즈 디젤 e-VGT R2.2 Exclusive Special(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3726</td>
						<td class="text-right">0</td>
						<td class="text-right">3726</td>
						<td class="text-right">71.2</td>
						<td class="text-right">52.3</td>
						<td class="text-center bold">98.0</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">맥스크루즈 2.2 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">3510</td>
						<td class="text-right">0</td>
						<td class="text-right">3510</td>
						<td class="text-right">67.9</td>
						<td class="text-right">51.7</td>
						<td class="text-center bold">96.7</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">8</td>
						<td>코란도 투리스모 TX 4WD 9인승 플러스</td>
						<td class="text-center">경유</td>
						<td class="text-right">3020</td>
						<td class="text-right">-50</td>
						<td class="text-right">2970</td>
						<td class="text-right">58.6</td>
						<td class="text-right">50.7</td>
						<td class="text-center bold">94.9</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">코란도 투리스모 9인승 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">3020</td>
						<td class="text-right">-50</td>
						<td class="text-right">2970</td>
						<td class="text-right">58.6</td>
						<td class="text-right">50.7</td>
						<td class="text-center bold">94.9</td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">9</td>
						<td>캡티바 2.0 디젤 LS(5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2809</td>
						<td class="text-right">-110</td>
						<td class="text-right">2699</td>
						<td class="text-right">56.2</td>
						<td class="text-right">48.0</td>
						<td class="text-center bold">89.9</td>
					</tr>
					<tr>
						<td>캡티바 2.0 디젤  LS(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2859</td>
						<td class="text-right">-110</td>
						<td class="text-right">2749</td>
						<td class="text-right">56.4</td>
						<td class="text-right">48.7</td>
						<td class="text-center bold">91.2</td>
					</tr>
					<tr>
						<td>캡티바 2.0 디젤 LT(5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2997</td>
						<td class="text-right">-110</td>
						<td class="text-right">2887</td>
						<td class="text-right">60.0</td>
						<td class="text-right">48.1</td>
						<td class="text-center bold">90.1</td>
					</tr>
					<tr>
						<td>캡티바 2.0 디젤 LT(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3047</td>
						<td class="text-right">-110</td>
						<td class="text-right">2937</td>
						<td class="text-right">60.2</td>
						<td class="text-right">48.8</td>
						<td class="text-center bold">91.3</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">캡티바 2.0 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2928</td>
						<td class="text-right">-110</td>
						<td class="text-right">2818</td>
						<td class="text-right">58.2</td>
						<td class="text-right">48.4</td>
						<td class="text-center bold">90.6</td>
					</tr>				
				</tbody>
			</table>
		</div>
	</div>	
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>
</div>
</t:genericpage>
