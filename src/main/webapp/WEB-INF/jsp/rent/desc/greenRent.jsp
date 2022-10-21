<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<script src="/resources/js/tab-common.js"></script>
<style>
.amazon-desc-tab a{
	height:80px !important;
	font-size:14px !important;
} 
.align-table > tbody > tr > td {
	vertical-align:middle;
}
.amazon-desc {
	width: 1250px !important;
}
</style>
<div  class="detail-title">
	<h2>
		친환경차&nbsp;<small><a href="/rent/domestic?carGubun=green"><span class="label label-success">대여요금보기</span></a></small>
		<br/>
		<!-- <small>&nbsp;<span class="primary">경차보다 경제적인</span> 전기차, <span class="primary">LPG차보다 경제적인</span> 하이브리드차</small> -->
		<small>&nbsp;<span class="primary">첨단기능과 경제성을 동시에 누린다!</span></small>
	</h2>
</div>
<ul class="nav nav-tabs amazon-desc-tab" role="tablist">
	<li role="presentation" class="active"><a href="#outline" aria-controls="outline" role="tab" data-toggle="tab" class="one-line" style="padding: 25px 15px 0px 15px !important; text-align: center !important;">개요</a></li>
	<li role="presentation"><a href="#benefit" aria-controls="benefit" role="tab" data-toggle="tab" class="one-line" style="padding: 25px 15px 0px 15px !important; text-align: center !important;">혜택</a></li>
	<li role="presentation"><a href="#howto" aria-controls="howto" role="tab" data-toggle="tab" class="one-line" style="padding: 15px 15px 0px 15px !important; text-align: center !important;">전기차<br>충전 및 충전기설치</a></li>
	<!-- <li role="presentation"><a href="#price" aria-controls="price" role="tab" data-toggle="tab">충전요금<br/><small>(1개월 요금)</small></a></li> -->
	<!-- <li role="presentation"><a href="#green-compare1" aria-controls="green-compare1" role="tab" data-toggle="tab">비용비교<br/><small>(차종등급 미구분)</small></a></li> -->
	<!-- <li role="presentation"><a href="#green-compare2" aria-controls="green-compare2" role="tab" data-toggle="tab">비용비교<br/><small>(차종등급별)</small></a></li> -->
	<li role="presentation"><a href="#pay_electro_etc" aria-controls="pay_electro_etc" role="tab" data-toggle="tab" class="one-line" style="padding: 15px 15px 0px 15px !important; text-align: center !important;">장기렌트 비용비교<br>전기차 vs 타차종</a></li>
	<li role="presentation"><a href="#green-compare1" aria-controls="green-compare1" role="tab" data-toggle="tab" class="one-line" style="padding: 15px 15px 0px 15px !important; text-align: center !important;">장기렌트 비용비교<br>하이브리드 vs 타차종</a></li>
<!-- 	<li role="presentation"><a href="#pay_buy_rent" aria-controls="pay_buy_rent" role="tab" data-toggle="tab" class="one-line" style="padding: 15px 15px 0px 15px !important; text-align: center !important;">전기차 비용비교<br>구매 vs 장기렌트</a></li> -->
	<!-- <li role="presentation"><a href="#buy_rent" aria-controls="buy_rent" role="tab" data-toggle="tab" class="one-line">전기차 배터리 보증조건<br>구매 vs 장기렌트</a></li> -->
	<li role="presentation"><a href="#buy_rent" aria-controls="buy_rent" role="tab" data-toggle="tab" class="one-line" style="padding: 25px 15px 0px 15px !important; text-align: center !important;">
		전기차 배터리 보증조건<!-- <br>구매 vs 장기렌트<br>(국산차, 볼트EV, 테슬라) --></a>
	</li>
</ul>
<!-- Tab panes -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active amazon-desc" id="outline">
    	<br/>
    	<table class="desc-table table-bordered" style="text-align:center !important;">
    		<colgroup>
    			<col width="10%"/>
    			<col width="22%"/>
    			<col width="22%"/>
    			<col width="22%"/>
    			<col width="22%"/>
    		</colgroup>
    		<tr>
    			<th></th>
    			<th>하이브리드차</th>
    			<th>플러그인 하이브리드차</th>
    			<th>전기차</th>
    			<th>수소차<br>(수소연료전지차)</th>
    		</tr>
    		<tr>
    			<th>구동방식</th>
    			<td>
    				가솔린엔진<br/>+<br/>전기모터<br/>(모터는 제한적 단독 주행 가능)<br/>
    				<a href="/resources/files/green_hybrid.pdf" target="_new"><input type="button" class="btn btn-primary" value="자세히 보기"/></a>
    			</td>
    			<td>
    				가솔린엔진<br/>+<br/>전기모터<br/>(모터 단독 주행 가능)<br/>
    				<a href="/resources/files/green_plugin_hybrid.pdf" target="_new"><input type="button" class="btn btn-primary" value="자세히 보기"/></a>
    			</td>
    			<td>
    				<br/><br/>전기모터<br/><br/>
    				<a href="/resources/files/green_eletric.pdf" target="_new"><input type="button" class="btn btn-primary" value="자세히 보기"/></a>
    			</td>
    			<td>
    				<br/><br/>전기모터<br/><br/>
    				<!-- <a href="/resources/files/green_eletric.pdf" target="_new"><input type="button" class="btn btn-primary" value="자세히 보기"/></a> -->
    				<a href="/resources/files/green_hydro.pdf" target="_new"><input type="button" class="btn btn-primary" value="자세히 보기"/></a>
    			</td>
    		</tr>
    		<tr>
    			<th>에너지원</th>
    			<td>휘발유</td>
    			<td>
    				휘발유<br/>+<br/>가전제품처럼 플러그로 충전<br/>
    			</td>
    			<td>플러그로 충전</td>
    			<td>수소<br>(외부 전기공급없이 내부 전기생산)</td>
    		</tr>
    		<tr>
    			<th>배터리 용량</th>
    			<td>적음</td>
    			<td>중간</td>
    			<td>많음</td>
    			<td>적음</td>
    		</tr>
    		<tr>
    			<th>장·단점</th>
    			<td class="text-left">
    				<ul>
    					<li>유류비용이 가솔린대비 70% 수준</li>
    					<li>1회 충전 주행거리가 길다</li>
    					<li>차량가격이 비싸지만, 개별소비세, 취득세 혜택이 있고 중고차 잔존가치가 일반차량 대비 높아서, 실질 비용은 오히려 유용함</li><!-- 차량가격이 비싸지만 정부지원 금액이 크며 중고차 잔존가치가 높음 -->
    					<li>트렁크 사이즈가 가솔린 대비 적음</li>
    				</ul>
    			</td>
    			<td class="text-left">
    				<ul>
    					<li>유지비용이 가솔린대비 40%~60% 수준</li>
    					<li>차량가격이 하이브리드차보다 비싸지만 유지비용은 저렴</li>
    					<li>전기충전에 따른 번거로움</li>
    					<li>트렁크 사이즈가 적음</li><!-- 트렁크 사이즈가 하이브리드차보다 더 적음 -->
    				</ul>
    			</td>
    			<td class="text-left">
    				<ul>
    					<li>유지비용이 가솔린 대비 15~40% 수준</li>
    					<li>소음진동이 적고 가속 성능이 뛰어남</li>
    					<li>정비 비용이 적게 듦</li>
    					<li>충전 소요 시간이 주유 대비 오래 걸림</li>
    					<li>겨울철에는 1회 충전 주행가능거리가 감소함</li><!-- 1회 충전 주행 가능 거리가 짧음 -->
    				</ul>
    			</td>
    			<td class="text-left">
    				<ul>
    					<li>유지비용이 가솔린 대비 70% 수준 (수소 1kg 8천원 기준)</li>
    					<li>소음진동이 적음</li>
    					<li>충전소요시간이 주유처럼 짧음</li>
    					<li>1회 충전으로 607km 운행 가능 (넥쏘 기준)</li>
    					<li>공기 정화 기능</li>
    				</ul>
    			</td>
    		</tr>
    		<tr>
    			<th>해당차종<BR/>(아마존카<BR/>영업기준)</th>
    			<td class="text-left">
    				<ul>
						<li>아반떼 하이브리드</li>
						<li>쏘나타 하이브리드</li>
						<li>그랜저 하이브리드</li>
						<li>코나 하이브리드</li>
						<li>투싼 하이브리드</li>
						<li>싼타페 하이브리드</li>
						<li>K5 하이브리드</li>
						<li>K8 하이브리드</li>
						<li>니로 하이브리드</li>
						<li>스포티지 하이브리드</li>
						<li>쏘렌토 하이브리드</li>
						<li>LEXUS ES300h 하이브리드</li>
						<li>LEXUS UX250h 하이브리드</li>
						<li>LEXUS NX300h 하이브리드</li>
						<li>LEXUS RX450h 하이브리드</li>
						<li>TOYOTA 프리우스 하이브리드</li>
						<li>TOYOTA 아발론 하이브리드</li>
						<li>TOYOTA 캠리 하이브리드</li>
						<li>TOYOTA RAV4 하이브리드</li>
						<li>혼다 CR-V 하이브리드</li>
						<!-- <li>TOYOTA 프리우스C 하이브리드</li> -->
