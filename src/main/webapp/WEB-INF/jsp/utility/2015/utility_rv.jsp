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
		<a href="/utility/2015/domestic"><div class="amazon-tab">국산승용차</div></a>
		<a href="/utility/2015/rv"><div class="amazon-tab active">국산 RV차</div></a>
		<a href="/utility/2015/imports"><div class="amazon-tab">수입차</div></a>
	</div>
	<BR/>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#rv1" aria-controls="rv1" role="tab" data-toggle="tab">RV1(소형)</a></li>
		<li role="presentation"><a href="#rv2" aria-controls="rv2" role="tab" data-toggle="tab">RV2(중대형)</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- rv1(소형) -->
		<div role="tabpanel" class="tab-pane active" id="rv1">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">RV1(소형)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_rv_201511_01.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">RV1(소형)</span></h3><br/>
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
						<td class="text-right"><b>2358.0</b></td>
						<td class="text-right"><b>-41.6</b></td>
						<td class="text-right"><b>2316.5</b></td>
						<td class="text-right"><b>44.9</b></td>
						<td class="text-right"><b>51.7</b></td>
						<td class="text-centerbg02"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td class="">스포티지 디젤 U2 1.7 2WD 노블레스</td>
						<td class="text-center">경유</td>
						<td class="text-right">2449</td>
						<td class="text-right">0</td>
						<td class="text-right">2449</td>
						<td class="text-right">44.1</td>
						<td class="text-right">55.5</td>
						<td class="text-centerbg02">107.5</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td class="">스포티지 디젤 R2.0 2WD 노블레스</td>
						<td class="text-center">경유</td>
						<td class="text-right">2601</td>
						<td class="text-right">0</td>
						<td class="text-right">2601</td>
						<td class="text-right">46.9</td>
						<td class="text-right">55.5</td>
						<td class="text-centerbg02">107.4</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td class="">스포티지 디젤 R2.0 2WD 노블레스 스페셜</td>
						<td class="text-center">경유</td>
						<td class="text-right">2842</td>
						<td class="text-right">8</td>
						<td class="text-right">2842</td>
						<td class="text-right">51.3</td>
						<td class="text-right">55.4</td>
						<td class="text-centerbg02">107.2</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td class="">스포티지 디젤 R2.0 2WD 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">2518</td>
						<td class="text-right">0</td>
						<td class="text-right">2518</td>
						<td class="text-right">45.5</td>
						<td class="text-right">55.3</td>
						<td class="text-centerbg02">107.1</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td class="">스포티지 디젤 U2 1.7 2WD 트렌디</td>
						<td class="text-center">경유</td>
						<td class="text-right">2253</td>
						<td class="text-right">0</td>
						<td class="text-right">2253</td>
						<td class="text-right">40.8</td>
						<td class="text-right">55.2</td>
						<td class="text-centerbg02">106.9</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td class="">올뉴투싼 디젤 e-VGT UⅡ 1.7 2WD STYLE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2297</td>
						<td class="text-right">0</td>
						<td class="text-right">2297</td>
						<td class="text-right">41.8</td>
						<td class="text-right">55.0</td>
						<td class="text-centerbg02">106.4</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td class="">스포티지 디젤 R2.0 2WD 트렌디 A/T</td>
						<td class="text-center">경유</td>
						<td class="text-right">2346</td>
						<td class="text-right">0</td>
						<td class="text-right">2346</td>
						<td class="text-right">42.7</td>
						<td class="text-right">54.9</td>
						<td class="text-centerbg02">106.4</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td class="">올뉴투싼 디젤 e-VGT R2.0 2WD STYLE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2376</td>
						<td class="text-right">0</td>
						<td class="text-right">2376</td>
						<td class="text-right">43.3</td>
						<td class="text-right">54.9</td>
						<td class="text-centerbg02">106.2</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td class="">올뉴투싼 디젤 e-VGT UⅡ 1.7 2WD MODERN</td>
						<td class="text-center">경유</td>
						<td class="text-right">2503</td>
						<td class="text-right">0</td>
						<td class="text-right">2503</td>
						<td class="text-right">45.7</td>
						<td class="text-right">54.8</td>
						<td class="text-centerbg02">106.0</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td class="">올뉴투싼 디젤 e-VGT R2.0 2WD MODERN</td>
						<td class="text-center">경유</td>
						<td class="text-right">2616</td>
						<td class="text-right">0</td>
						<td class="text-right">2616</td>
						<td class="text-right">47.9</td>
						<td class="text-right">54.6</td>
						<td class="text-centerbg02">105.7</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td class="">티볼리 VX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">1959</td>
						<td class="text-right">0</td>
						<td class="text-right">1959</td>
						<td class="text-right">38.6</td>
						<td class="text-right">50.8</td>
						<td class="text-centerbg02">98.2</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td class="">티볼리 TX A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">1763</td>
						<td class="text-right">0</td>
						<td class="text-right">1763</td>
						<td class="text-right">34.8</td>
						<td class="text-right">50.7</td>
						<td class="text-centerbg02">98.1</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td class="">QM3 LE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2337</td>
						<td class="text-right">-153</td>
						<td class="text-right">2184</td>
						<td class="text-right">43.5</td>
						<td class="text-right">50.2</td>
						<td class="text-centerbg02">97.2</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td class="">QM3 SE</td>
						<td class="text-center">경유</td>
						<td class="text-right">2239</td>
						<td class="text-right">-152</td>
						<td class="text-right">2087</td>
						<td class="text-right">41.9</td>
						<td class="text-right">49.8</td>
						<td class="text-centerbg02">96.4</td>
					</tr>	
					<tr>
						<td class="text-center">15</td>
						<td class="">올란도 1.6 디젤 LT 프리미엄</td>
						<td class="text-center">경유</td>
						<td class="text-right">2465</td>
						<td class="text-right">-100</td>
						<td class="text-right">2365</td>
						<td class="text-right">48.3</td>
						<td class="text-right">49.0</td>
						<td class="text-centerbg02">94.8</td>
					</tr>	
					<tr>
						<td class="text-center">16</td>
						<td class="">올란도 1.6 디젤 LS 고급형</td>
						<td class="text-center">경유</td>
						<td class="text-right">2278</td>
						<td class="text-right">-100</td>
						<td class="text-right">2178</td>
						<td class="text-right">44.8</td>
						<td class="text-right">48.6</td>
						<td class="text-centerbg02">94.1</td>
					</tr>		
					<tr>
						<td class="text-center">17</td>
						<td class="">QM5 Neo 디젤 2.0 2WD LE (아트컬렉션)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2877</td>
						<td class="text-right">-200</td>
						<td class="text-right">2677</td>
						<td class="text-right">55.2</td>
						<td class="text-right">48.5</td>
						<td class="text-centerbg02">93.9</td>
					</tr>	
					<tr>
						<td class="text-center">18</td>
						<td class="">올뉴 카렌스 2.0 LPI 7인승 프레스티지</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2165</td>
						<td class="text-right">-10</td>
						<td class="text-right">2155</td>
						<td class="text-right">44.5</td>
						<td class="text-right">48.4</td>
						<td class="text-centerbg02">93.7</td>
					</tr>		
					<tr>
						<td class="text-center">19</td>
						<td class="">올뉴 카렌스 2.0 LPI 7인승 럭셔리</td>
						<td class="text-center">LPG</td>
						<td class="text-right">1958</td>
						<td class="text-right">-10</td>
						<td class="text-right">1948</td>
						<td class="text-right">40.3</td>
						<td class="text-right">48.3</td>
						<td class="text-centerbg02">93.6</td>
					</tr>	
					<tr>
						<td class="text-center">20</td>
						<td class="">코란도C RX 고급형</td>
						<td class="text-center">경유</td>
						<td class="text-right">2494</td>
						<td class="text-right">-80</td>
						<td class="text-right">2414</td>
						<td class="text-right">50.2</td>
						<td class="text-right">48.1</td>
						<td class="text-centerbg02">93.1</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td class="">코란도C KX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2312</td>
						<td class="text-right">-80</td>
						<td class="text-right">2232</td>
						<td class="text-right">46.7</td>
						<td class="text-right">47.8</td>
						<td class="text-centerbg02">92.5</td>
					</tr>		
					<tr>
						<td class="text-center">22</td>
						<td class="">QM5 Neo 가솔린 2.0 2WD SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2229</td>
						<td class="text-right">-30</td>
						<td class="text-right">2199</td>
						<td class="text-right">48.6</td>
						<td class="text-right">45.2</td>
						<td class="text-centerbg02">87.6</td>
					</tr>		
				</tbody>
			</table>
			<small>※ 장기렌트 기본식 36개월 견적 기준</small><br/><br/>
		</div>
		
		<!-- rv2(중대형) -->
		<div role="tabpanel" class="tab-pane" id="rv2">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">RV2(중대형)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_rv_201511_02.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">RV2(중대형)</span></h3><br/>
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
						<td class="text-right"><b>3083.3</b></td>
						<td class="text-right"><b>-50.0</b></td>
						<td class="text-right"><b>3033.3</b></td>
						<td class="text-right"><b>56.6</b></td>
						<td class="text-right"><b>53.7</b></td>
						<td class="text-centerbg02"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td class="">올뉴쏘렌토 R2.0 디젤 2WD 프레스티지(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2994</td>
						<td class="text-right">0</td>
						<td class="text-right">2994</td>
						<td class="text-right">52.0</td>
						<td class="text-right">57.6</td>
						<td class="text-centerbg02">107.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td class="">올뉴쏘렌토 R2.0 디젤 2WD 노블레스 (7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3156</td>
						<td class="text-right">0</td>
						<td class="text-right">3156</td>
						<td class="text-right">55.2</td>
						<td class="text-right">57.2</td>
						<td class="text-centerbg02">106.5</td>
					</tr>	
					<tr>
						<td class="text-center">3</td>
						<td class="">올뉴쏘렌토 R2.0 디젤 2WD 럭셔리 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2793</td>
						<td class="text-right">0</td>
						<td class="text-right">2793</td>
						<td class="text-right">49.0</td>
						<td class="text-right">57.0</td>
						<td class="text-centerbg02">106.1</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td class="">올뉴쏘렌토 R2.0 디젤 2WD 디럭스 (5인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2714</td>
						<td class="text-right">0</td>
						<td class="text-right">2714</td>
						<td class="text-right">47.7</td>
						<td class="text-right">56.9</td>
						<td class="text-centerbg02">105.9</td>
					</tr>	
					<tr>
						<td class="text-center">5</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Premium 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2994</td>
						<td class="text-right">0</td>
						<td class="text-right">2884</td>
						<td class="text-right">53.5</td>
						<td class="text-right">56.0</td>
						<td class="text-centerbg02">104.2</td>
					</tr>	
					<tr>
						<td class="text-center">6</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Modern 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2837</td>
						<td class="text-right">0</td>
						<td class="text-right">2837</td>
						<td class="text-right">51.1</td>
						<td class="text-right">55.5</td>
						<td class="text-centerbg02">103.4</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Exclusive 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">3203</td>
						<td class="text-right">0</td>
						<td class="text-right">3203</td>
						<td class="text-right">57.8</td>
						<td class="text-right">55.4</td>
						<td class="text-centerbg02">103.2</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Smart 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2765</td>
						<td class="text-right">0</td>
						<td class="text-right">2765</td>
						<td class="text-right">49.9</td>
						<td class="text-right">55.4</td>
						<td class="text-centerbg02">103.2</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Premium 5인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2930</td>
						<td class="text-right">0</td>
						<td class="text-right">2930</td>
						<td class="text-right">53.0</td>
						<td class="text-right">55.3</td>
						<td class="text-centerbg02">102.9</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td class="">싼타페(신형) 더프라임 R2.0 2WD Exclusive Special 7인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">3321</td>
						<td class="text-right">0</td>
						<td class="text-right">3321</td>
						<td class="text-right">60.2</td>
						<td class="text-right">55.2</td>
						<td class="text-centerbg02">102.7</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td class="">올뉴카니발 2.2 디젤 9인승 럭셔리</td>
						<td class="text-center">경유</td>
						<td class="text-right">3020</td>
						<td class="text-right">-100</td>
						<td class="text-right">2920</td>
						<td class="text-right">54.4</td>
						<td class="text-right">53.7</td>
						<td class="text-centerbg02">99.9</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td class="">올뉴카니발 2.2 디젤 9인승 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">3305</td>
						<td class="text-right">-100</td>
						<td class="text-right">3205</td>
						<td class="text-right">60.3</td>
						<td class="text-right">53.2</td>
						<td class="text-centerbg02">99.0</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td class="">맥스크루즈 디젤 e-VGT R2.2 Exclusive(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3314</td>
						<td class="text-right">0</td>
						<td class="text-right">3314</td>
						<td class="text-right">63.3</td>
						<td class="text-right">52.4</td>
						<td class="text-centerbg02">97.5</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td class="">맥스크루즈 디젤 e-VGT R2.2 Exclusive Special(7인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3726</td>
						<td class="text-right">0</td>
						<td class="text-right">3726</td>
						<td class="text-right">71.2</td>
						<td class="text-right">52.3</td>
						<td class="text-centerbg02">97.4</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td class="">맥스크루즈 디젤 e-VGT R2.2 Exclusive Special(6인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3706</td>
						<td class="text-right">0</td>
						<td class="text-right">3706</td>
						<td class="text-right">72.4</td>
						<td class="text-right">51.2</td>
						<td class="text-centerbg02">95.3</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td class="">맥스크루즈 디젤 e-VGT R2.2 Exclusive(6인승)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3294</td>
						<td class="text-right">0</td>
						<td class="text-right">3294</td>
						<td class="text-right">64.5</td>
						<td class="text-right">51.1</td>
						<td class="text-centerbg02">95.1</td>
					</tr>
					<tr>
						<td class="text-center">17</td>
						<td class="">코란도 투리스모 TX 2WD 9인승</td>
						<td class="text-center">경유</td>
						<td class="text-right">2899</td>
						<td class="text-right">-110</td>
						<td class="text-right">2789</td>
						<td class="text-right">55.7</td>
						<td class="text-right">50.1</td>
						<td class="text-centerbg02">93.2</td>
					</tr>
					<tr>
						<td class="text-center">18</td>
						<td class="">캡티바 2.0 디젤 2WD LT</td>
						<td class="text-center">경유</td>
						<td class="text-right">2920</td>
						<td class="text-right">-320</td>
						<td class="text-right">2600</td>
						<td class="text-right">54.3</td>
						<td class="text-right">47.9</td>
						<td class="text-centerbg02">89.2</td>
					</tr>
					<tr>
						<td class="text-center">19</td>
						<td class="">캡티바 2.0 디젤 2WD LS</td>
						<td class="text-center">경유</td>
						<td class="text-right">2691</td>
						<td class="text-right">-320</td>
						<td class="text-right">2371</td>
						<td class="text-right">50.1</td>
						<td class="text-right">47.3</td>
						<td class="text-centerbg02">88.1</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
	</div>	
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>
</div>
</t:genericpage>
