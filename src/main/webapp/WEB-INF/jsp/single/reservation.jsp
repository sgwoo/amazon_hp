<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style>
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
    background-color: #5cb85c !important;
    color: #FFF !important;
}
.tab_size {
	width: 160px;
}
.row_tab {
	padding-top: 30px;
	padding-bottom: 20px;
}
.row_margin_left {
	margin-left: 0px !important;
}
.margin_left15 {
	margin-left: 15px !important;
}
.p_padding_top5 {
	padding-top: 5px;
}
.div_top_layout {
	background-color: #E6E6E6;
	height: 30px;
	border: 1px solid #b3b3b3;
	border-radius: 5px;
}
.div_top_layout2 {
	width: 150px !important;
	height: 30px;
	color: #4a4a4a;
	font-size: 13px;
	background-color: #E6E6E6;
	border: 1px solid #b3b3b3;
	border-radius: 5px;
}
.select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    font-family: inherit;
    background: url(/resources/images/button_arrow.png) no-repeat 95% 50%;
    background-color: #E6E6E6;
    border: 1px solid #b3b3b3;
    border-radius: 4px;
    padding: 5px;
    font-size: 13px;
    color: #4a4a4a;
    width: 150px;
    text-align: center;
  	text-align-last: center;
  	-moz-text-align-last: center;
}
.select::-ms-expand { 
	display: none;
}
option {
	background-color: #FFF;
}
.desc {
	 line-height: 25px;
}
</style>

