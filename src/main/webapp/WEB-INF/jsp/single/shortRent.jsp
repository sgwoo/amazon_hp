<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<style type="text/css">
.table > tbody > tr > td {
	vertical-align: middle !important;
}
</style>
	<h2>
		아마존카 단기 렌트 요금표<br/>
		<small>단기렌트는 아마존카 기존 고객에게만 제공됩니다</small>
	</h2>
	<br/>
<!-- 	<span>[2019년 07월 09일] 전차종 A/T(자동변속기) 차량 기준 요금입니다.(※부가세 별도)</span> -->
	<div style="display:flex; justify-content: space-between;">
		<span>[2021년 10월 27일] 전차종 A/T(자동변속기) 차량 기준 요금입니다.</span>
		<span>[부가세 별도]</span>
	</div>
	<table class="table table-bordered desc-table">
		<colgroup>
			<col width="10%"/>
			<col width="5%"/>
			<col width="15%"/>
			<col width="25%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
			<col width="8%"/>
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
				<td rowspan="5" style="text-align: center;">소형<br/>(Compact)</td>
				<td>C1</td>
				<td>모닝</td>
				<td>레이, 스파크</td>
				<td class="text-right">76,000</td>
				<td class="text-right">95,000</td>
				<td class="text-right">86,000</td>
				<td class="text-right">81,000</td>
				<td class="text-right">76,000</td>
			</tr>
			<tr>
				<td>C2</td>
				<td>엑센트</td>
				<td>프라이드, 아베오</td>
				<td class="text-right">80,000</td>
				<td class="text-right">100,000</td>
				<td class="text-right">90,000</td>
				<td class="text-right">85,000</td>
				<td class="text-right">80,000</td>
			</tr>
			<tr>
				<td>C3</td>
				<td>아반떼</td>
				<td>K3, SM3, 클리오, 크루즈, i30</td>
				<td class="text-right">87,000</td>
				<td class="text-right">109,000</td>
				<td class="text-right">98,000</td>
				<td class="text-right">93,000</td>
				<td class="text-right">87,000</td>
			</tr>
			<tr>
				<td>C4</td>
				<td>아이오닉 하이브리드</td>
				<td>아반떼 하이브리드</td>
				<td class="text-right">94,000</td>
				<td class="text-right">118,000</td>
				<td class="text-right">106,000</td>
				<td class="text-right">100,000</td>
				<td class="text-right">94,000</td>
			</tr>
			<tr>
				<td>C5</td>
				<td>아이오닉 일렉트릭(전기차)</td>
				<td>볼트EV, 조에(전기차)</td>
				<td class="text-right">116,000</td>
				<td class="text-right">145,000</td>
				<td class="text-right">131,000</td>
				<td class="text-right">123,000</td>
				<td class="text-right">116,000</td>
			</tr>
			<tr>
				<td rowspan="3" style="text-align: center;">중형<br/>(Intermediate)</td>
				<td>I1</td>
				<td>쏘나타 1.6 터보</td>
				<td>K5 1.6 터보, 말리부 1.5 터보</td>
				<td class="text-right">136,000</td>
				<td class="text-right">170,000</td>
				<td class="text-right">153,000</td>
				<td class="text-right">145,000</td>
				<td class="text-right">136,000</td>
			</tr>
			<tr>
				<td>I2</td>
				<td>쏘나타 2.0</td>
				<td>K5 2.0, SM6 2.0, 말리부 2.0, i40 2.0</td>
				<td class="text-right">136,000</td>
				<td class="text-right">170,000</td>
				<td class="text-right">153,000</td>
				<td class="text-right">145,000</td>
				<td class="text-right">136,000</td>
			</tr>
			<tr>
				<td>I3</td>
				<td>쏘나타 2.0 하이브리드</td>
				<td>K5 2.0 하이브리드</td>
				<td class="text-right">158,000</td>
				<td class="text-right">198,000</td>
				<td class="text-right">178,000</td>
				<td class="text-right">168,000</td>
				<td class="text-right">158,000</td>
			</tr>
			<tr>
				<td rowspan="20" style="text-align: center;">고급형<br/>(Premium, Luxury)</td>
				<td>P1</td>
				<td>그랜저HG 2.4</td>
				<td>그랜저HG 2.2 디젤, K7 2.4, K7 2.2디젤</td>
				<td class="text-right">202,000</td>
				<td class="text-right">253,000</td>
				<td class="text-right">228,000</td>
				<td class="text-right">215,000</td>
				<td class="text-right">202,000</td>
			</tr>
			<tr>
				<td>P2</td>
				<td>그랜저HG 3.0</td>
				<td>K7 2.7, K7 3.0</td>
				<td class="text-right">222,000</td>
				<td class="text-right">277,000</td>
				<td class="text-right">249,000</td>
				<td class="text-right">235,000</td>
				<td class="text-right">222,000</td>
			</tr>
			<tr>
				<td>P3</td>
				<td>그랜저HG 3.3</td>
				<td>K7 3.3</td>
				<td class="text-right">226,000</td>
				<td class="text-right">282,000</td>
				<td class="text-right">254,000</td>
				<td class="text-right">240,000</td>
				<td class="text-right">226,000</td>
			</tr>
			<tr>
				<td>P4</td>
				<td>그랜저IG 2.4</td>
				<td>그랜저IG 2.2 디젤, All New K7 2.4, All New K7 2.2 디젤</td>
				<td class="text-right">222,000</td>
				<td class="text-right">277,000</td>
				<td class="text-right">249,000</td>
				<td class="text-right">235,000</td>
				<td class="text-right">222,000</td>
			</tr>
			<tr>
				<td>P5</td>
				<td>그랜저IG 2.5</td>
				<td>K7 2.5, K8 2.5</td>
				<td class="text-right">226,000</td>
				<td class="text-right">283,000</td>
				<td class="text-right">255,000</td>
				<td class="text-right">241,000</td>
				<td class="text-right">226,000</td>
			</tr>
			<tr>
				<td>P6</td>
				<td>그랜저 2.4 하이브리드</td>
				<td>K7 2.4 하이브리드</td>
				<td class="text-right">234,000</td>
				<td class="text-right">292,000</td>
				<td class="text-right">263,000</td>
				<td class="text-right">248,000</td>
				<td class="text-right">234,000</td>
			</tr>
			<tr>
				<td>P7</td>
				<td>K8 1.6 터보 하이브리드</td>
				<td></td>
				<td class="text-right">234,000</td>
				<td class="text-right">292,000</td>
				<td class="text-right">263,000</td>
				<td class="text-right">248,000</td>
				<td class="text-right">234,000</td>
			</tr>
			<tr>
				<td>P8</td>
				<td>그랜저IG 3.0</td>
				<td>All New K7 3.0</td>
				<td class="text-right">243,000</td>
				<td class="text-right">304,000</td>
				<td class="text-right">274,000</td>
				<td class="text-right">258,000</td>
				<td class="text-right">243,000</td>
			</tr>
			<tr>
				<td>P9</td>
				<td>그랜저IG 3.3</td>
				<td>K8 3.5, All New K7 3.3</td>
				<td class="text-right">247,000</td>
				<td class="text-right">309,000</td>
				<td class="text-right">278,000</td>
				<td class="text-right">263,000</td>
				<td class="text-right">247,000</td>
			</tr>
			<tr>
				<td>P10</td>
				<td>제네시스 G70 2.0 터보</td>
				<td>제네시스 G70 2.2 디젤, 스팅어 2.0 터보, 스팅어 2.2 디젤, 스팅어 2.5 터보</td>
				<td class="text-right">254,000</td>
				<td class="text-right">318,000</td>
				<td class="text-right">286,000</td>
				<td class="text-right">270,000</td>
				<td class="text-right">254,000</td>
			</tr>
			<tr>
				<td>P11</td>
				<td>제네시스 G70 3.3 터보</td>
				<td>스팅어 3.3 터보</td>
				<td class="text-right">292,000</td>
				<td class="text-right">365,000</td>
				<td class="text-right">329,000</td>
				<td class="text-right">310,000</td>
				<td class="text-right">292,000</td>
			</tr>
			<tr>
				<td>P12</td>
				<td>제네시스 DH 3.3</td>
				<td></td>
				<td class="text-right">296,000</td>
				<td class="text-right">370,000</td>
				<td class="text-right">333,000</td>
				<td class="text-right">315,000</td>
				<td class="text-right">296,000</td>
			</tr>
			<tr>
				<td>P13</td>
				<td>제네시스 DH 3.8</td>
				<td></td>
				<td class="text-right">328,000</td>
				<td class="text-right">410,000</td>
				<td class="text-right">369,000</td>
				<td class="text-right">349,000</td>
				<td class="text-right">328,000</td>
			</tr>
			<tr>
				<td>P14</td>
				<td>제네시스 G80 3.3</td>
				<td>K9 3.3(~2018.03)</td>
				<td class="text-right">319,000</td>
				<td class="text-right">399,000</td>
				<td class="text-right">359,000</td>
				<td class="text-right">339,000</td>
				<td class="text-right">319,000</td>
			</tr>
			<tr>
				<td>P15</td>
				<td>제네시스 G80 3.8</td>
				<td>G80 3.3 터보, K9 3.8(~2018.03)</td>
				<td class="text-right">358,000</td>
				<td class="text-right">447,000</td>
				<td class="text-right">402,000</td>
				<td class="text-right">380,000</td>
				<td class="text-right">358,000</td>
			</tr>
			<tr>
				<td>P16</td>
				<td>제네시스 G80 2.5 터보(RG3)</td>
				<td>G80 2.2 디젤(RG3)</td>
				<td class="text-right">319,000</td>
				<td class="text-right">399,000</td>
				<td class="text-right">359,000</td>
				<td class="text-right">339,000</td>
				<td class="text-right">319,000</td>
			</tr>
			<tr>
				<td>P17</td>
				<td>제네시스 G80 3.5 터보(RG3)</td>
				<td>K9 3.8(2018.04~), K9 3.3 터보(2018.04~)</td>
				<td class="text-right">358,000</td>
				<td class="text-right">447,000</td>
				<td class="text-right">402,000</td>
				<td class="text-right">380,000</td>
				<td class="text-right">358,000</td>
			</tr>
			<tr>
				<td>P18</td>
				<td>제네시스 일렉트리파이드 G80(RG3)</td>
				<td></td>
				<td class="text-right">360,000</td>
				<td class="text-right">450,000</td>
				<td class="text-right">405,000</td>
				<td class="text-right">383,000</td>
				<td class="text-right">360,000</td>
			</tr>
			<tr>
				<td>P19</td>
				<td>제네시스 G90 3.8</td>
				<td>EQ900 3.8, EQ900 3.3 터보, 제네시스 G90 3.3 터보, K9 5.0</td>
				<td class="text-right">383,000</td>
				<td class="text-right">479,000</td>
				<td class="text-right">431,000</td>
				<td class="text-right">407,000</td>
				<td class="text-right">383,000</td>
			</tr>
			<tr>
				<td>P20</td>
				<td>제네시스 G90 5.0</td>
				<td>EQ900 5.0</td>
				<td class="text-right">468,000</td>
				<td class="text-right">585,000</td>
				<td class="text-right">527,000</td>
				<td class="text-right">497,000</td>
				<td class="text-right">468,000</td>
			</tr>
			<tr>
				<td rowspan="10" style="text-align: center;">RV<br/>(Recreational Vehicle)</td>
				<td>R1</td>
				<td>캐스퍼</td>
				<td></td>
				<td class="text-right">112,000</td>
				<td class="text-right">140,000</td>
				<td class="text-right">126,000</td>
				<td class="text-right">119,000</td>
				<td class="text-right">112,000</td>
			</tr>
			<tr>
				<td>R2</td>
				<td>코나</td>
				<td>베뉴, 스토닉, 카렌스, 쏘울, 니로, 셀토스, QM3, 캡처, XM3, 티볼리, 코란도, 올란도, 트랙스, 트레일블레이저</td>
				<td class="text-right">144,000</td>
				<td class="text-right">180,000</td>
				<td class="text-right">162,000</td>
				<td class="text-right">153,000</td>
				<td class="text-right">144,000</td>
			</tr>
			<tr>
				<td>R3</td>
				<td>아이오닉5(전기차)</td>
				<td>EV6, 코나 일렉트릭, 니로 EV, 쏘울 EV, 볼트 EUV</td>
				<td class="text-right">154,000</td>
				<td class="text-right">193,000</td>
				<td class="text-right">174,000</td>
				<td class="text-right">164,000</td>
				<td class="text-right">154,000</td>
			</tr>
			<tr>
				<td>R4</td>
				<td>투싼</td>
				<td>스포티지</td>
				<td class="text-right">162,000</td>
				<td class="text-right">202,000</td>
				<td class="text-right">182,000</td>
				<td class="text-right">172,000</td>
				<td class="text-right">162,000</td>
			</tr>
			<tr>
				<td>R5</td>
				<td>QM5</td>
				<td>캡티바</td>
				<td class="text-right">163,000</td>
				<td class="text-right">204,000</td>
				<td class="text-right">184,000</td>
				<td class="text-right">173,000</td>
				<td class="text-right">163,000</td>
			</tr>
			<tr>
				<td>R6</td>
				<td>넥쏘(수소차)</td>
				<td></td>
				<td class="text-right">176,000</td>
				<td class="text-right">220,000</td>
				<td class="text-right">198,000</td>
				<td class="text-right">187,000</td>
				<td class="text-right">176,000</td>
			</tr>
			<tr>
				<td>R7</td>
				<td>싼타페</td>
				<td>쏘렌토, QM6, 맥스크루즈, 이쿼녹스</td>
				<td class="text-right">194,000</td>
				<td class="text-right">242,000</td>
				<td class="text-right">218,000</td>
				<td class="text-right">206,000</td>
				<td class="text-right">194,000</td>
			</tr>
			<tr>
				<td>R8</td>
				<td>팰리세이드</td>
				<td>G4 렉스턴, GV60</td>
				<td class="text-right">276,000</td>
				<td class="text-right">345,000</td>
				<td class="text-right">311,000</td>
				<td class="text-right">293,000</td>
				<td class="text-right">276,000</td>
			</tr>
			<tr>
				<td>R9</td>
				<td>GV70</td>
				<td>모하비, 트래버스</td>
				<td class="text-right">319,000</td>
				<td class="text-right">399,000</td>
				<td class="text-right">359,000</td>
				<td class="text-right">339,000</td>
				<td class="text-right">319,000</td>
			</tr>
			<tr>
				<td>R10</td>
				<td>GV80</td>
				<td></td>
				<td class="text-right">360,000</td>
				<td class="text-right">450,000</td>
				<td class="text-right">405,000</td>
				<td class="text-right">383,000</td>
				<td class="text-right">360,000</td>
			</tr>
			<tr>
				<td rowspan="8" style="text-align: center;">승합<br/>(Mini-bus)<br/>&<br/>MPV<br/>(multi-purpose vehicle)</td>
				<td>B1</td>
				<td>스타렉스 11/12인승</td>
				<td>코란도투리스모 11인승</td>
				<td class="text-right">176,000</td>
				<td class="text-right">220,000</td>
				<td class="text-right">198,000</td>
				<td class="text-right">187,000</td>
				<td class="text-right">176,000</td>
			</tr>
			<tr>
				<td>B2</td>
				<td>스타렉스 9인승</td>
				<td>코란도투리스모 9인승</td>
				<td class="text-right">192,000</td>
				<td class="text-right">240,000</td>
				<td class="text-right">216,000</td>
				<td class="text-right">204,000</td>
				<td class="text-right">192,000</td>
			</tr>
			<tr>
				<td>B3</td>
				<td>스타리아 투어러 11인승</td>
				<td></td>
				<td class="text-right">200,000</td>
				<td class="text-right">250,000</td>
				<td class="text-right">225,000</td>
				<td class="text-right">213,000</td>
				<td class="text-right">200,000</td>
			</tr>
			<tr>
				<td>B4</td>
				<td>스타리아 투어러 9인승</td>
				<td></td>
				<td class="text-right">207,000</td>
				<td class="text-right">259,000</td>
				<td class="text-right">233,000</td>
				<td class="text-right">220,000</td>
				<td class="text-right">207,000</td>
			</tr>
			<tr>
				<td>B5</td>
				<td>카니발 11인승</td>
				<td></td>
				<td class="text-right">210,000</td>
				<td class="text-right">263,000</td>
				<td class="text-right">237,000</td>
				<td class="text-right">224,000</td>
				<td class="text-right">210,000</td>
			</tr>
			<tr>
				<td>B6</td>
				<td>카니발 9인승</td>
				<td>스타리아 라운지 9인승</td>
				<td class="text-right">216,000</td>
				<td class="text-right">270,000</td>
				<td class="text-right">243,000</td>
				<td class="text-right">230,000</td>
				<td class="text-right">216,000</td>
			</tr>
			<tr>
				<td>B7</td>
				<td>카니발 7인승</td>
				<td>스타리아 라운지 7인승, 카니발 7인승 리무진</td>
				<td class="text-right">264,000</td>
				<td class="text-right">330,000</td>
				<td class="text-right">297,000</td>
				<td class="text-right">281,000</td>
				<td class="text-right">264,000</td>
			</tr>
			<tr>
				<td>B8</td>
				<td>카니발 하이리무진</td>
				<td></td>
				<td class="text-right">302,000</td>
				<td class="text-right">377,000</td>
				<td class="text-right">339,000</td>
				<td class="text-right">320,000</td>
				<td class="text-right">302,000</td>
			</tr>
			<tr>
				<td rowspan="14" style="text-align: center;">수입차<br/>(Imported car)</td>
				<td>IC1</td>
				<td>MINI 미니쿠퍼 1.5</td>
				<td>폭스바겐 폴로, 폭스바겐 제타, 폭스바겐 골프, 도요타 프리우스, 푸조 208, 푸조 308</td>
				<td class="text-right">240,000</td>
				<td class="text-right">300,000</td>
				<td class="text-right">270,000</td>
				<td class="text-right">255,000</td>
				<td class="text-right">240,000</td>
			</tr>
			<tr>
				<td>II1</td>
				<td>벤츠 A220</td>
				<td>BMW 118d, 아우디 A3, 폭스바겐 파사트, 폭스바겐 CC, 도요타 캠리 2.5, 도요타 아발론 2.5, 혼다 어코드 1.5 터보, 푸조 508, MINI 미니쿠퍼 2.0</td>
				<td class="text-right">282,000</td>
				<td class="text-right">352,000</td>
				<td class="text-right">317,000</td>
				<td class="text-right">299,000</td>
				<td class="text-right">282,000</td>
			</tr>
			<tr>
				<td>II2</td>
				<td>벤츠 C200</td>
				<td>벤츠 C200d, 벤츠 CLA 250, BMW 320d, BMW 320i, BMW 523d, BMW 520i, BMW 530i, 아우디 A5 스포트백, 아우디 A6, 볼보 S90, 렉서스 ES300h</td>
				<td class="text-right">336,000</td>
				<td class="text-right">420,000</td>
				<td class="text-right">378,000</td>
				<td class="text-right">357,000</td>
				<td class="text-right">336,000</td>
			</tr>
			<tr>
				<td>IP1</td>
				<td>벤츠 E300</td>
				<td>벤츠 E220d, 벤츠 E250, 벤츠 E350, BMW 520d, BMW 523d, BMW 520i, BMW 530i, 아우디 A5 스포트백,아우디 A6, 볼보 S90, 렉서스 ES300h</td>
				<td class="text-right">410,000</td>
				<td class="text-right">512,000</td>
				<td class="text-right">461,000</td>
				<td class="text-right">435,000</td>
				<td class="text-right">410,000</td>
			</tr>
			<tr>
				<td>IP2</td>
				<td>아우디 A7</td>
				<td>벤츠 CLS 300d, 벤츠 CLS 400d, 벤츠 CLS 450, BMW 630i GT, 모델S</td>
				<td class="text-right">476,000</td>
				<td class="text-right">595,000</td>
				<td class="text-right">536,000</td>
				<td class="text-right">506,000</td>
				<td class="text-right">476,000</td>
			</tr>
			<tr>
				<td>IP3</td>
				<td>벤츠 S350d</td>
				<td>벤츠 S400d, BMW 730d, BMW 730Ld, BMW 740i, BMW 740Li, 아우디 A8</td>
				<td class="text-right">583,000</td>
				<td class="text-right">729,000</td>
				<td class="text-right">656,000</td>
				<td class="text-right">620,000</td>
				<td class="text-right">583,000</td>
			</tr>
			<tr>
				<td>IP4</td>
				<td>벤츠 S500 Long</td>
				<td>벤츠 S560 Long, 벤츠 S580 Long, BMW 750 Li</td>
				<td class="text-right">688,000</td>
				<td class="text-right">860,000</td>
				<td class="text-right">774,000</td>
				<td class="text-right">731,000</td>
				<td class="text-right">688,000</td>
			</tr>
			<tr>
				<td>IR1</td>
				<td>도요타 라브4</td>
				<td>아우디 Q2 2.0, 폭스바겐 티록 2.0, 지프 레니게이드 1.6, 지프 레니게이드 2.4, 지프 컴패스 2.4, 혼다 CR-V 1.5, 푸조 2008 1.5, 푸조 3008 1.5 </td>
				<td class="text-right">272,000</td>
				<td class="text-right">340,000</td>
				<td class="text-right">306,000</td>
				<td class="text-right">289,000</td>
				<td class="text-right">272,000</td>
			</tr>
			<tr>
				<td>IR2</td>
				<td>BMW X1</td>
				<td>아우디 Q3 2.0, 폭스바겐 티구안 2.0, 렉서스 UX250h, 혼다 CR-V 2.0 하이브리드, 볼보 XC40, 푸조 5008 1.5</td>
				<td class="text-right">314,000</td>
				<td class="text-right">392,000</td>
				<td class="text-right">353,000</td>
				<td class="text-right">333,000</td>
				<td class="text-right">314,000</td>
			</tr>
			<tr>
				<td>IR3</td>
				<td>BMW X2</td>
				<td>벤츠 GLA 2.0, 벤츠 EQA, 렉서스 NX300h, 푸조 5008 2.0,포드 익스플로러 2.3</td>
				<td class="text-right">336,000</td>
				<td class="text-right">420,000</td>
				<td class="text-right">378,000</td>
				<td class="text-right">357,000</td>
				<td class="text-right">336,000</td>
			</tr>
			<tr>
				<td>IR4</td>
				<td>BMW X3</td>
				<td>BMW X4 2.0, 벤츠 GLC 2.0, 아우디 Q5 2.0, 랜드로버 레인지로버 이보크 2.0, 랜드로버 디스커버리 스포츠 2.0, 포드 익스플로러 3.0, 볼보 XC60, 테슬라 모델Y</td>
				<td class="text-right">410,000</td>
				<td class="text-right">512,000</td>
				<td class="text-right">461,000</td>
				<td class="text-right">435,000</td>
				<td class="text-right">410,000</td>
			</tr>
			<tr>
				<td>IR5</td>
				<td>벤츠 GLC 300 쿠페</td>
				<td>랜드로버 디스커버리, 포드 익스페디션 3.5, 링컨 에비에이터 3.0, 폭스바겐 투아렉 3.0, 볼보 XC90</td>
				<td class="text-right">470,000</td>
				<td class="text-right">587,000</td>
				<td class="text-right">528,000</td>
				<td class="text-right">499,000</td>
				<td class="text-right">470,000</td>
			</tr>
			<tr>
				<td>IR6</td>
				<td>BMW X5</td>
				<td>BMW X6 3.0, 벤츠 GLE, 아우디 Q7, 아우디 Q8, 랜드로버 레인지로버 벨라, 모델X</td>
				<td class="text-right">525,000</td>
				<td class="text-right">656,000</td>
				<td class="text-right">590,000</td>
				<td class="text-right">558,000</td>
				<td class="text-right">525,000</td>
			</tr>
			<tr>
				<td>IR7</td>
				<td>BMW X7</td>
				<td>벤츠 GLS</td>
				<td class="text-right">570,000</td>
				<td class="text-right">713,000</td>
				<td class="text-right">642,000</td>
				<td class="text-right">606,000</td>
				<td class="text-right">570,000</td>
			</tr>
			<tr>
				<th colspan="4">일반 자차보험(면책금 30만원) 가입비용</th>
				<td colspan="5" class="text-center">대여요금의 10%</td>
			</tr>
			<tr>
				<th colspan="4">수퍼 자차보험(면책금 5만원) 가입비용</th>
				<td colspan="5" class="text-center">대여요금의 13%</td>
			</tr>
			<tr>
				<th colspan="4">연장이용시 추가 대여요금<br/>(연장이용은 아마존카의 사전동의하에 가능)</th>
				<td colspan="5" class="text-center">추가로 이용하는 날짜 X 원계약시 계약기간별 1일 대여요금</td>
			</tr>
		</tbody>
	</table>
</t:genericpage>