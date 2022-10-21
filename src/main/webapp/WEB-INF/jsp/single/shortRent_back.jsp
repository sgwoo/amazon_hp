<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
	<h2>
		아마존카 단기 렌트 요금표<br/>
		<small>단기렌트는 아마존카 기존 고객에게만 제공됩니다</small>
	</h2>
	<br/>
	<span>[2015년 01월 01일] 전차종 A/T(자동변속기) 차량 기준 요금입니다.(※부가세 별도)</span>
	<table class="table table-bordered desc-table">
		<colgroup>
			<col width="10%"/>
			<col width="5%"/>
			<col width="10%"/>
			<col width="25%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="4">이용 차량</th>
				<th colspan="5">대여 기간 별 일일 요금</th>
			</tr>
			<tr>
				<th colspan="2">구분</th>
				<th>기준 차량</th>
				<th>추가 해당 차종</th>
				<th>12시간</th>
				<th>1~2일</th>
				<th>3~4일</th>
				<th>5~6일</th>
				<th>7일 이상</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td rowspan="3">소형<br/>(Compact)</td>
				<td>C1</td>
				<td>모닝</td>
				<td>레이, 스파크, 마티즈</td>
				<td class="text-right">71,000</td>
				<td class="text-right">89,000</td>
				<td class="text-right">80,000</td>
				<td class="text-right">76,000</td>
				<td class="text-right">71,000</td>
			</tr>
			<tr>
				<td>C2</td>
				<td>액센트</td>
				<td>프라이드, 아베오, 베르나</td>
				<td class="text-right">75,000</td>
				<td class="text-right">94,000</td>
				<td class="text-right">85,000</td>
				<td class="text-right">80,000</td>
				<td class="text-right">75,000</td>
			</tr>
			<tr>
				<td>C3</td>
				<td>아반떼</td>
				<td>K3, SM3, 크루즈, i30, 포르테, 쏘울, 라세티</td>
				<td class="text-right">82,000</td>
				<td class="text-right">103,000</td>
				<td class="text-right">93,000</td>
				<td class="text-right">88,000</td>
				<td class="text-right">82,000</td>
			</tr>
			<tr>
				<td rowspan="3">중형<br/>(Intermediate)</td>
				<td>I1</td>
				<td>NF쏘나타</td>
				<td>로체, 토스카, SM5</td>
				<td class="text-right">112,000</td>
				<td class="text-right">140,000</td>
				<td class="text-right">126,000</td>
				<td class="text-right">119,000</td>
				<td class="text-right">112,000</td>
			</tr>
			<tr>
				<td>I2</td>
				<td>YF쏘나타</td>
				<td>K5, 신형SM5(L43), 말리부</td>
				<td class="text-right">124,000</td>
				<td class="text-right">155,000</td>
				<td class="text-right">140,000</td>
				<td class="text-right">132,000</td>
				<td class="text-right">124,000</td>
			</tr>
			<tr>
				<td>I3</td>
				<td>LF쏘나타</td>
				<td>i40</td>
				<td class="text-right">131,000</td>
				<td class="text-right">164,000</td>
				<td class="text-right">148,000</td>
				<td class="text-right">139,000</td>
				<td class="text-right">131,000</td>
			</tr>
			<tr>
				<td rowspan="9">고급형<br/>(Premium, Luxury)</td>
				<td>P1</td>
				<td>그랜저HG 2.4</td>
				<td>K7 2.4, SM7 2.3/2.5, 알페온 2.4, 그랜저TG 2.4/2.7, YF쏘나타 2.4, K5 2.4</td>
				<td class="text-right">200,000</td>
				<td class="text-right">250,000</td>
				<td class="text-right">225,000</td>
				<td class="text-right">213,000</td>
				<td class="text-right">200,000</td>
			</tr>
			<tr>
				<td>P2</td>
				<td>그랜저HG 3.0</td>
				<td>그랜저HG 디젤, K7 2.7/3.0, SM7 3.5, 알페온3.0, 그랜저TG 3.3, 오피러스 2.7</td>
				<td class="text-right">224,000</td>
				<td class="text-right">280,000</td>
				<td class="text-right">252,000</td>
				<td class="text-right">238,000</td>
				<td class="text-right">224,000</td>
			</tr>
			<tr>
				<td>P3</td>
				<td>체어맨H 2.8</td>
				<td>아슬란 3.0, 그랜저HG 3.3, K7 3.3/3.5, 오피러스 3.3</td>
				<td class="text-right">247,000</td>
				<td class="text-right">309,000</td>
				<td class="text-right">278,000</td>
				<td class="text-right">263,000</td>
				<td class="text-right">247,000</td>
			</tr>
			<tr>
				<td>P4</td>
				<td>체어맨H 3.2</td>
				<td>아슬란 3.3</td>
				<td class="text-right">282,000</td>
				<td class="text-right">353,000</td>
				<td class="text-right">318,000</td>
				<td class="text-right">300,000</td>
				<td class="text-right">282,000</td>
			</tr>
			<tr>
				<td>P5</td>
				<td>제네시스 3.3</td>
				<td></td>
				<td class="text-right">299,000</td>
				<td class="text-right">374,000</td>
				<td class="text-right">337,000</td>
				<td class="text-right">318,000</td>
				<td class="text-right">299,000</td>
			</tr>
			<tr>
				<td>P6</td>
				<td>제네시스 3.8</td>
				<td>K9 3.3, 체어맨W 3.2</td>
				<td class="text-right">318,000</td>
				<td class="text-right">398,000</td>
				<td class="text-right">358,000</td>
				<td class="text-right">338,000</td>
				<td class="text-right">318,000</td>
			</tr>
			<tr>
				<td>P7</td>
				<td>에쿠스 3.8</td>
				<td>K9 3.8, 체어맨W 3.6</td>
				<td class="text-right">335,000</td>
				<td class="text-right">419,000</td>
				<td class="text-right">377,000</td>
				<td class="text-right">356,000</td>
				<td class="text-right">335,000</td>
			</tr>
			<tr>
				<td>P8</td>
				<td>에쿠스 5.0</td>
				<td>에쿠스 4.6, 에쿠스 리무진</td>
				<td class="text-right">412,000</td>
				<td class="text-right">515,000</td>
				<td class="text-right">464,000</td>
				<td class="text-right">438,000</td>
				<td class="text-right">412,000</td>
			</tr>
			<tr>
				<td>P9</td>
				<td>벤츠 S클래스</td>
				<td>BMW 7시리즈, 아우디 A8</td>
				<td class="text-right">524,000</td>
				<td class="text-right">655,000</td>
				<td class="text-right">590,000</td>
				<td class="text-right">557,000</td>
				<td class="text-right">524,000</td>
			</tr>
			<tr>
				<td rowspan="8">RV<br/>(Recreational Vehicle)</td>
				<td>R1</td>
				<td>카렌스</td>
				<td>티볼리</td>
				<td class="text-right">128,000</td>
				<td class="text-right">160,000</td>
				<td class="text-right">144,000</td>
				<td class="text-right">136,000</td>
				<td class="text-right">128,000</td>
			</tr>
			<tr>
				<td>R2</td>
				<td>투싼</td>
				<td>스포티지, QM3, 코란도, 올란도, 트랙스</td>
				<td class="text-right">135,000</td>
				<td class="text-right">169,000</td>
				<td class="text-right">152,000</td>
				<td class="text-right">144,000</td>
				<td class="text-right">135,000</td>
			</tr>
			<tr>
				<td>R3</td>
				<td>싼타페CM</td>
				<td>쏘렌토, QM5, 캡티바, 렉스턴</td>
				<td class="text-right">150,000</td>
				<td class="text-right">187,000</td>
				<td class="text-right">168,000</td>
				<td class="text-right">159,000</td>
				<td class="text-right">150,000</td>
			</tr>
			<tr>
				<td>R4</td>
				<td>싼타페DM</td>
				<td>올뉴쏘렌토</td>
				<td class="text-right">165,000</td>
				<td class="text-right">206,000</td>
				<td class="text-right">185,000</td>
				<td class="text-right">175,000</td>
				<td class="text-right">165,000</td>
			</tr>
			<tr>
				<td>R5</td>
				<td>맥스크루즈</td>
				<td></td>
				<td class="text-right">194,000</td>
				<td class="text-right">243,000</td>
				<td class="text-right">219,000</td>
				<td class="text-right">207,000</td>
				<td class="text-right">194,000</td>
			</tr>
			<tr>
				<td>R6</td>
				<td>베라크루즈</td>
				<td>모하비</td>
				<td class="text-right">255,000</td>
				<td class="text-right">319,000</td>
				<td class="text-right">287,000</td>
				<td class="text-right">271,000</td>
				<td class="text-right">255,000</td>
			</tr>
			<tr>
				<td>R7</td>
				<td>아우디 Q5</td>
				<td></td>
				<td class="text-right">337,000</td>
				<td class="text-right">421,000</td>
				<td class="text-right">379,000</td>
				<td class="text-right">358,000</td>
				<td class="text-right">337,000</td>
			</tr>
			<tr>
				<td>R8</td>
				<td>BMW X5</td>
				<td></td>
				<td class="text-right">412,000</td>
				<td class="text-right">515,000</td>
				<td class="text-right">464,000</td>
				<td class="text-right">438,000</td>
				<td class="text-right">412,000</td>
			</tr>
			<tr>
				<td rowspan="5">승합<br/>(Minibus)</td>
				<td>B1</td>
				<td>그랜드 스타렉스 11/12인승</td>
				<td></td>
				<td class="text-right">165,000</td>
				<td class="text-right">206,000</td>
				<td class="text-right">185,000</td>
				<td class="text-right">175,000</td>
				<td class="text-right">165,000</td>
			</tr>
			<tr>
				<td>B2</td>
				<td>뉴카니발 9인승</td>
				<td>로디우스 9인승</td>
				<td class="text-right">202,000</td>
				<td class="text-right">253,000</td>
				<td class="text-right">228,000</td>
				<td class="text-right">215,000</td>
				<td class="text-right">202,000</td>
			</tr>
			<tr>
				<td>B3</td>
				<td>그랜드카니발 11인승</td>
				<td>코란도투리스모</td>
				<td class="text-right">225,000</td>
				<td class="text-right">281,000</td>
				<td class="text-right">253,000</td>
				<td class="text-right">239,000</td>
				<td class="text-right">225,000</td>
			</tr>
			<tr>
				<td>B4</td>
				<td>올뉴카니발</td>
				<td>카니발 9인승 리무진</td>
				<td class="text-right">240,000</td>
				<td class="text-right">300,000</td>
				<td class="text-right">270,000</td>
				<td class="text-right">255,000</td>
				<td class="text-right">240,000</td>
			</tr>
			<tr>
				<td>B5</td>
				<td>그랜드카니발 하이리무진</td>
				<td>올뉴카니발 하이리무진, 코란도투리스모 리무진</td>
				<td class="text-right">277,000</td>
				<td class="text-right">346,000</td>
				<td class="text-right">311,000</td>
				<td class="text-right">294,000</td>
				<td class="text-right">277,000</td>
			</tr>
			<tr>
				<th colspan="4">일반 자차보험(면책금 30만원) 가입비용</th>
				<td colspan="5">대여요금의 10%</td>
			</tr>
			<tr>
				<th colspan="4">수퍼 자차보험(면책금 5만원) 가입비용</th>
				<td colspan="5">대여요금의 13%</td>
			</tr>
			<tr>
				<th colspan="4">연장이용시 추가 대여요금<br/>(연장이용은 아마존카의 사전동의하에 가능)</th>
				<td colspan="5">추가로 이용하는 날짜 X 원계약시 계약기간별 1일 대여요금</td>
			</tr>
		</tbody>
	</table>
</t:genericpage>