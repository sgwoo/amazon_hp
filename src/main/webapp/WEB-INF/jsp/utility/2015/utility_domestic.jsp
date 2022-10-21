<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<script src="/resources/js/tab-common.js"></script>
<div class="desc-container">
	<h2 class="primary">장기렌트 효용지수 <small><span class="glyphicon glyphicon-question-sign info-modal-btn primary"  data-toggle="modal" data-target="#utility-modal"></span></small>
	</h2><br/>
	<div class="amazon-tabs">
		<a href="/utility/2015/domestic"><div class="amazon-tab active">국산승용차</div></a>
		<a href="/utility/2015/rv"><div class="amazon-tab">국산 RV차</div></a>
		<a href="/utility/2015/imports"><div class="amazon-tab">수입차</div></a>
	</div>
	<BR/>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#small" aria-controls="small" role="tab" data-toggle="tab">소형 승용</a></li>
		<li role="presentation"><a href="#middleLPG" aria-controls="middleLPG" role="tab" data-toggle="tab">중형·소형 승용LPG</a></li>
		<li role="presentation"><a href="#middle" aria-controls="middle" role="tab" data-toggle="tab">중형 승용</a></li>
		<li role="presentation"><a href="#largeLPG" aria-controls="largeLPG" role="tab" data-toggle="tab">준대형 승용 LPG</a></li>
		<li role="presentation"><a href="#large" aria-controls="large" role="tab" data-toggle="tab">준대형 승용</a></li>
		<li role="presentation"><a href="#big" aria-controls="big" role="tab" data-toggle="tab">대형 승용(프리미엄 세단)</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- 소형승용 -->
		<div role="tabpanel" class="tab-pane active" id="small">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">소형승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_01.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">소형승용</span></h3><br/>
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
					<tr class="text-right table-bold">
						<td colspan="3" class="text-center">소형 승용 평균</td>
						<td>1761.0</td>
						<td>-52.3</td>
						<td>1708.7</td>
						<td>35.6</td>
						<td>47.8</td>
						<td class="text-center">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>아반떼 1.6 GDi Modern Special</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2052</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2052</td>
						<td class="text-text-right">38.9</td>
						<td class="text-text-right">52.8</td>
						<td class="text-center bold">110.3</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>아반떼 1.6 GDi Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2125</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2125</td>
						<td class="text-text-right">40.3</td>
						<td class="text-text-right">52.7</td>
						<td class="text-center bold">110.3</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>아반떼 1.6 GDi Smart Special</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1878</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1878</td>
						<td class="text-text-right">35.8</td>
						<td class="text-text-right">52.5</td>
						<td class="text-center bold">109.7</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>아반떼 1.6 GDi Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1929</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1929</td>
						<td class="text-text-right">36.8</td>
						<td class="text-text-right">52.4</td>
						<td class="text-center bold">109.6</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>아반떼 1.6 GDi Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1765</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1765</td>
						<td class="text-text-right">33.7</td>
						<td class="text-text-right">52.4</td>
						<td class="text-center bold">109.5</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>아반떼 1.6 디젤 Premium</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2371</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2371</td>
						<td class="text-text-right">45.9</td>
						<td class="text-text-right">51.7</td>
						<td class="text-center bold">108.0</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>아반떼 1.6 GDi Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">29.7</td>
						<td class="text-text-right">51.5</td>
						<td class="text-center bold">107.8</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>아반떼 1.6 GDi 법인전용</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">29.7</td>
						<td class="text-text-right">51.5</td>
						<td class="text-center bold">107.8</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>아반떼 1.6 디젤 Smart Special</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2128</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2128</td>
						<td class="text-text-right">41.3</td>
						<td class="text-text-right">51.5</td>
						<td class="text-center bold">107.7</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>아반떼 1.6 디젤 Smart</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1981</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1981</td>
						<td class="text-text-right">38.5</td>
						<td class="text-text-right">51.5</td>
						<td class="text-center bold">107.6</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>아반떼 1.6 디젤 법인전용</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">35.0</td>
						<td class="text-text-right">50.9</td>
						<td class="text-center bold">106.5</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>아반떼 1.6 디젤 Style</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">35.0</td>
						<td class="text-text-right">50.9</td>
						<td class="text-center bold">106.5</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>K3 1.6 GDI 가솔린 럭셔리</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1712</td>
						<td class="text-text-right">-150</td>
						<td class="text-text-right">1562</td>
						<td class="text-text-right">32.9</td>
						<td class="text-text-right">47.5</td>
						<td class="text-center bold">99.3</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>K3 1.6 GDI 가솔린 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1860</td>
						<td class="text-text-right">-150</td>
						<td class="text-text-right">1710</td>
						<td class="text-text-right">36.1</td>
						<td class="text-text-right">47.4</td>
						<td class="text-center bold">99.0</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>K3 1.6 GDI 가솔린 노블레스</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1962</td>
						<td class="text-text-right">-150</td>
						<td class="text-text-right">1812</td>
						<td class="text-text-right">38.3</td>
						<td class="text-text-right">47.3</td>
						<td class="text-center bold">98.9</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>K3 1.6 GDI 가솔린 디럭스 A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1525</td>
						<td class="text-text-right">-150</td>
						<td class="text-text-right">1375</td>
						<td class="text-text-right">29.7</td>
						<td class="text-text-right">46.3</td>
						<td class="text-center bold">96.8</td>
					</tr>
					<tr>
						<td class="text-center">17</td>
						<td>프라이드 가솔린 4도어 1.6 GDI 럭셔리</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1527</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1527</td>
						<td class="text-text-right">34.0</td>
						<td class="text-text-right">44.9</td>
						<td class="text-center bold">93.9</td>
					</tr>
					<tr>
						<td class="text-center">18</td>
						<td>프라이드 가솔린 4도어 1.4 MPI 스마트</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">29.0</td>
						<td class="text-text-right">44.5</td>
						<td class="text-center bold">93.0</td>
					</tr>
					<tr>
						<td class="text-center">19</td>
						<td>NEW SM3 Neo RE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1962</td>
						<td class="text-text-right">-120</td>
						<td class="text-text-right">1842</td>
						<td class="text-text-right">41.7</td>
						<td class="text-text-right">44.2</td>
						<td class="text-center bold">92.4</td>
					</tr>
					<tr>
						<td class="text-center">20</td>
						<td>NEW SM3 Neo SE (아트컬렉션)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1718</td>
						<td class="text-text-right">-80</td>
						<td class="text-text-right">1638</td>
						<td class="text-text-right">37.1</td>
						<td class="text-text-right">44.2</td>
						<td class="text-center bold">92.3</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td>NEW SM3 Neo PE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1561</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">1461</td>
						<td class="text-text-right">33.6</td>
						<td class="text-text-right">43.5</td>
						<td class="text-center bold">90.9</td>
					</tr>
					<tr>
						<td class="text-center">22</td>
						<td>엑센트 4도어 디젤 1.6 VGT Style+</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1645</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1605</td>
						<td class="text-text-right">37.4</td>
						<td class="text-text-right">42.9</td>
						<td class="text-center bold">89.7</td>
					</tr>
					<tr>
						<td class="text-center">23</td>
						<td>크루즈 1.8 가솔린 LT A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1822</td>
						<td class="text-text-right">-170</td>
						<td class="text-text-right">1652</td>
						<td class="text-text-right">38.7</td>
						<td class="text-text-right">42.7</td>
						<td class="text-center bold">89.3</td>
					</tr>
					<tr>
						<td class="text-center">24</td>
						<td>엑센트 4도어 가솔린 1.4 VVT Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1357</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1317</td>
						<td class="text-text-right">31.2</td>
						<td class="text-text-right">42.2</td>
						<td class="text-center bold">88.3</td>
					</tr>
					<tr>
						<td class="text-center">25</td>
						<td>크루즈 1.8 가솔린 LS A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1718</td>
						<td class="text-text-right">-170</td>
						<td class="text-text-right">1548</td>
						<td class="text-text-right">36.8</td>
						<td class="text-text-right">42.1</td>
						<td class="text-center bold">88.0</td>
					</tr>
					<tr>
						<td class="text-center">26</td>
						<td>엑센트 4도어 가솔린 1.4 VVT Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1273</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1233</td>
						<td class="text-text-right">29.6</td>
						<td class="text-text-right">41.7</td>
						<td class="text-center bold">87.1</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
		
		<!-- 중/소형승용LPG -->
		<div role="tabpanel" class="tab-pane" id="middleLPG">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">중형·소형승용 LPG</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_02.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">중형·소형승용 LPG</span></h3><br/>
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
						<td colspan="3" class="text-center">중형·소형승용 LPG 평균</td>
						<td class="text-text-right">1971.0</td>
						<td class="text-text-right">-53.3</td>
						<td class="text-text-right">1917.8</td>
						<td class="text-text-right">45.1</td>
						<td class="text-text-right">42.5</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K5 LPG 2.0 LPI 프레스티지 MX</td>
						<td>LPG</td>
						<td class="text-text-right">2130</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2030</td>
						<td class="text-text-right">45.9</td>
						<td class="text-text-right">44.2</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>K5 LPG 2.0 LPI 노블레스 MX</td>
						<td>LPG</td>
						<td class="text-text-right">2375</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2275</td>
						<td class="text-text-right">51.5</td>
						<td class="text-text-right">44.2</td>
						<td class="text-center bold">104.0</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>K5 LPG 2.0 LPI 럭셔리 A/T MX</td>
						<td>LPG</td>
						<td class="text-text-right">1860</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">1760</td>
						<td class="text-text-right">40.1</td>
						<td class="text-text-right">43.9</td>
						<td class="text-center bold">103.4</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>LF쏘나타 LPG 렌터카 Modern</td>
						<td>LPG</td>
						<td class="text-text-right">2027</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1987</td>
						<td class="text-text-right">45.7</td>
						<td class="text-text-right">43.5</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>LF쏘나타 LPG 렌터카 Premium Special</td>
						<td>LPG</td>
						<td class="text-text-right">2330</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2290</td>
						<td class="text-text-right">52.7</td>
						<td class="text-text-right">43.5</td>
						<td class="text-center bold">102.3</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>LF쏘나타 LPG 렌터카 Premium</td>
						<td>LPG</td>
						<td class="text-text-right">2190</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2150</td>
						<td class="text-text-right">49.5</td>
						<td class="text-text-right">43.4</td>
						<td class="text-center bold">102.3</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>LF쏘나타 LPG 렌터카 Smart</td>
						<td>LPG</td>
						<td class="text-text-right">1870</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">42.2</td>
						<td class="text-text-right">43.4</td>
						<td class="text-center bold">102.1</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>아반떼 LPG 1.6 렌터카 Smart</td>
						<td>LPG</td>
						<td class="text-text-right">1815</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1815</td>
						<td class="text-text-right">44.3</td>
						<td class="text-text-right">41.0</td>
						<td class="text-center bold">96.5</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>NEW SM5 LPG Nova 렌터카 최고급형</td>
						<td>LPG</td>
						<td class="text-text-right">2050</td>
						<td class="text-text-right">-91</td>
						<td class="text-text-right">1959</td>
						<td class="text-text-right">48.0</td>
						<td class="text-text-right">40.8</td>
						<td class="text-center bold">96.1</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>아반떼 LPG 1.6 렌터카 Style</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">39.1</td>
						<td class="text-text-right">40.7</td>
						<td class="text-center bold">95.8</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>아반떼 LPG 1.6 LPi 법인전용</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">39.1</td>
						<td class="text-text-right">40.7</td>
						<td class="text-center bold">95.8</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>NEW SM5 LPG Nova 렌터카 고급형</td>
						<td>LPG</td>
						<td class="text-text-right">1825</td>
						<td class="text-text-right">-88</td>
						<td class="text-text-right">1737</td>
						<td class="text-text-right">43.0</td>
						<td class="text-text-right">40.4</td>
						<td class="text-center bold">95.1</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
		
		<!-- 중형승용 -->
		<div role="tabpanel" class="tab-pane" id="middle">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">중형승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_03.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">중형승용</span></h3><br/>
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
						<td colspan="3" class="text-center">중형승용 평균</td>
						<td class="text-text-right">2549.6</td>
						<td class="text-text-right">-84.7</td>
						<td class="text-text-right">2464.9</td>
						<td class="text-text-right">47.8</td>
						<td class="text-text-right">51.8</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K5 2.0 가솔린 프레스티지 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2474</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2374</td>
						<td class="text-text-right">43.5</td>
						<td class="text-text-right">54.6</td>
						<td class="text-center bold">105.4</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>K5 2.0 가솔린 노블레스 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2636</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2536</td>
						<td class="text-text-right">46.6</td>
						<td class="text-text-right">54.4</td>
						<td class="text-center bold">105.1</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>K5 2.0 가솔린 럭셔리 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2341</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2241</td>
						<td class="text-text-right">41.2</td>
						<td class="text-text-right">54.4</td>
						<td class="text-center bold">105.1</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>K5 2.0 가솔린 노블레스 스페셜 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2817</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2717</td>
						<td class="text-text-right">50.0</td>
						<td class="text-text-right">54.3</td>
						<td class="text-center bold">105.0</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>K5 2.0 가솔린 디럭스 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2204</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2104</td>
						<td class="text-text-right">39.0</td>
						<td class="text-text-right">53.9</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>K5 1.7 디젤 럭셔리 MX</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2572</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2472</td>
						<td class="text-text-right">46.3</td>
						<td class="text-text-right">53.4</td>
						<td class="text-center bold">103.1</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>K5 1.7 디젤 프레스티지 MX</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2705</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2605</td>
						<td class="text-text-right">48.9</td>
						<td class="text-text-right">53.3</td>
						<td class="text-center bold">102.9</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>K5 1.7 디젤 노블레스 MX</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2867</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2767</td>
						<td class="text-text-right">52.0</td>
						<td class="text-text-right">53.2</td>
						<td class="text-center bold">102.8</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>LF쏘나타 2.0 CVVL Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2498</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2458</td>
						<td class="text-text-right">46.3</td>
						<td class="text-text-right">53.1</td>
						<td class="text-center bold">102.6</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>LF쏘나타 2.0 CVVL Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2808</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2768</td>
						<td class="text-text-right">52.2</td>
						<td class="text-text-right">53.0</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>K5 1.7 디젤 디럭스 MX</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2435</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2335</td>
						<td class="text-text-right">44.2</td>
						<td class="text-text-right">52.8</td>
						<td class="text-center bold">102.1</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>LF쏘나타 2.0 CVVL Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2204</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2164</td>
						<td class="text-text-right">41.0</td>
						<td class="text-text-right">52.8</td>
						<td class="text-center bold">102.0</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>LF쏘나타 디젤 1.7 e-VGT Smart</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2729</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2689</td>
						<td class="text-text-right">51.5</td>
						<td class="text-text-right">52.2</td>
						<td class="text-center bold">100.9</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>K5 1.6 T-GDI 가솔린 프레스티지 SX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2616</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2516</td>
						<td class="text-text-right">48.2</td>
						<td class="text-text-right">52.2</td>
						<td class="text-center bold">100.8</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>LF쏘나타 디젤 1.7 e-VGT Style</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2449</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2409</td>
						<td class="text-text-right">46.3</td>
						<td class="text-text-right">52.0</td>
						<td class="text-center bold">100.5</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>K5 1.6 T-GDI 가솔린 럭셔리 SX</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2484</td>
						<td class="text-text-right">-100</td>
						<td class="text-text-right">2384</td>
						<td class="text-text-right">46.0</td>
						<td class="text-text-right">51.8</td>
						<td class="text-center bold">100.1</td>
					</tr>
					<tr>
						<td class="text-center">17</td>
						<td>LF쏘나타 1.6 터보 GDi Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2641</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2601</td>
						<td class="text-text-right">50.9</td>
						<td class="text-text-right">51.1</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr>
						<td class="text-center">18</td>
						<td>LF쏘나타 1.6 터보 GDi Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2366</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">2326</td>
						<td class="text-text-right">45.7</td>
						<td class="text-text-right">50.9</td>
						<td class="text-center bold">98.3</td>
					</tr>
					<tr>
						<td class="text-center">19</td>
						<td>NEW SM5 Nova G SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2460</td>
						<td class="text-text-right">-119</td>
						<td class="text-text-right">2341</td>
						<td class="text-text-right">50.4</td>
						<td class="text-text-right">46.4</td>
						<td class="text-center bold">89.7</td>
					</tr>
					<tr>
						<td class="text-center">20</td>
						<td>NEW SM5 Nova G RE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2867</td>
						<td class="text-text-right">-127</td>
						<td class="text-text-right">2740</td>
						<td class="text-text-right">59.1</td>
						<td class="text-text-right">46.4</td>
						<td class="text-center bold">89.6</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td>NEW SM5 Nova G LE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2710</td>
						<td class="text-text-right">-124</td>
						<td class="text-text-right">2586</td>
						<td class="text-text-right">55.8</td>
						<td class="text-text-right">46.3</td>
						<td class="text-center bold">89.5</td>
					</tr>
					<tr>
						<td class="text-center">22</td>
						<td>NEW SM5 Nova G PE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2209</td>
						<td class="text-text-right">-114</td>
						<td class="text-text-right">2095</td>
						<td class="text-text-right">45.5</td>
						<td class="text-text-right">46.0</td>
						<td class="text-center bold">89.0</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
		
		<!-- 준대형승용 LPG -->
		<div role="tabpanel" class="tab-pane" id="largeLPG">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">준대형 승용 LPG</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015"  selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_04.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">준대형승용 LPG</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>준대형승용LPG 평균</b></td>
						<td class="text-right"><b>2791.2</b></td>
						<td class="text-right"><b>-104.2</b></td>
						<td class="text-right"><b>2687.0</b></td>
						<td class="text-right"><b>61.6</b></td>
						<td class="text-right"><b>43.6</b></td>
						<td class="text-right bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>그랜저HG LPG 렌터카 300 Modern</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2645</td>
						<td class="text-right">-60</td>
						<td class="text-right">2585</td>
						<td class="text-right">56.9</td>
						<td class="text-right">45.4</td>
						<td class="text-right bold">104.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>그랜저HG LPG 렌터카 300 Exclusive</td>
						<td class="text-center">LPG</td>
						<td class="text-right">3086</td>
						<td class="text-right">-60</td>
						<td class="text-right">3026</td>
						<td class="text-right">67.6</td>
						<td class="text-right">44.8</td>
						<td class="text-right bold">102.6</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>K7 LPG 3.0 렌터카 럭셔리</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2635</td>
						<td class="text-right">-150</td>
						<td class="text-right">2485</td>
						<td class="text-right">56.9</td>
						<td class="text-right">43.7</td>
						<td class="text-right bold">100.1</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>K7 LPG 3.0 렌터카 프레스티지</td>
						<td class="text-center">LPG</td>
						<td class="text-right">3040</td>
						<td class="text-right">-150</td>
						<td class="text-right">2890</td>
						<td class="text-right">66.4</td>
						<td class="text-right">43.5</td>
						<td class="text-right bold">99.8</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>NEW SM7 LPG Nova 렌터카 LPe</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2550</td>
						<td class="text-right">-101</td>
						<td class="text-right">2449</td>
						<td class="text-right">60.2</td>
						<td class="text-right">40.7</td>
						<td class="text-right bold">93.3</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
		
		<!-- 준대형승용 -->
		<div role="tabpanel" class="tab-pane" id="large">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">준대형 승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_05.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">준대형 승용</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>준대형승용 평균</b></td>
						<td class="text-right"><b>3426.1</b></td>
						<td class="text-right"><b>-89.4</b></td>
						<td class="text-right"><b>3336.7</b></td>
						<td class="text-right"><b>66.1</b></td>
						<td class="text-right"><b>50.7</b></td>
						<td class="text-right bold"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>그랜저HG 240 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2933</td>
						<td class="text-right">-60</td>
						<td class="text-right">2873</td>
						<td class="text-right">52.2</td>
						<td class="text-right">55.0</td>
						<td class="text-right bold">108.6</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>그랜저HG 디젤 220 Premium</td>
						<td class="text-center">경유</td>
						<td class="text-right">3389</td>
						<td class="text-right">-60</td>
						<td class="text-right">3329</td>
						<td class="text-right">63.5</td>
						<td class="text-right">52.4</td>
						<td class="text-right bold">103.4</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>그랜저HG 디젤 220 Modern</td>
						<td class="text-center">경유</td>
						<td class="text-right">3156</td>
						<td class="text-right">-60</td>
						<td class="text-right">3096</td>
						<td class="text-right">59.2</td>
						<td class="text-right">52.3</td>
						<td class="text-right bold">103.2</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>그랜저HG 300 Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3259</td>
						<td class="text-right">-60</td>
						<td class="text-right">3199</td>
						<td class="text-right">61.7</td>
						<td class="text-right">51.8</td>
						<td class="text-right bold">102.3</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>그랜저HG 300 Exclusive</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3487</td>
						<td class="text-right">-60</td>
						<td class="text-right">3427</td>
						<td class="text-right">66.4</td>
						<td class="text-right">51.6</td>
						<td class="text-right bold">101.8</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>K7 2.4 GDI 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2929</td>
						<td class="text-right">-150</td>
						<td class="text-right">2779</td>
						<td class="text-right">54.0</td>
						<td class="text-right">51.5</td>
						<td class="text-right bold">101.5</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>임팔라 2.5 가솔린 LT</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3363</td>
						<td class="text-right">-20</td>
						<td class="text-right">3343</td>
						<td class="text-right">65.1</td>
						<td class="text-right">51.4</td>
						<td class="text-right bold">101.3</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>NEW SM7 Nova LE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3162</td>
						<td class="text-right">-113</td>
						<td class="text-right">3049</td>
						<td class="text-right">59.6</td>
						<td class="text-right">51.2</td>
						<td class="text-right bold">100.9</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>아슬란 G300 Modern Special</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3991</td>
						<td class="text-right">-100</td>
						<td class="text-right">3891</td>
						<td class="text-right">76.4</td>
						<td class="text-right">50.9</td>
						<td class="text-right bold">100.5</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>NEW SM7 Nova SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2946</td>
						<td class="text-right">-109</td>
						<td class="text-right">2837</td>
						<td class="text-right">55.9</td>
						<td class="text-right">50.8</td>
						<td class="text-right bold">100.1</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>아슬란 G300 Modern Basic</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3824</td>
						<td class="text-right">-100</td>
						<td class="text-right">3724</td>
						<td class="text-right">73.5</td>
						<td class="text-right">50.7</td>
						<td class="text-right bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>임팔라 2.5 가솔린 LTZ</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3797</td>
						<td class="text-right">-20</td>
						<td class="text-right">3777</td>
						<td class="text-right">74.6</td>
						<td class="text-right">50.6</td>
						<td class="text-right bold">99.9</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>K7 3.0 GDI 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3220</td>
						<td class="text-right">-150</td>
						<td class="text-right">3070</td>
						<td class="text-right">61.9</td>
						<td class="text-right">49.6</td>
						<td class="text-right bold">97.8</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>아슬란 G330 Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4113</td>
						<td class="text-right">-100</td>
						<td class="text-right">4013</td>
						<td class="text-right">81.6</td>
						<td class="text-right">49.2</td>
						<td class="text-right bold">97.0</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>NEW SM7 Nova LE35</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3417</td>
						<td class="text-right">-118</td>
						<td class="text-right">3299</td>
						<td class="text-right">70.4</td>
						<td class="text-right">46.9</td>
						<td class="text-right bold">92.4</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>K7 3.3 GDI 노블레스</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3831</td>
						<td class="text-right">-150</td>
						<td class="text-right">3681</td>
						<td class="text-right">81.4</td>
						<td class="text-right">45.2</td>
						<td class="text-right bold">89.2</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
		
		<!-- 대형 -->
		<div role="tabpanel" class="tab-pane" id="big">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">대형 승용(프리미엄 세단)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201511_06.png"/>
			</div><br/><br/>
			<p class="desc-paragraph">				
				<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;
				<span style="font-weight:500;">장기렌트 효용지수(아마존카 Index) 산출식</span><br/>
				    ① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				    ② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
			</p>
			<div class="panel panel-default">
				<div class="panel-body text-center">
			    	장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급(소형승용 전체) 평균 ) × 100
				</div>
			</div>
			<br/>
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">대형 승용(프리미엄 세단)</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>대형승용(프리미엄 세단) 평균</b></td>
						<td class="text-right"><b>6271.6</b></td>
						<td class="text-right"><b>-65.9</b></td>
						<td class="text-right"><b>6205.8</b></td>
						<td class="text-right"><b>118.0</b></td>
						<td class="text-right"><b>52.7</b></td>
						<td class="text-right bold"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>제네시스 EQ900 3.3T-GDi Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7560</td>
						<td class="text-right">0</td>
						<td class="text-right">7560</td>
						<td class="text-right">131.5</td>
						<td class="text-right">57.5</td>
						<td class="text-right bold">109.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>제네시스 EQ900 3.8 GDi Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7170</td>
						<td class="text-right">0</td>
						<td class="text-right">7170</td>
						<td class="text-right">125.2</td>
						<td class="text-right">57.3</td>
						<td class="text-right bold">108.8</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>제네시스(신형) G330 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4565</td>
						<td class="text-right">0</td>
						<td class="text-right">4565</td>
						<td class="text-right">80.1</td>
						<td class="text-right">57.0</td>
						<td class="text-right bold">108.2</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>제네시스(신형) G330 Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5159</td>
						<td class="text-right">0</td>
						<td class="text-right">5159</td>
						<td class="text-right">92.8</td>
						<td class="text-right">55.6</td>
						<td class="text-right bold">105.6</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>제네시스 EQ900 3.3T-GDi Premium Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">9130</td>
						<td class="text-right">0</td>
						<td class="text-right">9130</td>
						<td class="text-right">165.6</td>
						<td class="text-right">55.1</td>
						<td class="text-right bold">104.7</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>제네시스 EQ900 3.8 GDi Premium Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">8740</td>
						<td class="text-right">0</td>
						<td class="text-right">8740</td>
						<td class="text-right">159.6</td>
						<td class="text-right">54.8</td>
						<td class="text-right bold">104.0</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>제네시스(신형) G380 Exclusive</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5363</td>
						<td class="text-right">0</td>
						<td class="text-right">5363</td>
						<td class="text-right">98.8</td>
						<td class="text-right">54.3</td>
						<td class="text-right bold">103.1</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>제네시스(신형) G380 Prestige</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5959</td>
						<td class="text-right">0</td>
						<td class="text-right">5959</td>
						<td class="text-right">111.7</td>
						<td class="text-right">53.3</td>
						<td class="text-right bold">101.3</td>
					</tr>	
					<tr>
						<td class="text-center">9</td>
						<td>K9 3.3 GDI 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4899</td>
						<td class="text-right">0</td>
						<td class="text-right">4899</td>
						<td class="text-right">93.2</td>
						<td class="text-right">52.6</td>
						<td class="text-right bold">99.8</td>
					</tr>	
					<tr>
						<td class="text-center">10</td>
						<td>K9 3.3 GDI 이그제큐티브</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5232</td>
						<td class="text-right">0</td>
						<td class="text-right">5232</td>
						<td class="text-right">100.6</td>
						<td class="text-right">52.0</td>
						<td class="text-right bold">98.8</td>
					</tr>	
					<tr>
						<td class="text-center">11</td>
						<td>K9 3.8 GDI 이그제큐티브</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5576</td>
						<td class="text-right">0</td>
						<td class="text-right">5576</td>
						<td class="text-right">111.3</td>
						<td class="text-right">50.1</td>
						<td class="text-right bold">95.2</td>
					</tr>	
					<tr>
						<td class="text-center">12</td>
						<td>체어맨W Heritage CW600 Prestige</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6145</td>
						<td class="text-right">-307</td>
						<td class="text-right">5838</td>
						<td class="text-right">127.0</td>
						<td class="text-right">46.0</td>
						<td class="text-right bold">87.3</td>
					</tr>	
					<tr>
						<td class="text-center">13</td>
						<td>체어맨W Heritage CW600 Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5463</td>
						<td class="text-right">-273</td>
						<td class="text-right">5190</td>
						<td class="text-right">113.3</td>
						<td class="text-right">45.8</td>
						<td class="text-right bold">87.0</td>
					</tr>	
					<tr>
						<td class="text-center">14</td>
						<td>체어맨W Heritage CW700 Prestige</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6842</td>
						<td class="text-right">-342</td>
						<td class="text-right">6500</td>
						<td class="text-right">141.9</td>
						<td class="text-right">45.8</td>
						<td class="text-right bold">87.0</td>
					</tr>									
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월 견적 기준</small>
		</div>
	</div>

</div>
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>

</t:genericpage>
