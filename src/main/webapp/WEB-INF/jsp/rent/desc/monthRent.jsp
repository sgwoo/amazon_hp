<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<!-- <a href="/rent/month" class="back-arrow"> -->
		<a onclick="javascript:history.go(-1);" class="back-arrow" style="cursor: pointer;">
			<span class="icon-arrow_left"></span>
		</a>월렌트
	</h2>
</div>

<ul class="nav nav-tabs amazon-desc-tab" role="tablist">
  <li role="presentation" class="active"><a href="#goods" aria-controls="goods" role="tab" data-toggle="tab">상품 안내</a></li>
  <li role="presentation"><a href="#feature" aria-controls="feature" role="tab" data-toggle="tab">아마존카 특징</a></li>
  <li role="presentation"><a href="#requirement" aria-controls="requirement" role="tab" data-toggle="tab">꼼꼼한 체크</a></li>
</ul>

<!-- Tab panes -->
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active amazon-desc" id="goods">
   		<h3>아마존카의 <span class="text-point">월렌트</span>는?</h3>
   		<p>아마존카가 보유하고 있는 차량을 대여해드리는 서비스이며, 모든 계약은 최초 계약 시 1개월로 계약됩니다.</p>
		<img src="/resources/images/rent_month_desc.png"/><br/> 
		<p style="margin-top:24px;">
			<!-- <span class="glyphicon glyphicon-heart-empty"></span>&nbsp;&nbsp;월 단위로 연장계약을 하시면 최초계약 월 대여료 대비 3%의 할인혜택을 드립니다.<br/> -->
			<span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;월렌트 최초 대여기간은 1개월이며, 계약만료 7일전까지 요청하시면 사전 심사 후 연장 계약이 가능합니다.<br/> 
			<span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;중도 반납으로 인해 실제 이용기간이 1개월 미만인 경우, 견적서에 명시된 요금정산표에 따라 이용 일수 만큼의 대여료가 청구됩니다.<br/>
		</p>
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="feature">
		<h3>아마존카 <span class="text-point">월렌트의 특징</span>은?</h3> 
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;믿을 수 있는 우수한 차량만을 제공합니다</h4>
		<p>기존에 아마존카가 소유하고 있는 차량으로 사고 유무, 주행거리, 정비 등 관리 이력을 공개하고 있기 때문에 믿고 이용하실 수 있습니다.</p>
		 
		<h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;보험보상 범위가 업계 최고수준입니다</h4>
		<p>
			대인배상 : 무한(대인 I, II)<br/>
			대물보상 : 1억원  <br/>
			자기신체사고 : 1억원  <br/>
			무보험차 상해 : 1인당 최고 2억원  <br/>
			자기차량 손해 면책제도(자차보험) 기본적용 : 자차면책금 30만원  <br/>
			 운전자 범위 : 계약자 및 계약서상 명시된 추가운전자 <br/>
      	 </p>
      	
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;신용심사 기준이 간결합니다.</h4>
		 <!-- <p>
		 	획일화된 신용심사를 하지 않습니다.<br/>
			심사기준이 간결합니다. <br/>
			신설법인도 이용이 가능합니다.<br/>
      	 </p> -->
      	 <p>
		 	본인명의 신용카드 소지자<br/>
			<!-- 법인의 경우에는 법인 명의 신용카드 <br/> -->
			법인의 경우에는 기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드 소지 여부<br/>
			<!-- ＊ 고급차의 경우에는 신용등급 조회를 할 수 있습니다. -->
			<!-- 20180515_위 문구에서 아래 문구로 교체 -->
			＊ 월대여료 75만원(vat별도) 이상인 차량은 신용등급 조회가 필요합니다.<br/>
      	 </p>
      	 
		 <h4><span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;대여상품이 다양합니다</h4>
		 <p>
		 	월렌트를 이용하시더라도 다양한 차량을 사양 수준, 차령 및 주행거리에 따라 합리적인 가격에 이용 가능합니다.<br/>
      	 </p>      	 
    </div>
    <div role="tabpanel" class="tab-pane amazon-desc" id="requirement">
    	<h3><span class="text-point">월렌트를 이용하기</span> 위해서는?</h3> 
        <p>        
	      	<dl class="dl-horizontal">
		  		<dt>운전자 자격 요건</dt>
		  		<dd>반드시 만 26세 이상, 대한민국 면허취득 3년 이상의 내국인이어야 합니다.</dd>
		  		<dd>일반 개인은 본인만 운전가능하며, 배우자에 한하여 사전심사 후 추가 운전자로 지정이 가능합니다.</dd>
		  		<dd>개인사업자의 경우 계약자(개인사업자) 및 사전에 면허증이 접수된 직원 1인만 운전 가능합니다.</dd>
		  		<dd>법인의 경우 사전에 면허증이 접수된 직원 2인만 운전이 가능합니다.</dd>
			</dl>
			<hr/>
			<!-- 20180515_문구 추가 -->
			<dl class="dl-horizontal">
		  		<dt>신용심사 기준</dt>
		  		<dd>본인명의 신용카드 소지자</dd>
		  		<dd>법인의 경우에는 기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드 소지 여부</dd>
		  		<dd>월대여료 75만원(vat별도) 이상인 차량은 신용등급 조회가 필요합니다. (신용등급에 따라 계약진행이 불가 할 수도 있습니다.)</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>차량 대여 기간</dt>
		  		<dd>월렌트 최초 대여기간은 1개월이며, 계약만료 7일전까지 요청하시면 사전 심사후 연장계약이 가능합니다.</dd>
		  		<!-- <dd>(월 단위 연장계약시 최초계약 월 대여료 대비 3% 할인된 금액으로 적용)</dd> -->
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>차량 예약</dt>
		  		<dd>홈페이지를 통해서 차량 예약이 가능하고, 당사 직원과 상담을 통해서도 차량 예약이 가능합니다.</dd>
		  		<dd>예약 기한은 근무일 기준 익일 16시까지 입니다. 예약 기한 내에 계약을 진행하셔야 예약이 취소되지 않습니다.<br/>
		  			ex)금요일 13시에 차량을 예약하면 예약기한은 월요일 16시까지</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>차량 인수 가능 시간</dt>
		  		<dd>대여시 차량인수는 평일 오전 9시~오후 5시 내에만 가능합니다.</dd>
		  		<dd>차량인수 장소는 차량이 준비된 당사 지정 주차장이며, 방문계약만 가능합니다.</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>차량 반납 가능 시간</dt>
		  		<dd>평일: 오전 9시~오후 5시까지 차량반납이 가능합니다.</dd>
		  		<dd>공휴일 및 토요일: 오전 9시~12시까지 차량반납이 가능합니다.</dd>
		  		<dd>일요일, 설날(음력 1월 1일) 및 추석 당일: 차량반납이 불가하오니 다음날 반납해 주시기 바랍니다.</dd>