<t:genericpage>
<script type="text/javascript">
$(document).ready(function(){
	
	var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);	
	$('.nav-tabs a[href="#' + param + '"]').tab('show');
	
});
</script>	
	<ul class="nav nav-tabs" role="tablist" id="tos">
	   <li role="presentation" id="elec" class="tab_size text-center"><a href="#electric_car" aria-controls="electric_car" role="tab" data-toggle="tab">전기차</a></li>
	   <li role="presentation" id="hydro" class="tab_size text-center"><a href="#hydro_car" aria-controls="hydro_car" role="tab" data-toggle="tab">수소차</a></li>
	</ul>
		
	<div class="tab-content" style="padding-top: 20px;">
		<!-- 전기차 -->
	    <div role="tabpanel" class="tab-pane active company-tab-panel" id="electric_car" style="margin:0 auto;">
			<h3 style="font-weight: bold;">전기차 구입혜택 갈수록 축소</h3>
			<h4 style="margin-bottom: 30px !important; font-weight: bold;">전기차로 결정하셨다면, 하루라도 빨리 예약할수록 이익입니다!!</h4>
			
			<div class="col-md-8 col-xs-8" style="font-size: 15px; padding: 0;">
				&#x025FC; 전기차 장기렌트 시에도 구입 시 지원되는 모든 혜택을 누릴 수 있습니다.<br><br>
				
				<!-- &#x025FC; 2020년 보급 목표 대수 대비 실등록차량 미달로 인하여 2021년 전기차 혜택은 크게 감소하지 않았으나,<br>
				&nbsp;&nbsp;&nbsp; 2021년 아이오닉5, 기아 CV, 테슬라 모델Y 등의 신모델 출시 효과에 힘입어 보급 목표를 달성한다면<br> 
				&nbsp;&nbsp;&nbsp; 2022년에는 전기차 혜택이 많이 줄어들 것으로 예상됩니다. -->
				
				<!-- &#x025FC; 전기차 차량 구매를 위한 보조금이 해마다 감소하고 있습니다.<br>
				&nbsp;&nbsp;&nbsp;- 니로EV 기준으로 전기차 국고보조금이 900만원(2019년)에서<br>
				&nbsp;&nbsp;&nbsp;- <font style="font-weight: bold;">2020년 820만원으로 감소</font><br>
				&nbsp;&nbsp;&nbsp;<font style="font-size: 13px;">※ 지자체 보조금이 서울시 기준 2018년 500만원 이었으나,</font><br>
				&nbsp;&nbsp;&nbsp;<font style="font-size: 13px;">2019년에는 450만원으로 감소</font><br><br>
				&#x025FC; <font style="font-weight: bold;">완속충전기 보조금 축소및 폐지</font><br>
				&nbsp;&nbsp;&nbsp;- 충전기 보조금이 2018년에는 고정형 충전기에는 150만원, 이동형에는 50만원이 지급<br>
				&nbsp;&nbsp;&nbsp;- 2019년에는 고정형 충전기에는 130만원, 이동형에는 40만원이 지급<br>
				&nbsp;&nbsp;&nbsp;- 2020년에는 비공용 완속충전기 보조금 폐지<br><br>
				&#x025FC; <font style="font-weight: bold;">개별소비세 감면</font>(교육세 및 부가세 포함)<br>
				&nbsp;&nbsp;&nbsp;- 2022년 12월 31일까지 최대 429만원 감면. 추후 개별소비세 감면 혜택 유지 미정<br><br>
				&#x025FC; 취득세 감면<br>
				&nbsp;&nbsp;&nbsp;- 2018년에는 최대 200만원까지 감면됐으나, <font style="font-weight: bold;">2019년에는 최대 140만원 감면으로 축소</font> -->
				<div class="col-md-12 col-xs-12" style="text-align: center; margin-top: 20px;">
					<a href="/single/reservation_step1">
						<button type="button" style="font-weight: 400; color: #FFF; background-color: #5cb85c; padding: 15px 55px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 30px;">사전예약 바로가기</button>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-4" style="text-align: center; font-size: 14px; /* margin-top: 80px; */">
				<div class="col-md-12 col-xs-12">
					<!-- <img src="/resources/images/kona.png" align="left"> -->
					<img src="/resources/images/ioniq5.png" align="left">
				</div>
				<div class="col-md-12 col-xs-12" style="margin-top: 10px; margin-left: 30px;">
					<!-- 현대 코나 일렉트릭 -->
					현대 아이오닉5
				</div>
				<!-- <img src="/resources/images/niro.png" align="left" hspace="10"> -->
			</div>
			
			<div class="col-md-12" style="display: flex; justify-content: space-between; padding-top: 10px; padding-bottom: 5px;">
			<font style="font-weight:bold; font-size: 16px">[연도별 전기차 혜택]</font>
			<font style="text-align: right;">단위: 만 원</font>
			</div>
			<table class="table desc-table table-bordered text-center" id="detailInfo" >
	    		<colgroup>
	    			<col width="13%"/>
	    			<col width="7%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="28%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th colspan="2">연도</th>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    			<th>2022</th>
	    			<th>비고</th>
	    		</tr>
	    		<tr>
	    			<th colspan="2">개별소비세 감면<br>(교육세 및 부가세 포함)</th>
	    			<td style="vertical-align: middle !important;">최대 286</td>
	    			<td style="vertical-align: middle !important;">최대 429</td>
	    			<td style="vertical-align: middle !important;">최대 429</td>
	    			<td style="vertical-align: middle !important;">최대 429</td>
	    			<td style="vertical-align: middle !important;">최대 429</td>
	    			<td style="vertical-align: middle !important;">최대 429</td>
	    			<td class="text-left" style="font-size:14px; vertical-align: middle !important;">
	    				개별소비세 감면혜택 규정은 일몰 규정으로, 2023년 감면적용 여부 및 감면 금액은 미정(조세특례제한법 제109조)
