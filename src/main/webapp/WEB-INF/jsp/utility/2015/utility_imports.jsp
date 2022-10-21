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
		<a href="/utility/2015/rv"><div class="amazon-tab">국산 RV차</div></a>
		<a href="/utility/2015/imports"><div class="amazon-tab active">수입차</div></a>
	</div>
	<BR/>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">5천만원 이하</a></li>
		<li role="presentation"><a href="#2" aria-controls="2" role="tab" data-toggle="tab">5천만원~1억원</a></li>
	</ul>
	
	<div class="tab-content">
		<!-- 5000천만원 이하 -->
		<div role="tabpanel" class="tab-pane active" id="1">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">수입차(5천만원 이하)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_im_201511_01.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">수입차(5천만원 이하)</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>수입차(5천만원이하) 평균</b></td>
						<td class="text-right"><b>3935.2</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-right"><b>75.8</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-center"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>BMW 320d</td>
						<td class="text-center">경유</td>
						<td class="text-right">4940</td>
						<td class="text-right"></td>
						<td class="text-right">△</td>
						<td class="text-right">82.0</td>
						<td class="text-right">△</td>
						<td class="text-center">110.4</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>아우디 A4 30 TDI</td>
						<td class="text-center">경유</td>
						<td class="text-right">4600</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">73.4</td>
						<td class="text-right">△</td>
						<td class="text-center">109.3</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>벤츠 The new C200</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4790</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">90.2</td>
						<td class="text-right">△</td>
						<td class="text-center">106.2</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>폭스바겐 골프 2.0 TDI</td>
						<td class="text-center">경유</td>
						<td class="text-right">3450</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">61.5</td>
						<td class="text-right">△</td>
						<td class="text-center">105.5</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>폭스바겐 티구안 2.0 TDI Comfort</td>
						<td class="text-center">경유</td>
						<td class="text-right">3860</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">70.9</td>
						<td class="text-right">△</td>
						<td class="text-center">102.5</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>폭스바겐 제타 2.0 TDI</td>
						<td class="text-center">경유</td>
						<td class="text-right">3150</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">54.1</td>
						<td class="text-right">△</td>
						<td class="text-center">102.5</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>폭스바겐 CC 2.0 TDI</td>
						<td class="text-center">경유</td>
						<td class="text-right">4970</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">87.8</td>
						<td class="text-right">△</td>
						<td class="text-center">102.1</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>푸조 2008 1.6 디젤 Feline S</td>
						<td class="text-center">경유</td>
						<td class="text-right">2980</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">56.3</td>
						<td class="text-right">△</td>
						<td class="text-center">101.5</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>BMW 118d</td>
						<td class="text-center">경유</td>
						<td class="text-right">3860</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">67.2</td>
						<td class="text-right">△</td>
						<td class="text-center">101.2</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>미니 컨트리맨 쿠퍼 D ALL4</td>
						<td class="text-center">경유</td>
						<td class="text-right">4320</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">86.1</td>
						<td class="text-right">△</td>
						<td class="text-center">101.0</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>닛산 Altima 2.5 가솔린</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3290</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">67.4</td>
						<td class="text-right">△</td>
						<td class="text-center">98.7</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>벤츠 A180 CDI Style</td>
						<td class="text-center">경유</td>
						<td class="text-right">3710</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">73.9</td>
						<td class="text-right">△</td>
						<td class="text-center">98.6</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>도요타 캠리 2.5 XLE</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3330</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">70.2</td>
						<td class="text-right">△</td>
						<td class="text-center">98.4</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>벤츠 CLA200 CDI</td>
						<td class="text-center">경유</td>
						<td class="text-right">4410</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">91.8</td>
						<td class="text-right">△</td>
						<td class="text-center">97.9</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>푸조 208 1.6 디젤 (ECO)</td>
						<td class="text-center">경유</td>
						<td class="text-right">2790</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">54.2</td>
						<td class="text-right">△</td>
						<td class="text-center">97.2</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>포드 토러스 2.0가솔린 Limited</td>
						<td class="text-center">경유</td>
						<td class="text-right">4435</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">81.9</td>
						<td class="text-right">△</td>
						<td class="text-center">97.0</td>
					</tr>	
					<tr>
						<td class="text-center">17</td>
						<td>재규어 XE 2.0 디젤 프레스티지</td>
						<td class="text-center">경유</td>
						<td class="text-right">4710</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">103.4</td>
						<td class="text-right">△</td>
						<td class="text-center">95.7</td>
					</tr>	
					<tr>
						<td class="text-center">18</td>
						<td>포드 Mondeo 2.0 디젤 트렌드</td>
						<td class="text-center">경유</td>
						<td class="text-right">3930</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">79.6</td>
						<td class="text-right">△</td>
						<td class="text-center">95.6</td>
					</tr>	
					<tr>
						<td class="text-center">19</td>
						<td>푸조 뉴308 2.0 디젤 Active</td>
						<td class="text-center">경유</td>
						<td class="text-right">3390</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">73.6</td>
						<td class="text-right">△</td>
						<td class="text-center">95.1</td>
					</tr>
					<tr>
						<td class="text-center">20</td>
						<td>볼보 S60 D3 2.0 디젤</td>
						<td class="text-center">디젤</td>
						<td class="text-right">4270</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">88.4</td>
						<td class="text-right">△</td>
						<td class="text-center">94.8</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td>볼보 S60 D4 2.0 디젤</td>
						<td class="text-center">경유</td>
						<td class="text-right">4770</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">103.9</td>
						<td class="text-right">△</td>
						<td class="text-center">94.7</td>
					</tr>
					<tr>
						<td class="text-center">22</td>
						<td>폭스바겐 폴로 1.4 TDI R-Line</td>
						<td class="text-center">경유</td>
						<td class="text-right">2620</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">50.4</td>
						<td class="text-right">△</td>
						<td class="text-center">94.0</td>
					</tr>
				</tbody>
			</table>
			<small>※ 장기렌트 기본식 36개월 견적 기준,   △ : 제조사의 요청에 의한 미공개임</small>
		</div>
		
		<!-- 5천만원 이상 ~ 1억원 이하 -->
		<div role="tabpanel" class="tab-pane" id="2">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">수입차(5천만원~1억원)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015" selected>2015년 11월</option>
				  <option value="2016">2016년 6월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_im_201511_02.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블 - <span class="primary-orange">수입차(5천만원~1억원)</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>수입차(5천만원~1억원)  평균</b></td>
						<td class="text-right"><b>6848.5</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-right"><b>125.6</b></td>
						<td class="text-right"><b>△</b></td>
						<td class="text-center"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>BMW 520d M 에어로다이내믹</td>
						<td class="text-center">경유</td>
						<td class="text-right">6330</td>
						<td class="text-right"></td>
						<td class="text-right">△</td>
						<td class="text-right">103.5</td>
						<td class="text-right">△</td>
						<td class="text-center">108.7</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>벤츠 The new E220 BlueTEC AV</td>
						<td class="text-center">경유</td>
						<td class="text-right">6270</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">107.4</td>
						<td class="text-right">△</td>
						<td class="text-center">107.3</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>BMW 520d xDrive M 에어로다이내믹</td>
						<td class="text-center">경유</td>
						<td class="text-right">6730</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">111.9</td>
						<td class="text-right">△</td>
						<td class="text-center">106.9</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>벤츠 The new C220 d AV</td>
						<td class="text-center">경유</td>
						<td class="text-right">5520</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">99.0</td>
						<td class="text-right">△</td>
						<td class="text-center">105.6</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>아우디 The new A6 35 TDI Comfort</td>
						<td class="text-center">경유</td>
						<td class="text-right">6180</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">100.3</td>
						<td class="text-right">△</td>
						<td class="text-center">105.5</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>아우디 The new A6 35 TDI Premium</td>
						<td class="text-center">경유</td>
						<td class="text-right">6450</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">105.6</td>
						<td class="text-right">△</td>
						<td class="text-center">104.6</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>아우디 The new A6 40 TDI 콰트로 Premium</td>
						<td class="text-center">경유</td>
						<td class="text-right">7370</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">122.2</td>
						<td class="text-right">△</td>
						<td class="text-center">104.5</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>아우디 The new A6 40 TDI 콰트로 Sport</td>
						<td class="text-center">경유</td>
						<td class="text-right">7440</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">123.6</td>
						<td class="text-right">△</td>
						<td class="text-center">104.3</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>벤츠 The new E250 BlueTEC 4MATIC AV</td>
						<td class="text-center">경유</td>
						<td class="text-right">7190</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">127.7</td>
						<td class="text-right">△</td>
						<td class="text-center">103.6</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>벤츠 The new E300 EL</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6710</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">121.5</td>
						<td class="text-right">△</td>
						<td class="text-center">101.6</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>아우디 The new A7 50 TDI 콰트로 Comfort</td>
						<td class="text-center">경유</td>
						<td class="text-right">8840</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">154.3</td>
						<td class="text-right">△</td>
						<td class="text-center">101.5</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>BMW 528i</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6820</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">118.1</td>
						<td class="text-right">△</td>
						<td class="text-center">101.1</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>벤츠 The new E300 AV</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7000</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">127.6</td>
						<td class="text-right">△</td>
						<td class="text-center">100.9</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>아우디 The new Q3 30 TDI 콰트로 Design</td>
						<td class="text-center">경유</td>
						<td class="text-right">5130</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">93.5</td>
						<td class="text-right">△</td>
						<td class="text-center">100.3</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>아우디 Q5 35 TDI 콰트로</td>
						<td class="text-center">경유</td>
						<td class="text-right">6210</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">109.4</td>
						<td class="text-right">△</td>
						<td class="text-center">99.4</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>BMW X3 xDrive 20d xLine</td>
						<td class="text-center">경유</td>
						<td class="text-right">6700</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">130.8</td>
						<td class="text-right">△</td>
						<td class="text-center">98.0</td>
					</tr>	
					<tr>
						<td class="text-center">17</td>
						<td>랜드로버 레인지로버 이보크 2.0 디젤 SE</td>
						<td class="text-center">경유</td>
						<td class="text-right">6600</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">131.1</td>
						<td class="text-right">△</td>
						<td class="text-center">97.8</td>
					</tr>	
					<tr>
						<td class="text-center">18</td>
						<td>벤츠 The new E350 BlueTEC 4MATIC</td>
						<td class="text-center">경유</td>
						<td class="text-right">8830</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">166.1</td>
						<td class="text-right">△</td>
						<td class="text-center">97.7</td>
					</tr>	
					<tr>
						<td class="text-center">19</td>
						<td>벤츠 CLS250 BlueTEC 4MATIC</td>
						<td class="text-center">경유</td>
						<td class="text-right">8380</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">163.4</td>
						<td class="text-right">△</td>
						<td class="text-center">97.0</td>
					</tr>
					<tr>
						<td class="text-center">20</td>
						<td>BMW X5 xDrive 30d</td>
						<td class="text-center">경유</td>
						<td class="text-right">9630</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">186.1</td>
						<td class="text-right">△</td>
						<td class="text-center">96.4</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td>BMW GT 20d ED</td>
						<td class="text-center">경유</td>
						<td class="text-right">7300</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">140.7</td>
						<td class="text-right">△</td>
						<td class="text-center">95.4</td>
					</tr>
					<tr>
						<td class="text-center">22</td>
						<td>BMW 320d GT</td>
						<td class="text-center">경유</td>
						<td class="text-right">5440</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">105.7</td>
						<td class="text-right">△</td>
						<td class="text-center">95.1</td>
					</tr>
					<tr>
						<td class="text-center">23</td>
						<td>랜드로버 디스커버리4 3.0 디젤 SE</td>
						<td class="text-center">경유</td>
						<td class="text-right">8080</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">161.5</td>
						<td class="text-right">△</td>
						<td class="text-center">95.1</td>
					</tr>
					<tr>
						<td class="text-center">24</td>
						<td>렉서스 ES350 SUPREME</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5680</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">116.3</td>
						<td class="text-right">△</td>
						<td class="text-center">94.5</td>
					</tr>
					<tr>
						<td class="text-center">25</td>
						<td>포드 익스플로러 2.3 가솔린 Limited 4WD</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5600</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">116.2</td>
						<td class="text-right">△</td>
						<td class="text-center">94.4</td>
					</tr>
					<tr>
						<td class="text-center">26</td>
						<td>지프 그랜드체로키 3.0 디젤 리미티드</td>
						<td class="text-center">경유</td>
						<td class="text-right">7090</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">143.5</td>
						<td class="text-right">△</td>
						<td class="text-center">91.8</td>
					</tr>
					<tr>
						<td class="text-center">27</td>
						<td>링컨 MKZ 2.0 가솔린 300A, Retract Roof,Teck pkg FWD</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5390</td>
						<td class="text-right">△</td>
						<td class="text-right">△</td>
						<td class="text-right">104.4</td>
						<td class="text-right">△</td>
						<td class="text-center">91.2</td>
					</tr>
				</tbody>
			</table>		
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>
</div>
</t:genericpage>
