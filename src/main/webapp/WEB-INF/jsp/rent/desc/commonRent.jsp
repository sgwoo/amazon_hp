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
		<!-- <a href="/rent/domestic" class="back-arrow"> -->
		<a onclick="javascript:history.go(-1);" class="back-arrow" style="cursor: pointer;">
			<span class="icon-arrow_left"></span>
		</a>장기렌트
	</h2>
</div>

<ul class="nav nav-tabs nav-justified amazon-desc-tab" role="tablist">
  <li role="presentation" class="active"><a href="#goods" aria-controls="goods" role="tab" data-toggle="tab">상품 안내</a></li>
  <li role="presentation"><a href="#feature" aria-controls="feature" role="tab" data-toggle="tab">아마존카 특징</a></li>
  <li role="presentation"><a href="#advantage" aria-controls="feature" role="tab" data-toggle="tab">이용장점</a></li>
  <li role="presentation"><a href="#requirement" aria-controls="requirement" role="tab" data-toggle="tab">꼼꼼한 체크</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active amazon-desc" id="goods">
    		<h3>아마존카의 <span class="text-point">장기렌트</span>는?</h3>
    		<p>고객이 원하는 차량을 구매하여 일정기간 대여해드리는	서비스이며, 유지 / 관리 / 정비 / 사고처리 등 차량관련 모든 서비스를 제공합니다. </p>
			<img src="/resources/images/rent_domestic_desc.png"/><br/>
			<br/>
			<table class="desc-table table-bordered">
				<colgroup>
					<col width="25%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<th>다양한 이용기간</th>
					<td>12개월 / 24개월 / 36개월 / 48개월 / 60개월 (필요시 12~60개월 이내 전 개월 견적 가능)</td>
				</tr>
				<tr>
					<th>대여기간 종료 후<br/>매입 여부 선택가능</th>
					<td>
						1. 차량반납<br/>
						2. 구매(매입옵션 행사)<br/>
						3. 이용 연장
					</td>
				</tr>
				<tr>
					<th>전 차종 이용 가능</th>					
					<td>
						단, 화물 및 승합차종은 자동차 리스로 이용 가능
					</td>
				</tr>
			</table>
   	</div>
    
    <div role="tabpanel" class="tab-pane amazon-desc" id="feature">
		 <h3>아마존카 <span class="text-point">장기렌트의 특징</span>은?</h3> 
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대여요금이 착합니다</h4>
		 <p>
		 	효율적인 경영, 꼼꼼한 원가분석 및 합리적인 가격 정책으로 언제나 업계 최저요금을 추구합니다.      	 
      	 </p>
		 
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;수준높은 차량관리 서비스를 제공합니다</h4>
		<p>
			고객별 카 매니저(Car Manager)를 지정하여 전문성있는 맞춤형 차량관리서비스를 제공합니다.
      	 </p>
      	
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;신용심사 기준의 문턱을 낮췄습니다</h4>
		 <p>
		 	획일화된 신용심사를 하지 않습니다.<br/>
			심사기준이 간결합니다. <br/>
			신설법인도 이용이 가능합니다.<br/>
      	 </p>
      	 
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대여상품이 다양합니다</h4>
		 <p>
		 	전 차종 이용이 가능합니다.(단, 화물 및 승합차종은 리스로 이용가능)<br/>
			정비서비스 포함 여부를 고객이 선택할 수 있습니다.<br/>
			대여기간이 다양합니다.(12개월 ~ 60개월)<br/>
			신차 외에 저렴한 재렌트 차량도 이용할 수 있습니다.(6~48개월)
      	 </p>    
      	 
      	  <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대출기록이 남지 않습니다</h4>
		 <p>
		 	아마존카의 장기렌트, 리스를 이용하더라도 금융권 전산상에 대출 기록이 남지 않습니다.
      	 </p>
      	 <br/>
      	 <table class="desc-table table-bordered text-center">
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
    	<h3>아마존카 <span class="text-point">장기렌트의 이용장점</span>은?</h3> 
	    <table class="advantage-table">
	    	<colgroup>
	    		<col width="20%"/>
	    		<col width="*"/>
	    	</colgroup>
	    	<tr>
	    		<th>
	    			<div>비용절감</div>
	    		</th>
	    		<td>
	    			<ul>
	    				<!-- <li>할부구입 대비 경제적입니다.</li> --> 
	    				<li>
	    					할부구입 대비 경제적입니다. (자세한 내용은 각 견적서 상단에 있는 [비용비교 안내] 참조)