<!-- 	    				감면혜택 규정은 일몰 규정으로, 해당년도 이후 감면 적용 여부 및 감면금액은 미정(조세특례제한법 제109조, 지방세특례제한법 제66조 참고) -->
	    			</td>
	    		</tr>
	    		<tr>
	    			<th colspan="2">취득세 감면</th>
	    			<td>최대 200</td>
	    			<td>최대 200</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    			<td class="text-left" style="font-size:14px; vertical-align: middle !important;">
	    				2024년 말까지 동일 혜택 유지(지방세특례제한법 제66조)
	    			</td>
	    		</tr>
	    		<tr>
	    			<th rowspan="3">*구매보조금<br>(승용)</th>
	    			<th>국고</th>
	    			<td style="vertical-align: middle !important;">정액 1400</td>
	    			<td style="vertical-align: middle !important;">최대 1200</td>
	    			<td style="vertical-align: middle !important;">최대 900</td>
	    			<td style="vertical-align: middle !important;">최대 820</td>
	    			<td style="vertical-align: middle !important;">최대 800</td>
	    			<td style="vertical-align: middle !important;">최대 700</td>
	    			<td rowspan="3" class="text-left" style="font-size:14px;">
	    				* 국고보조금<br>
	    				2018년부터는 배터리용량과 주행거리에 따라 차등지급,<br>
	    				2020년부터는 연비와 주행거리에 따라 차등지급,<br>
	    				2021년부터는 연비와 주행거리와 차량가격(**)에 따라 차등지급<br><br>
	    				* 지자체보조금<br>
	    				2020년까지는 정액 지급<br>
	    				2021년부터는 연비와 주행거리와 차량가격(***)에 따라 차등지급<br>
	    				2022년부터 법인은 50%만 지급(****)
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>지자체<br>(서울)</th>
	    			<td style="vertical-align: middle !important;">정액 5500</td>
	    			<td style="vertical-align: middle !important;">정액 550</td>
	    			<td style="vertical-align: middle !important;">정액 500</td>
	    			<td style="vertical-align: middle !important;">정액 450</td>
	    			<td style="vertical-align: middle !important;">최대 400<br><small>(2월 공고 기준)</small></td>
	    			<td style="vertical-align: middle !important;">최대 200</td>
	    		</tr>
	    		<tr>
	    			<th>합계</th>
	    			<td style="vertical-align: middle !important;">정액 1950</td>
	    			<td style="vertical-align: middle !important;">최대 1700</td>
	    			<td style="vertical-align: middle !important;">최대 1350</td>
	    			<td style="vertical-align: middle !important;">최대 1270</td>
	    			<td style="vertical-align: middle !important;">최대 1200</td>
	    			<td style="vertical-align: middle !important;">최대 900</td>
	    		</tr>
	    		<tr>
	    			<th rowspan="3">*구매보조금<br>(소형화물)</th>
	    			<th>국고</th>
	    			<td>-</td>
	    			<td>정액 2000</td>
	    			<td>정액 1800</td>
	    			<td>정액 1800</td>
	    			<td>정액 1600</td>
	    			<td>최대 1400</td>
	    			<td rowspan="3" class="text-left"  style="vertical-align: middle !important; font-size:14px;">
	    				* 2021년에는 국고보조금과 지자체 보조금 모두 감소. 승용 보조금과 다르게, 연비와 주행거리 등에 따른 차등지급하지 않고 모든 차량 정액 지급<br>
	    				* 2022년에는 소형화물 전기차도 자동차의 성능(연비, 주행거리)을 고려하여 차등하고 최대 1,400만원 지원
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>지자체<br>(서울)</th>
	    			<td style="vertical-align: middle !important;">-</td>
	    			<td style="vertical-align: middle !important;">정액 1000</td>
	    			<td style="vertical-align: middle !important;">정액 900</td>
	    			<td style="vertical-align: middle !important;">정액 900</td>
	    			<td style="vertical-align: middle !important;">정액 700</td>
	    			<td style="vertical-align: middle !important;">최대 700</td>
	    		</tr>
	    		<tr>
	    			<th>합계<br>(서울)</th>
	    			<td style="vertical-align: middle !important;">-</td>
	    			<td style="vertical-align: middle !important;">정액 3000</td>
	    			<td style="vertical-align: middle !important;">정액 2700</td>
	    			<td style="vertical-align: middle !important;">정액 2700</td>
	    			<td style="vertical-align: middle !important;">정액 2300</td>
	    			<td style="vertical-align: middle !important;">최대 2100</td>
	    		</tr>
	    		<tr>
	    			<th rowspan="2">충전기 보조금</th>
	    			<th>비공용<br>고정형</th>
	    			<td style="vertical-align: middle !important;">정액 300</td>
	    			<td style="vertical-align: middle !important;">정액 150</td>
	    			<td style="vertical-align: middle !important;">정액 130</td>
	    			<td style="vertical-align: middle !important;">폐지</td>
	    			<td style="vertical-align: middle !important;">폐지</td>
	    			<td style="vertical-align: middle !important;">폐지</td>
	    			<td rowspan="2" class="text-left" style="vertical-align: middle !important; font-size:14px;">
	    				2019년까지 감소하다가 2020년부터는 비공용 충전기에 대한 보조금 폐지
	    			</td>
	    		</tr>
	    		<tr>
	    			<th>이동형</th>
	    			<td>정액 60</td>
	    			<td>정액 50</td>
	    			<td>정액 40</td>
	    			<td>폐지</td>
	    			<td>폐지</td>
	    			<td>폐지</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12" style="font-size: 14px; margin-bottom: 20px;">
	    		* 구매보조금(승용): 승용 차종에 해당하는 금액임. 초소형 차종에 대한 보조금은 별도로 규정되어 있음.<br>
	    		* 구매보조금(소형화물): 소형화물 차종(포터 일렉트릭, 봉고 EV 등)에 해당하는 금액임. 초소형, 경형, 특장 화물차종에 대한 보조금은 별도로 규정되어 있음.<br>
	    		** 2021년 가격구간별 보조금 차등: 6천만원 미만(전액), 6~9천만원 미만(50%), 9천만원 이상(0%)<br>
	    		<span style='margin-left: 17px;'>2022년 가격구간별 보조금 차등: 5.5천만원 미만(전액), 5.5~8.5천만원 미만(50%), 8.5천만원 이상(0%)</span><br>
	    		*** [해당 차량 국고보조금 / 국비 최대지원액(800만원)] x 지자체별 지원 단가<br>
	    		**** [해당 차량 국고보조금 / 국비 최대지원액(700만원)] x 지자체별 지원 단가 x 50%<br>
	    	</div>
			<!-- <h5 style="margin-bottom: 20px !important;">전기차 구입혜택 갈수록 축소</h5>
			<p class="desc">
				- 하루라도 빨리 구입할수록 이익!!<br>
				- 차량 구매보조금 축소: 전기차 보조금이 해마다 감소.<br>
				&nbsp;&nbsp;니로EV 기준으로 전기차 국고보조금이 2018년 1200만원에서 2019년 900만원으로 감소 예정.<br>
				&nbsp;&nbsp;이는 해마다 단계적으로 감소하며, 지자체 보조금도 국고보조금과 함께 해마다 감소 중.<br>
				- 완속충전기 보조금 축소및 폐지: 충전기 보조금이 현행 고정형 충전기에는 150만원, 이동형에는 50만원이 지급되고 있으나, 2019년에는 폐지 또는 대폭 축소될 것으로 예상 됨.<br>
				- 개별소비세 감면(교육세 및 부가세 포함): 2020년 12월 31일까지 최대 429만원 감면. 추후 개별소비세 감면 혜택 유지 여부는 미정.<br>
				- 취득세 감면: 2018년에는 최대 200만원까지 감면됐으나, 2019년에는 최대 140만원 감면으로 축소.<br><br>
			</p> -->
			
			<div class="col-md-12" style="padding-top: 10px; padding-bottom: 5px;">
				<font style="font-weight:bold; font-size: 16px">[연도별 전기차 보급 목표]</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="20%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th rowspan="2">차종</th>
	    			<th colspan="6">보급 목표</th>
	    		</tr>
	    		<tr>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    			<th>2022</th>
	    		</tr>
	    		<tr>
	    			<th>승용</th>
	    			<td>-</td>
	    			<td>20,000</td>
	    			<td>42,000</td>
	    			<td>65,000</td>
	    			<td>75,000</td>
	    			<td>164,500</td>
	    		</tr>
	    		<tr>
	    			<th>승합</th>
	    			<td>-</td>
	    			<td>150</td>
	    			<td>300</td>
	    			<td>650</td>
	    			<td>1,000</td>
	    			<td>2,000</td>
	    		</tr>
	    		<tr>
	    			<th>화물</th>
	    			<td>-</td>
	    			<td>-</td>
	    			<td>1,000</td>
	    			<td>13,000</td>
	    			<td>25,000</td>
	    			<td>41,000</td>
	    		</tr>
	    		<tr>
	    			<th>합계</th>
	    			<td>14,100</td>
	    			<td>20,150</td>
	    			<td>43,300</td>
	    			<td>78,650</td>
	    			<td>101,000</td>
	    			<td>207,500</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12 text-right" style="font-size: 14px; margin-bottom: 5px;">
	    		환경부 [환경친화적자동차 보급시행계획] 보도자료 참고
	    	</div>
	    	<div class="col-md-12" style="font-size: 14px; margin-bottom: 20px;">
	    		※ 상기 목표는 각 연도별 당해 보급 목표로서 실제 달성 목표와는 차이가 있을 수 있습니다.<br>
	    		<font style="font-size: 13px;">(각 연도 연초 기준 목표로서, 추경 예산 반영으로 조정되기도 함)</font>
	    	</div>
	    	
	    	<div class="col-md-12" style="padding-top: 10px; padding-bottom: 5px;">
				<font style="font-weight:bold; font-size: 16px">[연도별 전기차 등록대수 현황]</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="10%"/>
	    			<col width="10%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th rowspan="2" colspan='2'>차종</th>
	    			<th colspan="6">등록대수(연말 기준)</th>
	    		</tr>
	    		<tr>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>승용</th>
	    			<th>누적</th>
	    			<td>24,907</td>
	    			<td>55,417</td>
	    			<td>87,926</td>
	    			<td>117,616</td>
	    			<td>185,256</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+14,136</td>
	    			<td>+30,510</td>
	    			<td>+32,509</td>
	    			<td>+29,690</td>
	    			<td>+67,640</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>승합</th>
	    			<th>누적</th>
	    			<td>141</td>
	    			<td>279</td>
	    			<td>828</td>
	    			<td>1,837</td>
	    			<td>3,120</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+89</td>
	    			<td>+138</td>
	    			<td>+549</td>
	    			<td>+1,009</td>
	    			<td>+1,283</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>화물</th>
	    			<th>누적</th>
	    			<td>55</td>
	    			<td>53</td>
	    			<td>1,140</td>
	    			<td>15,436</td>
	    			<td>42,937</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+23</td>
	    			<td>-2</td>
	    			<td>+1,087</td>
	    			<td>+14,296</td>
	    			<td>+27,501</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>특수</th>
	    			<th>누적</th>
	    			<td>5</td>
	    			<td>7</td>
	    			<td>24</td>
	    			<td>73</td>
	    			<td>130</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+5</td>
	    			<td>+2</td>
	    			<td>+17</td>
	    			<td>+49</td>
	    			<td>+57</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>합계</th>
	    			<th>누적</th>
	    			<td>25,108</td>
	    			<td>55,756</td>
	    			<td>89,918</td>
	    			<td>134,962</td>
	    			<td>231,443</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+14,253</td>
	    			<td>+30,648</td>
	    			<td>+34,162</td>
	    			<td>+45,044</td>
	    			<td>+96,481</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12 text-right" style="font-size: 14px; margin-bottom: 5px;">
	    		국토교통부 통계누리, 환경부 보도자료 참고
	    	</div>
	    	<div class="col-md-12" style="font-size: 14px; margin-bottom: 20px;">
	    		※ 승용: 초소형 차량 포함<br>
	    		※ 승합: 초소형, 경형, 특장 차량 포함<br>
	    	</div>
			
			<div class="col-md-12 col-xs-12" style="text-align: center; margin-top: 20px;">
				<a href="/single/reservation_step1">
					<button type="button" style="font-weight: 400; color: #FFF; background-color: #5cb85c; padding: 15px 55px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 30px;">사전예약 바로가기</button>
				</a>
			</div>
			
			<div class="col-md-12 col-xs-12" style="padding-top: 50px; padding-left: 0px;">
				<div class="col-md-8 col-xs-8" style="padding-left: 0;">					
					전기차 뿐만 아니라 하이브리드 차량 등 친환경 차량에 대해서도 알아보세요.
				</div>
				
				<div class="col-md-4 col-xs-4" style="text-align: right;">
					<a href="/rent/green/desc#tab_green-compare1">
						<button type="button" style="font-weight: 400; color: #FFF; background-color: #777777; padding: 5px 30px; border-radius: 5px; border-style: none; font-size: 16px;">친환경차 더 알아보기</button>
					</a>
				</div>
			</div>
	    </div>
	    
	    <!-- 수소차 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="hydro_car" style="margin:0 auto;">
	    	<h3 style="margin-bottom: 30px !important; font-weight: bold;">최첨단 수소차 타고, 환경도 지키자!</h3>
	    	<!-- <h3 style="margin-bottom: 30px !important; font-weight: bold;">수소차 보급 확대 정책 본격 시행</h3> -->
			<!-- <div class="col-md-12 col-xs-12" style="margin-bottom: 30px !important;">
				<div style="border: 0.1px solid #CCC; width: 50%; text-align: center; margin: 0 auto;">
					<div style="padding: 30px; font-size: 18px; font-weight: bold;">
						<font style="color: #0079e0; font-weight: bold;">전기차로 결정하셨다면, <font style="color: red; font-weight: bold;">하루라도 빨리 예약 할수록 이익</font>입니다 !!</font>
					</div>
				</div>
			</div> -->
			<div class="col-md-7 col-xs-7" style="font-size: 15px; padding: 0;">
				<!-- &#x025FC; 2019년 수소차 보급 정부 목표 4000대!<br><br>
				&#x025FC; 2022년까지 전국에 수소 충전소 310곳 신설!<br><br>
				&#x025FC; <font style="font-weight: bold;">2019년 수소차 구매혜택</font><br>
				&nbsp;&nbsp;&nbsp;- 구매 보조금 3250만원~3600만원(지자체별로 상이)<br>
				&nbsp;&nbsp;&nbsp;- 개별소비세(교육세 및 부가세 포함) 감면 혜택 최대 572만원<br>
				&nbsp;&nbsp;&nbsp;- 취득세 감면 혜택 최대 140만원<br>
				&nbsp;&nbsp;&nbsp; <font style="font-weight: bold;">총 4,212만원</font><br><br>
				&#x025FC; 수소차 구입 혜택도 전기차 구입 혜택처럼 해마다 감소 예정이므로,<br>
				&nbsp;&nbsp;내년으로 미루지 말고 <font style="font-weight: bold;">올해 구입하는 것이 현명한 결정</font>입니다.<br><br> -->
				&#x025FC; 수소차 장기렌트 시에도 구입 시 지원되는 모든 혜택을 누릴 수 있습니다.<br><br>
				<!-- &#x025FC; 수소차 보조금은 아직 보급 초반이라서 높게 유지되고 있습니다.<br>
				&nbsp;&nbsp;&nbsp; <font style="font-size: 14px;">(2021년 전기차 최대 보조금 1200만원(서울), 수소차 최대 보조금 3350만원(서울))</font><br>
				&nbsp;&nbsp;&nbsp; 향후에는 수소차 보조금도 전기차 보조금과 마찬가지로 점차 감소될 것으로 예상됩니다.<br><br>
				&#x025FC; 보조금과 충전소 보급계획을 고려할 때, 2021년이 수소차 구매 적기로 판단됩니다. -->
			</div>
			<div class="col-md-5 col-xs-5" style="text-align: center; font-size: 14px;">
				<div class="col-md-12 col-xs-12">
					<img src="/resources/images/nexo.png" align="left" style="width: 420px; height: 240px;">
				</div>
				<div class="col-md-12 col-xs-12" style="margin-top: 10px;">
					현대 수소차 넥쏘
				</div>
			</div>
			
			<div class="col-md-12" style="display: flex; justify-content: space-between; padding-top: 10px; padding-bottom: 5px;">
			<font style="font-weight:bold; font-size: 16px">[연도별 수소차 혜택]</font>
			<font style="text-align: right;">단위: 만 원</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="15%"/>
	    			<col width="10%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th colspan="2">연도</th>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    			<th>2022</th>
	    		</tr>
	    		<tr>
	    			<th colspan="2">개별소비세감면<br>(교육세 및 부가세 포함)</th>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    			<td style="vertical-align: middle !important;">최대 572</td>
	    		</tr>
	    		<tr>
	    			<th colspan="2">취득세 감면</th>
	    			<td>최대 200</td>
	    			<td>최대 200</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    			<td>최대 140</td>
	    		</tr>
	    		<tr>
	    			<th rowspan="3">구매보조금</th>
	    			<th>국고</th>
	    			<td>정액 2750</td>
	    			<td>정액 2250</td>
	    			<td>정액 2250</td>
	    			<td>정액 2250</td>
	    			<td>정액 2250</td>
	    			<td>정액 2250</td>
	    		</tr>
	    		<tr>
	    			<th>지자체<br>(서울)</th>
	    			<td style="vertical-align: middle !important;">-</td>
	    			<td style="vertical-align: middle !important;">정액 1250</td>
	    			<td style="vertical-align: middle !important;">정액 1250</td>
	    			<td style="vertical-align: middle !important;">정액 1250</td>
	    			<td style="vertical-align: middle !important;">정액 1100</td>
	    			<td style="vertical-align: middle !important;">정액 1100</td>
	    		</tr>
	    		<tr>
	    			<th>합계<br>(서울)</th>
	    			<td style="vertical-align: middle !important;">-</td>
	    			<td style="vertical-align: middle !important;">정액 3500</td>
	    			<td style="vertical-align: middle !important;">정액 3500</td>
	    			<td style="vertical-align: middle !important;">정액 3500</td>
	    			<td style="vertical-align: middle !important;">정액 3350</td>
	    			<td style="vertical-align: middle !important;">정액 3350</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12" style="font-size: 14px; margin-bottom: 20px;">
	    		※ 감면혜택 규정은 일몰 규정으로, 해당년도 이후 감면적용 여부 및 감면금액은 미정.<br>
	    		<font style="font-size: 13px;">(개별소비세-조세특례제한법 제109조, 취득세-지방세특례제한법 제66조 참고)</font>
	    	</div>
	    	
	    	<div class="col-md-12" style="padding-top: 10px; padding-bottom: 5px;">
				<font style="font-weight:bold; font-size: 16px">[연도별 수소차 및 충전소 보급 목표]</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="20%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th rowspan="2">수소차 & 충전소</th>
	    			<th colspan="6">보급 목표</th>
	    		</tr>
	    		<tr>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    			<th>2022</th>
	    		</tr>
	    		<tr>
	    			<th>수소차</th>
	    			<td>130</td>
	    			<td>659</td>
	    			<td>4,000</td>
	    			<td>10,180</td>
	    			<td>15,185</td>
	    			<td>28,000</td>
	    		</tr>
	    		<tr>
	    			<th>충전소</th>
	    			<td>10</td>
	    			<td>10</td>
	    			<td>30</td>
	    			<td>27</td>
	    			<td>54</td>
	    			<td>200</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12 text-right" style="font-size: 14px; margin-bottom: 5px;">
	    		환경부 [환경친화적자동차 보급시행계획] 보도자료 참고
	    	</div>
	    	<div class="col-md-12" style="font-size: 14px; margin-bottom: 20px;">
	    		※ 상기 목표는 각 연도별 당해 보급 목표로서 실제 달성 목표와는 차이가 있을 수 있습니다.<br>
	    		<font style="font-size: 13px;">(각 연도 연초 기준 목표로서, 추경 예산 반영으로 조정되기도 함)</font>
	    	</div>
	    	
	    	<div class="col-md-12" style="padding-top: 10px; padding-bottom: 5px;">
				<font style="font-weight:bold; font-size: 16px">[연도별 수소차 등록대수 현황]</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="10%"/>
	    			<col width="10%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th rowspan="2" colspan='2'>차종</th>
	    			<th colspan="6">등록대수(연말 기준)</th>
	    		</tr>
	    		<tr>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>승용</th>
	    			<th>누적</th>
	    			<td>170</td>
	    			<td>891</td>
	    			<td>5,068</td>
	    			<td>10,831</td>
	    			<td>19,270</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+83</td>
	    			<td>+721</td>
	    			<td>+4,177</td>
	    			<td>+5,763</td>
	    			<td>+8,439</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>승합</th>
	    			<th>누적</th>
	    			<td></td>
	    			<td>2</td>
	    			<td>15</td>
	    			<td>75</td>
	    			<td>129</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td></td>
	    			<td>+2</td>
	    			<td>+13</td>
	    			<td>+60</td>
	    			<td>+54</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>화물</th>
	    			<th>누적</th>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td>5</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td></td>
	    			<td>+5</td>
	    		</tr>
	    		<tr>
	    			<th rowspan='2'>합계</th>
	    			<th>누적</th>
	    			<td>170</td>
	    			<td>893</td>
	    			<td>5,083</td>
	    			<td>10,906</td>
	    			<td>19,404</td>
	    		</tr>
	    		<tr>
	    			<th>전년대비</th>
	    			<td>+83</td>
	    			<td>+723</td>
	    			<td>+4,190</td>
	    			<td>+5,823</td>
	    			<td>+8,498</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12 text-right" style="font-size: 14px; margin-bottom: 5px;">
	    		국토교통부 통계누리, 환경부 보도자료 참고
	    	</div>
	    	
	    	<div class="col-md-12" style="padding-top: 10px; padding-bottom: 5px;">
				<font style="font-weight:bold; font-size: 16px">[연도별 수소차 충전소 보급 현황]</font>
			</div>
			<table class="table desc-table table-bordered text-center">
	    		<colgroup>
	    			<col width="20%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    			<col width="9%"/>
	    		</colgroup>
	    		<tr class="header">
	    			<th rowspan="3">수소 충전소 보급 현황</th>
	    			<th colspan="5">등록(누적)</th>
	    		</tr>
	    		<tr>
	    			<th>2017</th>
	    			<th>2018</th>
	    			<th>2019</th>
	    			<th>2020</th>
	    			<th>2021</th>
	    		</tr>
	    		<tr>
	    			<td>-</td>
	    			<td>10</td>
	    			<td>36</td>
	    			<td>63</td>
	    			<td>89</td>
	    		</tr>
	    	</table>
	    	<div class="col-md-12 text-right" style="font-size: 14px; margin-bottom: 5px;">
	    		환경부 보도자료 참고
	    	</div>
	    	
			<div class="col-md-12 col-xs-12" style="text-align: center; margin-top: 20px;">
				<a href="/single/reservation_step1">
					<button type="button" style="font-weight: 400; color: #FFF; background-color: #5cb85c; padding: 15px 55px; border-radius: 5px; border-style: none; font-size: 16px; margin-top: 30px;">사전예약 바로가기</button>
				</a>
			</div>
			
			<div class="col-md-12 col-xs-12" style="padding-top: 80px; padding-left: 0px;">
				<div class="col-md-8 col-xs-8" style="padding-left: 0px;">					
					수소차 뿐만 아니라 하이브리드 차량 등 친환경 차량에 대해서도 알아보세요.
				</div>
				
				<div class="col-md-4 col-xs-4" style="text-align: right;">
					<a href="/rent/green/desc#tab_green-compare1">
						<button type="button" style="font-weight: 400; color: #FFF; background-color: #777777; padding: 5px 30px; border-radius: 5px; border-style: none; font-size: 16px;">친환경차 더 알아보기</button>
					</a>
				</div>
			</div>
	    </div>	     
    </div>
	
</t:genericpage>