<!-- 						<li>링컨 MKZ 하이브리드</li> -->
						<!-- <li>TOYOTA 아발론 하이브리드</li> -->
						<!-- <li>혼다 ACCORD 하이브리드</li> -->
    				</ul>
    			</td>
    			<td class="text-left">
    				<ul>
    					<!-- <li>아이오닉 플러그인 하이브리드</li> -->
    					<!-- <li>쏘나타 플러그인 하이브리드</li> -->
    					<!-- <li>니로 플러그인 하이브리드</li> -->
    					<!-- <li>K5 플러그인 하이브리드</li> -->
    					<!-- <li>벤츠 E300 플러그인 하이브리드</li> -->
    					<li>벤츠 E300 PHEV</li>
    					<li>벤츠 GLC 300 PHEV</li>
    					<li>벤츠 GLC 350 PHEV</li>
    					<li>BMW 320 PHEV</li>
    					<li>BMW 530 PHEV</li>
    					<li>BMW 745 PHEV</li>
    					<li>BMW X3 PHEV</li>
    					<li>BMW X5 PHEV</li>
    					<li>볼보 S90 PHEV</li>
    					<li>볼보 XC60 PHEV</li>
    					<li>볼보 XC90 PHEV</li>
    				</ul>
    				<div>※ 이 차량들은 실질적으로는 하이브리드 차량에 가까움</div>
    			</td>
    			<td class="text-left">
    				<ul>
    					<!-- <li>아이오닉 일렉트릭</li> -->
    					<li>아이오닉5</li>
    					<li>GV60</li>
    					<li>Electrified GV70</li>
    					<li>Electrified G80</li>
    					<li>EV6</li>
    					<li>니로SG2 EV(예정)</li>
    					<li>볼트 EUV</li>
    					<li>모델3(테슬라)</li>
    					<li>모델Y(테슬라)</li>
    					<li>EQA(벤츠)</li>
    					<li>폴스타2</li>
    					<li>포터 II 일렉트릭</li>
    					<li>봉고 Ⅲ EV</li>
    					<!-- <li>쏘울 EV</li> -->
    					<!-- <li>코나 일렉트릭</li> -->
    				</ul>
    			</td>
    			<td class="text-left">
    				<ul>
    					<li>넥쏘</li>
    				</ul>
    			</td>
    		</tr>
    	</table>
    </div>
    
	<div role="tabpanel" class="tab-pane amazon-desc" id="benefit">
		<br/>
		<span style="float: right;">2022년 기준</span>
		<table class="desc-table table-bordered text-center">
			<colgroup>
				<col width="12%"/>
				<col width="22%"/>
				<col width="22%"/>
				<col width="22%"/>
				<col width="22%"/>
			</colgroup>
			<tbody>
				<tr>
					<th></th>
					<th>하이브리드차</th>
					<th>플러그인 하이브리드차</th>
					<th>전기차</th>
					<th>수소차</th>
				</tr>
				<tr>
					<th>개별소비세 감면<br><small>(교육세 및 부가세 포함)</small></th>
					<td>최대 143만원</td>
					<td>최대 143만원</td>
					<td>최대 429만원</td>
					<td>최대 572만원</td>
				</tr>
				<tr>
					<th>취득세 감면</th>
					<td>최대 40만원</td>
					<td>최대 40만원</td>
					<td>최대 140만원</td>
					<td>최대 140만원</td>
				</tr>
				<tr>
					<th>구매보조금</th>
					<td>없음</td>
					<td>없음<br>(2021년부터 폐지됨)</td>
					<td class="text-left">
						<b>·</b> 정 부 : 차종별 상이 (최대 700만원)<br/>
						<b>·</b> 지자체 :  지자체별, 차종별로 상이<br/>
						&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:12px;">(서울 최대 200만원, 단 법인은 최대 100만원)</span><br/><br/>
						<!-- &nbsp;&nbsp;&nbsp;총 1950만원<br> -->
						<!-- <span style="font-size:12px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(서울 450만원)</span><br><br> -->
						<!-- <div align="left">* 기타 지차체의 보조금은 '환경부 전기차 <br>충전소' 홈페이지 참조(<a href="https://www.ev.or.kr" target="_blank" style="text-decoration:underline;">www.ev.or.kr</a>)<br>
						</div> -->
						<div align="left">
							* 차종별 정부보조금과 지자체별 보조금은<br>
							&nbsp;&nbsp;'환경부 전기차 충전소' 홈페이지 참조<br>
							&nbsp;&nbsp;(<a href="https://www.ev.or.kr" target="_blank" style="text-decoration:underline;">www.ev.or.kr</a>)<br>
						</div>
					</td>
					<td class="text-left">
						<b>·</b> 정 부 : 2,250만원<br>
						<b>·</b> 지자체 :  지자체별로 상이<br>
						<span style="font-size:12px;">(서울 1000만원, 대전 1000만원, 부산 1200만원, 인천 1000만원)</span><br><br>
						<div align="left">
							* 수소차 정부보조금과 지자체별 보조금은<br>
							&nbsp;&nbsp;'환경부 전기차 충전소' 홈페이지 참조<br>
							&nbsp;&nbsp;(<a href="https://www.ev.or.kr" target="_blank" style="text-decoration:underline;">www.ev.or.kr</a>)<br>
						</div>						
					</td>
				</tr>
				<%-- <tr>
					<td colspan="2" > ※ 보조금 대상 차종 여부는 '하이브리드 자동차 구매보조금 지원시스템' 홈페이지 참조  <br>(<a href="https://hybridbonus.or.kr" target="_blank">https://hybridbonus.or.kr</a>)</td>
				</tr> --%>
				<tr>
					<th>공채매입감면</th>
					<td colspan="5"><!-- 3 -->
						※ 공채매입액 기준으로 도시철도공채 최대 200만원(전기차, 수소차는 최대 250만원) 감면<br>
						&nbsp;&nbsp;지역개발공채 매입감면 금액은 지자체별로 상이함<br>
						※ 차량구입자가 실제로 부담하는 비용은 "공채매입액 × 공채할인율 = 공채할인비용"임.<br>
						&nbsp;&nbsp;공채할인율은 지역별로 상이함.
					</td>
				</tr>
				<%-- <tr>
					//<td colspan="3">※ 공채 매입액 기준으로 도시철도 공채 최대 200만원, 지역개발공채 최대 150만원이 감면되지만,<br>
					 //&nbsp;&nbsp;&nbsp; 최근 공채할인율이 매우 낮아(약 1% 수준) 비용절감 효과가 미미함</td>
					 <td colspan="3">※ 공채 매입액 기준으로 도시철도 공채 최대 200만원(전기차는 최대250만원), 지역개발공채 최대 150만원이 감면되지만,<br>
					  &nbsp;&nbsp;&nbsp;최근 공채할인율이 매우 낮아(약 1% 수준) 비용절감 효과가 미미함</td>
				</tr> --%>
				<tr>
					<th>충전기지원</th>
					<td>해당사항없음</td>
					<td>지원안됨</td>
					<td>2020년부터 비공용 (고정형 및 이동형)<br>완속충전기에 대한 보조금 폐지</td>
					<%-- <td class="text-left">
						※ 완속충전기 보조금 지원<br>
						&nbsp;&nbsp;<b>·</b> 고정형 충전기<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 130만원 (비공용 미개방 기준)<br>
						&nbsp;&nbsp;<b>·</b> 과금형 휴대용충전기(이동형 충전기)<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 40만원<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 전용콘센트 설치비 지원<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(자세한 내용은 상세보기 참조)<br>
						※ 고정형, 이동형 중 택1<br>
						※ 충전기 비용중 정부지원금을<br>
						&nbsp;&nbsp;&nbsp;&nbsp;초과하는 부분은 이용자 부담
						<span class="label label-primary" data-toggle="modal" data-target="#detail-content-modal" style="cursor:pointer;font-size:13px;padding-left:100px;padding-right:100px;">상세내용보기</span>
					</td> --%>
					<td>해당사항없음</td>
				</tr>
				<tr>
					<th>자동차세</th>
					<td>동일 배기량<br>가솔린·디젤 차량과 같음</td>
					<td>동일 배기량<br>가솔린·디젤 차량과 같음</td>
					<td class="text-left">
						<b>·</b> 자가용 : 13만원 (교육세 포함)<br>
						<b>·</b> 영업용 : &nbsp; 2만원 (교육세 없음)
					</td>
					<td class="text-left">
						<b>·</b> 자가용 : 13만원 (교육세 포함)<br>
						<b>·</b> 영업용 : &nbsp; 2만원 (교육세 없음)
					</td>
				</tr>
				<tr>
					<th>기타</th>
					<td colspan="5" class="text-left">
						<b>·</b> 공영 및 환승주차장 감면, 혼잡통행료 면제 등의 혜택(서울시 기준)<br>
						<b>·</b> 전기, 수소차 고속도로 통행료 50% 할인
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div role="tabpanel" class="tab-pane amazon-desc" id="howto">
		<br/><h4>(1) 전기차 충전 방법</h4><br/>
		<small style="float:right;">2022년 04월 기준</small>
		<table class="desc-table table-bordered text-center">
			<tbody>
				<tr>
					<th rowspan="2" colspan="2">&nbsp;</th>
					<th colspan="2">비공용(개인용) 및 부분 공용</th>
					<th colspan="2">공용</th>
				</tr>
				<tr>
					<th>고정형 완속충전기<br>(스탠드형 및 벽걸이형)</th>
					<th>이동형충전기</th>
					<th>급속충전기</th>
					<th>완속충전기</th>
				</tr>
				<tr>
					<th colspan="2">전기요금</th>
					<td class="center" colspan="2">66원 / kWh<br>(경부하시간대 평균 기준)<br><br>2022년 6월까지 10% 할인요금 적용<br>( <span class="primary-red">59원 / kWh</span> )<br>
						 <span class="label label-primary" data-toggle="modal" data-target="#personal-fee-modal" style="cursor:pointer;font-size:13px;">시간대별 전기 요금 보기</span>
					</td>
					<td class="center" colspan="2">
						50kW 이하 충전시설 : 292.9원/kWh<br>
						그 외 충전시설 : 309.1원/kWh<br><br>
						(2021년 7월 이전에는 충전기 구분없이 255.7원/kWh 단일요금 적용)
					</td>
				</tr>
				<tr>
					<th colspan="2">전기요금 인상</th>
					<td class="center" colspan="4">
						전기차 충전 시 발생하는 요금에는 '한국전력이 전기차 이용자에게 제공하는 혜택(전기차 특례 할인)'이 반영되어 있으며, 2020년 6월까지는 전력량요금(충전요금) 50%를 할인받아왔습니다. '2020년 7월부터 2021년 6월까지는 30%, 2021년 7월부터 2022년 6월까지는 10%'에 해당하는 전력량요금 할인 혜택이 적용되며, 이후에는 할인 혜택이 배제된 전력량요금이 적용됩니다. 
						<!-- 현재 전기차 충전 시 발생하는 요금에는 '한국전력이 전기차 이용자에게 제공해온 혜택(전기차 특례 할인)'이 반영되어 있으며, 전력량 요금 50%를 할인받아왔습니다. 해당 할인 혜택은 본래 2019년을 끝으로 종료 예정이었으나 '전기 공급 시행세칙 변경안'에 따라 2020년 6월까지만 현행 50% 전력량 요금 할인 혜택이 유지되며, '7월부터 2021년 6월까지는 30%', '2021년 7월부터 2022년 6월까지는 10%'에 해당하는 전력량 요금 할인 혜택이 적용됩니다. 이후에는 할인 혜택이 배제된 전력량 요금이 적용됩니다. -->
					</td>
				</tr>
				<tr>
					<th width="5%">충전<br>시간</th>
					<th width="13%" class="center">아이오닉5<br>(72.6kWh)<br>기준</th>
					<td width="21%" class="center">약 10시간 50분<br>(100% 기준)</td>
					<td width="21%" class="center">약 24시간 10분<br>(100% 기준)</td>
					<td width="20%" class="center">&nbsp;&nbsp;약 1시간(100kw 기준)</td>
					<td width="20%" class="center">약 10시간 50분<br>(100% 기준)</td>
				</tr>
				<%-- <tr>
					<th class="center">쏘나타 &amp; K5<br>플러그인 하이브리드</th>
					<td class="center">약 2시간 30분 ~ 3시간</td>
					<td class="center">약 4시간<br>(100% 기준)</td>
					<td class="center">충전불가</td>
					<td class="center">약 2시간 30분 ~ 3시간</td>
				</tr> --%>
				<tr>
					<th colspan="2" rowspan="2">이용방법</th>
					<%-- <td class="center">정부지원금을 받아서<br>원하는 위치에 설치 이용</td> --%>
					<td class="center">충전기 설치 공급업체로부터<br>개별 구매하여 원하는 위치에 설치 이용</td>
					<td class="center">이동형 충전기 구매 후<br>원하는 장소에서<br>플러그 이용 충전</td>
					<td class="text-left" colspan="2" rowspan="2">
					공용주차장, 고속도로 휴게소, 대형마트 등에
					설치되어 있는 충전기 이용<br><br>
					※ 결제방법<br>
					&nbsp;&nbsp;&nbsp;&nbsp; 환경부 전기차 충전소 홈페이지(www.ev.or.kr) 에서<br>
					&nbsp;&nbsp;&nbsp;&nbsp; ① 회원가입<br>
					&nbsp;&nbsp;&nbsp;&nbsp; ② 공공인프라카드 발급<br>
					<!-- &nbsp;&nbsp;&nbsp;&nbsp; ③ 로그인 후 마이페이지 좌측하단에 결제카드 관리에서 결제할<br>&nbsp;&nbsp;&nbsp;&nbsp;카드(신용카드-그린카드 선택 시 50% 할인 적용, 그린카드 혜택 지속여부 2월중 결정예정)등록<br> -->
					&nbsp;&nbsp;&nbsp;&nbsp; ③ 로그인 후 마이페이지 좌측하단에 결제카드 관리에서 결제할 카드 등록<br>
					&nbsp;&nbsp;&nbsp;&nbsp; ④ 충전소에서 공공인프라카드로 충전<br>
					&nbsp;&nbsp;&nbsp;&nbsp; ⑤ 충전요금은 충전 완료 후 등록된 결제카드(신용카드)사로<br>&nbsp;&nbsp;&nbsp;&nbsp;자동으로 요금청구가 진행 <br><br>
					<!-- ※ 할인금액(간편결제 등록한 경우에만 추가할인 적용) <br>
					-BC카드 : 30%할인 (월 3만원 한도) <br>
					-BC그린카드 : 50%할인 (월 5만원 한도) <br><br> -->
					※ 환경부 전기충전소 홈페이지에서 회원가입을 하지 않더라도,<br>
					&nbsp;&nbsp;&nbsp;&nbsp;일반 후불교통카드로 비회원 결제 가능<br>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-left">
						※ 정부지원금(전기차 기준)<br>
						▶ 2020년부터 비공용 (고정형 및 이동형)완속충전기 보조금 지원 폐지<br>
						<!-- ▶ 완속충전기 보조금 지원<br>
						&nbsp;&nbsp;&nbsp;&nbsp; · 고정형 충전기<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 130만원 (비공용 미개방 기준)<br>
						&nbsp;&nbsp;&nbsp;&nbsp; · 과금형 휴대용충전기(이동형 충전기)<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 40만원<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 전용콘센트 설치비 지원(자세한 내용은 아래 전기자동차<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;충전기 보급사업 공고문 참조)<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 고정형, 이동형 중 택1<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 충전기 비용중 정부지원금을 초과하는 부분은 이용자 부담<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - 플러그인 하이브리드는 별도 지원 없음<br><br>
						
						※ 충전기 보조금 신청은 차량 구입 당해년도 비공용 충전기 보조금 예산이 소진되기 전 까지 신청가능합니다.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단, 고객부담으로 추후 충전기 설치는 가능합니다. <br> -->
					</td>
				</tr>
			</tbody>
		</table>	
		<%-- <br/>
		<h4>(2) 비공용(개인용) 전기충전기 이용안내</h4><br/>
		<table class="desc-table table-bordered">
			<tbody>
				<tr>
					<th rowspan="2"></th>
					<th rowspan="2">고정형 완속충전기<br>(스탠드형 및 벽걸이형)</th>
					<th colspan="2">이동형충전기</th>
				</tr>
				<tr>
					<th>이동형 충전서비스 이용시<br>((주)파워큐브 충전시스템 이용 기준)</th>
					<th>이동형 충전서비스 미이용시</th>
				</tr>
				<tr>
					<th>이용<br>안내</th>
					<td style="vertical-align:top;">&lt; 설치 장소 &gt;<br>
						· 전기차 이용고객(장기대여 계약자 및 직원)의 사업장, 주민등록지 또는 근무지(4대보험 등 객관적 증빙이 가능한 근무지)<br><br>
						&lt; 비공용충전기 설치 요건 &gt;<br>
						· 단독주택: 소유자, 임차인으로부터 설치허가를 받은 경우<br>
						· 공동주택: 공동주택에 사용 가능한 충전기가 없는 자 중 입주자 대표회의 등 허가권자로부터 설치 허가를 받은 경우(입주자 대표회의 동의 혹은 관리사무소 직인 날인으로 가능)<br><br>
						※ 유의사항<br>
						- 비공용충전기 보조금은 전기차 구매자(전기차 이용고객)에게 당연히 지원되는 것이 아니라, 충전기가 반드시 필요하고 거주지(또는 근무지)에 설치가 가능한 전기차 구매자(전기차 이용고객)에 지원하며, 보조금 소진시 신청마감<br>
						- 전기차 구매자(전기차 이용고객)의 거주지(주민등록 기준)나 근무지(4대보험 등 객관적 증빙이 가능한 근무지) 외 다른 장소에 설치할 경우 비공용충전기 보조금 지원 불가<br>
						- 공동주택 거주자의 경우, 공동주택 내 공용충전기가 이미 설치되어 있는 경우 보조금 미지급<br><br>
						<a href="/resources/files/green_car_2019.pdf" target="_blank"><span class="label label-primary" style="cursor:pointer;font-size:13px;display: inline-block;width:100%;">충전기 지원관련 상세 내용 보기<br><br>[ 2019년도 전기자동차 충전기 보급사업 공고문 ]
						</span></a>
					</td>
					<td width="34%" style="padding:25px 10px;vertical-align:top;">① 전력용량이 큰 아파트나 일반 빌딩 주차장에서<br>
						&nbsp;&nbsp;&nbsp;&nbsp;이용하기에 적합 (현재 단독주택에서는 이용불가)<br><br>
						② 본인 전기차 전력 사용량과 아파트나 빌딩의 전력<br>
						&nbsp;&nbsp;&nbsp;&nbsp;사용량을 분리하여 청구하는 서비스<br><br>
						③ 아파트나 일반 빌딩에 기존 설치된 모든 콘센트에 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;RF태그를 부착하여 충전가능(RF태그 부착된 주차<br>
						&nbsp;&nbsp;&nbsp;&nbsp;면에 타차량이 주차되어 있을 경우에도 다른 RF<br>
						&nbsp;&nbsp;&nbsp;&nbsp;태크 부착된 콘센트에서 충전가능)<br><br>
						④ RF태그 부착된 장소 어디서든 충전가능 (본인 주<br>
						&nbsp;&nbsp;&nbsp;&nbsp;소지 외의 다른 아파트나 빌딩 등에서도 이용가능,<br>
						&nbsp;&nbsp;&nbsp;&nbsp;(주)파워큐브에서 부착한 RF태그에 한함)<br><br>
						
						※ RF태그 부착시 건물주나 입주자 대표회의 등의 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;동의가 필요하지만 충전서비스 제공 업체 ((주)<br>
						&nbsp;&nbsp;&nbsp;&nbsp;파워큐브)에서 별무리없이 동의를 받고 있음
					</td>
					<td width="30%" style="vertical-align:top; padding:25px 10px;">① 제조사에서 판매하는 이동형 충전기 또는<br>
						&nbsp;&nbsp;&nbsp;&nbsp;개인적으로 구입한 충전기 이용<br><br>
						② 배전기 용량이 크고 누진제가 적용되지<br>
						&nbsp;&nbsp;&nbsp;&nbsp;않는 전기를 이용하기에 적합한 충전방법<br><br>
						※ 일반 콘센트에 충전할 경우 누진제가 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;적용되어 과다한 전기요금이 발생할 수<br>
						&nbsp;&nbsp;&nbsp;&nbsp;있음<br><br>
						※ 가정용 전원에 연결하여 사용할 경우 <br>
						&nbsp;&nbsp;&nbsp;&nbsp;배전기의 용량 초과로 인하여 전원 차단, <br>
						&nbsp;&nbsp;&nbsp;&nbsp;화재발생 등의 안전문제가 발생할 수<br>
						&nbsp;&nbsp;&nbsp;&nbsp;있음
					</td>
				</tr>
				<tr>
					<th>월<br>기본<br>요금</th>
					<td>
					2017년~2019년말까지 기본요금 면제<br><br>
					※ 참고: 2016년 기본요금<br>
					①  단독주택(저압, 380V 이하) 8kw급 충전기 : 9,560원/월<br>
					② 아파트(고압, 3300V 이상) 8kw급 충전기 : 10,320원/월</td>
					<td style="vertical-align:top;">
					 2017년~2019년말까지<br>
					 ▶ (주)파워큐브 시스템 이용시 : 11,000원/월<br>
							&nbsp;&nbsp;&nbsp; (통신비, RF태그 부착비용, 관리비 등) <br><br>
					※ 참고: 2016년 (주)파워큐브 시스템 이용시 기본요금<br>
					14,870원/월 ( = 한전기본료 3,870원 + 파워큐브  월회비 11,000원 )
					</td>
					<td style="vertical-align:top;">기본요금 없음</td>
				</tr>
			</tbody>
		</table><br> --%>			
	</div>
	<div role="tabpanel" class="tab-pane amazon-desc" id="price">
		<br/>		
		<small style="float:right;">2017년03월기준</small>
		<h4>(1) 준중형승용 및 소형RV</h4><br/>
		<small>※ 실주행거리 월 2,300km 기준 </small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table-bordered text-center green-charge-table">
			<colgroup>
				<col width="2%"/>
				<col width="21%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="9%"/>
				<col width="28%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>순위</th>
					<th>차명</th>
					<th>연료<br>종류</th>
					<th>주행거리<br><small>(월평균)</small></th>
					<th>* 적용연비<br><small>(복합연비<br>× 0.85)</small></th>
					<th>연료 <br>필요량</th>
					<th>연료가격<br><small>(03월07일<br> 오피넷 전국<br> 평균유가)</small></th>
					<th class="primary-red">금액<br><small>(월평균)</small></th>
					<th>비 고</th>
				</tr>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td>①</td>
					<td>②</td>
					<td>③=①÷②</td>
					<td>④</td>
					<td>⑤=③×④</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td rowspan="3">1</td>
					<td rowspan="3">아이오닉 일렉트릭 N</td>
					<td rowspan="3">전기</td>
					<td rowspan="3">2,300km</td>
					<td rowspan="3">5.4km/kWh</td>
					<td rowspan="3">430kWh</td>
					<td>평균<br>44원/kWh</td>
					<td class="primary-red text-right">18,825원</td>
					<td rowspan="3" style="font-size:12px;">개인용충전기로 경부하시간대 (평균33원/kWh)에 80% 충전,
						공용충전기(평균87원/kWh)로 20% 충전 기준.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 430kWh × 0.8 × 33원/kWh ) +<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 430kWh × 0.2 × 86.9원/kWh )<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 11,352원 + 7,473원 = 18,825원<br>
						※ 기본요금 : 단독주택에서 8kw급 완속충전기<br>
						&nbsp;&nbsp;&nbsp; 이용 기준 ( ㈜파워큐브 이동형 충전시스템<br>
						&nbsp;&nbsp;&nbsp; 이용시 기본요금 : 11,000원/월 )
						
						
					</td>
				</tr>
				<tr class="primary-green">
					<td>기본요금</td>
					<td class="primary-red text-right">0원</td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td class="primary-red text-right">18,825원</td>
				</tr>
				<tr class="primary-green">
					<td rowspan="5">2</td>
					<td rowspan="5">아이오닉 플러그인 <br>하이브리드 N <br>(전기로 50% 주행,<br> 휘발유로 50% 주행 기준)</td>
					<td rowspan="3">전기</td>
					<td rowspan="3">1,150km</td>
					<td rowspan="3">4.7km/kWh</td>
					<td rowspan="3">246kWh</td>
					<td>평균<br>38원/kWh</td>
					<td class="primary-red text-right">9,444원</td>
					<td rowspan="3" style="font-size:12px;">개인용충전기로 경부하시간대 (평균33원/kWh)에 90% 충전,
						공용 완속충전기(평균87원/kWh)로 10% 충전 기준.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 246kWh × 0.9 × 33원/kWh ) +<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 246kWh × 0.1 × 86.9원/kWh )<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 7,306원 + 2,138원 = 9,444원<br>
						※ 기본요금 : ㈜파워큐브 이동형 충전시스템<br> 이용 기준
						
						
					</td>
				</tr>
				<tr class="primary-green">
					<td>기본요금</td>
					<td class="primary-red text-right">11,000원</td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td class="primary-red text-right">20,444원</td>
				</tr>
				<tr class="primary-green">
					<td>휘발유</td>
					<td>1,150km</td>
					<td>17.4km/ℓ</td>
					<td>66ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">100,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td><b>2,300km</b></td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td class="primary-red text-right">120,444원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td>3</td>
					<td>아이오닉 하이브리드 N</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>19.0km/ℓ</td>
					<td>121ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">183,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td>4</td>
					<td>니로 하이브리드 프레스티지</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>16.6km/ℓ</td>
					<td>139ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">210,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>5</td>
					<td>아반떼 LPG 1.6 렌터카 Smart</td>
					<td>LPG</td>
					<td>2,300km</td>
					<td>9.0km/ℓ</td>
					<td>255ℓ</td>
					<td class="text-right">858원/ℓ</td>
					<td class="primary-red text-right">219,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>6</td>
					<td>티볼리 디젤 LX</td>
					<td>경유</td>
					<td>2,300km</td>
					<td>12.5km/ℓ</td>
					<td>184ℓ</td>
					<td class="text-right">1304원/ℓ</td>
					<td class="primary-red text-right">240,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>7</td>
					<td>스포티지 디젤 U2 1.7 2WD 노블레스</td>
					<td>경유</td>
					<td>2,300km</td>
					<td>12.4km/ℓ</td>
					<td>185ℓ</td>
					<td class="text-right">1304원/ℓ</td>
					<td class="primary-red text-right">242,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>8</td>
					<td>아반떼 1.6 Gdi Modern Special</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>11.1km/ℓ</td>
					<td>207ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">313,000원</td>
					<td></td>
				</tr>
			</tbody>
		</table>		
		<small>* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.</small>
		<br/>
		<br/>
		<h4>(2) 경승용</h4><br/>
		<small>※ 실주행거리 월 2,300km 기준 </small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table-bordered  text-center green-charge-table">
			<colgroup>
				<col width="2%"/>
				<col width="21%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="9%"/>
				<col width="28%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>순위</th>
					<th>차명</th>
					<th>연료<br>종류</th>
					<th>주행거리<br><small>(월평균)</small></th>
					<th>* 적용<br>연비<br><small>(복합연비<br>× 0.85)</small></th>
					<th>연료<br> 필요량</th>
					<th>연료가격<br><small>(03월 07일 <br>오피넷 전국 <br>평균 유가)</small></th>
					<th class="primary-red">금액<br><small>(월평균)</small></th>
					<th>비 고</th>
				</tr>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td>①</td>
					<td>②</td>
					<td>③=①÷②</td>
					<td>④</td>
					<td>⑤=③×④</td>
					<td></td>
				</tr>
				<tr>
					<td>1</td>
					<td>모닝 럭셔리</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>13.1km/ℓ</td>
					<td>176ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">266,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>2</td>
					<td>스파크 LT A/T</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>12.2km/ℓ</td>
					<td>189ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">286,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>레이 럭셔리 A/T</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>11.5km/ℓ</td>
					<td>200ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">303,000원</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<small>* 적용연비 : 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.</small><br/><br/>
		<h4>(3) 중형승용</h4><BR/>
		<h4>① 쏘나타</h4>
		<small>※ 실주행거리 월 2,300km 기준 </small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table-bordered text-center green-charge-table">
			<colgroup>
				<col width="2%"/>
				<col width="21%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="28%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>순위</th>
					<th>차명</th>
					<th>연료<br>종류</th>
					<th>주행거리<br><small>(월평균)</small></th>
					<th>* 적용연비<br><small>(복합연비<br>× 0.85)</small></th>
					<th>연료<br>필요량</th>
					<th>연료가격<br><small>(03월 07일<br>오피넷 전국 <br>평균 유가)</small></th>
					<th class="primary-red">금액<br><small>(월평균)</small></th>
					<th>비 고</th>
				</tr>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td>①</td>
					<td>②</td>
					<td>③=①÷②</td>
					<td>④</td>
					<td>⑤=③×④</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td rowspan="5">1</td>
					<td rowspan="5">LF쏘나타 플러그인 하이브리드 Premium<small><br>(전기로 50% 주행,<br> 휘발유로 50% 주행 기준)</small></td>
					<td rowspan="3">전기</td>
					<td rowspan="3">1,150km</td>
					<td rowspan="3">3.9km/kWh</td>
					<td rowspan="3">294kWh</td>
					<td>평균<br> 38원/kWh</td>
					<td class="primary-red text-right">11,287원</td>
					<td rowspan="3" style="font-size:12px;">
						개인용충전기로 경부하시간대 (평균33원/kWh)에 90% 충전,
						공용 완속충전기(평균86원/kWh)로 10% 충전 기준.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 294kWh × 0.9 × 33원/kWh ) +<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 294kWh × 0.1 × 86.9원/kWh )<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 8,732원 + 2,555원 = 11,287원<br>
						※ 기본요금 : ㈜파워큐브 이동형 충전시스템<br>
						&nbsp;&nbsp;&nbsp; 이용 기준
					</td>
				</tr>
				<tr class="primary-green">
					<td>기본요금</td>
					<td class="primary-red text-right">11,000원</td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td class="primary-red text-right">22,287원</td>
				</tr>
				<tr class="primary-green">
					<td>휘발유</td>
					<td>1,150km</td>
					<td>14.6km/ℓ</td>
					<td>79ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">119,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td><b>2,300km</b></td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td class="primary-red text-right">141,287원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td>2</td>
					<td>LF쏘나타 하이브리드 Premium</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>15.0km/ℓ</td>
					<td>153ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">231,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>LF쏘나타 LPG 렌터카 Premium Special</td>
					<td>LPG</td>
					<td>2,300km</td>
					<td>8.2km/ℓ</td>
					<td>282ℓ</td>
					<td class="text-right">858원/ℓ</td>
					<td class="primary-red text-right">242,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td>LF쏘나타 뉴라이즈 가솔린 2.0 프리미엄 스페셜</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>9.9km/ℓ</td>
					<td>233ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">353,000원</td>
					<td></td>
				</tr>
			</tbody>
		</table>	
		<small>* 적용연비 : 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.</small><br/><br/>
		<br/>
		<h4>② K5</h4>
		<small>※ 실주행거리 월 2,300km 기준 </small>		
		<small style="float:right;">VAT포함</small>	
		<table class="desc-table table-bordered text-center green-charge-table">
			<colgroup>
				<col width="2%"/>
				<col width="21%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="28%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>순위</th>
					<th>차명</th>
					<th>연료<br>종류</th>
					<th>주행거리<br><small>(월평균)</small></th>
					<th>* 적용연비<br><small>(복합연비<br>× 0.85)</small></th>
					<th>연료 <br>필요량</th>
					<th>연료가격<br><small>(03월 07일<br> 오피넷 전국 <br>평균 유가)</small></th>
					<th class="primary-red">금액<br><small>(월평균)</small></th>
					<th>비 고</th>
				</tr>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td>①</td>
					<td>②</td>
					<td>③=①÷②</td>
					<td>④</td>
					<td>⑤=③×④</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td rowspan="5">1</td>
					<td rowspan="5">K5 플러그인 하이브리드 <br>노블레스 스페셜<small><br>(전기로 50% 주행,<br> 휘발유로 50% 주행 기준)</small></td>
					<td rowspan="3">전기</td>
					<td rowspan="3">1,150km</td>
					<td rowspan="3">3.9km/kWh</td>
					<td rowspan="3">294kWh</td>
					<td>평균<br>38원/kWh</td>
					<td class="primary-red text-right">11,287원</td>
					<td rowspan="3" style="font-size:12px;">
						개인용충전기로 경부하시간대 (평균33원/kWh)에 90% 충전,
						공용 완속충전기(평균86.9원/kWh)로 10% 충전 기준.<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 294kWh × 0.9 × 33원/kWh ) +<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ( 294kWh × 0.1 × 86.9원/kWh )<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = 8,732원 + 2,555원 = 11,287원<br>
						※ 기본요금 : ㈜파워큐브 이동형 충전시스템<br>
						&nbsp;&nbsp;&nbsp; 이용 기준
					</td>
				</tr>
				<tr class="primary-green">
					<td>기본요금</td>
					<td class="primary-red text-right">11,000원</td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td class="primary-red text-right">22,287원</td>
				</tr>
				<tr class="primary-green">
					<td>휘발유</td>
					<td>1,150km</td>
					<td>13.9km/ℓ</td>
					<td>82ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">125,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td><b>합계</b></td>
					<td><b>2,300km</b></td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td class="primary-red text-right">147,287원</td>
					<td></td>
				</tr>				
				<tr class="primary-green">
					<td>2</td>
					<td>K5 하이브리드 노블레스 스페셜</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>14.5km/ℓ</td>
					<td>159ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">241,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>K5 LPG 2.0 LPI 노블레스 스페셜</td>
					<td>LPG</td>
					<td>2,300km</td>
					<td>8.0km/ℓ</td>
					<td>288ℓ</td>
					<td class="text-right">858원/ℓ</td>
					<td class="primary-red text-right">247,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td>K5 2.0 가솔린 시그니처</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>9.9km/ℓ</td>
					<td>233ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">353,000원</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<small>* 적용연비 : 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.</small><br/><br/>
		<br>
		<h4>(4) 준대형승용</h4><br/>
		<small>※ 실주행거리 월 2,300km 기준 </small>
		<small style="float:right;">VAT포함</small>	
		<table class="desc-table table-bordered text-center green-charge-table">
			<colgroup>
				<col width="2%"/>
				<col width="21%"/>
				<col width="7%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="10%"/>
				<col width="10%"/>
				<col width="28%"/>
			</colgroup>
			<tbody>
				<tr>
					<th>순위</th>
					<th>차명</th>
					<th>연료<br>종류</th>
					<th>주행거리<br><small>(월평균)</small></th>
					<th>* 적용연비<br><small>(복합연비<br>× 0.85)</small></th>
					<th>연료 필요량</th>
					<th>연료가격<br><small>(03월 07일 <br>오피넷 전국 <br>평균 유가)</small></th>
					<th class="primary-red">금액<br><small>(월평균)</small></th>
					<th>비 고</th>
				</tr>
				<tr class="text-center">
					<td></td>
					<td></td>
					<td></td>
					<td>①</td>
					<td>②</td>
					<td>③=①÷②</td>
					<td>④</td>
					<td>⑤=③×④</td>
					<td></td>
				</tr>
				<tr>
					<td>1</td>
					<td>그랜저IG 디젤 2.2 프리미엄</td>
					<td>경유</td>
					<td>2,300km</td>
					<td>12.6km/ℓ</td>
					<td>183ℓ</td>
					<td class="text-right">1304원/ℓ</td>
					<td class="primary-red text-right">238,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td>2</td>
					<td>K7 하이브리드 프레스티지</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>13.8km/ℓ</td>
					<td>167ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">253,000원</td>
					<td></td>
				</tr>
				<tr class="primary-green">
					<td>3</td>
					<td>그랜저HG 하이브리드 Premium</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>13.6km/ℓ</td>
					<td>169ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">256,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>4</td>
					<td>그랜저IG LPi 3.0 렌터카 익스클루시브</td>
					<td>LPG</td>
					<td>2,300km</td>
					<td>6.3km/ℓ</td>
					<td>366ℓ</td>
					<td class="text-right">858원/ℓ</td>
					<td class="primary-red text-right">314,000원</td>
					<td></td>
				</tr>
				<tr>
					<td>5</td>
					<td>그랜저IG 가솔린 3.0 익스클루시브</td>
					<td>휘발유</td>
					<td>2,300km</td>
					<td>8.6km/ℓ</td>
					<td>268ℓ</td>
					<td class="text-right">1514원/ℓ</td>
					<td class="primary-red text-right">406,000원</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<small>* 적용연비 : 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.</small><br/><br/>
	</div>
	<!-- <div role="tabpanel" class="tab-pane amazon-desc" id="green-compare1"> -->
	<div role="tabpanel" class="tab-pane amazon-desc" id="pay_electro_etc9">
		<h4>장기렌트 36개월 이용기준</h4><br/><span style="float:right;">2017년3월07일 기준</span><br>
		★ 아마존카에서 영업하는 친환경차와 비슷한 등급의 차종들 및 경차의 경제성을 비교함<br/>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr class="primary-green">
				<td>1</td>
				<td>아이오닉 일렉트릭 N</td>
				<td>전기</td>
				<td>4260만원</td>
				<td>4,000,000</td>
				<td>377,300</td>
				<td class="primary-red">18,825</td>
				<td class="bold">396,125</td>
				<td>14,260,500</td>
				<td>
					<small>배터리 10년 20만km<br/>배터리 외 전기차 전용 부품 10년 16만km</small>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>모닝 럭셔리</td>
				<td>휘발유</td>
				<td>1315만원</td>
				<td>2,630,000</td>
				<td>338,800</td>
				<td class="primary-red">266,000</td>
				<td class="bold">604,800</td>
				<td>21,772,800</td>
				<td></td>
			</tr>
			<tr>
				<td>3</td>
				<td>스파크 LT A/T</td>
				<td>휘발유</td>
				<td>1297만원</td>
				<td>2,454,000</td>
				<td>328,900</td>
				<td class="primary-red">286,000</td>
				<td class="bold">614,900</td>
				<td>22,136,400</td>
				<td></td>
			</tr>
			<tr class="primary-green">
				<td>4</td>
				<td>아이오닉 하이브리드 N</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>2533만원</td>
				<td>4,780,000</td>
				<td>456,500</td>
				<td class="primary-red">183,000</td>
				<td class="bold">639,500</td>
				<td>23,022,000</td>
				<td>
					<small>
						하이브리드 전용 부품 <br>(모터/배터리/전력제어모듈) 10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>5</td>
				<td>니로 하이브리드 프레스티지</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>2688만원</td>
				<td>5,090,000</td>
				<td>446,600</td>
				<td class="primary-red">210,000</td>
				<td class="bold">656,600</td>
				<td>23,637,600</td>
				<td>
					<small>
						하이브리드 전용 부품<br/>(고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>6</td>
				<td>아반떼 LPG 1.6 렌터카 Smart	</td>
				<td>LPG</td>
				<td>1815만원</td>
				<td>3,570,000</td>
				<td>466,400</td>
				<td class="primary-red">219,000</td>
				<td class="bold">685,400</td>
				<td>24,674,400</td>
				<td>
					<small>
						아반떼 LPG 렌터카 모델중 최고사양이지만, 비교 아반떼 가솔린 및 아이오닉 대비 사양수준이 낮음<br/>(가격 기준 약 150만원)
					</small>
				</td>
			</tr>
			<tr>
				<td>7</td>
				<td>레이 럭셔리 A/T</td>
				<td>휘발유</td>
				<td>1426만원</td>
				<td>2,852,000</td>
				<td>386,100</td>
				<td class="primary-red">303,000</td>
				<td class="bold">689,100</td>
				<td>24,807,600</td>
				<td></td>
			</tr>
			<tr class="primary-green">
				<td>8</td>
				<td>아이오닉 플러그인 하이브리드 N</td>
				<td>전기 + 휘발유 <br>(하이브리드)</td>
				<td>3373만원</td>
				<td>6,460,000</td>
				<td>572,000</td>
				<td class="primary-red">120,444</td>
				<td class="bold">692,444</td>
				<td>24,927,984</td>
				<td>
					<small>
						하이브리드 전용 부품<br/>(모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>9</td>
				<td>LF쏘나타 플러그인 하이브리드 Premium</td>
				<td>전기 + 휘발유 <br>(하이브리드)</td>
				<td>4036만원</td>
				<td>7,186,000</td>
				<td>569,800</td>
				<td class="primary-red">141,287</td>
				<td class="bold">711,087</td>
				<td>25,599,132</td>
				<td>
					<small>
						하이브리드 전용 부품<br/>(모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>10</td>
				<td>스포티지 디젤 U2 1.7 2WD 노블레스</td>
				<td>경유</td>
				<td>2530만원</td>
				<td>4,930,000</td>
				<td>495,000</td>
				<td class="primary-red">242,000</td>
				<td class="bold">737,000</td>
				<td>26,532,000</td>
				<td></td>
			</tr>
			<tr>
				<td>11</td>
				<td>티볼리 디젤 LX</td>
				<td>경유</td>
				<td>2346만원</td>
				<td>4,632,000</td>
				<td>495,000</td>
				<td class="primary-red">240,000</td>
				<td class="bold">735,000</td>
				<td>26,460,000</td>
				<td></td>
			</tr>
			<tr>
				<td>12</td>
				<td>아반떼 1.6 Gdi Modern Special</td>
				<td>휘발유</td>
				<td>2090만원</td>
				<td>4,120,000</td>
				<td>456,500</td>
				<td class="primary-red">313,000</td>
				<td class="bold">769,500</td>
				<td>27,702,000</td>
				<td></td>
			</tr>
			<tr class="primary-green">
				<td>13</td>
				<td>K5 플러그인 하이브리드 노블레스 스페셜</td>
				<td>전기 + 휘발유<BR/>(하이브리드)</td>
				<td>4103만원</td>
				<td>7,720,000</td>
				<td>621,500</td>
				<td class="primary-red">147,287</td>
				<td class="bold">768,787</td>
				<td>27,676,332</td>
				<td>
					<small>
						하이브리드 전용 부품<br>  (고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>14</td>
				<td>LF쏘나타 하이브리드 Premium</td>
				<td>휘발유<BR/>(하이브리드)</td>
				<td>3353만원</td>
				<td>6,120,000</td>
				<td>574,200</td>
				<td class="primary-red">231,000</td>
				<td class="bold">805,200</td>
				<td>28,987,200</td>
				<td>
					<small>
						하이브리드 전용 부품<br>(모터/배터리/전력제어모듈) 10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>15</td>
				<td>LF쏘나타 LPG 렌터카 Premium Special </td>
				<td>LPG</td>
				<td>2330만원</td>
				<td>4,600,000</td>
				<td>569,800</td>
				<td class="primary-red">242,000</td>
				<td class="bold">811,800</td>
				<td>29,224,800</td>
				<td> 
					<small>
						본 표 비교 K5 LPG 대비 사양수준이 낮음 <br>(가격기준  200만원 이상 차이남)
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>16</td>
				<td>K5 하이브리드 노블레스 스페셜</td>
				<td>휘발유<BR/>(하이브리드)</td>
				<td>3413만원</td>
				<td>6,240,000</td>
				<td>580,800</td>
				<td class="primary-red">241,000</td>
				<td class="bold">821,800</td>
				<td>29,584,800</td>
				<td>
					<small>
						하이브리드 전용 부품<br> (고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>17</td>
				<td>K5 LPG 2.0 LPI 노블레스 스페셜</td>
				<td>LPG</td>
				<td>2570만원</td>
				<td>4,980,000</td>
				<td>610,500</td>
				<td class="primary-red">247,000</td>
				<td class="bold">857,500</td>
				<td>30,870,000</td>
				<td></td>
			</tr>
			<tr>
				<td>18</td>
				<td>그랜저IG 디젤 2.2 프리미엄</td>
				<td>경유</td>
				<td>3475만원</td>
				<td>6,950,000</td>
				<td>678,700</td>
				<td class="primary-red">238,000</td>
				<td class="bold">916,700</td>
				<td>33,001,200</td>
				<td></td>
			</tr>
			<tr class="primary-green">
				<td>19</td>
				<td>K7 하이브리드 프레스티지</td>
				<td>휘발유<BR/>(하이브리드)</td>
				<td>3718만원</td>
				<td>7,150,000</td>
				<td>664,400</td>
				<td class="primary-red">253,000</td>
				<td class="bold">917,400</td>
				<td>33,026,400</td>
				<td>
					<small>
						하이브리드 전용 부품 <br>(고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>20</td>
				<td>그랜저HG 하이브리드 Premium</td>
				<td>휘발유<BR/>(하이브리드)</td>
				<td>3709만원</td>
				<td>6,832,000</td>
				<td>675,400</td>
				<td class="primary-red">256,000</td>
				<td class="bold">931,400</td>
				<td>33,530,400</td>
				<td>
					<small>
						하이브리드 전용 부품 <br> (모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>21</td>
				<td>K5 2.0 가솔린 시그니처</td>
				<td>휘발유</td>
				<td>2905만원</td>
				<td>5,710,000</td>
				<td>597,300</td>
				<td class="primary-red">353,000</td>
				<td class="bold">950,300</td>
				<td>34,210,800</td>
				<td></td>
			</tr>
			<tr>
				<td>22</td>
				<td>LF쏘나타 뉴라이즈 가솔린 2.0 프리미엄 스페셜</td>
				<td>휘발유</td>
				<td>2933만원</td>
				<td>5,866,000</td>
				<td>619,300</td>
				<td class="primary-red">353,000</td>
				<td class="bold">972,300</td>
				<td>35,002,800</td>
				<td></td>
			</tr>
			<tr>
				<td>23</td>
				<td>그랜저IG LPi 3.0 렌터카 익스클루시브</td>
				<td>LPG</td>
				<td>3295만원</td>
				<td>6,590,000</td>
				<td>763,400</td>
				<td class="primary-red">314,000</td>
				<td class="bold">1,077,400</td>
				<td>38,786,400</td>
				<td></td>
			</tr>
			<tr>
				<td>24</td>
				<td>그랜저IG 가솔린 3.0 익스클루시브</td>
				<td>휘발유</td>
				<td>3550만원</td>
				<td>7,100,000</td>
				<td>686,400</td>
				<td class="primary-red">406,000</td>
				<td class="bold">1,092,400</td>
				<td>39,326,400</td>
				<td></td>
			</tr>
			
		</table>
		<small>
			※ 아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준<br/>
		</small>
	</div>
	<div role="tabpanel" class="tab-pane amazon-desc" id="green-compare2">
		<h4>장기렌트 36개월 이용기준</h4><br/><span style="float:right;">2017년3월07일 기준</span>
		<h4>(1)준중형승용 및 소형RV</h4>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr class="primary-green">
				<td>1</td>
				<td>아이오닉 일렉트릭 N</td>
				<td>전기</td>
				<td>4260만원</td>
				<td>4,000,000</td>
				<td>377,300</td>
				<td class="primary-red">18,825</td>
				<td class="bold">396,125</td>
				<td>14,260,500</td>
				<td>
					<small>배터리 10년 20만km<br/>배터리 외 전기차 전용 부품 10년 16만km</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>2</td>
				<td>아이오닉 하이브리드 N</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>2533만원</td>
				<td>4,780,000</td>
				<td>456,500</td>
				<td class="primary-red">183,000</td>
				<td class="bold">639,500</td>
				<td>23,022,000</td>
				<td>
					<small>
						하이브리드 전용 부품 (모터/배터리/전력제어모듈) 10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>3</td>
				<td>니로 하이브리드 프레스티지</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>2688만원</td>
				<td>5,090,000</td>
				<td>446,600</td>
				<td class="primary-red">210,000</td>
				<td class="bold">656,600</td>
				<td>23,637,600</td>
				<td>
					<small>
						하이브리드 전용 부품<br/>(고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>아반떼 LPG 1.6 렌터카 Smart</td>
				<td>LPG</td>
				<td>1815만원</td>
				<td>3,570,000</td>
				<td>466,400</td>
				<td class="primary-red">219,000</td>
				<td class="bold">685,400</td>
				<td>24,674,400</td>
				<td>
					<small>
						아반떼 LPG 렌터카 모델중 최고사양이지만, 비교 아반떼 가솔린 및 아이오닉 대비 사양수준이 낮음<br/>(가격 기준 약 150만원)
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>5</td>
				<td>아이오닉 플러그인 하이브리드 N</td>
				<td>전기 + 휘발유<br>(하이브리드)</td>
				<td>3373만원</td>
				<td>6,460,000</td>
				<td>572,000</td>
				<td class="primary-red">120,444</td>
				<td class="bold">692,444</td>
				<td>24,927,984</td>
				<td>
					<small>
						하이브리드 전용 부품<br/>(모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>6</td>
				<td>스포티지 디젤 U2 1.7 2WD 노블레스</td>
				<td>경유</td>
				<td>2530만원</td>
				<td>4,930,000</td>
				<td>495,000</td>
				<td class="primary-red">242,000</td>
				<td class="bold">737,000</td>
				<td>26,532,000</td>
				<td></td>
			</tr>
			<tr>
				<td>7</td>
				<td>티볼리 디젤 LX</td>
				<td>경유</td>
				<td>2346만원</td>
				<td>4,632,000</td>
				<td>495,000</td>
				<td class="primary-red">240,000</td>
				<td class="bold">735,000</td>
				<td>26,460,000</td>
				<td></td>
			</tr>
			<tr>
				<td>8</td>
				<td>아반떼 1.6 Gdi Modern Special</td>
				<td>휘발유</td>
				<td>2090만원</td>
				<td>4,120,000</td>
				<td>456,500</td>
				<td class="primary-red">313,000</td>
				<td class="bold">769,500</td>
				<td>27,702,000</td>
				<td></td>
			</tr>
		</table>
		<small>
			※ 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준
		</small><br/><br/>
		<h4>(2)경승용</h4>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr>
				<td>1</td>
				<td>모닝 럭셔리</td>
				<td>휘발유</td>
				<td>1315만원</td>
				<td>2,630,000</td>
				<td>338,800</td>
				<td class="primary-red">266,000</td>
				<td class="bold">604,800</td>
				<td>21,772,800</td>
				<td></td>
			</tr>
			<tr>
				<td>2</td>
				<td>스파크 LT A/T</td>
				<td>휘발유</td>
				<td>1297만원</td>
				<td>2,454,000</td>
				<td>328,900</td>
				<td class="primary-red">286,000</td>
				<td class="bold">614,900</td>
				<td>22,136,400</td>
				<td></td>
			</tr>
			<tr>
				<td>3</td>
				<td>레이 럭셔리 A/T</td>
				<td>휘발유</td>
				<td>1426만원</td>
				<td>2,852,000</td>
				<td>386,100</td>
				<td class="primary-red">303,000</td>
				<td class="bold">689,100</td>
				<td>24,807,600</td>
				<td></td>
			</tr>
		</table>
		<small>※ 아마존카 홈페이지 월대여료(약정운행거리 30,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준</small><br/><BR/>
		<h4>(3)중형승용</h4>
		<span style="font-weight:bold">★쏘나타와 K5 사양 수준 차이로, 각각 나누어서 비교함</span><br>
		<h5>① 쏘나타</h5>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr class="primary-green">
				<td>1</td>
				<td>LF쏘나타 플러그인 하이브리드 Premium</td>
				<td>전기 + 휘발유<BR/>(하이브리드)</td>
				<td>4036만원</td>
				<td>7,186,000</td>
				<td>569,800</td>
				<td class="primary-red">141,287</td>
				<td class="bold">711,087</td>
				<td>25,599,132</td>
				<td>
					<small>
						하이브리드 전용 부품 <br>(모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>2</td>
				<td>LF쏘나타 하이브리드 Premium</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>3353만원</td>
				<td>6,120,000</td>
				<td>574,200</td>
				<td class="primary-red">231,000</td>
				<td class="bold">805,200</td>
				<td>28,987,200</td>
				<td>
					<small>
						하이브리드 전용 부품 <br>(모터/배터리/전력제어모듈)10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>LF쏘나타 LPG 렌터카 Premium Special </td>
				<td>LPG</td>
				<td>2330만원</td>
				<td>4,600,000</td>
				<td>569,800</td>
				<td class="primary-red">242,000</td>
				<td class="bold">811,800</td>
				<td>29,224,800</td>
				<td>
					<small>본 표 비교 K5 LPG 대비 사양수준이 낮음 <br> (가격기준  200만원 이상 차이남)</small>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>LF쏘나타 뉴라이즈 가솔린 2.0 프리미엄 스페셜</td>
				<td>휘발유</td>
				<td>2933만원</td>
				<td>5,866,000</td>
				<td>619,300</td>
				<td class="primary-red">353,000</td>
				<td class="bold">972,300</td>
				<td>35,002,800</td>
				<td></td>
			</tr>
		</table>
		<small>※ 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 30,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준</small><br/><br/>
		<h5>② K5</h5>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr class="primary-green">
				<td>1</td>
				<td>K5 플러그인 하이브리드 노블레스 스페셜</td>
				<td>전기 + 휘발유<br/>(하이브리드)</td>
				<td>4103만원</td>
				<td>7,720,000</td>
				<td>621,500</td>
				<td class="primary-red">147,287</td>
				<td class="bold">768,787</td>
				<td>27,676,332</td>
				<td>
					<small>하이브리드 전용 부품 <br/> (고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>2</td>
				<td>K5 하이브리드 노블레스 스페셜</td>
				<td>휘발유<br/>(하이브리드)</td>
				<td>3413만원</td>
				<td>6,240,000</td>
				<td>580,800</td>
				<td class="primary-red">241,000</td>
				<td class="bold">821,800</td>
				<td>29,584,800</td>
				<td>
					<small>
						하이브리드 전용 부품 <br/> (고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km
					</small>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>K5 LPG 2.0 LPI 노블레스 스페셜</td>
				<td>LPG</td>
				<td>2570만원</td>
				<td>4,980,000</td>
				<td>610,500</td>
				<td class="primary-red">247,000</td>
				<td class="bold">857,500</td>
				<td>30,870,000</td>
				<td></td>
			</tr>
			<tr>
				<td>4</td>
				<td>K5 2.0 가솔린 시그니처</td>
				<td>휘발유</td>
				<td>2905만원</td>
				<td>5,710,000</td>
				<td>597,300</td>
				<td class="primary-red">353,000</td>
				<td class="bold">950,300</td>
				<td>34,210,800</td>
				<td></td>
			</tr>
		</table>
		<small>※ 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 30,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준</small><br/><br/>
		<h4>(4)준대형승용</h4>
		<small>※ 연료비: 실주행거리 월 2,300km 기준 ( 충전요금(1개월 요금) 참조 )</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered green-compare-table">
			<colgroup>
				<col width="3%"/>
				<col width="20%"/>
				<col width="10%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="8%"/>
				<col width="9%"/>
				<col width="18%"/>
			</colgroup>
			<tr>
				<th rowspan="2">순위</th>
				<th rowspan="2">차명</th>
				<th rowspan="2">연료종류</th>
				<th rowspan="2">차량가격</th>
				<th rowspan="2">보증금<br/><small>(계약종료시 환급)</small></th>
				<th colspan="3">월간 대여료+연료비</th>
				<th rowspan="2">36개월 총계</th>
				<th rowspan="2">비고<br/><small>(하이브리드 및 전기차<br/>무상 보증수리)</small></th>
			</tr>
			<tr>
				<th>대여료</th>
				<th class="primary-red">연료비</th>
				<th>합계</th>
			</tr>
			<tr>
				<td>1</td>
				<td>그랜저IG 디젤 2.2 프리미엄</td>
				<td>경유</td>
				<td>3475만원</td>
				<td>6,950,000</td>
				<td>678,700</td>
				<td class="primary-red">238,000</td>
				<td class="bold">916,700</td>
				<td>33,001,200</td>
				<td></td>
			</tr>
			<tr class="primary-green">
				<td>2</td>
				<td>K7 하이브리드 프레스티지</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>3718만원</td>
				<td>7,150,000</td>
				<td>664,400</td>
				<td class="primary-red">253,000</td>
				<td class="bold">917,400</td>
				<td>33,026,400</td>
				<td>
					<small>하이브리드 전용 부품 <br>(고전압배터리/구동모터/인버터/직류변환장치/HPCU) 10년 20만km</small>
				</td>
			</tr>
			<tr class="primary-green">
				<td>3</td>
				<td>그랜저HG 하이브리드 Premium</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>3709만원</td>
				<td>6,832,000</td>
				<td>675,400</td>
				<td class="primary-red">256,000</td>
				<td class="bold">931,400</td>
				<td>33,530,400</td>
				<td>
					<small>하이브리드 전용 부품 <br> (모터/배터리/전력제어모듈)10년 20만km</small>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>그랜저IG LPi 3.0 렌터카 익스클루시브</td>
				<td>LPG</td>
				<td>3295만원</td>
				<td>6,590,000</td>
				<td>763,400</td>
				<td class="primary-red">314,000</td>
				<td class="bold">1,077,400</td>
				<td>38,786,400</td>
				<td></td>
			</tr>
			<tr>
				<td>5</td>
				<td>그랜저IG 가솔린 3.0 익스클루시브</td>
				<td>휘발유</td>
				<td>3550만원</td>
				<td>7,100,000</td>
				<td>686,400</td>
				<td class="primary-red">406,000</td>
				<td class="bold">1,092,400</td>
				<td>39,326,400</td>
				<td></td>
			</tr>
		</table>
		<small>※ 아마존카 홈페이지 월대여료(약정운행거리 30,000km/년, 정비서비스 미포함, 계약기간 36개월) 기준
		</small><br/><br/>
	</div>	
	
	<div role="tabpanel" class="tab-pane amazon-desc" id="pay_electro_etc">
		<div class="col-md-12 col-xs-12" style="background-color: #ffffca; margin-bottom: 20px; margin-top: 20px;">
			<h4>전기차는 뛰어난 주행성능과 첨단사양을 갖춘 차종이지만</h4>
			<h4>차량 크기가 비슷한 타차종보다 오히려 비용이 절감됩니다.</h4>
		</div>
		<div class="col-md-12 col-xs-12" style="padding: 0px;">
			<h4>(1) 월간 총 비용 비교</h4>
		</div>
		<small>※ 장기렌트 기본식 48개월 이용 기준</small><br>
		<small>※ 연료비: 실주행거리 월 2,000km 기준</small>
		<small style="float:right;">2022년 04월 기준</small><br>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
			</colgroup>
			<tr>
				<th>차명</th>
				<th style="background-color:#dff0d8;">EV6<br>(롱레인지 GT-Line)</th>
				<th style="background-color:#dff0d8;">아이오닉5<br>(롱레인지 프레스티지)</th>
				<th>더뉴 그랜저 하이브리드<br>익스클루시브</th>
				<th>더뉴 그랜저<br>스마트스트림 가솔린 2.5<br>익스클루시브</th>
				<th>쏘렌토 MQ4<br>2.2 디젤 노블레스 5인승<br>(내비게이션 옵션 포함)</th>
				<%-- <th>스포티지 1.6 디젤<br>프레스티지</th>
				<th>K5 LPG 2.0<br>렌터카 프레스티지</th> --%>
				<%-- <th>쏘나타 DN8 LPG<br>2.0 렌터카 스마트</th> --%>
			</tr>			
			<tr>
				<th>연료</th>
				<td style="background-color:#dff0d8;">전기</td>
				<td style="background-color:#dff0d8;">전기</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>휘발유</td>
				<td>경유</td>
			</tr>
			<tr>
				<th>차량가격<br>(개소세 5% 기준)</th>
				<td style="background-color:#dff0d8;">6,049만원</td>
				<td style="background-color:#dff0d8;">5,809만원</td>
				<td>4,233만원</td>
				<td>3,750만원</td>
				<td>3,888만원</td>
			</tr>
			<tr>
				<th>개소세 감면혜택<br>적용후 차량가격</th>
				<td style="background-color:#dff0d8;">5,680만원</td>
				<td style="background-color:#dff0d8;">5,455만원</td>
				<td>4,012만원</td>
				<td>3,681만원</td>
				<td>3,817만원</td>
			</tr>
			<tr>
				<th>보증금<br>(개소세 감면혜택 적용후 차량가격의 20% 기준)</th>
				<td style="background-color:#dff0d8;">11,360,000원</td>
				<td style="background-color:#dff0d8;">10,910,000원</td>
				<td>8,024,000원</td>
				<td>7,362,000원</td>
				<td>7,634,000원</td>
			</tr>
			<tr>
				<th>월대여료<br>(계약기간 48개월)</th>
				<td style="background-color:#dff0d8;">737,550원</td>
				<td style="background-color:#dff0d8;">709,610원</td>
				<td>662,530원</td>
				<td>628,650원</td>
				<td>609,180원</td>
			</tr>
			<tr>
				<th>복합연비</th>
				<td style="background-color:#dff0d8;">4.9km/kWh</td>
				<td style="background-color:#dff0d8;">4.9km/kWh</td>
				<td>16.2km/ℓ</td>
				<td>11.6km/ℓ</td>
				<td>14.1km/ℓ</td>
			</tr>
			<tr>
				<th>월평균 연료비<br>(2000km÷적용연비Ⅹℓ 당 연료가격)</th>
				<td style="background-color:#dff0d8;">74,814원</td>
				<td style="background-color:#dff0d8;">74,814원</td>
				<td>294,000원</td>
				<td>411,000원</td>
				<td>328,000원</td>
			</tr>
			<tr>
				<th style="background-color:#dff0d8;">월간 총 비용<br>(대여료+연료비)</th>
				<td style="background-color:#dff0d8;">812,364원</td>
				<td style="background-color:#dff0d8;">784,424원</td>
				<td style="background-color:#dff0d8;">956,530원</td>
				<td style="background-color:#dff0d8;">1,039,650원</td>
				<td style="background-color:#dff0d8;">937,180원</td>
			</tr>			
		</table>		
		<small>
			* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.<br>
			* 리터당 연료가격: 2022년04월19일 오피넷 유종별 서울 평균 유가 기준 (휘발유 2027원/ℓ, 경유 1963원/ℓ, LPG 1227원/ℓ)<br>
			<!-- * 코로나 19로 인한 개별소비세 한시적 인하(~2020.06.31)로 인해 내연기관차량의 월대여료가 과소 계산된 측면이 있음. 2020년06월31일 이후<br>
			&nbsp;&nbsp;내연기관차량의 월대여료 인상(경차및 9인승이상제외)이 예상됨.<br>
			&nbsp;&nbsp;개별소비세 환원 후에도 차량가 6600만원 이하 전기차의 경우 개별소비세가 전액감면(교육세 및 부가세 포함) 되므로 월대여료 변동 요인이 없음.<br> -->
			※아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 48개월, 전기차는 서울보조금) 기준
		</small><br/><br/>		
		
		<h4>(2) 월간 충전요금 비교</h4>
		<small>※ 장기렌트 기본식 48개월 이용 기준</small><br>
		<small>※ 연료비: 실주행거리 월 2,000km 기준</small>
		<small style="float:right;">2022년 04월 기준</small><br>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
				<col width="12%"/>
			</colgroup>
			<tr>
				<th>차명</th>
				<th style="background-color:#dff0d8;">EV6<br>(롱레인지 GT-Line)</th>
				<th style="background-color:#dff0d8;">아이오닉5<br>(익스클루시브 롱레인지)</th>
				<th>더뉴 그랜저 하이브리드<br>익스클루시브</th>
				<th>더뉴그랜저<br>스마트스트림 가솔린 2.5<br>익스클루시브</th>
				<th>쏘렌토 MQ4<br>2.2 디젤 노블레스 5인승<br>(내비게이션 옵션 포함)</th>
			</tr>			
			<tr>
				<th>연료</th>
				<td style="background-color:#dff0d8;">전기</td>
				<td style="background-color:#dff0d8;">전기</td>
				<td>휘발유<br>(하이브리드)</td>
				<td>휘발유</td>
				<td>경유</td>
			</tr>
			<tr>
				<th>주행거리<br>(월평균)</th>
				<td style="background-color:#dff0d8;">2,000km</td>
				<td style="background-color:#dff0d8;">2,000km</td>
				<td>2,000km</td>
				<td>2,000km</td>
				<td>2,000km</td>
			</tr>
			<tr>
				<th>연비<br>(복합연비)</th>
				<td style="background-color:#dff0d8;">4.9km/kWh</td>
				<td style="background-color:#dff0d8;">4.9km/kWh</td>
				<td>16.2km/ℓ</td>
				<td>11.6km/ℓ</td>
				<td>14.1km/ℓ</td>
			</tr>
			<tr>
				<th>*적용연비<br>(복합연비x0.85)</th>
				<td style="background-color:#dff0d8;">4.2km/kWh</td>
				<td style="background-color:#dff0d8;">4.2km/kWh</td>
				<td>13.8km/ℓ</td>
				<td>9.9km/ℓ</td>
				<td>12.0km/ℓ</td>
			</tr>
			<tr>
				<th>연료 필요량</th>
				<td style="background-color:#dff0d8;">480kWh</td>
				<td style="background-color:#dff0d8;">480kWh</td>
				<td>145ℓ</td>
				<td>203ℓ</td>
				<td>167ℓ</td>
			</tr>
			<tr>
				<th>연료가격<br>(2022년04월19일 오피넷 서울 평균유가)</th>
				<td style="background-color:#dff0d8;">평균156원/kWh</td>
				<td style="background-color:#dff0d8;">평균156원/kWh</td>
				<td>2,027원/ℓ</td>
				<td>2,027원/ℓ</td>
				<td>1,963원/ℓ</td>
			</tr>
			<tr>
				<th style="background-color:#dff0d8;">금액(월평균)</th>
				<th style="background-color:#dff0d8;">74,814원</th>
				<th style="background-color:#dff0d8;">74,814원</th>
				<th style="background-color:#dff0d8;">294,000원</th>
				<th style="background-color:#dff0d8;">411,000원</th>
				<th style="background-color:#dff0d8;">328,000원</th>
			</tr>
			<tr>
				<th>전기차 충전요금<br>산출 기준</th>
				<td colspan="6">
					개인용충전기로 경부하시간대(평균59원/kWh)에 60% 충전, 공용충전기(평균300원/kWh)로 40% 충전 기준.<br>
					※ ㈜파워큐브 이동형충전시스템 이용시 기본요금(11,000원/월) 추가됨 
				</td>
			</tr>
		</table>
		<small>
			* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.<br>
<!-- 			* 리터당 연료가격: 2019년03월05일 오피넷 유종별 서울 평균 유가 기준  (휘발유 1451원/ℓ, 경유 1345원/ℓ, LPG 843원/ℓ) -->
<!-- 			* 리터당 연료가격: 2020년04월08일 오피넷 유종별 서울 평균 유가 기준  (휘발유 1444원/ℓ, 경유 1265원/ℓ, LPG 869원/ℓ) -->
			* 리터당 연료가격: 2022년04월19일 오피넷 유종별 서울 평균 유가 기준  (휘발유 2027원/ℓ, 경유 1963원/ℓ, LPG 1227원/ℓ)
		</small><br><br>
	</div>
	
	
	
	
	<div role="tabpanel" class="tab-pane amazon-desc" id="green-compare1">
		<h4>장기렌트 기본식 48개월 이용기준</h4><br>	
		<h4>(1) 소형RV 및 준중형RV</h4>
		<small>※ 연료비: 실주행거리 월 2,000km 기준</small>
		<small style="float:right;">2022년 04월 기준</small><br>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="14%"/>
				<col width="14%"/>
				<col width="14%"/>
				<col width="14%"/>
				<col width="14%"/>
			</colgroup>
			<tr>
				<th>차명</th>
				<th style="background-color:#dff0d8;">니로 SG2 하이브리드<br>1.6 프레스티지</th>
				<th style="background-color:#dff0d8;">투산 NX4 하이브리드<br>프리미엄</th>
				<th>투산 NX4 디젤<br>2.0 프리미엄</th>
				<th>투산 NX4 가솔린<br>1.6터보 프리미엄</th>
			</tr>			
			<tr>
				<th>연료</th>
				<td style="background-color:#dff0d8;">휘발유<br>(하이브리드)</td>
				<td style="background-color:#dff0d8;">휘발유<br>(하이브리드)</td>
				<td>경유</td>
				<td>휘발유</td>
			</tr>
			<tr>
				<th>차량가격<br>(개소세 5% 기준)</th>
				<td style="background-color:#dff0d8;">3,083만원</td>
				<td style="background-color:#dff0d8;">3,273만원</td>
				<td>2,885만원</td>
				<td>2,690만원</td>
			</tr>
			<tr>
				<th>개소세 감면혜택<br>적용후 차량가격</th>
				<td style="background-color:#dff0d8;">2,895만원</td>
				<td style="background-color:#dff0d8;">3,073만원</td>
				<td>2,832만원</td>
				<td>2,641만원</td>
			</tr>
			<tr>
				<th>보증금<br>(개소세 감면혜택 적용후 차량가격의 20% 기준)</th>
				<td style="background-color:#dff0d8;">5,790,000원</td>
				<td style="background-color:#dff0d8;">6,146,000원</td>
				<td>5,664,000원</td>
				<td>5,282,000원</td>
			</tr>
			<tr>
				<th>월대여료<br>(계약기간 48개월)</th>
				<td style="background-color:#dff0d8;">484,550원</td>
				<td style="background-color:#dff0d8;">505,780원</td>
				<td>487,740원</td>
				<td>455,730원</td>
			</tr>
			<tr>
				<th>복합연비</th>
				<td style="background-color:#dff0d8;">20.8km/ℓ</td>
				<td style="background-color:#dff0d8;">16.2km/ℓ</td>
				<td>14.2km/ℓ</td>
				<td>12.5km/ℓ</td>
			</tr>
			<tr>
				<th>월평균 연료비<br>(2000km÷적용연비Ⅹℓ 당 연료가격)</th>
				<td style="background-color:#dff0d8;">229,000원</td>
				<td style="background-color:#dff0d8;">294,000원</td>
				<td>325,000원</td>
				<td>382,000원</td>
			</tr>
			<tr>
				<th style="background-color:#dff0d8;">월간 총 비용<br>(대여료+연료비)</th>
				<td style="background-color:#dff0d8;">713,550원</td>
				<td style="background-color:#dff0d8;">799,780원</td>
				<td style="background-color:#dff0d8;">812,740원</td>
				<td style="background-color:#dff0d8;">837,730원</td>
			</tr>			
		</table>		
		<small>
			* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.<br>
			* 리터당 연료가격: 2022년04월19일 오피넷 유종별 서울 평균 유가 기준  (휘발유 2027원/ℓ, 경유 1963원/ℓ, LPG 1227원/ℓ)<br>
			※ 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 48개월) 기준 
		</small><br/><br/>
				
		<h4>(2) 중형승용</h4>
		<small>※ 연료비: 실주행거리 월 2,000km 기준</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="25%"/>
				<col width="25%"/>
				<col width="25%"/>
				<col width="25%"/>
			</colgroup>
			<tr>
				<th>차명</th>
				<th style="background-color:#dff0d8;">K5 DL3<br>하이브리드<br>프레스티지</th>
				<th>K5 DL3 LPG<br>2.0 LPI 프레스티지</th>
				<th>K5 DL3 가솔린<br>2.0 프레스티지</th>
			</tr>
			<tr>
				<th>연료</th>
				<td style="background-color:#dff0d8;">휘발유<br>(하이브리드)</td>
				<td>LPG</td>
				<td>휘발유</td>
			</tr>
			<tr>
				<th>차량가격<br>(개소세 5% 기준)</th>
				<td style="background-color:#dff0d8;">3,168만원</td>
				<td>2,725만원</td>
				<td>2,680만원</td>
			</tr>
			<tr>
				<th>개소세 감면혜택<br>적용후 차량가격</th>
				<td style="background-color:#dff0d8;">2,975만원</td>
				<td>2,675만원</td>
				<td>2,631만원</td>
			</tr>
			<tr>
				<th>보증금<br>(개소세 감면혜택 적용후 차량가격의 20% 기준)</th>
				<td style="background-color:#dff0d8;">5,950,000원</td>
				<td>5,350,000원</td>
				<td>5,262,000원</td>
			</tr>
			<tr>
				<th>월대여료<br>(계약기간 48개월)</th>
				<td style="background-color:#dff0d8;">520,740원</td>
				<td>483,340원</td>
				<td>481,690원</td>
			</tr>
			<tr>
				<th>복합연비</th>
				<td style="background-color:#dff0d8;">19.1km/ℓ</td>
				<td>10.0km/ℓ</td>
				<td>13.0km/ℓ</td>
			</tr>
			<tr>
				<th>월평균 연료비<br>(2000km÷적용연비Ⅹℓ 당 연료가격)</th>
				<td style="background-color:#dff0d8;">250,000원</td>
				<td>289,000원</td>
				<td>367,000원</td>
			</tr>
			<tr>
				<th style="background-color:#dff0d8;">월간 총 비용<br>(대여료+연료비)</th>
				<td style="background-color:#dff0d8;">770,740원</td>
				<td style="background-color:#dff0d8;">772,340원</td>
				<td style="background-color:#dff0d8;">848,690원</td>
			</tr>			
		</table>		
		<small>
			* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.<br>
			* 리터당 연료가격: 2022년04월19일 오피넷 유종별 서울 평균 유가 기준  (휘발유 2027원/ℓ, 경유 1963원/ℓ, LPG 1227원/ℓ)<br>
			※ 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 48개월) 기준 
		</small><br/><br/>
		
		
		<h4>(3) 준대형승용</h4>
		<small>※ 연료비: 실주행거리 월 2,000km 기준</small>
		<small style="float:right;">VAT포함</small>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
				<col width="20%"/>
			</colgroup>
			<tr>
				<th>차명</th>
				<th style="background-color:#dff0d8;">더뉴 그랜저<br>하이브리드<br>프리미엄</th>
				<th>더뉴 그랜저 LPG<br>3.0 렌터카 프리미엄</th>
				<th>더뉴 그랜저 가솔린<br>2.5 프리미엄</th>
				<th>더뉴 그랜저 가솔린<br>3.3프리미엄</th>
			</tr>
			<tr>
				<th>연료</th>
				<td style="background-color:#dff0d8;">휘발유<br>(하이브리드)</td>
				<td>LPG</td>
				<td>휘발유</td>
				<td>휘발유</td>
			</tr>
			<tr>
				<th>차량가격</th>
				<td style="background-color:#dff0d8;">3,893만원</td>
				<td>3,193만원</td>
				<td>3,365만원</td>
				<td>3,655만원</td>
			</tr>
			<tr>
				<th>개소세 감면혜택<br>적용후 차량가격</th>
				<td style="background-color:#dff0d8;">3,679만원</td>
				<td></td>
				<td>3,303만원</td>
				<td>3,588만원</td>
			</tr>
			<tr>
				<th>보증금<br>(개소세 감면혜택 적용후 차량가격의 20% 기준)</th>
				<td style="background-color:#dff0d8;">7,358,000원</td>
				<td>6,386,000원</td>
				<td>6,606,000원</td>
				<td>7,176,000원</td>
			</tr>
			<tr>
				<th>월대여료<br>(계약기간 48개월)</th>
				<td style="background-color:#dff0d8;">606,540원</td>
				<td>570,350원</td>
				<td>562,980원</td>
				<td>634,040원</td>
			</tr>
			<tr>
				<th>복합연비</th>
				<td style="background-color:#dff0d8;">16.2km/ℓ</td>
				<td>7.5km/ℓ</td>
				<td>11.9km/ℓ</td>
				<td>9.7km/ℓ</td>
			</tr>
			<tr>
				<th>월평균 연료비<br>(2000km÷적용연비Ⅹℓ 당 연료가격)</th>
				<td style="background-color:#dff0d8;">294,000원</td>
				<td>385,000원</td>
				<td>401,000원</td>
				<td>492,000원</td>
			</tr>
			<tr>
				<th style="background-color:#dff0d8;">월간 총 비용<br>(대여료+연료비)</th>
				<td style="background-color:#dff0d8;">900,540원</td>
				<td style="background-color:#dff0d8;">955,350원</td>
				<td style="background-color:#dff0d8;">963,980원</td>
				<td style="background-color:#dff0d8;">1,126,040원</td>
			</tr>			
		</table>
		<small style="font-weight: bold; font-size: 90%;">
			※ 각 비교차종의 사양수준 차이가 있음 (하이브리드와 가솔린은 사양수준 비슷함)<br>
		</small>		
		<small>			
			* 적용연비: 실주행 연비를 정부공인 복합연비의 85% 수준으로 봄.<br>
			* 리터당 연료가격: 2022년04월19일 오피넷 유종별 서울 평균 유가 기준  (휘발유 2027원/ℓ, 경유 1963원/ℓ, LPG 1227원/ℓ)<br>
			* 사양수준이 비슷한 차량들을 비교함, 아마존카 홈페이지 월대여료(약정운행거리 24,000km/년, 정비서비스 미포함, 계약기간 48개월) 기준 
		</small><br/><br/>
	</div>
	
	
	<div role="tabpanel" class="tab-pane amazon-desc" id="pay_buy_rent">
		<div class="col-md-12 col-xs-12" style="background-color: #ffffca; margin-bottom: 20px; margin-top: 20px;">
			<h4>전기차를 아마존카 장기렌트로 이용 시</h4>
			<h4>현금구입 대비 약285만원, 할부구입 대비 약165만원 절약! (니로 EV 노블레스 53,040,000원 차량 기준)</h4>
		</div>
		<!-- <div class="col-md-12 col-xs-12" style="padding: 0px;">
			<h4>※  니로 EV 노블레스 52,070,000원 차량 기준</h4>
			<small style="float:right;">2019년 02월 18일</small><br><br>
		</div> -->
		<small style="float:right;">2020년 04월 기준</small><br><br>
		<div class="col-md-12 col-xs-12" style="text-align: center; padding-bottom: 20px;">
			<div class="col-md-3 col-xs-3"></div>
			<div class="col-md-6 col-xs-6" style="border: 1px solid #ddd; padding-top: 10px; padding-bottom: 10px;">
				<h4>현금구입 vs 아마존카 장기렌트 비용비교<br>
				(2년간 소요비용 기준)</h4>
			</div>
			<div class="col-md-3 col-xs-3"></div>
		</div>
		<div class="col-md-12 col-xs-12" style="padding: 0px;">
			<div class="col-md-6 col-xs-6" style="text-align: left; padding: 0px;">
				니로 EV 노블레스 53,040,000원 차량, 약정운행거리 30,000km/년, 서울보조금 기준
			</div>
			<div class="col-md-6 col-xs-6" style="text-align: right; padding: 0px;">
				단위: 원
			</div>
		</div>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="1%"/>
				<col width="1%"/>
				<col width="1%"/>
				<col width="17%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="30%"/>
				<col width="20%"/>
			</colgroup>
			<tr>
				<th colspan="4" rowspan="2">구분</th>
				<th colspan="3">현금구입</th>
				<th rowspan="2">아마존카<br>장기렌트 기본식<br>(24개월)</th>
			</tr>
			<tr>
				<th>현금구입</th>
				<th colspan="2">산출기준</th>
			</tr>
			<tr>
				<th rowspan="18" style="border-bottom: hidden;"></th>
				<th colspan="2" rowspan="2" style="border-bottom: hidden;"></th>
				<th>차량가격</th>
				<td></td>
				<td style="text-align: right;">49,802,817</td>
				<td>차가 53,040,000 - 개소세감면액 3,237,183</td>
				<td rowspan="5"></td>
			</tr>
			<tr>
				<th>탁송료</th>
				<td></td>
				<td style="text-align: right;">121,000</td>
				<td>서울기준</td>
			</tr>
			<tr>
				<th colspan="3">총 차량가격</th>
				<td></td>
				<td style="text-align: right;">49,923,817</td>
				<td></td>
			</tr>
			<tr>
				<th colspan="3">친환경차 구매보조금</th>
				<td></td>
				<td style="text-align: right;">12,700,000</td>
				<td>서울기준</td>
			</tr>
			<tr>
				<th colspan="3">총 차량가격 - 구매보조금</th>
				<td></td>
				<td style="text-align: right;">37,223,817</td>
				<td>소비자가 실질적으로 부담하는 총 차량가격</td>
			</tr>
			<tr>
				<th rowspan="9" style="border-bottom: hidden;"></th>
				<th rowspan="4" style="border-bottom: hidden;"></th>
				<th>현금 일시불</th>
				<td style="text-align: right;">37,223,817</td>
				<td></td>
				<td></td>
				<td rowspan="4" style="vertical-align: bottom !important; text-align: right;">보증금<br>(현금 구입 시 초기비용 수준 적용)</td>
			</tr>
			<tr>
				<th>통합취득세</th>
				<td style="text-align: right;">1,776,950</td>
				<td style="text-align: right;">7.0%</td>
				<td>친환경차 취득세 감면혜택 적용</td>
			</tr>
			<tr>
				<th>공채할인</th>
				<td style="text-align: right;">0</td>
				<td></td>
				<td>감면혜택 적용(서울 및 전지역)</td>
			</tr>
			<tr>
				<th>부대비용</th>
				<td style="text-align: right;">82,000</td>
				<td></td>
				<td>번호판대+증지대+등록대행료 등</td>
			</tr>
			<tr>
				<th colspan="2">구입단계 제비용</th>
				<th style="text-align: right;">39,082,767</th>
				<th colspan="2"></th>
				<th style="text-align: right;">39,082,767</th>
			</tr>
			<tr>
				<th rowspan="3" style="border-bottom: hidden;"></th>
				<th>보험료</th>
				<td style="text-align: right;">1,600,000</td>
				<td style="text-align: right;">800,000/년</td>
				<td>실 보험료는 고객 할인할증율에 따라 다름</td>
				<td rowspan="2" style="text-align: right; border-bottom: 1px solid #f6f6f6;">월대여료(VAT포함)<br>622,490/월</td>
			</tr>
			<tr>
				<th>자동차세</th>
				<td style="text-align: right;">260,000</td>
				<td style="text-align: right;">130,000/년</td>
				<td></td>
			</tr>
			<tr>
				<th>사고처리 및<br>사고대차</th>
				<td style="text-align: right;">100,000</td>
				<td style="text-align: right;">50,000/년</td>
				<td>아마존카 전상품 기본 제공서비스<br>(자차,가해사고시에도 무료대차)</td>
				<td style="text-align: right;">※ 추가비용 없이<br>좌측의 해당 서비스 제공</td>
			</tr>
			<tr>
				<th colspan="2">유지단계 제비용</th>
				<th style="text-align: right;">1,960,000</th>
				<th colspan="2"></th>
				<th style="text-align: right;">14,939,760</th>
			</tr>
			<tr>
				<th colspan="3">구입/유지 총비용</th>
				<th style="text-align: right;">41,042,767</th>
				<th colspan="2" style="text-align: right;">(ⓐ)</th>
				<th style="text-align: right;">54,022,527</th>
			</tr>
			<tr>
				<th colspan="3" rowspan="3">계약만료시<br>차량인수 비용</th>
				<th></th>
				<th></th>
				<th style="text-align: right;">보증금 환불 (ⓑ)</th>
				<th style="text-align: right;">-39,082,767</th>				
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th style="text-align: right;">매입옵션가격 (ⓒ)</th>
				<th style="text-align: right;">22,710,085</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th style="text-align: right;">*매입옵션 취득세(ⓓ)</th>
				<th style="text-align: right;">189,706</th>
			</tr>
			<tr>
				<th colspan="4">총 필요비용(24개월)</th>
				<td style="text-align: right;">41,042,767</td>
				<td></td>
				<td style="text-align: right;">= ⓐ + ⓑ + ⓒ + ⓓ</td>
				<td style="text-align: right;">37,649,845</td>
			</tr>
			<tr>
				<td colspan="5" style="border-bottom: hidden; border-left: hidden;"></td>
				<th colspan="2">현금구입 대비 (Cash Flow 이자효과 미반영)</th>
				<th style="text-align: right;">-3,392,922원</th>
			</tr>
		</table>
		<br>
		<span>
			◎ Cash Flow 차이에 따른 2년간	이자 효과 (년리	4.5%기준) = +542,616원 (542,616원 추가 부담)<br>
			<font style="font-weight: bold; font-size: 15px;">※ 비용절감 효과 합계 : 2,850,306원 ( =3,392,922원 - 542,616원 )</font><br><br>			
		</span>
		<div style="padding-left: 9.5em; text-indent: -9.5em;">
			* 매입옵션 취득세(ⓓ): 전기차는 취득세 최대 140만원까지 면제 (2020년 기준)<br>
			전기차 취득세 혜택 완전 소멸 시 취득세 =	1,445,220원
		</div>
		<br><br><br><br>
		
		
		<small style="float:right;">2020년 04월 기준</small><br><br>
		<div class="col-md-12 col-xs-12" style="text-align: center; padding-bottom: 20px;">
			<div class="col-md-3 col-xs-3"></div>
			<div class="col-md-6 col-xs-6" style="border: 1px solid #ddd; padding-top: 10px; padding-bottom: 10px;">
				<h4>36개월 할부구입 vs 아마존카 장기렌트 비용비교</h4>
			</div>
			<div class="col-md-3 col-xs-3"></div>
		</div>
		<div class="col-md-12 col-xs-12" style="padding: 0px;">
			<div class="col-md-6 col-xs-6" style="text-align: left; padding: 0px;">
				니로 EV 노블레스 53,040,000원 차량, 약정운행거리 30,000km/년, 서울보조금 기준
			</div>
			<div class="col-md-6 col-xs-6" style="text-align: right; padding: 0px;">
				단위: 원
			</div>
		</div>
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="1%"/>
				<col width="1%"/>
				<col width="1%"/>
				<col width="17%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="30%"/>
				<col width="20%"/>
			</colgroup>
			<tr>
				<th colspan="4" rowspan="2">구분</th>
				<th colspan="3">36개월 할부구입</th>
				<th rowspan="2">아마존카<br>장기렌트 기본식<br>(36개월)</th>
			</tr>
			<tr>
				<th>총비용(36개월)</th>
				<th colspan="2">산출기준</th>
			</tr>
			<tr>
				<th rowspan="21" style="border-bottom: hidden;"></th>
				<th colspan="2" rowspan="2" style="border-bottom: hidden;"></th>
				<th>차량가격</th>
				<td></td>
				<td style="text-align: right;">49,802,817</td>
				<td>차가 53,040,000 - 개소세감면액 3,237,183</td>
				<td rowspan="7"></td>
			</tr>
			<tr>
				<th>탁송료</th>
				<td></td>
				<td style="text-align: right;">121,000</td>
				<td>서울기준</td>
			</tr>
			<tr>
				<th colspan="3">총 차량가격</th>
				<td></td>
				<td style="text-align: right;">49,923,817</td>
				<td></td>
			</tr>
			<tr>
				<th colspan="3">친환경차 구매보조금</th>
				<td></td>
				<td style="text-align: right;">12,700,000</td>
				<td>서울기준</td>
			</tr>
			<tr>
				<th colspan="3">총 차량가격 - 구매보조금</th>
				<td></td>
				<td style="text-align: right;">37,223,817</td>
				<td>소비자가 실질적으로 부담하는 총 차량가격</td>
			</tr>
			<tr>
				<th colspan="3">할부원금</th>
				<td></td>
				<td style="text-align: right;">33,100,000</td>
				<td>메이커 선수금 4,123,817원 기준</td>
			</tr>
			<tr>
				<th colspan="3">월할부금</th>
				<td></td>
				<td style="text-align: right;">984,725/월</td>
				<td>이자율4.5%</td>
			</tr>
			<tr>
				<th rowspan="10" style="border-bottom: hidden;"></th>
				<th rowspan="4" style="border-bottom: hidden;"></th>
				<th>메이커 선수금</th>
				<td style="text-align: right;">4,123,817</td>
				<td style="text-align: right;">총 차가의 8.4%</td>
				<td>총차량가격 - 구매보조금 - 할부원금</td>
				<td rowspan="4" style="vertical-align: bottom !important; text-align: right;">보증금 (차가 15% 기준)</td>
			</tr>
			<tr>
				<th>통합취득세</th>
				<td style="text-align: right;">1,776,950</td>
				<td style="text-align: right;">7.0%</td>
				<td>친환경차 취득세 감면혜택 적용</td>
			</tr>
			<tr>
				<th>공채할인</th>
				<td style="text-align: right;">0</td>
				<td></td>
				<td>감면혜택 적용(서울 및 전지역)</td>
			</tr>
			<tr>
				<th>부대비용</th>
				<td style="text-align: right;">82,000</td>
				<td></td>
				<td>번호판대+증지대+등록대행료 등</td>
			</tr>
			<tr>
				<th colspan="2">구입단계 제비용</th>
				<th style="text-align: right;">5,982,767</th>
				<th colspan="2"></th>
				<th style="text-align: right;">7,470,600</th>
			</tr>
			<tr>
				<th rowspan="4" style="border-bottom: hidden;"></th>
				<th>보험료</th>
				<td style="text-align: right;">2,400,000</td>
				<td style="text-align: right;">800,000/년</td>
				<td>실 보험료는 고객 할인할증율에 따라 다름</td>
				<td rowspan="2" style="text-align: right; border-bottom: 1px solid #f6f6f6;">월대여료(VAT포함)<br>667,590/월</td>
			</tr>
			<tr>
				<th>할부금</th>
				<td style="text-align: right;">35,450,100</td>
				<td style="text-align: right;"></td>
				<td>= 월할부금 x 할부개월수</td>
			</tr>
			<tr>
				<th>자동차세</th>
				<td style="text-align: right;">390,000</td>
				<td style="text-align: right;">130,000/년</td>
				<td></td>
				<td style="border-bottom: 1px solid #f6f6f6;"></td>
			</tr>
			<tr>
				<th>사고처리 및<br>사고대차</th>
				<td style="text-align: right;">150,000</td>
				<td style="text-align: right;">50,000/년</td>
				<td>아마존카 전상품 기본 제공서비스<br>(자차,가해사고시에도 무료대차)</td>
				<td style="text-align: right;">※ 추가비용 없이<br>좌측의 해당 서비스 제공</td>
			</tr>
			<tr>
				<th colspan="2">유지단계 제비용</th>
				<th style="text-align: right;">38,390,100</th>
				<th colspan="2"></th>
				<th style="text-align: right;">24,033,240</th>
			</tr>
			<tr>
				<th colspan="3">구입/유지 총비용</th>
				<th style="text-align: right;">44,372,867</th>
				<th colspan="2" style="text-align: right;">(ⓐ)</th>
				<th style="text-align: right;">31,503,840</th>
			</tr>
			<tr>
				<th colspan="3" rowspan="3">계약만료시<br>차량인수 비용</th>
				<th></th>
				<th></th>
				<th style="text-align: right;">보증금 환불 (ⓑ)</th>
				<th style="text-align: right;">-7,470,600</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th style="text-align: right;">매입옵션가격 (ⓒ)</th>
				<th style="text-align: right;">19,472,901</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th style="text-align: right;">*매입옵션 취득세(ⓓ)</th>
				<th style="text-align: right;">0</th>
			</tr>
			<tr>
				<th colspan="4">총 필요비용(36개월)</th>
				<td style="text-align: right;">44,372,867</td>
				<td></td>
				<td style="text-align: right;">= ⓐ + ⓑ + ⓒ + ⓓ</td>
				<td style="text-align: right;">43,506,141</td>
			</tr>
			<tr>
				<td colspan="5" style="border-bottom: hidden; border-left: hidden;"></td>
				<th colspan="2">현금구입 대비 (Cash Flow 이자효과 미반영)</th>
				<th style="text-align: right;">-866,726원</th>
			</tr>
		</table>
		<br>
		<span>
			◎ Cash Flow 차이에 따른 3년간	이자 효과 (년리	4.5%기준) = -784,285원 (784,285원 절감)<br>
			<font style="font-weight: bold; font-size: 15px;">※ 비용절감 효과 합계 : 1,651,011원 ( =866,726원 + 784,285원 )</font><br><br>			
		</span>
		<div style="padding-left: 9.5em; text-indent: -9.5em;">
			* 매입옵션 취득세(ⓓ): 전기차는 취득세 최대 140만원까지 면제 (2020년 기준)<br>
			전기차 취득세 혜택 완전 소멸 시 취득세 =	1,239,210원
		</div>
		<br><br>		
	</div>
	
	
	<div role="tabpanel" class="tab-pane amazon-desc" id="buy_rent">
		<h4>전기차 배터리 및 전기차전용부품 보증 조건</h4>
		<h5 style="color: #6C7382;">(구매 고객별 차이)</h5>		
		<table class="desc-table table table-bordered align-table" style="text-align:center;">
			<colgroup>				
				<col width="18%"/>
				<col width="16%"/>
				<col width="15%"/>
				<col width="14%"/>
				<col width="16%"/>
				<col width="16%"/>
			</colgroup>
			<tr>
				<th rowspan="2">구분</th>
				<th rowspan="2">1회충전<br>주행거리</th>
				<th rowspan="2">배터리용량</th>
				<th rowspan="2">전기차전용부품<br>보증기간</th>
				<th colspan="2">배터리 보증</th>
			</tr>
			<tr>
				<th>최초 구매 개인 고객</th>
				<th>법인/리스/중고차고객<br>(렌트는 법인에 포함)</th>
			</tr>
			<tr>
				<th style="background-color:#cde4f5;">아이오닉5 2WD 롱레인지 20인치</th>
				<td style="background-color:#cde4f5;">(상온)405km/(저온)354km</td>
				<td style="background-color:#cde4f5;">72.0kWh</td>
				<td>10년/16만km</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
			</tr>
			<tr>
				<th style="background-color:#dad9d9;">EV6 롱레인지 2WD 롱레인지 20인치</th>
				<td style="background-color:#dad9d9;">(상온)445km/(저온)411km</td>
				<td style="background-color:#dad9d9;">77.5kWh</td>
				<td>10년/16만km</td>
				<td>10년/20만km</td>
				<td>10년/16만km</td>
			</tr>
			<tr>
				<td>GV60 스탠다드 2WD 19인치</td>
				<td>(상온)470km/(저온)416km</td>
				<td>77.5kWh</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
			</tr>					
			<tr>
				<td>Electrified GV70 AWD 19인치</td>
				<td>(상온)408km/(저온)353km</td>
				<td>77.5kWh</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
			</tr>
			<tr>
				<td>G80 Eletrified</td>
				<td>(상온)433km/(저온)411km</td>
				<td>87.2kWh</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
				<td>10년/20만km</td>
			</tr>
			<tr>
				<td>볼트 EUV</td>
				<td>(상온)403km/(저온)279km</td>
				<td>65.9kWh</td>
				<td>8년/16만km</td>
				<td>8년/16만km</td>
				<td>8년/16만km</td>
			</tr>
			<tr>
				<td>Model 3(Long Range HPL)</td>
				<td>(상온)527.9km/(저온)440.1km</td>
				<td>85.0kWh</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
			</tr>
			<tr>
				<td>Model 3(Performance HPL)</td>
				<td>(상온)480.1km/(저온)415.8km</td>
				<td>85.0kWh</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
			</tr>
			<tr>
				<td>Model Y(Long Range)</td>
				<td>(상온)511.4km/(저온)432.5km</td>
				<td>85.0kWh</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
				<td>8년/19.2만km</td>
			</tr>
			<tr>
				<td>포터 II 일렉트릭</td>
				<td>(상온)220km/(저온)173km</td>
				<td>58.9kWh</td>
				<td>8년/12만km</td>
				<td>8년/12만km</td>
				<td>8년/12만km</td>
			</tr>
			<tr>
				<td>봉고 Ⅲ EV</td>
				<td>(상온)220km/(저온)172km</td>
				<td>58.9kWh</td>
				<td>8년/12만km</td>
				<td>8년/12만km</td>
				<td>8년/12만km</td>
			</tr>
		</table>
		<br/>	
		<!-- <small>
			* SOH (STATE of Health) : 배터리 출하 당시 초기 건강도/내구도 대비 성능상태 
		</small><br/><br/> -->
	</div>
	
	
	
	
</div>
<!-- Modal -->
<div class="modal fade" id="personal-fee-modal" tabindex="-1" role="dialog" aria-labelledby="detail-modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title">시간대별 전기요금 <small>(전기자동차 충전전력 전기요금, 개인용)</small></h4>
	     	</div>
	     	<div class="modal-body">
	     		<!-- ※경부하 시간대 전기 요금 평균 : <span>66원/kWh (2020년 6월까지 50% 할인요금 적용 (<span class="primary-red">33원 / kWh</span>))</span><br/><br/> -->
	     		<div style='display: flex; justify-content: space-between;'>
	     			<div style='font-size: 16px; font-weight: bold;'>[할인 전 요금]</div>
	     			<div>적용일자: 2022년 4월 1일</div>
	     		</div>
		    	<table class="table desc-table table-bordered text-center" id="detailInfo">
		    		<colgroup>
		    			<col width="10%"/>
		    			<col width="10%"/>
		    			<col width="10%"/>
		    			<col width="15%"/>
		    			<col width="13%"/>
		    			<col width="13%"/>
		    			<col width="13%"/>
		    			<col width="16%"/>
		    		</colgroup>
		    		<tr class="header">
		    			<%-- <th rowspan="2" colspan="2">구분</th> --%>
		    			<th rowspan="2">구분</th>
		    			<th rowspan="2">기본요금<br/>(원/kW)</th>
		    			<th rowspan="2" colspan="2">시간대<br/>(봄, 여름, 가을)<br>(6월~8월),(3월~5월,9월~10월)</th>
		    			<th colspan="3">전력량 요금 (원/kWh)</th>
		    			<th rowspan="2">시간대<br/>(겨울)<br>(11월~2월)</th>
		    		</tr>
		    		<tr class="header">
		    			<th>여름<br/>(6~8월)</th>
		    			<th>봄·가을<br/>(3~5, 9~10월)</th>
		    			<th>겨울<br/>(11~2월)</th>
		    		</tr>
		    		<tr>
		    			<th rowspan="3">저 압<!-- <br/>(380V 이하) --></th>
		    			<th rowspan="3">2,390</th>
		    			<th>경부하</th>
		    			<th>23:00 ~ 09:00</th>
		    			<td style="vertical-align: middle !important;">57.5</td>
		    			<td style="vertical-align: middle !important;">58.6</td>
		    			<td style="vertical-align: middle !important;">80.6</td>
		    			<td>23:00 ~ 09:00</td>
		    		</tr>
		    		<tr>
		    			<th>중간부하</th>
		    			<th>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 13:00<br/>
		    				17:00 ~ 23:00
		    			</th>
		    			<td style="vertical-align: middle !important;">145.2</td>
		    			<td style="vertical-align: middle !important;">70.4</td>
		    			<td style="vertical-align: middle !important;">128.1</td>
		    			<td>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 17:00<br/>
		    				20:00 ~ 22:00
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>최대부하</th>
		    			<th>
		    				10:00 ~ 12:00<br/>
		    				13:00 ~ 17:00
		    			</th>
		    			<td style="vertical-align: middle !important;">232.4</td>
		    			<td style="vertical-align: middle !important;">75.3</td>
		    			<td style="vertical-align: middle !important;">190.7</td>
		    			<td>
		    				<!-- 10:00 ~ 12:00<br/> -->
		    				17:00 ~ 20:00<br/>
		    				22:00 ~ 23:00
		    			</td>
		    		</tr>
		    		<tr>
		    			<th rowspan="3">
		    				고 압<!-- <br/>(3,300V 이상) -->
		    			</th>
		    			<th rowspan="3">2,580</th>
		    			<th>경부하</th>
		    			<th>23:00 ~ 09:00</th>
		    			<td style="vertical-align: middle !important;">52.4</td>
		    			<td style="vertical-align: middle !important;">53.4</td>
		    			<td style="vertical-align: middle !important;">69.8</td>
		    			<td>23:00 ~ 09:00</td>
		    		</tr>
		    		<tr>
		    			<th>중간부하</th>
		    			<th>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 13:00<br/>
		    				17:00 ~ 23:00
		    			</th>
		    			<td style="vertical-align: middle !important;">110.6</td>
		    			<td style="vertical-align: middle !important;">64.2</td>
		    			<td style="vertical-align: middle !important;">100.9</td>
		    			<td>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 17:00<br/>
		    				20:00 ~ 22:00
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>최대부하</th>
		    			<th>
		    				10:00 ~ 12:00<br/>
		    				13:00 ~ 17:00
		    			</th>
		    			<td style="vertical-align: middle !important;">163.6</td>
		    			<td style="vertical-align: middle !important;">68.1</td>
		    			<td style="vertical-align: middle !important;">138.7</td>
		    			<td>
		    				<!-- 10:00 ~ 12:00<br/> -->
		    				17:00 ~ 20:00<br/>
		    				22:00 ~ 23:00
		    			</td>
		    		</tr>
		    	</table>
		    	※경부하 시간대 전기 요금 평균 : <span>66원/kWh(할인 적용 전), 10% 할인 적용 시 <span class="primary-red">59원/kWh</span> </span><br/><br/>
		    	
		    	<h4 class="modal-title">전기차 충전료 할인율 변동 계획 <small>(* 한국전력)</small></h4>
		    	<table class="table desc-table table-bordered text-center" id="detailInfo">
		    		<colgroup>
		    			<col width="20%"/>
		    			<col width="20%"/>
		    			<col width="20%"/>
		    			<col width="20%"/>
		    			<col width="20%"/>
		    		</colgroup>
		    		<tr class="header">
		    			<th colspan="2" style="vertical-align: middle !important;">적용기간</th>
		    			<th>2017.01.01<br/>~<br/>2020.06.30</th>
		    			<th>2020.07.01<br/>~<br/>2021.06.30</th>
		    			<th>2021.07.01<br/>~<br/>2022.06.30</th>
		    			<th style="vertical-align: middle !important;">2022.07.01 이후</th>
		    		</tr>
		    		<tr>
		    			<th rowspan="2">할인율</th>
		    			<th>기본요금</th>
		    			<td>100%</td>
		    			<td>50%</td>
		    			<td>25%</td>
		    			<td rowspan="2" style="vertical-align: middle !important;">0%</td>
		    		</tr>
		    		<tr>
		    			<th>전력량요금<br/>(충전요금)</th>
		    			<td style="vertical-align: middle !important;">50%</td>
		    			<td style="vertical-align: middle !important;">30%</td>
		    			<td style="vertical-align: middle !important;">10%</td>
		    		</tr>
		    	</table>
	   		</div>
	    	<div class="modal-footer">
	       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	    	</div>
		 </div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="public-fee-modal" tabindex="-1" role="dialog" aria-labelledby="detail-modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title">시간대별 전기요금<small>(환경부 급속충족기 전기 요금, 공용)</small></h4>
	     	</div>
	     	<div class="modal-body">
	     		※경부하 시간대 전기 요금 평균 : <span class="primary-orange bold">313원/kWh</span><br/><br/>
		    	<table class="table desc-table table-bordered text-center" id="detailInfo">
		    		<colgroup>
		    			<col width="11%"/>
		    			<col width="16%"/>
		    			<col width="15%"/>
		    			<col width="15%"/>
		    			<col width="15%"/>
		    			<col width="16%"/>
		    		</colgroup>
		    		<tr class="header">
		    			<th rowspan="2">구분</th>
		    			<th rowspan="2">시간대<br/>(봄,여름,가을)</th>
		    			<th colspan="3">전력량 요금 (원/kWh)</th>
		    			<th rowspan="2">시간대<br/>(겨울)</th>
		    		</tr>
		    		<tr class="header">
		    			<th>여름<br/>(6~8월)</th>
		    			<th>봄·가을<br/>(3~5월,9~10월)</th>
		    			<th>겨울<br/>(11~2월)</th>
		    		</tr>
		    		<tr>
		    			<th>경부하</th>
		    			<th>23:00 ~ 09:00</th>
		    			<td>294.8</td>
		    			<td>285.2</td>
		    			<td>304.2</td>
		    			<td>23:00 ~ 09:00</td>
		    		</tr>
		    		<tr>
		    			<th>중간부하</th>
		    			<th>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 13:00<br/>
		    				17:00 ~ 23:00
		    			</th>
		    			<td>334.9</td>
		    			<td>296.0</td>
		    			<td>323.4</td>
		    			<td>
		    				09:00 ~ 10:00<br/>
		    				12:00 ~ 17:00<br/>
		    				20:00 ~ 22:00
		    			</td>
		    		</tr>
		    		<tr>
		    			<th>최대부하</th>
		    			<th>
		    				10:00 ~ 12:00<br/>
		    				13:00 ~ 17:00
		    			</th>
		    			<td>356.2</td>
		    			<td>299.9</td>
		    			<td>337.4</td>
		    			<td>
		    				10:00 ~ 12:00<br/>
		    				17:00 ~ 20:00<br/>
		    				22:00 ~ 23:00
		    			</td>
		    		</tr>
		    	</table>
	   		</div>
	    	<div class="modal-footer">
	       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	    	</div>
		 </div>
	</div>
</div>
<!-- Modal --><!-- tt -->
<div class="modal fade" id="detail-content-modal" tabindex="-1" role="dialog" aria-labelledby="detail-modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title">< 고정형 완속충전기 보조금 지원기준 ></h4>
	     	</div>
	     	<div class="modal-body">
	     		<span style="float:right;">( 단위 : 만원 )</span>
		    	<table class="desc-table table-bordered text-center" id="detailInfo">
		    		<colgroup>
		    			<col width="11%"/>
		    			<col width="11%"/>
		    			<col width="16%"/>
		    			<col width="15%"/>
		    			<col width="15%"/>
		    		</colgroup>
		    		<tr class="header">
		    			<th rowspan="2" >구분</th>
		    			<th colspan="2">지원조건</th>
		    			<th colspan="3">지원한도</th>
		    		</tr>
		    		<tr class="header">
		    			<th>개방여부</th>
		    			<th>지원물량</th>
		    			<th>1기</th>
		    			<th>2∼5기</th>
		    			<th>6기 이상</th>
		    		</tr>
		    		<tr>
		    			<td rowspan="2">공용</td>
		    			<td>완전개방</td>
		    			<td rowspan="2">주차면<br>100면당 최대 1기</td>
		    			<td>350</td>
		    			<td>300</td>
		    			<td>250</td>
		    		</tr>
		    		<tr>
		    			<td>부분개방</td>
		    			<td>300</td>
		    			<td>260</td>
		    			<td>210</td>
		    		</tr>
		    		<tr>
		    			<td>비공용</td>
		    			<td>미개방</td>
		    			<td>전기차<br>1대당 최대 1기</td>
		    			<td colspan="3">
		    				<span style="font-weight: bold;">최대 130</span>
		    			</td>
		    		</tr>
		    	</table><br>
		    	* 비공용 충전기<br>
		    	&nbsp;&nbsp;<span style="font-weight: bold;">- 벽부형 및 스탠드형 등을 신청할 경우 130만원 지원(정액 지원)</span><br>
		    	&nbsp;&nbsp;- 과금형 휴대용충전기(계량, 통신기능이 있는 충전기)를 신청할 경우 전용 콘센트 설치비를<br>
				&nbsp;&nbsp;&nbsp;포함하여 60만원 지급<br>
      			&nbsp;&nbsp;<span style="font-weight: bold;">- 과금형 휴대용충전기만 신청할 경우 40만원 지원(정액 지원)</span><br>
				<!-- &nbsp;&nbsp;- 전기차 제작사에서 제공하는 충전기는 비공용으로 신청시 설치비 90만원 지원(정액지원)<br>
				** 공용으로 과금형 휴대용충전기를 사용할 수 있는 전용콘센트 설치비는 40만원/개, 최대 5개 까지 지원,<br>
				&nbsp;&nbsp;무선인식표지(과금형 휴대용 충전기용 RFID Tag등)는 1.5만원/개, 최대 100개 까지 지원<br><br> -->
		    	※ 비공용 완속충전기에 대한 보조사업은 19년까지만 시행(20년부터 보조금 미지원)<br>
		    	※ 충전기 비용중 정부지원금을 초과하는 부분은 이용자 부담
	   		</div>
	    	<div class="modal-footer">
	       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	    	</div>
		 </div>
	</div>
</div>
</t:genericpage>
