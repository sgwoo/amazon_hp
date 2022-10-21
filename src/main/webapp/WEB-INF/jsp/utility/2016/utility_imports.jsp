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
		<a href="/utility/2016/rv"><div class="amazon-tab">국산 RV차</div></a>
		<a href="/utility/2016/imports"><div class="amazon-tab active">수입차</div></a>
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
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				  <option value="2017">2017년 1월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_im_201606_01.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">수입차(5천만원 이하)</span></h3><br/>
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
						<td class="text-right"><b>4136.5</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-right"><b>82.6</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-center"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>BMW 320d(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4940</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">81.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">110.2</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>폭스바겐 CC 2.0 TDI(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4970</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">83.4</td>
						<td class="text-right">미공개</td>
						<td class="text-center">105.5</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>벤츠 The new C200(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4800</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">94.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">104.2</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>폭스바겐 골프 2.0 TDI(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3450</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">66.2</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.8</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>아우디 The new A4 45 TFSI(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">4950</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">98.0</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.4</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>폭스바겐 티구안 2.0 TDI Comfort(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3860</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">72.6</td>
						<td class="text-right">미공개</td>
						<td class="text-center">102.3</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>벤츠 GLA 200d(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">5000</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">103.1</td>
						<td class="text-right">미공개</td>
						<td class="text-center">101.6</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>인피니티 Q50 2.2d 프리미엄(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4430</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">94.4</td>
						<td class="text-right">미공개</td>
						<td class="text-center">98.0</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>도요타 캠리 2.5 XLE(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3330</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">69.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">97.8</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>재규어 XE 2.0 디젤 프레스티지(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4760</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">98.8</td>
						<td class="text-right">미공개</td>
						<td class="text-center">97.3</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>폭스바겐 파사트 1.8 Tsi(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3650</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">71.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">96.8</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>혼다 ACCORD 가솔린 2.4 EX-L(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3490</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">77.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">96.5</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>포드 Mondeo 2.0 디젤 트렌드(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">3930</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">78.3</td>
						<td class="text-right">미공개</td>
						<td class="text-center">96.1</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>혼다 CR-V 2.4 가솔린 4WD(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">3840</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">84.0</td>
						<td class="text-right">미공개</td>
						<td class="text-center">95.9</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>닛산 Altima 2.5 SL Smart 가솔린(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">2990</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">68.3</td>
						<td class="text-right">미공개</td>
						<td class="text-center">95.4</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>볼보 S60 D4 2.0 디젤(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">4770</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">100.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">95.1</td>
					</tr>					
				</tbody>
			</table>
			<small>※ 장기렌트 기본식 36개월, 약정운행거리 30,000km/1년 기준임</small>
		</div>
		
		<!-- 5천만원 이상 ~ 1억원 이하 -->
		<div role="tabpanel" class="tab-pane" id="2">
			<h3>장기렌트 효용지수 그래프 - <span class="primary-orange">수입차(5천만원~1억원)</span></h3><br/>
			<div class="text-right">
				<select name="yearSelectBox">
				  <option value="2015">2015년 11월</option>
				  <option value="2016" selected>2016년 6월</option>
				</select>
			</div>
			<img src="/resources/images/uindex_graph_im_201606_02.png"/><br/><br/>
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
			<h3>장기렌트 효용지수 테이블(요약) - <span class="primary-orange">수입차(5천만원~1억원)</span></h3><br/>
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
						<td class="text-center" colspan="3"><b>수입차(5천만원~1억원) 평균</b></td>
						<td class="text-right"><b>6982.6</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-right"><b>129.7</b></td>
						<td class="text-right"><b>미공개</b></td>
						<td class="text-center"><b>100.0</b></td>
					</tr>
					<tr>
						<td class="text-center">1</td>
						<td>아우디 The new A6 40 TDI 콰트로 Comfort(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">7030</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">102.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">111.9</td>
					</tr>
					<tr>
						<td class="text-center">2</td>
						<td>벤츠 The new E220d AV(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6560</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">117.0</td>
						<td class="text-right">미공개</td>
						<td class="text-center">110.2</td>
					</tr>
					<tr>
						<td class="text-center">3</td>
						<td>BMW 520d M Aero PRO(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6330</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">111.6</td>
						<td class="text-right">미공개</td>
						<td class="text-center">105.6</td>
					</tr>
					<tr>
						<td class="text-center">4</td>
						<td>벤츠 GLC220 d 4MATIC(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6390</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">118.6</td>
						<td class="text-right">미공개</td>
						<td class="text-center">105.4</td>
					</tr>
					<tr>
						<td class="text-center">5</td>
						<td>벤츠 The new E300 AV(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">7250</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">137.2</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.9</td>
					</tr>
					<tr>
						<td class="text-center">6</td>
						<td>벤츠 The new C220 d AV(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">5530</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">103.3</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.7</td>
					</tr>
					<tr>
						<td class="text-center">7</td>
						<td>아우디 The new Q3 30 TDI 콰트로 Design(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">5190</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">90.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.4</td>
					</tr>
					<tr>
						<td class="text-center">8</td>
						<td>아우디 The new A7 50 TDI 콰트로 Comfort(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">9040</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">159.4</td>
						<td class="text-right">미공개</td>
						<td class="text-center">103.1</td>
					</tr>
					<tr>
						<td class="text-center">9</td>
						<td>BMW X3 xDrive 20d xLine(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6540</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">116.5</td>
						<td class="text-right">미공개</td>
						<td class="text-center">101.5</td>
					</tr>
					<tr>
						<td class="text-center">10</td>
						<td>아우디 Q5 35 TDI 콰트로(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6350</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">111.0</td>
						<td class="text-right">미공개</td>
						<td class="text-center">101.5</td>
					</tr>
					<tr>
						<td class="text-center">11</td>
						<td>BMW X5 xDrive 30d(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">9430</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">166.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">100.1</td>
					</tr>
					<tr>
						<td class="text-center">12</td>
						<td>BMW 320d GT(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">5440</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">91.5</td>
						<td class="text-right">미공개</td>
						<td class="text-center">99.8</td>
					</tr>
					<tr>
						<td class="text-center">13</td>
						<td>아우디 The new Q7 35 TDI 콰트로 Comfort(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">8580</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">170.5</td>
						<td class="text-right">미공개</td>
						<td class="text-center">99.4</td>
					</tr>
					<tr>
						<td class="text-center">14</td>
						<td>BMW GT 20d ED(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">7300</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">122.2</td>
						<td class="text-right">미공개</td>
						<td class="text-center">99.0</td>
					</tr>
					<tr>
						<td class="text-center">15</td>
						<td>랜드로버 레인지로버 이보크 2.0 디젤 SE(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">6600</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">128.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">98.7</td>
					</tr>
					<tr>
						<td class="text-center">16</td>
						<td>벤츠 CLS250 d 4MATIC(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">8530</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">168.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">98.0</td>
					</tr>
					<tr>
						<td class="text-center">17</td>
						<td>BMW X6 xDrive 30d(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">9840</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">180.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">97.6</td>
					</tr>
					<tr>
						<td class="text-center">18</td>
						<td>BMW 528i M Aero PRO(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">6820</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">131.2</td>
						<td class="text-right">미공개</td>
						<td class="text-center">96.8</td>
					</tr>
					<tr>
						<td class="text-center">19</td>
						<td>랜드로버 디스커버리4 3.0 디젤 SE(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">8180</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">168.6</td>
						<td class="text-right">미공개</td>
						<td class="text-center">94.8</td>
					</tr>
					<tr>
						<td class="text-center">20</td>
						<td>포드 익스플로러 2.3 가솔린 Limited 4WD(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5600</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">115.5</td>
						<td class="text-right">미공개</td>
						<td class="text-center">93.3</td>
					</tr>
					<tr>
						<td class="text-center">21</td>
						<td>지프 그랜드체로키 3.0 디젤 리미티드(평균)</td>
						<td class="text-center">경유</td>
						<td class="text-right">7000</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">143.9</td>
						<td class="text-right">미공개</td>
						<td class="text-center">92.0</td>
					</tr>
					<tr>
						<td class="text-center">22</td>
						<td>렉서스 ES350 SUPREME(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5680</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">122.7</td>
						<td class="text-right">미공개</td>
						<td class="text-center">91.9</td>
					</tr>
					<tr>
						<td class="text-center">23</td>
						<td>링컨 MKZ 2.0 가솔린 300A, Retract Roof, Teck pkg FWD(평균)</td>
						<td class="text-center">휘발유</td>
						<td class="text-right">5390</td>
						<td class="text-right">미공개</td>
						<td class="text-right">미공개</td>
						<td class="text-right">104.0</td>
						<td class="text-right">미공개</td>
						<td class="text-center">88.4</td>
					</tr>				
				</tbody>	
			</table>		
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/common/utility-modal.jsp"%>
</div>
</t:genericpage>