<!-- 	    					<a href="#detail_info_modal" data-toggle="modal" style="text-decoration: none; color: red; outline: 0px;">[상세보기]</a> -->
	    				</li>
	    				<!-- <input type="button" class="btn btn-danger detail_info" value="상세보기" data-toggle="modal" data-target="#detail_info_modal" style="position: relative;"> -->
						<li>차량구매에 비해 초기비용을 최소화 할 수 있습니다.</li>
						<li>세금감면 효과가 있습니다.</li>
						<li>차량관리 및 유지에 따른 번거로움을 피할 수 있습니다.</li>
	    			</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>
	    			<div>회계처리 간소화</div>
	    		</th>
	    		<td>
	    			<ul>
	    				<li>
	    					신차 구매시 자산과 부채가 동시에 증가하여 부채비율이 증가하는데 비해,<br/>
     						장기렌트시 매월 내는 대여료만 비용처리 되므로 회사의 부채비율을 줄일 수 있습니다.
	    				</li>
	    				<li>
	    					매월 발행되는 세금계산서로 회계처리를 쉽고 간편하게 할 수 있습니다.
	    				</li>
	    			</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>
	    			<div style="padding-top:40px;">차량유지 및<br/>관리 편의</div>
	    		</th>
	    		<td>
	    			<ul>
	    				<li>차량유지와 관련된 모든 지원 서비스를 제공합니다.</li>
	    				<li>
	    					차량정비 및 사고 발생시 신속한 대차제공을 통해 업무공백을 최소화합니다.<br/>
	    					(4시간 이상 차량 공백이 발생하는 경우 대차서비스 제공)
	    				</li>
	    				<li>카매니저를 통해 정기적인 차량 관리를 편안하게 받을 수 있습니다.</li>
	    			</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>
	    			<div>사고처리 대응</div>
	    		</th>
	    		<td>
	    			<ul>
	    				<li>사고발생시 보험사고에 따른 복잡한 업무처리를 지원합니다.</li>
	    				<li>사고 발생시 긴급대차 서비스를 무상 제공합니다.</li>
	    			</ul>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>
	    			<div>기타</div>
	    		</th>
	    		<td>
	    			<ul>
	    				<li>특별한 사유(승진 등)로 차종변경이 필요한 경우 대응이 용이합니다.</li>
	    				<li>대여기간(12~60개월)을 상황에 따라 다양하게 선택할 수 있습니다.</li>
	    			</ul>
	    		</td>
	    	</tr>
	    </table>
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="requirement">
    	<h3><span class="text-point">장기렌트</span>와 <span class="text-point">신차구매</span>를 비교하면?</h3> 
    	<table class="desc-table table-bordered">
			<thead>
				<tr>
					<th colspan="2" scope="cols">&nbsp;</th>
					<th scope="cols">신차구입</th>
					<th scope="cols">아마존카 장기렌트</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th colspan="2" scope="row">소유(명의자)</th>
					<td>본인 소유</td>
					<td>아마존카 소유</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">초기비용</th>
					<td>취득세, 공채, 번호판대, 증지대(수입인지), 등록대행료(등록대행시)등<br>초기비용 부담 발생</td>
					<td>초기비용 부담적음. 월대여료에 모든 비용 포함</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">보험료</th>
					<td>본인부담<br>본인 보험요율에 따른 보험료 산정<br>사고 유무에 따라 보험료 할인/할증</td>
					<td>월대여료에 포함<br>사고유무에 따른 보험료 할인/할증 없음</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">재무/회계처리</th>
					<td>할부로 구입시에는 부채비율에 영향<br>자산(차량운반구) 감가상각, 세금, 보험료 등<br>항목별 비용처리필요</td>
					<td>월대여료만 비용처리하므로 부채비율에 영향을 미치지 않음<br>매월 발행되는 세금계산서 하나로 간편하게 회계처리<br>자금운용 계획 수립 용이</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">차량관리</th>
					<td>본인이 직접관리</td>
					<td>전담 카매니저에 의한 체계적 차량관리</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">사고처리</th>
					<td>사고처리 업무 부담 발생</td>
					<td>아마존카에서 사고처리 업무 대행</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">대차서비스</th>
					<td>사고 및 정비로 인한 수리기간 동안 업무 공백 발생</td>
					<td>사고 및 4시간 이상 정비공장 입고시 무료 대차서비스 제공</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">정기검사</th>
					<td>본인 직접 검사</td>
					<td>아마존카에서 검사 대행</td>
				</tr>
				<tr>
					<th colspan="2" scope="row">중고차처리</th>
					<td>중고차 매각 업무 발생 (적정 가격 판단, 매각 루트 결정 등)<br>법인 및 개인사업자(면세사업자 제외)의 경우 매각시<br>부가가치세 10% 납부해야 함</td>
					<td>계약만료시 반납, 연장이용, 매입옵션 행사 등 다양한 선택가능</td>
				</tr>
				<%-- <tr>
					<th colspan="2" scope="row">LPG차량 이용</th>
					<td>불가능</td>
					<td>이용가능</td>
				</tr> --%>
			</tbody>
		</table>
		
    	<%-- <table class="desc-table table-bordered">
			<thead>
				<tr>
					<th colspan="2" scope="cols">&nbsp;</th>
					<th scope="cols">신차구입</th>
					<th scope="cols">아마존카 장기렌트</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th rowspan="5" scope="row">비용절감</th>
					<th scope="row">총지출비용</th>
					<td>중대형 승용차는 세금 비중 과다<br />
					  (개별소비세, 등록비용, 자동차세 등)</td>
					<td>할부구입대비 10~15% 정도 저렴(대형·중형·소형승용 및 RV)<br />
						(렌터카에 주어지는 세제혜택효과, 낮은조달 금리, 대량구매,<br />
						중고차 거래비용 절감 등으로 저렴)</td>
				</tr>
				<tr>
					<th scope="row">초기비용</th>
					<td>초기비용 과다 소요<br />
						※ 할부구입시 까다로운 신용심사</td>
								<td>최소한의 초기 비용<br />
						※ 할부구입보다 신용평가 기준 및 절차간편</td>
				</tr>
				<tr>
					<th scope="row">세금감면</th>
					<td>
						<span  class="text02">장기렌트보다 손비처리 용이하지 않음</span> <br />
						<span  class="text02">·법인 : 차량을 구입하여 차량을 지급할 경우 복잡하고 번거러운 일이 많음</span> <br />
						<span  class="text02">·개인사업자: 고급차보유시 손비 인정받기 어려움</span>
					</td>
					<td>
						<span  class="text02">차량을 구입할 경우보다 손비처리 용이함</span> <br />
						<span  class="text02">·법인: 회사 중역의 경우 급여대신 차량을 지급하면 세금감면효과 큼</span> <br />
						<span  class="text02">·개인사업자: 소득세 절감효과</span></td>
					</td>
				</tr>
				<tr>
					<th scope="row">인건비절감</th>
					<td>차량관리 인력 필요<br />
						복잡한 회계처리에 따른 인건비 발생</td>
					<td>차량유지 및 정비관련 Full Service 제공<br />
						간편한 회계처리</td>
				</tr>
				<tr>
					<th scope="row">기타</th>
					<td>고급 차량 소유시 세무조사 부담</td>
					<td>고급차일수록 비용절감 효과가 큼</td>
				</tr>
				<tr>
					<th rowspan="3" scope="row">재무/<br />
					회계처리</th>
					<th scope="row">재무구조</th>
					<td>자산구입이므로 부채비율에 영향 재무구조 악화<br />
					자산(차량)구입 → 차입금발생 → 부채비율상승</td>
					<td>월대여료만 비용처리하므로 부채비율에 영향을 미치지 않음 <br />
					(건실한 재무구조)</td>
				</tr>
				<tr>
					<th scope="row">회계처리</th>
					<td>자산(차량운반구)감가상각, 다양한 항목(세금, 보험료,<br />
					차량정비비 등) 비용처리 등 복잡한 회계처리 필요.<br />
					차량정비비 과다청구 등으로 비용투명성 확보 곤란.</td>
					<td>매월 발행되는 세금계산서 하나로 회계처리완료<br />
					차량정비비 등의 비용운영 내역이 투명해짐</td>
				</tr>
				<tr>
					<th scope="row">자금운용계획</th>
					<td>복잡한 회계처리로 계획수립 어려움</td>
					<td> 자금운용 계획 수립 용이</td>
				</tr>
				<tr>
					<th rowspan="4" scope="row">차량유지/<br />
					관리</th>
					<th scope="row">차량관리</th>
					<td>사전정비/사후정비/제세공과금납부/ 검사 등 항상 세심한 <br />
					차량관리 필요</td>
					<td>전담 카매니저에 의한 체계적 차량관리로 고객은 차량관리 <br />
					부담없이 최상 상태의 차량이용</td>
				</tr>
				<tr>
					<th scope="row">사고처리</th>
					<td>사고처리 업무 부담 발생</td>
					<td>아마존카에서 사고처리 업무 대행</td>
				</tr>
				<tr>
					<th scope="row">대차서비스</th>
					<td>사고 및 정비로 인한 수리기간 동안 업무 공백 발생 </td>
					<td>사고 및 4시간 이상 정비공장 입고시 즉각적인 무료 대차서비스<br />
					제공</td>
				</tr>
				<tr>
					<th scope="row">중고차처리</th>
					<td>중고차 매각 업무 발생 (적정 가격 판단, 매각 루트 결정 등)<br />
					법인의 경우 매각시 부가가치세 10% 납부해야 함 </td>
					<td>계약만료시 반납, 연장이용, 매입옵션 행사 등 다양한 선택가능</td>
				</tr>
				<tr>
					<th rowspan="3" scope="row">기타</th>
					<th scope="row">10부제</th>
					<td>해당 </td>
					<td>규제대상에서 제외</td>
				</tr>
				<tr>
					<th scope="row">LPG차량 이용</th>
					<td>불가능 </td>
					<td>이용가능 </td>
				</tr>
				<tr>
					<th scope="row">이용기간</th>
					<td>단기간 이용 후 매각시 손실이 큼 </td>
					<td>차량이용 계약기간이 다양해서 필요한 기간 만큼만 이용 가능 </td>
				</tr>
			</tbody>
		</table> --%>		
		
		<br/>
		
		<h3><span class="text-point">장기렌트</span>와 <span class="text-point">리스</span>를 비교하면?</h3>
		<table class="desc-table table-bordered">
			<thead>
				<tr>
					<th colspan="3" rowspan="2" scope="cols">구분</th>
					<th colspan="2" scope="cols">장기렌트</th>
					<th colspan="2" scope="cols">리스</th>
				</tr>
				<tr>
					<th scope="cols">장기렌트 일반식</th>
					<th scope="cols">장기렌트 기본식</th>
					<th scope="cols">리스 일반식</th>
					<th scope="cols">리스 기본식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th colspan="3" scope="row">차량번호</th>
					<td>'허','하','호' 번호</td>
					<td>'허','하','호' 번호</td>
					<td>일반 자가용번호</td>
					<td>일반 자가용번호</td>
				</tr>
				<tr>
					<th colspan="3" scope="row">이용차종</th>
					<td colspan="2">전차종 (화물 및 승합 차종 제외)<br />
					  ※ 화물 및 승합 차종은 아마존카 리스로 이용가능</td>
					<%-- <td colspan="2">전차종 (일반승용 LPG 차종 제외)<br />
						※ 경차, 7·9인승, 승합의 경우에는 LPG 차종도 이용가능</td> --%>
					<td colspan="2">전차종</td>
				</tr>
				<%-- <tr>
					<th colspan="3" scope="row">LPG차량 이용</th>
					<td>가능 </td>
					<td>가능 </td>
					<td><div  align="center">X</div></td>
					<td><div  align="center">X</div></td>
				</tr> --%>
				<tr>
					<th colspan="3" scope="row">이용기간</th>
					<td>12 ~ 60개월<br />
					(보유차 6~48개월)</td>
					<td>12 ~ 60개월<br />
					(보유차 6~48개월)</td>
					<td>12 ~ 60개월</td>
					<td>12 ~ 60개월</td>
				</tr>
				<tr>
					<th rowspan="6" scope="row">제<br />
					공<br />
					서<br />
					비<br />
					스</th>
					<th colspan="2" scope="row">차량대여료, 등록비용, <br />
					자동차세, 보험료<br />
					(대여료외고객추가 비용없음)</th>
					<td ><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
				</tr>
				<tr>
					<th rowspan="2" scope="row">사<br />
					고<br />
					처<br />
					리<br /></th>
					<th scope="row">사고처리 업무대행</th>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
				</tr>
				<tr>
					<th scope="row">사고대차서비스<br />
					(피해,가해 모두 제공)</th>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">O</div></td>
				</tr>
				<tr>
					<th rowspan="3" scope="row">차<br />
					량<br />
					정<br />
					비<br /></th>
					<th scope="row">일체의 정비 서비스</th>
					<td><div align="center">O</div></td>
					<td><div align="center">X</div></td>
					<td><div align="center">O</div></td>
					<td><div align="center">X</div></td>
				</tr>
				<tr>
					<th rowspan="2" scope="row">정비대차</th>
					<td rowspan="2">4시간이상 정비공장 입고시<br />
					무상 정비대차 제공</td>
					<td>대여 개시 2개월 이내<br />
					무상 정비대차 제공<br />
					(24시간 이상 정비공장 입고시)</td>
					<td rowspan="2">4시간이상 정비공장 입고시<br />
					무상 정비대차 제공</td>
					<td>대여 개시 2개월 이내<br />
					무상 정비대차 제공<br />
					(24시간 이상 정비공장 입고시)</td>
				</tr>
				<tr>
					<td>대여 개시 2개월 이후<br />
					원가 수준의 유상 정비대차 제공<br />
					(단기 대여요금의<br />
					15~30%수준, 탁송료 별도)</td>
					<td>대여 개시 2개월 이후<br />
					원가 수준의 유상 정비대차 제공<br />
					(단기 대여요금의<br />
					15~30%수준, 탁송료 별도)</td>
				</tr>
				<tr>
					<th colspan="3" scope="row">대여료</th>
					<td>리스 일반식 대비<br />
					10~20% 정도 저렴</td>
					<td>리스 기본식 대비<br />
					10~20% 정도 저렴</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th colspan="3" scope="row">중고차 매입옵션</th>
					<td><div align="center">X</div></td>
					<%-- <td><div align="center">O<br />(LPG 전용차의 경우<br /> 자격요건이 되는 고객만<br /> 매입옵션 행사가 가능합니다)</div></td> --%>
					<td><div align="center">O</div></td>
					<td><div align="center">X</div></td>
					<td><div align="center">O</div></td>
				</tr>
				<tr>
					<th colspan="3" scope="row">주고객층</th>
					<td colspan="2">대기업, 금융기관,관공서, 중소기업,
						개인사업자 등 <br />
						비용절감에 보다 관심이
						많은 고객층 </td>
					<td colspan="2">전문직 종사자, 개인사업자, 신설법인, 수입차 이용자 등<br /> 
					'허', '하', '호' 번호를 부담스러워하는 고객층</td>
				</tr>
				<tr>
					<th colspan="3" scope="row">비고</th>
					<td colspan="2">저렴한 대여요금</td>
					<td colspan="2">캐피탈사에서 시행하는 리스와 동일한상품<br />
					(단, 아마존카는 렌터카 겸업업체로서 정비 및 대차서비스의 <br />
					품질이 훨씬 우수함)</td>
				</tr>
			</tbody>
		</table>
    </div>
</div>

<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> -->
<div class="pre-check-modal modal fade" id="detail_info_modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="border: 0px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <!-- <h4 class="modal-title" id="myModalLabel">* 아래 조건에 해당될 경우 할부구입대비 10~15% 유리</h4> -->
      </div>
      <div class="modal-body">
      	<div style="margin: 0 auto; padding-left: 30px;">
	        <h4><span style="vertical-align:  middle;">*</span> 아래 조건에 해당될 경우 할부구입대비 10~15% 유리</h4><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px;">- 차종 : 경차/승합차를 제외한 승용차 및 RV 전차종</font><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px;">- 법인 및 개인사업자 (면세사업자 제외)</font><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px;">- 할부 구입 후 5년이내에 중고차로 매각</font><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px;">- 자동차 보험 손해율이 보험 가입자 전체 평균 수준</font><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px;">- 할부 이자율 4.5% 기준</font><br><br>
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-size: 16px; word-spacing: 2px; font-weight: bold;">※ 자세한 내용은 각 견적서 상단에 있는 [비용비교 안내] 참조</font>
        </div>
      </div>
      <div class="modal-footer" style="border: 0px;">
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
        <button type="button" class="btn btn-default-reverse" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

</t:genericpage>