<!-- 		  		<dd>차량반납은 오전 9시~ 오후 5시 내에만 가능합니다.(단, 설날 및 추석 당일은 차량반납이 되지 않습니다.)</dd> -->
		  		<dd>차량반납 장소는 당사 지정 주차장이 원칙이며 탁송요청시 추가요금이 부가됩니다.</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>요금 결제</dt>
		  		<dd>① &nbsp;대여료는 1개월씩 선불로 결제해야 합니다.</dd>
		  		<dd>② &nbsp;대여료는 계약자 본인 명의의 신용카드로 결제해야합니다. (체크카드 불가)</dd>
		  		<dd> &nbsp;&nbsp;&nbsp;※ 법인의 경우에는 기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드만 가능합니다.</dd>
		  		<!-- <dd> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(신용우수 개인 및 법인의 경우 현금결제도 가능)</dd> -->
		  		<dd>③ &nbsp;2회차부터의 대여요금, 연장대여요금, 중도해지위약금, 면책금 등의 기타 채무는 신용카드로 자동출금됩니다.</dd>
		  		<dd> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(계약시 신용카드 자동출금 신청 필수, 2회차부터의 대여요금은 해당 회차 대여시작일 하루 전날 결제)</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>차량 이용 중 정비</dt>
		  		<dd>차량 이용 중 정비(고장수리, 엔진오일 교환 등)가 필요한 경우 필히 아마존카 관리담당자에게 연락하여야 하며,</dd>
		  		<dd>차량 정비시 아마존카 지정정비업체로 직접 방문해 주셔야 합니다.</dd>
		  		<dd>정비비는 아마존카에서 지불하며, 개인비용으로 처리시 비용처리가 안됩니다.</dd>
			</dl>
			<hr/>
			<dl class="dl-horizontal">
		  		<dt>기타 대여 조건</dt>
		  		<dd>월간 4,000km의 주행거리 제한이 있으며, 초과 시 차량별 추가요금이 적용됩니다.</dd>
		  		<dd>월렌트(장기계약)의 특성상 유류대 정산을 하지 않습니다.</dd>
		  		<dd>연장계약은 계약만료 7일 전까지 당사에 유선으로 연락을 취하여 연장승인을 받은 후에 연장대여료가 결제되어야 확정됩니다.<!-- (연장대여료는 자동이체로 결제) --></dd>
			</dl>
		</p>
    </div>
</div>

</t:genericpage>