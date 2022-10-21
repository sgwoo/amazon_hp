<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<script src="/resources/js/tab-common.js"></script>
<div class="desc-container">
	<h2 class="primary">장기렌트 효용지수 <span class="glyphicon glyphicon-question-sign info-modal-btn primary"  data-toggle="modal" data-target="#utility-modal"></span>
	</h2><br/>
	<div class="amazon-tabs">
		<a href="/utility/2016/domestic"><div class="amazon-tab active">국산승용차</div></a>
		<a href="/utility/2016/rv"><div class="amazon-tab">국산 RV차</div></a>
		<a href="/utility/2016/imports"><div class="amazon-tab">수입차</div></a>
	</div>
	<BR/>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#small" aria-controls="small" role="tab" data-toggle="tab">소형 승용</a></li>
		<li role="presentation"><a href="#middleLPG" aria-controls="middleLPG" role="tab" data-toggle="tab">중형·소형 승용LPG</a></li>
		<li role="presentation"><a href="#middle" aria-controls="middle" role="tab" data-toggle="tab">중형 승용</a></li>
		<li role="presentation"><a href="#largeLPG" aria-contols="largeLPG" role="tab" data-toggle="tab">준대형 승용 LPG</a></li>
		<li role="presentation"><a href="#large" aria-controls="large" role="tab" data-toggle="tab">준대형 승용</a></li>
		<li role="presentation"><a href="#big" aria-controls="big" role="tab" data-toggle="tab">대형 승용(프리미엄 세단)</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- 소형승용 -->
		<div role="tabpanel" class="tab-pane active" id="small">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">소형승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_01.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">소형승용</span></h3><br/>
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
						<td>1704.3</td>
						<td>-62.2</td>
						<td>1642.1</td>
						<td>35.3</td>
						<td>46.2</td>
						<td class="text-center">100</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>아반떼 1.6 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">36.0</td>
						<td class="text-text-right">50.9</td>
						<td class="text-center bold">110.0</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>아반떼 1.6 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2009</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2009</td>
						<td class="text-text-right">40.6</td>
						<td class="text-text-right">49.5</td>
						<td class="text-center bold">107.1</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>K3 1.6 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1745</td>
						<td class="text-text-right">-70</td>
						<td class="text-text-right">1675</td>
						<td class="text-text-right">34.9</td>
						<td class="text-text-right">48.0</td>
						<td class="text-center bold">103.8</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>K3 1.6 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1973</td>
						<td class="text-text-right">-79</td>
						<td class="text-text-right">1894</td>
						<td class="text-text-right">39.8</td>
						<td class="text-text-right">47.6</td>
						<td class="text-center bold">102.9</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>NEW SM3 1.6 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1700</td>
						<td class="text-text-right">-165</td>
						<td class="text-text-right">1535</td>
						<td class="text-text-right">34.0</td>
						<td class="text-text-right">45.2</td>
						<td class="text-center bold">97.8</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>크루즈 1.8 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1770</td>
						<td class="text-text-right">-144</td>
						<td class="text-text-right">1627</td>
						<td class="text-text-right">36.5</td>
						<td class="text-text-right">44.6</td>
						<td class="text-center bold">96.4</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>프라이드 1.4 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">30.3</td>
						<td class="text-text-right">42.6</td>
						<td class="text-center bold">92.1</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>악센트 1.4 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1318</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1278</td>
						<td class="text-text-right">30.8</td>
						<td class="text-text-right">41.6</td>
						<td class="text-center bold">89.9</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년, 홈페이지 월대여료 차종별/엔진별 평균값 기준</small><br/><br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">소형승용</span></h3><br/>
			<small>※동일 차종/엔진 내에서는 차량가격 순서로 정렬</small>
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
						<td>1704.3</td>
						<td>-62.2</td>
						<td>1642.1</td>
						<td>35.3</td>
						<td>46.2</td>
						<td class="text-center">100</td>
					</tr>
					<tr>
						<td rowspan="8" class="text-center">1</td>
						<td>아반떼 1.6 GDi Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">30.6</td>
						<td class="text-text-right">50.0</td>
						<td class="text-center bold">108.2</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi 법인전용</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1531</td>
						<td class="text-text-right">30.6</td>
						<td class="text-text-right">50.0</td>
						<td class="text-center bold">108.2</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1765</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1765</td>
						<td class="text-text-right">34.6</td>
						<td class="text-text-right">51.0</td>
						<td class="text-center bold">110.3</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi Smart Special</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1878</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1878</td>
						<td class="text-text-right">36.8</td>
						<td class="text-text-right">51.0</td>
						<td class="text-center bold">110.4</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1929</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1929</td>
						<td class="text-text-right">37.8</td>
						<td class="text-text-right">51.0</td>
						<td class="text-center bold">110.4</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi Modern Special</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2052</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2052</td>
						<td class="text-text-right">40.0</td>
						<td class="text-text-right">51.3</td>
						<td class="text-center bold">111.0</td>
					</tr>
					<tr>
						<td>아반떼 1.6 GDi Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2125</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2125</td>
						<td class="text-text-right">41.5</td>
						<td class="text-text-right">51.2</td>
						<td class="text-center bold">110.7</td>
					</tr>
					<tr class="primary-green">
						<td>아반떼 1.6 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">36.0</td>
						<td class="text-text-right">50.9</td>
						<td class="text-center bold">110.0</td>
					</tr>
					<tr>
						<td rowspan="6" class="text-center">2</td>
						<td>아반떼 1.6 e-VGT Style</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">36.3</td>
						<td class="text-text-right">49.1</td>
						<td class="text-center bold">106.2</td>
					</tr>
					<tr>
						<td>아반떼 1.6 디젤 법인전용</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1782</td>
						<td class="text-text-right">36.3</td>
						<td class="text-text-right">49.1</td>
						<td class="text-center bold">106.2</td>
					</tr>
					<tr>
						<td>아반떼 1.6 e-VGT Smart</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1981</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1981</td>
						<td class="text-text-right">39.9</td>
						<td class="text-text-right">49.6</td>
						<td class="text-center bold">107.4</td>
					</tr>
					<tr>
						<td>아반떼 1.6 e-VGT Smart Special</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2128</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2128</td>
						<td class="text-text-right">42.8</td>
						<td class="text-text-right">49.7</td>
						<td class="text-center bold">107.5</td>
					</tr>
					<tr>
						<td>아반떼 1.6 e-VGT Premium</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2371</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2371</td>
						<td class="text-text-right">47.5</td>
						<td class="text-text-right">49.9</td>
						<td class="text-center bold">108.0</td>
					</tr>
					<tr class="primary-green">
						<td>아반떼 1.6 디젤 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">2009</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">2009</td>
						<td class="text-text-right">40.6</td>
						<td class="text-text-right">49.5</td>
						<td class="text-center bold">107.1</td>
					</tr>
					<tr>
						<td rowspan="6" class="text-center">3</td>
						<td>K3 1.6 GDI 가솔린 디럭스 A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1521</td>
						<td class="text-text-right">-63</td>
						<td class="text-text-right">1458</td>
						<td class="text-text-right">30.7</td>
						<td class="text-text-right">47.5</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td>K3 1.6 GDI 가솔린 트렌디</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1735</td>
						<td class="text-text-right">-70</td>
						<td class="text-text-right">1665</td>
						<td class="text-text-right">34.5</td>
						<td class="text-text-right">48.3</td>
						<td class="text-center bold">104.4</td>
					</tr>
					<tr>
						<td>K3 1.6 GDI 가솔린 트렌디A</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1823</td>
						<td class="text-text-right">-73</td>
						<td class="text-text-right">1750</td>
						<td class="text-text-right">36.4</td>
						<td class="text-text-right">48.1</td>
						<td class="text-center bold">104.0</td>
					</tr>
					<tr>
						<td>K3 1.6 GDI 가솔린 트렌디A</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1823</td>
						<td class="text-text-right">-73</td>
						<td class="text-text-right">1750</td>
						<td class="text-text-right">36.4</td>
						<td class="text-text-right">48.1</td>
						<td class="text-center bold">104.0</td>
					</tr>
					<tr>
						<td>K3 1.6 GDI 가솔린 트렌디A</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1823</td>
						<td class="text-text-right">-73</td>
						<td class="text-text-right">1750</td>
						<td class="text-text-right">36.4</td>
						<td class="text-text-right">48.1</td>
						<td class="text-center bold">104.0</td>
					</tr>
					<tr class="primary-green">
						<td>K3 1.6 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1745</td>
						<td class="text-text-right">-70</td>
						<td class="text-text-right">1675</td>
						<td class="text-text-right">34.9</td>
						<td class="text-text-right">48.0</td>
						<td class="text-center bold">103.8</td>
					</tr>
					<tr>
						<td rowspan="4" class="text-center">4</td>
						<td>K3 1.6 디젤 디럭스</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1772</td>
						<td class="text-text-right">-72</td>
						<td class="text-text-right">1700</td>
						<td class="text-text-right">36.0</td>
						<td class="text-text-right">47.2</td>
						<td class="text-center bold">102.1</td>
					</tr>
					<tr>
						<td>K3 1.6 디젤 트렌디</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">1986</td>
						<td class="text-text-right">-79</td>
						<td class="text-text-right">1907</td>
						<td class="text-text-right">39.9</td>
						<td class="text-text-right">47.8</td>
						<td class="text-center bold">103.4</td>
					</tr>
					<tr>
						<td>K3 1.6 디젤 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2160</td>
						<td class="text-text-right">-85</td>
						<td class="text-text-right">2075</td>
						<td class="text-text-right">43.5</td>
						<td class="text-text-right">47.7</td>
						<td class="text-center bold">103.2</td>
					</tr>
					<tr class="primary-green">
						<td>K3 1.6 디젤 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1973</td>
						<td class="text-text-right">-79</td>
						<td class="text-text-right">1894</td>
						<td class="text-text-right">39.8</td>
						<td class="text-text-right">47.6</td>
						<td class="text-center bold">102.9</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">5</td>
						<td>NEW SM3 Neo 1.6 가솔린 PE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1623</td>
						<td class="text-text-right">-162</td>
						<td class="text-text-right">1461</td>
						<td class="text-text-right">32.6</td>
						<td class="text-text-right">44.8</td>
						<td class="text-center bold">96.9</td>
					</tr>
					<tr>
						<td>NEW SM3 Neo 1.6 가솔린 SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1777</td>
						<td class="text-text-right">-168</td>
						<td class="text-text-right">1609</td>
						<td class="text-text-right">35.3</td>
						<td class="text-text-right">45.6</td>
						<td class="text-center bold">98.6</td>
					</tr>
					<tr class="primary-green">
						<td>NEW SM3 1.6 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1700</td>
						<td class="text-text-right">-165</td>
						<td class="text-text-right">1535</td>
						<td class="text-text-right">34.0</td>
						<td class="text-text-right">45.2</td>
						<td class="text-center bold">97.8</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">6</td>
						<td>크루즈 1.8 가솔린 LS A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1718</td>
						<td class="text-text-right">-140</td>
						<td class="text-text-right">1578</td>
						<td class="text-text-right">35.6</td>
						<td class="text-text-right">44.3</td>
						<td class="text-center bold">95.9</td>
					</tr>
					<tr>
						<td>크루즈 1.8 가솔린 LT A/T</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1822</td>
						<td class="text-text-right">-147</td>
						<td class="text-text-right">1675</td>
						<td class="text-text-right">37.4</td>
						<td class="text-text-right">44.8</td>
						<td class="text-center bold">96.9</td>
					</tr>
					<tr class="primary-green">
						<td>크루즈 1.8 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1770</td>
						<td class="text-text-right">-144</td>
						<td class="text-text-right">1627</td>
						<td class="text-text-right">36.5</td>
						<td class="text-text-right">44.6</td>
						<td class="text-center bold">96.4</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">7</td>
						<td>프라이드 가솔린 4도어 1.4 MPI 스마트	</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1290</td>
						<td class="text-text-right">30.3</td>
						<td class="text-text-right">42.6</td>
						<td class="text-center bold">92.1</td>
					</tr>
					<tr>
						<td>프라이드 가솔린 4도어 1.6 GDI 럭셔리</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1527</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1527</td>
						<td class="text-text-right">35.5</td>
						<td class="text-text-right">43.0</td>
						<td class="text-center bold">93.0</td>
					</tr>
					<tr class="primary-green">
						<td>프라이드 1.4 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1409</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1409</td>
						<td class="text-text-right">32.9</td>
						<td class="text-text-right">42.8</td>
						<td class="text-center bold">92.6</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">8</td>
						<td>엑센트 4도어 가솔린 1.4 VVT Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1276</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1236</td>
						<td class="text-text-right">29.9</td>
						<td class="text-text-right">41.3</td>
						<td class="text-center bold">89.4</td>
					</tr>
					<tr>
						<td>엑센트 4도어 가솔린 1.4 VVT Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">1360</td>
						<td class="text-text-right">-40</td>
						<td class="text-text-right">1320</td>
						<td class="text-text-right">31.6</td>
						<td class="text-text-right">41.8</td>
						<td class="text-center bold">90.3</td>
					</tr>
					<tr class="primary-green">
						<td>엑센트 1.4 가솔린 (평균)</td>
						<td class="text-center"></td>
						<td class="text-text-right">1372</td>
						<td class="text-text-right">-16</td>
						<td class="text-text-right">1356</td>
						<td class="text-text-right">32.0</td>
						<td class="text-text-right">42.3</td>
						<td class="text-center bold">91.6</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년 기준</small>
		</div>
		
		<!-- 중/소형승용LPG -->
		<div role="tabpanel" class="tab-pane" id="middleLPG">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">중형·소형승용 LPG</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_02.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">중형·소형승용 LPG</span></h3><br/>
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
						<td class="text-text-right">2058.1</td>
						<td class="text-text-right">-48.1</td>
						<td class="text-text-right">2010.0</td>
						<td class="text-text-right">44.8</td>
						<td class="text-text-right">44.8</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K5 LPG(평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2122</td>
						<td class="text-text-right">-60</td>
						<td class="text-text-right">2062</td>
						<td class="text-text-right">45.0</td>
						<td class="text-text-right">45.8</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>LF쏘나타 LPG(평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2133</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2083</td>
						<td class="text-text-right">45.7</td>
						<td class="text-text-right">45.6</td>
						<td class="text-center bold">101.7</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>SM6 LPG(평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2427</td>
						<td class="text-text-right">-24</td>
						<td class="text-text-right">2403</td>
						<td class="text-text-right">53.3</td>
						<td class="text-text-right">45.1</td>
						<td class="text-center bold">100.8</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>NEW SM5 LPG(평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2019</td>
						<td class="text-text-right">-107</td>
						<td class="text-text-right">1913</td>
						<td class="text-text-right">43.0</td>
						<td class="text-text-right">44.5</td>
						<td class="text-center bold">99.4</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>아반떼 LPG(평균)</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">37.1</td>
						<td class="text-text-right">42.9</td>
						<td class="text-center bold">95.7</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년, 홈페이지 월대여료 차종별/엔진별 평균값 기준</small><br/>
			<br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">중형·소형승용 LPG</span></h3><br/>
			<small>※동일 차종/엔진 내에서는 차량가격 순서로 정렬</small>
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
						<td class="text-text-right">2058.1</td>
						<td class="text-text-right">-48.1</td>
						<td class="text-text-right">2010.0</td>
						<td class="text-text-right">44.8</td>
						<td class="text-text-right">44.8</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center" rowspan="4">1</td>
						<td>K5 LPG 2.0 LPI 럭셔리 A/T MX</td>
						<td>LPG</td>
						<td class="text-text-right">1860</td>
						<td class="text-text-right">-60</td>
						<td class="text-text-right">1800</td>
						<td class="text-text-right">39.2</td>
						<td class="text-text-right">45.9</td>
						<td class="text-center bold">102.5</td>
					</tr>
					<tr>
						<td>K5 LPG 2.0 LPI 프레스티지 MX</td>
						<td>LPG</td>
						<td class="text-text-right">2130</td>
						<td class="text-text-right">-60</td>
						<td class="text-text-right">2070</td>
						<td class="text-text-right">45.0</td>
						<td class="text-text-right">46.0</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td>K5 LPG 2.0 LPI 노블레스 MX</td>
						<td>LPG</td>
						<td class="text-text-right">2375</td>
						<td class="text-text-right">-60</td>
						<td class="text-text-right">2315</td>
						<td class="text-text-right">50.7</td>
						<td class="text-text-right">45.7</td>
						<td class="text-center bold">102.0</td>
					</tr>
					<tr class="primary-green">
						<td>K5 LPG (평균)</td>
						<td></td>
						<td class="text-text-right">2122</td>
						<td class="text-text-right">-60</td>
						<td class="text-text-right">2062</td>
						<td class="text-text-right">45.0</td>
						<td class="text-text-right">45.8</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr>
						<td class="text-center" rowspan="4">2</td>
						<td>LF쏘나타 LPG 렌터카 Smart A/T</td>
						<td>LPG</td>
						<td class="text-text-right">1880</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">1830</td>
						<td class="text-text-right">40.1</td>
						<td class="text-text-right">45.6</td>
						<td class="text-center bold">101.9</td>
					</tr>
					<tr>
						<td>LF쏘나타 LPG 렌터카 Premium</td>
						<td>LPG</td>
						<td class="text-text-right">2190</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2140</td>
						<td class="text-text-right">47.0</td>
						<td class="text-text-right">45.5</td>
						<td class="text-center bold">101.7</td>
					</tr>
					<tr>
						<td>LF쏘나타 LPG 렌터카 Premium Special</td>
						<td>LPG</td>
						<td class="text-text-right">2330</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2280</td>
						<td class="text-text-right">50.1</td>
						<td class="text-text-right">45.5</td>
						<td class="text-center bold">101.6</td>
					</tr>
					<tr class="primary-green">
						<td>LF쏘나타 LPG (평균)</td>
						<td></td>
						<td class="text-text-right">2133</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2083</td>
						<td class="text-text-right">45.7</td>
						<td class="text-text-right">45.6</td>
						<td class="text-center bold">101.7</td>
					</tr>
					<tr>
						<td class="text-center" rowspan="3">3</td>
						<td>SM6 LPG 2.0 LPe 장애인용 SE</td>
						<td>LPG</td>
						<td class="text-text-right">2348</td>
						<td class="text-text-right">-23</td>
						<td class="text-text-right">2325</td>
						<td class="text-text-right">51.5</td>
						<td class="text-text-right">45.1</td>
						<td class="text-center bold">100.8</td>
					</tr>
					<tr>
						<td>SM6 LPG 2.0 LPe 장애인용 LE</td>
						<td>LPG</td>
						<td class="text-text-right">2505</td>
						<td class="text-text-right">-25</td>
						<td class="text-text-right">2480</td>
						<td class="text-text-right">55.0</td>
						<td class="text-text-right">45.1</td>
						<td class="text-center bold">100.7</td>
					</tr>
					<tr class="primary-green">
						<td>SM6 LPG (평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2427</td>
						<td class="text-text-right">-24</td>
						<td class="text-text-right">2403</td>
						<td class="text-text-right">53.3</td>
						<td class="text-text-right">45.1</td>
						<td class="text-center bold">100.8</td>
					</tr>
					<tr>
						<td class="text-center" rowspan="3">4</td>
						<td>NEW SM5 LPG 2.0 LPLi 고급형</td>
						<td>LPG</td>
						<td class="text-text-right">1928</td>
						<td class="text-text-right">-103</td>
						<td class="text-text-right">1825</td>
						<td class="text-text-right">41.1</td>
						<td class="text-text-right">44.4</td>
						<td class="text-center bold">99.2</td>
					</tr>
					<tr>
						<td>NEW SM5 LPG 2.0 LPLi 최고급형</td>
						<td>LPG</td>
						<td class="text-text-right">2110</td>
						<td class="text-text-right">-110</td>
						<td class="text-text-right">2000</td>
						<td class="text-text-right">44.8</td>
						<td class="text-text-right">44.6</td>
						<td class="text-center bold">99.7</td>
					</tr>
					<tr class="primary-green">
						<td>NEW SM5 LPG (평균)</td>
						<td>LPG</td>
						<td class="text-text-right">2019</td>
						<td class="text-text-right">-107</td>
						<td class="text-text-right">1913</td>
						<td class="text-text-right">43.0</td>
						<td class="text-text-right">44.5</td>
						<td class="text-center bold">99.4</td>
					</tr>
					<tr>
						<td class="text-center" rowspan="3">5</td>
						<td>아반떼 LPG 1.6 LPi 법인전용</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">37.1</td>
						<td class="text-text-right">42.9</td>
						<td class="text-center bold">95.7</td>
					</tr>
					<tr>
						<td>아반떼 LPG 1.6 렌터카 Style</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">37.1</td>
						<td class="text-text-right">42.9</td>
						<td class="text-center bold">95.7</td>
					</tr>
					<tr class="primary-green">
						<td>아반떼 LPG (평균)</td>
						<td>LPG</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">0</td>
						<td class="text-text-right">1590</td>
						<td class="text-text-right">37.1</td>
						<td class="text-text-right">42.9</td>
						<td class="text-center bold">95.7</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 중형승용 -->
		<div role="tabpanel" class="tab-pane" id="middle">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">중형승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_03.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">중형승용</span></h3><br/>
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
						<td class="text-text-right">2575.4</td>
						<td class="text-text-right">-59.0</td>
						<td class="text-text-right">2516.5</td>
						<td class="text-text-right">50.9</td>
						<td class="text-text-right">49.5</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K5 2.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2494</td>
						<td class="text-text-right">-97</td>
						<td class="text-text-right">2397</td>
						<td class="text-text-right">45.6</td>
						<td class="text-text-right">52.6</td>
						<td class="text-center bold">106.3</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>K5 1.7 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2645</td>
						<td class="text-text-right">-102</td>
						<td class="text-text-right">2543</td>
						<td class="text-text-right">49.1</td>
						<td class="text-text-right">51.8</td>
						<td class="text-center bold">104.7</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>LF쏘나타 2.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2493</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2443</td>
						<td class="text-text-right">47.3</td>
						<td class="text-text-right">51.6</td>
						<td class="text-center bold">104.3</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>LF쏘나타 1.7 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-text-right">2621</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2571</td>
						<td class="text-text-right">50.6</td>
						<td class="text-text-right">50.8</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>K5 1.6 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2550</td>
						<td class="text-text-right">-99</td>
						<td class="text-text-right">2451</td>
						<td class="text-text-right">49.5</td>
						<td class="text-text-right">49.6</td>
						<td class="text-center bold">100.2</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>SM6 2.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2596</td>
						<td class="text-text-right">-26</td>
						<td class="text-text-right">2571</td>
						<td class="text-text-right">52.0</td>
						<td class="text-text-right">49.4</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>LF쏘나타 2.0 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2651</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2601</td>
						<td class="text-text-right">53.3</td>
						<td class="text-text-right">48.8</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>말리부 2.0 가솔린(터보)(평균)	</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2957</td>
						<td class="text-text-right">-20</td>
						<td class="text-text-right">2937</td>
						<td class="text-text-right">60.3</td>
						<td class="text-text-right">48.7</td>
						<td class="text-center bold">98.5</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>말리부 1.5 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2459</td>
						<td class="text-text-right">-20</td>
						<td class="text-text-right">2439</td>
						<td class="text-text-right">50.2</td>
						<td class="text-text-right">48.6</td>
						<td class="text-center bold">98.2</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>LF쏘나타 1.6 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2376</td>
						<td class="text-text-right">-50</td>
						<td class="text-text-right">2326</td>
						<td class="text-text-right">48.0</td>
						<td class="text-text-right">48.5</td>
						<td class="text-center bold">98.0</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>SM6 1.6 가솔린(터보)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2859</td>
						<td class="text-text-right">-28</td>
						<td class="text-text-right">2831</td>
						<td class="text-text-right">59.4</td>
						<td class="text-text-right">47.7</td>
						<td class="text-center bold">96.4</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>NEW SM5 2.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-text-right">2205</td>
						<td class="text-text-right">-116</td>
						<td class="text-text-right">2089</td>
						<td class="text-text-right">45.9</td>
						<td class="text-text-right">45.5</td>
						<td class="text-center bold">92.0</td>
					</tr>
				</tbody>
			</table>
			<small> ※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년, 홈페이지 월대여료 차종별/엔진별 평균값 기준</small>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">중형 승용</span></h3><br/>
			<table class="table table-bordered desc-table">
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
						<td>&nbsp;</td>
						<td class="text-center"><b>중형승용 평균</b></td>
						<td>&nbsp;</td>
						<td class="text-right"><b>2621.3</b></td>
						<td class="text-right"><b>-50.0</b></td>
						<td class="text-right"><b>2571.3</b></td>
						<td class="text-right"><b>50.6</b></td>
						<td class="text-right"><b>50.8</b></td>
						<td class="text-center"><b>102.7</b></td>
					</tr>
					<tr>
						<td rowspan="6" class="text-center">1</td>
						<td>K5 2.0 가솔린 디럭스 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2204</td>
						<td class="text-right">-87</td>
						<td class="text-right">2117</td>
						<td class="text-right">40.5</td>
						<td class="text-right">52.3</td>
						<td class="text-center bold">105.7 </td>
					</tr>
					<tr>
						<td>K5 2.0 가솔린 럭셔리 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2341</td>
						<td class="text-right">-92</td>
						<td class="text-right">2249</td>
						<td class="text-right">42.7</td>
						<td class="text-right">52.7</td>
						<td class="text-center bold">106.5</td>
					</tr>
					<tr>
						<td>K5 2.0 가솔린 프레스티지 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2474</td>
						<td class="text-right">-96</td>
						<td class="text-right">2378</td>
						<td class="text-right">45.1</td>
						<td class="text-right">52.7</td>
						<td class="text-center bold">106.6</td>
					</tr>
					<tr>
						<td>K5 2.0 가솔린 노블레스 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2636</td>
						<td class="text-right">-102</td>
						<td class="text-right">2534</td>
						<td class="text-right">48.2</td>
						<td class="text-right">52.6</td>
						<td class="text-center bold">106.3</td>
					</tr>
					<tr>
						<td>K5 2.0 가솔린 노블레스 스페셜 MX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2817</td>
						<td class="text-right">-108</td>
						<td class="text-right">2709</td>
						<td class="text-right">51.5</td>
						<td class="text-right">52.6</td>
						<td class="text-center bold">106.4</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">K5 2.0 가솔린 (평균) </td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2494 </td>
						<td class="text-right">-97 </td>
						<td class="text-right">2397 </td>
						<td class="text-right">45.6 </td>
						<td class="text-right">52.6 </td>
						<td class="text-center bold">106.3 </td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">2</td>
						<td>K5 1.7 디젤 디럭스 MX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2435</td>
						<td class="text-right">-95</td>
						<td class="text-right">2340</td>
						<td class="text-right">45.4</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td>K5 1.7 디젤 럭셔리 MX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2572</td>
						<td class="text-right">-100</td>
						<td class="text-right">2472</td>
						<td class="text-right">47.5</td>
						<td class="text-right">52.0</td>
						<td class="text-center bold">105.2</td>
					</tr>
					<tr>
						<td>K5 1.7 디젤 프레스티지 MX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2705</td>
						<td class="text-right">-104</td>
						<td class="text-right">2601</td>
						<td class="text-right">50.2</td>
						<td class="text-right">51.8</td>
						<td class="text-center bold">104.8</td>
					</tr>
					<tr>
						<td>K5 1.7 디젤 노블레스 MX</td>
						<td class="text-center">경유</td>
						<td class="text-right">2867</td>
						<td class="text-right">-110</td>
						<td class="text-right">2757</td>
						<td class="text-right">53.2</td>
						<td class="text-right">51.8</td>
						<td class="text-center bold">104.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">K5 1.7 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2645</td>
						<td class="text-right">-102</td>
						<td class="text-right">2543</td>
						<td class="text-right">49.1</td>
						<td class="text-right">51.8</td>
						<td class="text-center bold">104.7</td>
					</tr>
					<tr>
						<td rowspan="5" class="text-center">3</td>
						<td>LF쏘나타 2.0 CVVL Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2214</td>
						<td class="text-right">-50</td>
						<td class="text-right">2164</td>
						<td class="text-right">42.0</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td>LF쏘나타 2.0 CVVL Care+</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2450</td>
						<td class="text-right">-50</td>
						<td class="text-right">2400</td>
						<td class="text-right">46.4</td>
						<td class="text-right">51.7</td>
						<td class="text-center bold">104.6</td>
					</tr>
					<tr>
						<td>LF쏘나타 2.0 CVVL Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2498</td>
						<td class="text-right">-50</td>
						<td class="text-right">2448</td>
						<td class="text-right">47.5</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr>
						<td>LF쏘나타 2.0 CVVL Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2808</td>
						<td class="text-right">-50</td>
						<td class="text-right">2758</td>
						<td class="text-right">53.4</td>
						<td class="text-right">51.6</td>
						<td class="text-center bold">104.4</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">LF쏘나타 2.0 가솔린 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2493</td>
						<td class="text-right">-50</td>
						<td class="text-right">2443</td>
						<td class="text-right">47.3</td>
						<td class="text-right">51.6</td>
						<td class="text-center bold">104.3</td>
					</tr>
					<tr>
						<td rowspan="4" class="text-center">4</td>
						<td>LF쏘나타 디젤 1.7 e-VGT Style</td>
						<td class="text-center">경유</td>
						<td class="text-right">2459</td>
						<td class="text-right">-50</td>
						<td class="text-right">2409</td>
						<td class="text-right">47.5</td>
						<td class="text-right">50.7</td>
						<td class="text-center bold">102.5</td>
					</tr>
					<tr>
						<td>LF쏘나타 디젤 1.7 e-VGT Care+</td>
						<td class="text-center">경유</td>
						<td class="text-right">2676</td>
						<td class="text-right">-50</td>
						<td class="text-right">2626</td>
						<td class="text-right">51.7</td>
						<td class="text-right">50.8</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td>LF쏘나타 디젤 1.7 e-VGT Smart</td>
						<td class="text-center">경유</td>
						<td class="text-right">2729</td>
						<td class="text-right">-50</td>
						<td class="text-right">2679</td>
						<td class="text-right">52.7</td>
						<td class="text-right">50.8</td>
						<td class="text-center bold">102.8</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">LF쏘나타 1.7 디젤 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2621</td>
						<td class="text-right">-50</td>
						<td class="text-right">2571</td>
						<td class="text-right">50.6</td>
						<td class="text-right">50.8</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">5</td>
						<td>K5 1.6 T-GDI 가솔린 럭셔리 SX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2484</td>
						<td class="text-right">-97</td>
						<td class="text-right">2387</td>
						<td class="text-right">48.3</td>
						<td class="text-right">49.4</td>
						<td class="text-center bold">99.9</td>
					</tr>
					<tr>
						<td>K5 1.6 T-GDI 가솔린 프레스티지 SX</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2616</td>
						<td class="text-right">-101</td>
						<td class="text-right">2515</td>
						<td class="text-right">50.6</td>
						<td class="text-right">49.7</td>
						<td class="text-center bold">100.5</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">K5 1.6 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2550</td>
						<td class="text-right">-99</td>
						<td class="text-right">2451</td>
						<td class="text-right">49.5</td>
						<td class="text-right">49.6</td>
						<td class="text-center bold">100.2</td>
					</tr>
					<tr>
						<td rowspan="4" class="text-center">6</td>
						<td>SM6 2.0 GDe PE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2400</td>
						<td class="text-right">-24</td>
						<td class="text-right">2376</td>
						<td class="text-right">48.5</td>
						<td class="text-right">49.0</td>
						<td class="text-center bold">99.0</td>
					</tr>
					<tr>
						<td>SM6 2.0 GDe SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2618</td>
						<td class="text-right">-26</td>
						<td class="text-right">2592</td>
						<td class="text-right">52.2</td>
						<td class="text-right">49.7</td>
						<td class="text-center bold">100.4</td>
					 </tr>
					<tr>
						<td>SM6 2.0 GDe LE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2771</td>
						<td class="text-right">-27</td>
						<td class="text-right">2744</td>
						<td class="text-right">55.3</td>
						<td class="text-right">49.6</td>
						<td class="text-center bold">100.3</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">SM6 2.0 가솔린 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2596</td>
						<td class="text-right">-26</td>
						<td class="text-right">2571</td>
						<td class="text-right">52.0</td>
						<td class="text-right">49.4</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">7</td>
						<td>LF쏘나타 2.0 터보 GDi Smart</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2651</td>
						<td class="text-right">-50</td>
						<td class="text-right">2601</td>
						<td class="text-right">53.3</td>
						<td class="text-right">48.8</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">LF쏘나타 2.0 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2651</td>
						<td class="text-right">-50</td>
						<td class="text-right">2601</td>
						<td class="text-right">53.3</td>
						<td class="text-right">48.8</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">8</td>
						<td>말리부 2.0 터보 LT 프리미엄</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2957</td>
						<td class="text-right">-20</td>
						<td class="text-right">2937</td>
						<td class="text-right">60.3</td>
						<td class="text-right">48.7</td>
						<td class="text-center bold">98.5</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">말리부 2.0 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2957</td>
						<td class="text-right">-20</td>
						<td class="text-right">2937</td>
						<td class="text-right">60.3</td>
						<td class="text-right">48.7</td>
						<td class="text-center bold">98.5</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">9</td>
						<td>말리부 1.5 터보 LS</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2310</td>
						<td class="text-right">-20</td>
						<td class="text-right">2290</td>
						<td class="text-right">47.6</td>
						<td class="text-right">48.1</td>
						<td class="text-center bold">97.3</td>
					</tr>
					<tr>
						<td>말리부 1.5 터보 LT</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2607</td>
						<td class="text-right">-20</td>
						<td class="text-right">2587</td>
						<td class="text-right">52.8</td>
						<td class="text-right">49.0</td>
						<td class="text-center bold">99.1</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">말리부 1.5 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2459</td>
						<td class="text-right">-20</td>
						<td class="text-right">2439</td>
						<td class="text-right">50.2</td>
						<td class="text-right">48.6</td>
						<td class="text-center bold">98.2</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">10</td>
						<td>LF쏘나타 1.6 터보 GDi Style</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2376</td>
						<td class="text-right">-50</td>
						<td class="text-right">2326</td>
						<td class="text-right">48.0</td>
						<td class="text-right">48.5</td>
						<td class="text-center bold">98.0</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">LF쏘나타 1.6 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2376</td>
						<td class="text-right">-50</td>
						<td class="text-right">2326</td>
						<td class="text-right">48.0</td>
						<td class="text-right">48.5</td>
						<td class="text-center bold">98.0</td>
					</tr>
					<tr>
						<td rowspan="3" class="text-center">11</td>
						<td>SM6 1.6 TCe SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2782</td>
						<td class="text-right">-27</td>
						<td class="text-right">2755</td>
						<td class="text-right">57.8</td>
						<td class="text-right">47.7</td>
						<td class="text-center bold">96.4</td>
					</tr>
					<tr>
						<td>SM6 1.6 TCe LE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2935</td>
						<td class="text-right">-29</td>
						<td class="text-right">2906</td>
						<td class="text-right">60.9</td>
						<td class="text-right">47.7</td>
						<td class="text-center bold">96.5</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">SM6 1.6 가솔린(터보) (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2859</td>
						<td class="text-right">-28</td>
						<td class="text-right">2831</td>
						<td class="text-right">59.4</td>
						<td class="text-right">47.7</td>
						<td class="text-center bold">96.4</td>
					</tr>
					<tr>
						<td rowspan="2" class="text-center">12</td>
						<td>NEW SM5 2.0 G(가솔린) Classic</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2205</td>
						<td class="text-right">-116</td>
						<td class="text-right">2089</td>
						<td class="text-right">45.9</td>
						<td class="text-right">45.5</td>
						<td class="text-center bold">92.0</td>
					</tr>
					<tr class="primary-green">
						<td class="text-center">NEW SM5 2.0 가솔린 (평균)</td>
						<td class="text-center">&nbsp;</td>
						<td class="text-right">2205</td>
						<td class="text-right">-116</td>
						<td class="text-right">2089</td>
						<td class="text-right">45.9</td>
						<td class="text-right">45.5</td>
						<td class="text-center bold">92.0</td>
					</tr>
				</tbody>
			</table>
			<small>※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년 기준</small>
		</div>
		
		<!-- 준대형승용 LPG -->
		<div role="tabpanel" class="tab-pane" id="largeLPG">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">준대형 승용 LPG</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_04.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">준대형승용 LPG</span></h3><br/>
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
						<td class="text-right"><b>2819.6</b></td>
						<td class="text-right"><b>-68.4</b></td>
						<td class="text-right"><b>2751.2</b></td>
						<td class="text-right"><b>59.2</b></td>
						<td class="text-right"><b>46.5</b></td>
						<td class="text-right bold">100.0</td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K7 LPG 3.0 LPI 럭셔리(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2650</td>
						<td class="text-right">0</td>
						<td class="text-right">2650</td>
						<td class="text-right">54.1</td>
						<td class="text-right">49.0</td>
						<td class="text-right bold">105.4</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>K7 LPG 3.0 LPI 프레스티지(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">3090</td>
						<td class="text-right">0</td>
						<td class="text-right">3090</td>
						<td class="text-right">64.3</td>
						<td class="text-right">48.1</td>
						<td class="text-right bold">103.4</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>그랜저HG LPG 렌터카 300 Modern(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2645</td>
						<td class="text-right">-80</td>
						<td class="text-right">2565</td>
						<td class="text-right">56.3</td>
						<td class="text-right">45.6</td>
						<td class="text-right bold">98.0</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>NEW SM7 LPG Nova 2.0 LPe (장애인용/렌터카)(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">2627</td>
						<td class="text-right">-182</td>
						<td class="text-right">2445</td>
						<td class="text-right">54.3</td>
						<td class="text-right">45.0</td>
						<td class="text-right bold">96.9</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>그랜저HG LPG 렌터카 300 Exclusive(평균)</td>
						<td class="text-center">LPG</td>
						<td class="text-right">3086</td>
						<td class="text-right">-80</td>
						<td class="text-right">3006</td>
						<td class="text-right">67.2</td>
						<td class="text-right">44.7</td>
						<td class="text-right bold">96.3</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 준대형승용 -->
		<div role="tabpanel" class="tab-pane" id="large">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">준대형 승용</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_05.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">준대형 승용</span></h3><br/>
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
						<td class="text-right"><b>3435.0</b></td>
						<td class="text-right"><b>-79.9</b></td>
						<td class="text-right"><b>3355.1</b></td>
						<td class="text-right"><b>65.4</b></td>
						<td class="text-right"><b>51.5</b></td>
						<td class="text-right bold"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>K7 2.4 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2994</td>
						<td class="text-right">0</td>
						<td class="text-right">2994</td>
						<td class="text-right">54.3</td>
						<td class="text-right">55.2</td>
						<td class="text-right bold">107.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>K7 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3269</td>
						<td class="text-right">0</td>
						<td class="text-right">3269</td>
						<td class="text-right">61.1</td>
						<td class="text-right">53.5</td>
						<td class="text-right bold">104.0</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>그랜저HG 2.4 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2983</td>
						<td class="text-right">-80</td>
						<td class="text-right">2903</td>
						<td class="text-right">54.9</td>
						<td class="text-right">52.9</td>
						<td class="text-right bold">102.8</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>K7 3.3 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3637</td>
						<td class="text-right">0</td>
						<td class="text-right">3637</td>
						<td class="text-right">70.2</td>
						<td class="text-right">51.8</td>
						<td class="text-right bold">100.7</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>그랜저HG 2.2 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3364</td>
						<td class="text-right">-80</td>
						<td class="text-right">3284</td>
						<td class="text-right">63.6</td>
						<td class="text-right">51.6</td>
						<td class="text-right bold">100.3</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>아슬란 3.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3927</td>
						<td class="text-right">-100</td>
						<td class="text-right">3827</td>
						<td class="text-right">74.5</td>
						<td class="text-right">51.4</td>
						<td class="text-right bold">99.8</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>NEW SM7 2.5 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3135</td>
						<td class="text-right">-202</td>
						<td class="text-right">2933</td>
						<td class="text-right">57.3</td>
						<td class="text-right">51.2</td>
						<td class="text-right bold">99.6</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>임팔라 2.5 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3580</td>
						<td class="text-right">-20</td>
						<td class="text-right">3560</td>
						<td class="text-right">70.3</td>
						<td class="text-right">50.6</td>
						<td class="text-right bold">98.4</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>그랜저HG 3.0 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3508</td>
						<td class="text-right">-80</td>
						<td class="text-right">3428</td>
						<td class="text-right">67.8</td>
						<td class="text-right">50.5</td>
						<td class="text-right bold">98.2</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>아슬란 3.3 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3868</td>
						<td class="text-right">-100</td>
						<td class="text-right">3768</td>
						<td class="text-right">75.3</td>
						<td class="text-right">50.0</td>
						<td class="text-right bold">97.2</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>NEW SM7 3.5 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3520</td>
						<td class="text-right">-217</td>
						<td class="text-right">3303</td>
						<td class="text-right">70.0</td>
						<td class="text-right">47.2</td>
						<td class="text-right bold">91.7</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">준대형 승용</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>준대형승용 평균</b> (위 표의 평균값 적용)</td>
						<td class="text-right"><b>3435.0</b></td>
						<td class="text-right"><b>-79.9</b></td>
						<td class="text-right"><b>3355.1</b></td>
						<td class="text-right"><b>65.4</b></td>
						<td class="text-right"><b>51.5</b></td>
						<td class="text-center"><b>100</b></td>
					</tr>
					<tr>
						<td rowspan="3">1</td>
						<td>K7 2.4 GDI 프레스티지(네비게이션 미적용)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2955</td>
						<td class="text-right">0</td>
						<td class="text-right">2955</td>
						<td class="text-right">53.6</td>
						<td class="text-right">55.1</td>
						<td class="text-center bold">107.1 </td>
					</tr>
					<tr>
						<td>K7 2.4 GDI 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3033</td>
						<td class="text-right">0</td>
						<td class="text-right">3033</td>
						<td class="text-right">54.9</td>
						<td class="text-right">55.2</td>
						<td class="text-center bold">107.4</td>
					</tr>
					<tr class="primary-green">
						<td height="40">K7 2.4 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">2994 </td>
						<td class="text-right">0</td>
						<td class="text-right">2994 </td>
						<td class="text-right">54.3</td>
						<td class="text-right">55.2 </td>
						<td class="text-center bold">107.2</td>
					</tr>
					<tr>
						<td rowspan="3">2</td>
						<td>K7 2.2 디젤 프레스티지(네비게이션 미적용)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3230</td>
						<td class="text-right">0</td>
						<td class="text-right">3230</td>
						<td class="text-right">60.5</td>
						<td class="text-right">53.4</td>
						<td class="text-center bold">103.7</td>
					</tr>
					<tr>
						<td>K7 2.2 디젤 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">3308</td>
						<td class="text-right">0</td>
						<td class="text-right">3308</td>
						<td class="text-right">61.7</td>
						<td class="text-right">53.6</td>
						<td class="text-center bold">104.2</td>
					</tr>
					<tr class="primary-green">
						<td height="40">K7 2.2 디젤 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3269</td>
						<td class="text-right">0</td>
						<td class="text-right">3269</td>
						<td class="text-right">61.1</td>
						<td class="text-right">53.5</td>
						<td class="text-center bold">104.0</td>
					</tr>
					<tr>
						<td rowspan="3">3</td>
						<td>그랜저HG 240 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2933</td>
						<td class="text-right">-80</td>
						<td class="text-right">2853</td>
						<td class="text-right">54.0</td>
						<td class="text-right">52.8</td>
						<td class="text-center bold">102.7</td>
					</tr>
					<tr>
						<td>그랜저HG 240 Modern Collection</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3033</td>
						<td class="text-right">-80</td>
						<td class="text-right">2953</td>
						<td class="text-right">55.7</td>
						<td class="text-right">53.0</td>
						<td class="text-center bold">103.0</td>
					</tr>
					<tr class="primary-green">
						<td height="40">그랜저HG 2.4 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">2983</td>
						<td class="text-right">-80</td>
						<td class="text-right">2903</td>
						<td class="text-right">54.9</td>
						<td class="text-right">52.9</td>
						<td class="text-center bold">102.8</td>
					</tr>
					<tr>
						<td rowspan="3">4</td>
						<td>K7 3.3 GDI 노블레스</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3426</td>
						<td class="text-right">0</td>
						<td class="text-right">3426</td>
						<td class="text-right">65.6</td>
						<td class="text-right">52.2</td>
						<td class="text-center bold">101.5</td>
					</tr>
					<tr>
						<td>K7 3.3 GDI 노블레스 스페셜</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3848</td>
						<td class="text-right">0</td>
						<td class="text-right">3848</td>
						<td class="text-right">74.7</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">100.1</td>
					</tr>
					<tr class="primary-green">
						<td height="40">K7 3.3 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3637</td>
						<td class="text-right">0</td>
						<td class="text-right">3637</td>
						<td class="text-right">70.2</td>
						<td class="text-right">51.8</td>
						<td class="text-center bold">100.7</td>
					</tr>
					<tr>
						<td rowspan="5">5</td>
						<td>그랜저HG 디젤 220 Modern</td>
						<td class="text-center">경유</td>
						<td class="text-right">3156</td>
						<td class="text-right">-80</td>
						<td class="text-right">3076</td>
						<td class="text-right">59.8</td>
						<td class="text-right">51.4</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr>
						<td>그랜저HG 디젤 220 Modern Collection</td>
						<td class="text-center">경유</td>
						<td class="text-right">3303</td>
						<td class="text-right">-80</td>
						<td class="text-right">3223</td>
						<td class="text-right">61.3</td>
						<td class="text-right">52.6</td>
						<td class="text-center bold">102.2</td>
					</tr>
					<tr>
						<td>그랜저HG 디젤 220 Premium</td>
						<td class="text-center">경유</td>
						<td class="text-right">3389</td>
						<td class="text-right">-80</td>
						<td class="text-right">3309</td>
						<td class="text-right">64.2</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">100.2</td>
					</tr>
					<tr>
						<td>그랜저HG 디젤 220 Premium Collection</td>
						<td class="text-center">경유</td>
						<td class="text-right">3608</td>
						<td class="text-right">-80</td>
						<td class="text-right">3528</td>
						<td class="text-right">69.2</td>
						<td class="text-right">51.0</td>
						<td class="text-center bold">99.1</td>
					</tr>
					<tr class="primary-green">
						<td height="40">그랜저HG 2.2 디젤 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3364</td>
						<td class="text-right">-80</td>
						<td class="text-right">3284</td>
						<td class="text-right">63.6</td>
						<td class="text-right">51.6</td>
						<td class="text-center bold">100.3</td>
					</tr>
					<tr>
						<td rowspan="3">6</td>
						<td>아슬란 G300 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3721</td>
						<td class="text-right">-100</td>
						<td class="text-right">3621</td>
						<td class="text-right">70.7</td>
						<td class="text-right">51.2</td>
						<td class="text-center bold">99.5</td>
					</tr>
					<tr>
						<td>아슬란 G300 EXCLUSIVE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4133</td>
						<td class="text-right">-100</td>
						<td class="text-right">4033</td>
						<td class="text-right">78.3</td>
						<td class="text-right">51.5</td>
						<td class="text-center bold">100.1</td>
					</tr>
					<tr class="primary-green">
						<td height="40">아슬란 3.0 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3927</td>
						<td class="text-right">-100</td>
						<td class="text-right">3827</td>
						<td class="text-right">74.5</td>
						<td class="text-right">51.4</td>
						<td class="text-center bold">99.8</td>
					</tr>
					<tr>
						<td rowspan="3">7</td>
						<td>NEW SM7 Nova SE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3034</td>
						<td class="text-right">-198</td>
						<td class="text-right">2836</td>
						<td class="text-right">55.6</td>
						<td class="text-right">51.0</td>
						<td class="text-center bold">99.1</td>
					</tr>
					<tr>
						<td>NEW SM7 Nova LE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3236</td>
						<td class="text-right">-206</td>
						<td class="text-right">3030</td>
						<td class="text-right">58.9</td>
						<td class="text-right">51.4</td>
						<td class="text-center bold">100.0</td>
					</tr>
					<tr class="primary-green">
						<td height="40">NEW SM7 2.5 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3135</td>
						<td class="text-right">-202</td>
						<td class="text-right">2933</td>
						<td class="text-right">57.3</td>
						<td class="text-right">51.2</td>
						<td class="text-center bold">99.6</td>
					</tr>
					<tr>
						<td rowspan="3">8</td>
						<td>임팔라 2.5 가솔린 LT</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3363</td>
						<td class="text-right">-20</td>
						<td class="text-right">3343</td>
						<td class="text-right">65.5</td>
						<td class="text-right">51.0</td>
						<td class="text-center bold">99.2</td>
					</tr>
					<tr>
						<td>임팔라 2.5 가솔린 LTZ</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3797</td>
						<td class="text-right">-20</td>
						<td class="text-right">3777</td>
						<td class="text-right">75.1</td>
						<td class="text-right">50.3</td>
						<td class="text-center bold">97.7</td>
					</tr>
					<tr class="primary-green">
						<td height="40">임팔라 2.5 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3580</td>
						<td class="text-right">-20</td>
						<td class="text-right">3560</td>
						<td class="text-right">70.3</td>
						<td class="text-right">50.6</td>
						<td class="text-center bold">98.4</td>
					</tr>
					<tr>
						<td rowspan="4">9</td>
						<td>그랜저HG 300 Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3259</td>
						<td class="text-right">-80</td>
						<td class="text-right">3179</td>
						<td class="text-right">62.4</td>
						<td class="text-right">50.9</td>
						<td class="text-center bold">99.0</td>
					</tr>
					<tr>
						<td>그랜저HG 300 Premium Collection</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3416</td>
						<td class="text-right">-80</td>
						<td class="text-right">3336</td>
						<td class="text-right">65.7</td>
						<td class="text-right">50.8</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr>
						<td>그랜저HG 300 Exclusive Collection</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3848</td>
						<td class="text-right">-80</td>
						<td class="text-right">3768</td>
						<td class="text-right">75.4</td>
						<td class="text-right">50.0</td>
						<td class="text-center bold">97.1</td>
					</tr>
					<tr class="primary-green">
						<td height="40">그랜저HG 3.0 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3508</td>
						<td class="text-right">-80</td>
						<td class="text-right">3428</td>
						<td class="text-right">67.8</td>
						<td class="text-right">50.5</td>
						<td class="text-center bold">98.2</td>
					</tr>
					<tr>
						<td rowspan="2">10</td>
						<td>아슬란 G330 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3868</td>
						<td class="text-right">-100</td>
						<td class="text-right">3768</td>
						<td class="text-right">75.3</td>
						<td class="text-right">50.0</td>
						<td class="text-center bold">97.2</td>
					</tr>
					<tr class="primary-green">
						<td height="40">아슬란 3.3 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3868</td>
						<td class="text-right">-100</td>
						<td class="text-right">3768</td>
						<td class="text-right">75.3</td>
						<td class="text-right">50.0</td>
						<td class="text-center bold">97.2</td>
					</tr>
					<tr>
						<td rowspan="2">11</td>
						<td>NEW SM7 Nova LE35</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3520</td>
						<td class="text-right">-217</td>
						<td class="text-right">3303</td>
						<td class="text-right">70.0</td>
						<td class="text-right">47.2</td>
						<td class="text-center bold">91.7</td>
					</tr>
					<tr class="primary-green">
						<td height="40">NEW SM7 3.5 가솔린 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">3520</td>
						<td class="text-right">-217</td>
						<td class="text-right">3303</td>
						<td class="text-right">70.0</td>
						<td class="text-right">47.2</td>
						<td class="text-center bold">91.7</td>
					</tr>
				</tbody>
			</table>			
		</div>
		
		<!-- 대형 -->
		<div role="tabpanel" class="tab-pane" id="big">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">대형 승용(프리미엄 세단)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<div class="text-center">
				<img class="full-width" src="/resources/images/uindex_graph_do_201606_06.png"/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">대형 승용(프리미엄 세단)</span></h3><br/>
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
						<td class="text-right"><b>6192.7</b></td>
						<td class="text-right"><b>-72.3</b></td>
						<td class="text-right"><b>6120.4</b></td>
						<td class="text-right"><b>117.8</b></td>
						<td class="text-right"><b>52.0</b></td>
						<td class="text-right bold"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>제네시스 3.3(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4862</td>
						<td class="text-right">-150</td>
						<td class="text-right">4712</td>
						<td class="text-right">84.4</td>
						<td class="text-right">55.9</td>
						<td class="text-right bold">107.5</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>제네시스 EQ900 3.8(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7955</td>
						<td class="text-right">0</td>
						<td class="text-right">7955</td>
						<td class="text-right">144.9</td>
						<td class="text-right">54.9</td>
						<td class="text-right bold">105.6</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>제네시스 EQ900 3.3터보(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">8345</td>
						<td class="text-right">0</td>
						<td class="text-right">8345</td>
						<td class="text-right">153.3</td>
						<td class="text-right">54.4</td>
						<td class="text-right bold">104.7</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>제네시스 3.8(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5661</td>
						<td class="text-right">-150</td>
						<td class="text-right">5511</td>
						<td class="text-right">103.6</td>
						<td class="text-right">53.2</td>
						<td class="text-right bold">102.4</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>K9 3.3(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5066</td>
						<td class="text-right">0</td>
						<td class="text-right">5066</td>
						<td class="text-right">98.7</td>
						<td class="text-right">51.3</td>
						<td class="text-right bold">98.7</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>K9 3.8(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5576</td>
						<td class="text-right">0</td>
						<td class="text-right">5576</td>
						<td class="text-right">113.5</td>
						<td class="text-right">49.1</td>
						<td class="text-right bold">94.5</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>체어맨W 3.2 (CW600)(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5885</td>
						<td class="text-right">-206</td>
						<td class="text-right">5679</td>
						<td class="text-right">126.1</td>
						<td class="text-right">45.0</td>
						<td class="text-right bold">86.7</td>
					</tr>								
				</tbody>
			</table>
			<br/>
			<h3>장기렌트 효용지수 테이블(상세) - <span class="primary-orange">대형 승용(프리미엄 세단)</span></h3><br/>
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
						<td class="text-right"><b>6192.7</b></td>
						<td class="text-right"><b>-72.3</b></td>
						<td class="text-right"><b>6120.4</b></td>
						<td class="text-right"><b>117.8</b></td>
						<td class="text-right"><b>52.0</b></td>
						<td class="text-center"><b>100</b></td>
					</tr>
					<tr>
						<td rowspan="3">1</td>
						<td>제네시스 G330 Modern</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4565</td>
						<td class="text-right">-150</td>
						<td class="text-right">4415</td>
						<td class="text-right">78.9</td>
						<td class="text-right">56.0</td>
						<td class="text-center bold">107.6</td>
					</tr>
					<tr>
						<td>제네시스 G330 Premium</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5159</td>
						<td class="text-right">-150</td>
						<td class="text-right">5009</td>
						<td class="text-right">89.8</td>
						<td class="text-right">55.8</td>
						<td class="text-center bold">107.3</td>
					</tr>
					<tr class="primary-green">
						<td height="40">제네시스 3.3 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">4862 </td>
						<td class="text-right"><span class="text-right">-150</span></td>
						<td class="text-right">4712 </td>
						<td class="text-right">84.4</td>
						<td class="text-right">55.9 </td>
						<td class="text-center bold">107.5</td>
					</tr>
					<tr>
						<td rowspan="3">2</td>
						<td>제네시스 EQ900 3.8 GDi Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7170</td>
						<td class="text-right">0</td>
						<td class="text-right">7170</td>
						<td class="text-right">127.5</td>
						<td class="text-right">56.2</td>
						<td class="text-center bold">108.2</td>
					</tr>
					<tr>
						<td>제네시스 EQ900 3.8 GDi Premium Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">8740</td>
						<td class="text-right">0</td>
						<td class="text-right">8740</td>
						<td class="text-right">162.3</td>
						<td class="text-right">53.9</td>
						<td class="text-center bold">103.6</td>
					</tr>
					<tr class="primary-green">
						<td height="40">제네시스 EQ900 3.8(평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">7955</td>
						<td class="text-right">0</td>
						<td class="text-right">7955</td>
						<td class="text-right">144.9</td>
						<td class="text-right">54.9</td>
						<td class="text-center bold">105.6</td>
					</tr>
					<tr>
						<td rowspan="3">3</td>
						<td>제네시스 EQ900 3.3T-GDi Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7560</td>
						<td class="text-right">0</td>
						<td class="text-right">7560</td>
						<td class="text-right">135.8</td>
						<td class="text-right">55.7</td>
						<td class="text-center bold">107.1</td>
					</tr>
					<tr>
						<td>제네시스 EQ900 3.3T-GDi Premium Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">9130</td>
						<td class="text-right">0</td>
						<td class="text-right">9130</td>
						<td class="text-right">170.8</td>
						<td class="text-right">53.5</td>
						<td class="text-center bold">102.8</td>
					</tr>
					<tr class="primary-green">
						<td height="40">제네시스 EQ900 3.3터보 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">8345</td>
						<td class="text-right">0</td>
						<td class="text-right">8345</td>
						<td class="text-right">153.3</td>
						<td class="text-right">54.4</td>
						<td class="text-center bold">104.7</td>
					</tr>
					<tr>
						<td rowspan="3">4</td>
						<td>제네시스 G380 Exclusive</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5363</td>
						<td class="text-right">-150</td>
						<td class="text-right">5213</td>
						<td class="text-right">97.4</td>
						<td class="text-right">53.5</td>
						<td class="text-center bold">102.9</td>
					</tr>
					<tr>
						<td>제네시스 G380 Prestige</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5959</td>
						<td class="text-right">-150</td>
						<td class="text-right">5809</td>
						<td class="text-right">109.7</td>
						<td class="text-right">53.0</td>
						<td class="text-center bold">101.9</td>
					</tr>
					<tr class="primary-green">
						<td height="40">제네시스 3.8 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">5661</td>
						<td class="text-right">-150</td>
						<td class="text-right">5511</td>
						<td class="text-right">103.6</td>
						<td class="text-right">53.2</td>
						<td class="text-center bold">102.4</td>
					</tr>
					<tr>
						<td rowspan="3">5</td>
						<td>K9 3.3 GDI 프레스티지</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4899</td>
						<td class="text-right">0</td>
						<td class="text-right">4899</td>
						<td class="text-right">95.0</td>
						<td class="text-right">51.6</td>
						<td class="text-center bold">99.2</td>
					</tr>
					<tr>
						<td>K9 3.3 GDI 이그제큐티브</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5232</td>
						<td class="text-right">0</td>
						<td class="text-right">5232</td>
						<td class="text-right">102.4</td>
						<td class="text-right">51.1</td>
						<td class="text-center bold">98.3</td>
					</tr>
					<tr class="primary-green">
						<td height="40">K9 3.3 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">5066</td>
						<td class="text-right">0</td>
						<td class="text-right">5066</td>
						<td class="text-right">98.7</td>
						<td class="text-right">51.3</td>
						<td class="text-center bold">98.7</td>
					</tr>
					<tr>
						<td rowspan="2">6</td>
						<td>K9 3.8 GDI 이그제큐티브</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5576</td>
						<td class="text-right">0</td>
						<td class="text-right">5576</td>
						<td class="text-right">113.5</td>
						<td class="text-right">49.1</td>
						<td class="text-center bold">94.5</td>
					</tr>
					<tr class="primary-green">
						<td height="40">K9 3.8 (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">5576</td>
						<td class="text-right">0</td>
						<td class="text-right">5576</td>
						<td class="text-right">113.5</td>
						<td class="text-right">49.1</td>
						<td class="text-center bold">94.5</td>
					</tr>
					<tr>
						<td rowspan="3">7</td>
						<td>체어맨W KAISER CW600 Luxury</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5531</td>
						<td class="text-right">-194</td>
						<td class="text-right">5337</td>
						<td class="text-right">118.1</td>
						<td class="text-right">45.2</td>
						<td class="text-center bold">86.9</td>
					</tr>
					<tr>
						<td>체어맨W KAISER CW600 Prestige</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6238</td>
						<td class="text-right">-218</td>
						<td class="text-right">6020</td>
						<td class="text-right">134.0</td>
						<td class="text-right">44.9</td>
						<td class="text-center bold">86.4</td>
					</tr>
					<tr class="primary-green">
						<td height="40">체어맨W 3.2 (CW600) (평균)</td>
						<td>&nbsp;</td>
						<td class="text-right">5885</td>
						<td class="text-right">-206</td>
						<td class="text-right">5679</td>
						<td class="text-right">126.1</td>
						<td class="text-right">45.0</td>
						<td class="text-center bold">86.7</td>
					</tr>				
				</tbody>
			</table>
		</div>
	</div>
</div>
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>
</t:genericpage>
