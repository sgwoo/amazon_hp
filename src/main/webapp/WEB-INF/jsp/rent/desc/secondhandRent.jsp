<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<script type="text/javascript"> 
$(document).ready(function(){

	// url 가져오기
	var url = location.href;
	
    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    
    // alert(parameters);
    var urlParamChk = parameters.indexOf("f=m");
    // alert(urlParamChk);
    
    if (urlParamChk =='0') {
    	$('.navbar-default').hide();
    	$('.footer').hide();
    } else {
    	$('.navbar-default').show();
    	$('.footer').show(); 
    }

});
</script>
<link href="<c:url value='/resources/stylesheets/rent.css'/>" rel="stylesheet" />
<div  class="detail-title">
	<h2>
		<!-- <a href="/rent/secondhand" class="back-arrow"> -->
		<a onclick="javascript:history.go(-1);" class="back-arrow" style="cursor: pointer;">
			<span class="icon-arrow_left"></span>
		</a>재렌트/재리스
	</h2>
</div>
<ul class="nav nav-tabs nav-justified amazon-desc-tab" role="tablist">
  <li role="presentation" class="active"><a href="#goods" aria-controls="goods" role="tab" data-toggle="tab">상품 안내</a></li>
  <li role="presentation"><a href="#feature" aria-controls="feature" role="tab" data-toggle="tab">아마존카 특징</a></li>
  <li role="presentation"><a href="#advantage" aria-controls="advantage" role="tab" data-toggle="tab">이용장점</a></li>
  <li role="presentation"><a href="#requirement" aria-controls="requirement" role="tab" data-toggle="tab">꼼꼼한 체크</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active amazon-desc" id="goods">
    		<h3>아마존카의 <span class="text-point">재렌트/재리스</span>는?</h3>
    		<p>
    			아마존카가 <span style="font-weight:bold;">국내에 최초로 소개</span>한 상품으로,기존 보유차량 중에서 고객이 원하는 차량을 일정기간 대여해드리는 서비스입니다.<br/>
    			아마존카의 재렌트 / 재리스 차량은 평균 차령 24개월 수준으로 차량관리 상태가 매우 우수합니다.
    		</p>
			<img style="border-radius:5px;" src="/resources/images/img_re-rent.png"/>
			<BR/><bR/>
			<table class="desc-table table-bordered">
				<colgroup>
					<col width="25%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<th>신차 이용과 비교</th>
					<td>
						15~40% 저렴한 대여료<br/>
						동일한 비용으로 한 등급 이상 높은 차량을 이용하는 효과
					</td>
				</tr>
				<tr>
					<th>다양한 이용기간</th>
					<td>
						장기렌트(6~48개월)<br/>
						리스 (12~48개월)
					</td>
				</tr>
			</table>      	  
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="feature">
		 <h3>아마존카 <span class="text-point">재렌트/재리스의 특징</span>은?</h3> 
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;믿을 수 있는 우수한 차량만을 제공합니다</h4>
		 <p>
		 	 신차등록 시부터 아마존카 소유의 차량으로 사고유무, 주행거리, 정비 등 관리이력을 공개하고 있기 때문에 믿고 이용하실 수 있습니다.
      	 </p>
		 
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;2개월 무상 보증수리제도가 적용됩니다</h4>
		<p>
			엔진, 변속기 : 2개월 / 5,000 Km 품질보증(기간 또는 주행거리 중 먼저 도래한 것을 보증기간 만료로 간주합니다) ※일반부품 및 소모성부품 제외
      	 </p>
      	
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;아마존케어 서비스를 제공합니다</h4>
		 <p>
		 	차량정비 관련 유선 상담서비스 상시 제공<br/>
			대여개시 2개월 이내 무상 정비대차 제공(24시간 이상 정비공장 입고 시)<br/>
			대여개시 2개월 이후 원가 수준의 유상 정비대차 제공(단기 대여요금의 15~30% 수준, 탁송료 별도)
      	 </p>
      	 
      	  <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;신용심사 기준의 문턱이 낮습니다</h4>
		 <p>
		 	획일화된 신용심사를 하지 않습니다.<br/>
			심사기준이 간결합니다.<br/>
			신설법인도 이용이 가능합니다.
      	 </p>
      	 
      	 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대여상품이 다양합니다</h4>
		 <p>
		 	재렌트/재리스를 이용하시더라도 대여서비스는 신차 장기렌트/리스와 동일합니다.<br/>
			정비서비스 포함 여부를 고객이 선택할 수 있습니다.
      	 </p>    
      	 <table class="desc-table table-bordered">
				<colgroup>
					<col width="33%"/>
					<col width="33%"/>
					<col width="33%"/>
				</colgroup>
				<tr>
					<th>구분</th>
					<th>아마존카</th>
					<th>타사</th>
				</tr>
				<tr>
					<th>장기렌트</th>
					<td class="text-center" colspan="2">금융권 전산상 대출로 잡히지 않음</td>
				</tr>
				<tr>
					<th>리스</th>					
					<td class="text-center">금융권 전산상 대출로 잡히지 않음</td>
					<td class="text-center">금융권 전산상 대출로 잡힘</td>
				</tr>
				<tr>
					<th>할부 구입</th>					
					<td class="text-center">상품 미운영</td>
					<td class="text-center">금융권 전산상 대출로 잡힘</td>
				</tr>
			</table>      	    	   	 
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="advantage">
    	<h3>아마존카 <span class="text-point">재렌트/재리스의 이용장점</span>은?</h3> 
	    <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대여료가 훨씬 저렴합니다</h4>
		<p>
			등록세, 취득세, 공채비용 등 초기 등록비용이 없습니다.
      	</p>
	    <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;감가상각 비용 절감 효과가 있습니다</h4>
		<img src="/resources/images/img_re_rent02.png"/><br/>
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;신차 vs 재렌트/재리스 월 대여료 비교</h4>
		2015년 9월 10일 홈페이지 견적 기준 (단위:원)
		<table class="desc-table table-bordered text-center">
			<tr>
				<th rowspan="2"></th>
				<th colspan="2">신차</th>
				<th colspan="2">아마존카 보유차</th>
			</tr>
			<tr>
				<th>장기렌트</th>
				<th>리스</th>
				<th>재렌트</th>
				<th>재리스</th>
			</tr>
			<tr>
				<th class="sub-title">차종</th>
				<td colspan="4">그랜저HG 300 Exclusive (가솔린 3.0 엔진)</td>
			</tr>
			<tr>
				<th class="sub-title">신차가격</th>
				<td colspan="2">34,870,000</td>
				<td colspan="2">34,630,000</td>
			</tr>
			<tr>
				<th class="sub-title">제조사 DC</th>
				<td colspan="2">-600,000</td>
				<td colspan="2">-</td>
			</tr>
			<tr>
				<th class="sub-title">차령</th>
				<td colspan="2">0개월</td>
				<td colspan="2">24개월</td>
			</tr>
			<tr>
				<th class="sub-title">운행거리</th>
				<td colspan="2">0 km</td>
				<td colspan="2">46,000 km</td>
			</tr>
			<tr>
				<th class="sub-title">감가상각</th>
				<td colspan="2">-</td>
				<td colspan="2">-13,230,000</td>
			</tr>
			<tr>
				<th class="sub-title">적용차가</th>
				<td colspan="2">34,270,000</td>
				<td colspan="2">21,400,000</td>
			</tr>
			<tr>
				<th class="sub-title">이용기간</th>
				<td colspan="2">36개월</td>
				<td colspan="2">36개월</td>
			</tr>
			<tr>
				<th class="sub-title">보증금</th>
				<td colspan="2">6,854,000 (20.0%)</td>
				<td colspan="2">5,350,000 (25.0%)</td>
			</tr>
			<tr>
				<th class="sub-title">자동차세/보험료</th>
				<td colspan="4">포함</td>
			</tr>
			<tr>
				<th>정비 서비스</th>
				<td colspan="4">미포함</td>
			</tr>
			<tr>
				<th>매입옵션</th>
				<td colspan="2">16,243,980</td>
				<td colspan="2">12,005,400</td>
			</tr>
			<tr>
				<th>월대여료(VAT포함)</th>
				<td>767,800</td>
				<td>851,400</td>
				<td>518,100</td>
				<td>570,900</td>
			</tr>
			<tr>
				<th rowspan="2">
				<td rowspan="2" colspan="2">
				<td class="primary-orange">-249,700</td>
				<td class="primary-orange">-280,500</td>
			</tr>
			<tr>
				<td class="primary-orange">-32.5%</td>
				<td class="primary-orange">-32.9%</td>
			</tr>
		</table>
		<br/>
		<!-- <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;리스 비용 전액 손비 처리로 절세 효과가 있습니다</h4><br/> -->
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;비용 손비 처리로 절세 효과가 있습니다</h4><br/>
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;중고차 할부 구입보다 경제적입니다</h4>
		<p>
			중고차 할부 구입 시 중고차 매매에 따라 발생하는 거래비용 및 중고차 이전등록 비용이 없고, 높은 이자율에 따른 이자부담도 없습니다.
		</p>
		<table class="desc-table table-bordered" style="width:50%;">
			<tr>
				<th colspan="2">중고차 할부 이자율</th>
			</tr>
			<tr>
				<th class="sub-title">개인</th>
				<td>7.5% ~ 18.4%</td>
			</tr>
			<tr>
				<th class="sub-title">법인</th>
				<td>14.9% ~ 19.9%</td>
			</tr>
			<tr>
				<th class="sub-title">아마존카 재렌트 이자율</th>
				<td>6.0%</td>
			</tr>
		</table>
		※2015-09-10 현대캐피탈 기준
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="requirement">
    	<h3><span class="text-point">재렌트/재리스</span>와 <span class="text-point">할부구입</span>을 비교하면?</h3>
    	<span class="icon-car"></span>&nbsp;<span style="line-height:30px;">이용차종: 그랜저HG 300 Exclusive (가솔린 3.0 엔진), 차령24개월, 운행거리 46,000km 기준</span>
    	<br/>
    	<table class="desc-table table-bordered" style="text-align:center;">
    		<colgroup>
    			<col width="20%"/>
    			<col width="15%"/>
    			<col width="15%"/>
    			<col width="20%"/>
    			<col width="15%"/>
    			<col width="15%"/>
    		</colgroup>
    		<tr>
    			<th rowspan="2">구분</th>
    			<th colspan="3">36개월 중고차 할부 구입</th>
    			<th colspan="2">아마존카 보유차 36개월 이용</th>
    		</tr>
    		<tr>
    			<th>총비용(36개월)</th>
    			<th colspan="2">산출기준</th>
    			<th>재렌트</th>
    			<th>재리스</th>
    		</tr>
    		<tr>
    			<th class="sub-title">차량가격</th>
    			<td></td>
    			<td>21,400,000원</td>
    			<td>아마존카 재리스 잔존가 기준,<br/>중고차 소매 가격 대비 10~15% 저렴</td>
    			<td colspan="2">
    				아마존카 재리스 잔존가로 보증금 25%(5,350,000원) 기준 견적 산출<br/>
    				(2015-09-10 아마존카 홈페이지 견적 기준)
    			</td>
    		</tr>
    		<tr>
    			<th class="sub-title">할부금</th>
    			<td>27,087,264원</td>
    			<td>752,424원/월</td>
    			<td>차량가 전액할부<br/>할부이자율 16% 기준</td>
    			<td rowspan="3">518,100원/월<br/>(VAT 포함)</td>
    			<td rowspan="3">570,900원/월<br/>(VAT 포함)</td>
    		</tr>
    		<tr>
    			<th class="sub-title">취득세</th>
    			<td>1,361,780원</td>
    			<td></td>
    			<td></td>
    		</tr>
    		<tr>
    			<th class="sub-title">공채할인</th>
    			<td>69,900원</td>
    			<td></td>
    			<td>공채할인율 6%</td>
    		</tr>
    		<tr>
    			<th class="sub-title">보험료</th>
    			<td>2,872,551원</td>
    			<td>957,517원/년</td>
    			<td></td>
    			<td colspan="2" rowspan="3">추가비용 없이 좌측의 모든 서비스 제공</td>
    		</tr>
    		<tr>
    			<th class="sub-title">자동차세</th>
    			<td>2,339,220원</td>
    			<td>779,740원/년</td>
    			<td></td>
    		</tr>
    		<tr>
    			<th class="sub-title">사고처리 및 사고대차</th>
    			<td>450,000원</td>
    			<td>150,000원/년</td>
    			<td>사고처리 인건비 포함</td>
    		</tr>
    		<tr>
    			<th class="sub-title">차량구입 및 유지 제비용 합계(ⓐ)</th>
    			<td>34,180,715원</td>
    			<td></td>
    			<td></td>
    			<td rowspan="2" colspan="2">적정한 가격의 매입 옵션 부여</td>
    		</tr>
    		<tr>
    			<th class="sub-title">중고차 매각 수입(ⓑ)</th>
    			<td>10,116,364원</td>
    			<td colspan="2">매입가격의 52%에 매각<br/>매각시 매각가격의 10% 부가세 납입해야 함</td>
    		</tr>
    		<tr>
    			<th class="sub-title">36개월 차량 이용에 따른 순비용</th>
    			<td>24,064,351원</td>
    			<td colspan="2">= ⓐ - ⓑ</td>
    			<td>18,651,600원</td>
    			<td>20,552,400원</td>
    		</tr>
    		<tr>
    			<td colspan="2"></td>
    			<th colspan="2" class="sub-title">할부구입대비</th>
    			<td class="primary-orange" style="text-decoration:bold;">-5,412,751원</td>
    			<td class="primary-orange" style="text-decoration:bold;">-3,511,951원</td>
    		</tr>
    	</table>
    	<br/>
    	<h3><span class="text-point">재렌트/재리스</span> 비용처리에 따른 <span class="text-point">세금감면</span> 효과를 비교하면?</h3>
    	<br/>
    	<div class="desc-half-table">
		   	법인
		   	<table class="desc-table table-bordered">
		   		<tr>
		   			<th>연간 순이익</th>
		   			<th>법인세율</th>
		   			<th>손비처리액</th>
		   			<th>법인세 절감액</th>	
		   		</tr>
		   		<tr>	
		   			<th class="sub-title">2억 이하</th>
		   			<td>11.0%</td>
		   			<td>18,651,600원</td>
		   			<td>2,051,676원</td>
		   		</tr>
		   		<tr>	
		   			<th class="sub-title">200억 이하</th>
		   			<td>22.0%</td>
		   			<td>18,651,600원</td>
		   			<td>4,103,352원</td>
		   		</tr>
		   		<tr>	
		   			<th class="sub-title">200억 초과</th>
		   			<td>24.2%</td>
		   			<td>18,651,600원</td>
		   			<td>4,513,687원</td>
		   		</tr>
		   	</table>
		   	* 위의 재렌트 대여료 3년 비용 처리 기준<br/>
		   	※ 차량 구입 이용 시에도 대부분 비용 처리가 가능하나, 회계 처리가 매우 복잡합니다.<br>
		   	※ 승용차(경차, 9인승 제외)의 경우 차량구입과 장기렌트/리스 모두 임직원 전용 자동차 보험을 가입하고, 법인세법상 손비처리 기준에 따라 손비처리 가능<br>
		   	(당사 홈페이지 '업무용승용차 손비처리 기준' 참고)
    	</div>
    	<div class="desc-half-table">
    		개인사업자
	    	<table class="desc-table table-bordered">
	    		<tr>
	    			<th>연간 순이익</th>
	    			<th>소득세율</th>
	    			<th>손비처리액</th>
	    			<th>소득세 절감액</th>	
	    		</tr>
	    		<tr>	
	    			<th class="sub-title">4600만원 이하</th>
	    			<td>16.5%</td>
	    			<td>18,651,600원</td>
	    			<td>3,077,514원</td>
	    		</tr>
	    		<tr>	
	    			<th class="sub-title">8800만원 이하</th>
	    			<td>26.4%</td>
	    			<td>18,651,600원</td>
	    			<td>4,924,022원</td>
	    		</tr>
	    		<tr>	
	    			<th class="sub-title">1억5천만원 이하</th>
	    			<td>38.5%</td>
	    			<td>18,651,600원</td>
	    			<td>7,180,866원</td>
	    		</tr>
	    		<tr>	
	    			<th class="sub-title">1억5천만원 초과</th>
	    			<td>41.8%</td>
	    			<td>18,651,600원</td>
	    			<td>7,796,369원</td>
	    		</tr>    		
	    	</table>
	    	* 위의 재렌트 대여료 3년 비용 처리 기준<br/>
	    	※ 차량구입 이용시 손비처리 안될 경우도 있으나, 장기렌트 및 리스 이용 시에는 쉽게 손비처리 가능합니다.<br>
	    	※ 승용차(경차, 9인승 제외)의 경우 2016년 소득세법부터 적용되고 있는 업무용승용차 손비처리 기준에 따라 손비처리 가능<br>
	    	(당사 홈페이지 '업무용승용차 손비처리 기준' 참고)
    	</div>
    	<h3><span class="text-point">재렌트/재리스 회계처리</span>는?</h3>
    	<ul>
    		<!-- <li>리스 비용 전액 손비처리가 가능하고, 회계처리가 쉽습니다. (매월 세금계산서 1장으로 끝)</li> -->
    		<li>대여료 손비처리시 회계처리가 매우 간편합니다. (매월 발부되는 세금계산서 1장으로 비용처리 완료)</li>
    		<li>금융권 전산에 대출로 잡히지 않습니다. (할부구입이나 일반 캐피탈사의 리스 이용시 금융권 전산에 대출로 잡힙니다)</li>    		
    	</ul>
    </div> 
    <br/>

</div>

</t:genericpage>