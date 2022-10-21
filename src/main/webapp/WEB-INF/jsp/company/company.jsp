<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<t:genericpage>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript">
$(document).ready(function(){
	
	//날짜 formating
	var a_j = $("#a_j").val();	
	var curYear = a_j.substr(5,4);
	var curMonth = a_j.substr(9,2);	
	var curDay = a_j.substr(11,2);	
	
	$(".curYear").text(curYear);
	$(".curMonth").text(curMonth);
	$(".curDay").text(curDay);
	
});
</script>    
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
	<h2 class="primary">회사 소개</h2>
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active"><a href="#info" aria-controls="info" role="tab" data-toggle="tab">기업정보</a></li>
	   	<li role="presentation"><a href="#history" aria-controls="history" role="tab" data-toggle="tab">회사연혁</a></li>
	   	<li role="presentation"><a href="#greeting" aria-controls="greeting" role="tab" data-toggle="tab">CEO인사말</a></li>
	   	<li role="presentation"><a href="#customer" aria-controls="customer" role="tab" data-toggle="tab">아마존카 고객</a></li>
	   	<li role="presentation"><a href="#social" aria-controls="social" role="tab" data-toggle="tab">사회공헌활동</a></li>
	   	<li role="presentation"><a href="#human" aria-controls="human" role="tab" data-toggle="tab">인재상</a></li>
	   	<li role="presentation"><a href="#ethics" aria-controls="ethics" role="tab" data-toggle="tab">윤리경영</a></li>
	</ul>  
  
	<!-- Tab panes -->
	<div class="tab-content">
	    <!-- 기업정보 -->
	    <div role="tabpanel" class="tab-pane active company-tab-panel" id="info" style="margin:0 auto;">
			<!-- <h2 class="company-title">
				<span class="primary">국내 1000여개 자동차 대여 업체 중 1위 </span><br>
				국내 최초, 국내 최고를 선도하는 기업입니다
			</h2><br> -->
			<h2 class="company-title">
				<span class="primary">아마존카는</span><br>최고의 효율을 목표로 합니다.
			</h2>
			<br>
			<!-- <img src="/resources/images/img_company01.png"/> -->
			<div class="container" style="position: absolute; padding-left: 0px;">    
				<img src="/resources/images/img_company_01.png" class="" style="padding-right: 20px; width: 650px; height: 430px;">
			</div>
			<div class="container" style="padding-left:  0px; position: relative; padding-bottom:30px;">	
				<div style="overflow: hidden; width: 650px; height: 430px; margin: 0 auto;">
					<div style="width: 200px; height: 130px; margin:  0 auto; margin-top: 35px; margin-left: 220px;">
						<h3 style="padding-top: 20px; font-weight: bold; font-size: 20px; margin-bottom: 0px;">보유대수<br>국내1위(독립기업중)</h3>
						<p style=" padding-bottom:  10px; padding-top: 5px; font-weight: 400; font-size: 12px;">그룹계열사 2개사<br>[롯데렌탈, SK렌터카]제외</p>
					</div>
					<div style="float:  left; width: 200px; height: 130px; margin-top: 100px; margin-left: 68px;"> 
						<h3 style="margin-top: 0px; margin-bottom:  0px; padding-top: 30px; font-weight: bold; font-size: 20px;">국내최초</h3>
						<p style="padding-bottom:  10px; padding-top: 5px; font-weight: 400;">국내 장기렌트, 자동차리스<br>겸업회사<br></p>            
					</div>
					<div style="float: right; width: 200px; height: 130px; margin-top: 87px; margin-right: 66px;">
						<h3 style="margin-top: 0px; margin-bottom:  0px; padding-top: 28px; font-weight: bold; font-size: 20px;">${info_continue_year+1}년<br>장기대여 전문기업</h3>
						<p style=" padding-bottom:  10px; padding-top: 5px; font-weight: 400; ">- 4시간이상 운행불가시<br>대차서비스 제공 -</p>
					</div>
				</div>
			</div>
			
			<div class="company-detail">
				<p>
					<span class="glyphicon glyphicon-ok"></span>
					미국, 일본 등지에서 보편화 되어 있는 자동차리스를 국내실정에 맞게 재설계하여 상품화 하였습니다.
				</p>
				<!-- <p>
					<span class="glyphicon glyphicon-ok"></span>
					인터넷 시대에 걸맞게 가장 합리적인 원가구조를 바탕으로 완전 공개된 대여요금 체제를 도입하였고,
					<span class="primary">저렴한 대여요금에<br>업계 최고 서비스를 제공</span>하는 상품을 지속적으로 개발 출시하고 있습니다.
				</p> -->
				<p>
					<span class="glyphicon glyphicon-ok"></span>
					인터넷 시대에 걸맞게 가장 합리적인 원가구조를 바탕으로 완전 공개된 대여요금 체제를 도입하였고, <span class="primary">저렴한 대여요금에</span><br>
					상품을 지속적으로 개발 출시하고 있습니다.
				</p>
				<p>
					<span class="glyphicon glyphicon-ok"></span>
					또한 당사는 <span class="primary">업계 최초로 장기렌트, 자동차리스를 겸업</span>하여 고객의 선택 폭을 넓혔습니다.
				</p>
				<!-- <p>
					<span class="glyphicon glyphicon-ok"></span>
					오토리스, 장기렌트 겸업회사의 장점을 살려 일반 캐피탈 회사들이 흉내낼 수 없는
					<span class="primary">높은 수준의 대차서비스 및 차량관리 서비스가 <br>제공되는 오토리스 상품을 운영</span>하고 있습니다.
				</p> -->
				<p>
					<span class="glyphicon glyphicon-ok"></span>
					장기렌트, 자동차리스 겸업회사의 장점을 살려 
					<span class="primary">높은 수준의 대차서비스 및 차량관리 서비스가 제공되는<br>자동차 장기대여 상품을 운영</span>하고 있습니다.
				</p>
				<!-- <p>
					<span class="glyphicon glyphicon-ok"></span>
					기존 캐피탈 회사들의 지나치게 까다로운 채권확보 관행을 과감히 탈피하여 <span class="primary">자본금이 미약한 신설법인이나
					개인사업자들도<br>쉽게 오토리스 차량 이용이 가능</span>하게 하는 등 자동차 장기대여 시장의 변화를 끊임없이
					선도하고 있는 기업입니다.
				</p> -->
				<p>
					<span class="glyphicon glyphicon-ok"></span>
					<span class="primary">자본금이 미약한 신설법인이나 개인사업자들도 쉽게 장기렌트, 자동차리스 이용이 가능</span>하게 하는 등<br>
					자동차 장기대여 시장의 변화를 끊임없이 선도하고 있는 기업입니다.
				</p>
			</div>
	    </div>
	    <!-- 회사 연혁 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="history" style="margin:0 auto;">
	    	<h2 class="company-title">
	    		경영진의 자동차 제조회사 출신 근무경력에 기반하여,<br>체계적이고 효율적인 서비스 및 시스템으로 
				지속적인 성장을 하여왔습니다.
	    	</h2>
			<table class="table history-table">
				<thead>
					<tr>
						<th colspan="3" scope="row"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th width="180" scope="row"><span class="primary-orange">2022</span></th>
						<td width="70" colspan="2">
							<b>04</b>&nbsp;&nbsp;<b class="primary-orange">약정 운행거리 이하 운행 시 대여료 환급 상품</b> 운영 개시<br>
							<b>04</b>&nbsp;&nbsp;<b class="primary-orange">친환경차 4,000대</b>&nbsp;돌파&nbsp;(전기차 / 수소차 / 하이브리드 / 플러그인 하이브리드 차량)<br>
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2021</th>
						<td width="70" colspan="2">
							<b>10</b>&nbsp;&nbsp;친환경차 3,700대&nbsp;돌파&nbsp;<br>
							<b>04</b>&nbsp;&nbsp;보유차량 23,000대&nbsp;돌파<br>
<!-- 							<b>04</b>&nbsp;&nbsp;<b class="primary-orange">보유자산 4,600억</b>&nbsp;돌파 -->
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2020</th>
						<td width="70" colspan="2">
							<b>10</b>&nbsp;&nbsp;보유차량 22,000대&nbsp;돌파<br>
							<b>06</b>&nbsp;&nbsp;친환경차 2,800대&nbsp;돌파&nbsp;<br>
							<b>04</b>&nbsp;&nbsp;보유자산 4,000억&nbsp;돌파, 창립 20주년
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2019</th>
						<td width="70" colspan="2">
							<b>05</b>&nbsp;&nbsp;<b>보유차량 20,000대</b>&nbsp;돌파
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2018</th>
						<td width="70" colspan="2">
							<b>06</b>&nbsp;&nbsp;<b>장기렌트 효용지수</b>&nbsp;발표(3차)<br>
							<b>02</b>&nbsp;&nbsp;아마존카 새 CI 및 슬로건&nbsp;도입전개
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2017</th>
						<td width="70" colspan="2">
							<b>08</b>&nbsp;&nbsp;<b>보유차량 18,000대</b>&nbsp;돌파<br>
							<b>03</b>&nbsp;&nbsp;<b>보유자산 3,000억</b>&nbsp;돌파
						</td>
					</tr>
					<tr>
						<th width="180" scope="row">2016</th>
						<td width="70" colspan="2">
							<b>06</b>&nbsp;&nbsp;<b>장기렌트 효용지수</b>&nbsp;발표(2차)<br>
							<b>03</b>&nbsp;&nbsp;보유차량 16,000대&nbsp;돌파
						</td>
					</tr>
					<tr>
						<th width="180" scope="row"><span>2015</span></th>
						<td width="70" colspan="2">
							<b>12</b>&nbsp;&nbsp;<b>장기렌트 효용지수</b>&nbsp;발표(1차)<br>
							<b>11</b>&nbsp;&nbsp;보유차량 15,000대&nbsp;돌파<br>
							<b>05</b>&nbsp;&nbsp;전산센터 IDC 이전 및 클라우드서비스&nbsp;오픈<br>
							<b>04</b>&nbsp;&nbsp;보유차량 14,000대,&nbsp;보유자산 2,420억 돌파
						</td>
					</tr>
					<tr>
						<th scope="row">2014</th>
						<td colspan="2">
							<b>08</b>&nbsp;&nbsp;강북지점, 송파지점 오픈<br>
							<b>04</b>&nbsp;&nbsp;보유차량 12,000대, 보유자산 2,000억&nbsp;돌파<br>
							<b>03</b>&nbsp;&nbsp;울산지점 오픈<br>
							<b>01</b>&nbsp;&nbsp;수원지점 오픈
						</td>
					</tr>
					<tr>
						<th scope="row">2013</th>
						<td colspan="2">
							<b>10</b>&nbsp;&nbsp;인천지점 오픈<br>
							<b>07</b>&nbsp;&nbsp;강남지점, 대구지점, 광주지점 오픈<br>
							<p style="text-indent:30px;">보유차량 10,000대, 보유자산 1,631억&nbsp;돌파</p>
							<b>02</b>&nbsp;&nbsp;보유차량 9,000대, 보유자산 1,424억&nbsp;돌파
						</td>
					</tr>
					<tr>
						<th scope="row">2012</th>
						<td colspan="2">
							<b>07</b>&nbsp;&nbsp;보유차량  8,000대, 보유자산 1,303억&nbsp;돌파<br>
							<b>06</b>&nbsp;&nbsp;월렌트 영업개시<br>
							<b>02</b>&nbsp;&nbsp;보유차량 7,000대, 보유자산 1,110억 돌파
						</td>
					</tr>
					<tr>
						<th scope="row">2011</th>
						<td colspan="2">
							<b>06</b>&nbsp;&nbsp;보유차량 6,000대, 보유자산 950억 돌파
						</td>
					</tr>
					<tr>
						<th scope="row">2010</th>
						<td colspan="2">
							<b>10</b>&nbsp;&nbsp;보유차량 5,000대, 보유자산 800억 돌파<br>
							<b> 04</b>&nbsp;&nbsp;보유차량 4,000대, 보유자산 700억 돌파, 창립 10주년
						</td>
					</tr>
					<tr>
						<th scope="row">2008</th>
						<td colspan="2"><b>04 </b>&nbsp;&nbsp;보유차량 3,000대, 보유자산 600억 돌파</td>
					</tr>
					<tr>
						<th scope="row">2007</th>
						<td colspan="2">
							<b>05</b>&nbsp;&nbsp;대전지점 오픈<br>
							<b>04</b>&nbsp;&nbsp;보유차량 2,000대, 보유자산 400억 돌파
						</td>
					</tr>
					<tr>
						<th scope="row">2005</th>
						<td colspan="2">
							<b>12</b>&nbsp;&nbsp;부산지점 오픈<br>
							<b>06</b>&nbsp;&nbsp;홈페이지에 재리스 실시간 견적시스템 운영
						</td>
					</tr>
					<tr>
						<th scope="row">2004</th>
						<td colspan="2">
							<b>04 </b>&nbsp;&nbsp;체계화된 재리스 상품 운영 개시
						</td>
					</tr>
					<tr>
						<th scope="row">2003</th>
						<td colspan="2">
							<b>08</b>&nbsp;&nbsp;오프리스(off lease)차량 온라인판매 시작
						</td>
					</tr>
					<tr>
						<th scope="row">2002</th>
						<td colspan="2">
							<b>06</b>&nbsp;&nbsp;그룹계열사 6개 렌터카사를 제외 렌트카업계 1위 (보유대수/거래업체수/자산규모 등)<br>
							<b>01</b>&nbsp;&nbsp;장기렌트, 오토리스 겸업회사로 발전
						</td>
					</tr>
					<tr>
						<th scope="row">2001</th>
						<td colspan="2">
							<b>07</b>&nbsp;&nbsp;신설중소기업의 보증인 입보면제를 일반화함
						</td>
					</tr>
					<tr>
						<th scope="row">2000</th>
						<td colspan="2">
							<b>09</b>&nbsp;&nbsp;실시간 장기대여 견적가능 사이트 오픈 (https://www.amazoncar.co.kr)<br>
							<b>07</b>&nbsp;&nbsp;장기렌트 전문기업으로 출발
						</td>
					</tr>
				</tbody>
			</table>
	    </div>	    
	    <!-- CEO 인사말 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="greeting">
	    	<h2 class="company-title">
				아마존카 고객 여러분 안녕하세요?<br>
				<span class="primary">자동차리스/장기렌트 전문회사 아마존카입니다.</span>
			</h2>
			<div class="company-detail">
			<c:forEach items="${info_date}" var="infoList">
				<%-- <c:if test="${infoList=='hp_var1'}">
				</c:if> --%>
					<input type="hidden" id="a_j" value="${info_date}">
			</c:forEach>				
				<p>
					아마존카는 국내 자동차대여업계(렌터카 + 자동차리스)의 선두주자로서 매출액 및 보유대수로 볼 때 <span class="primary">비그룹사 중 당당히 업계 1위</span>
					(<span class="curYear"></span>년 
					<span class="curMonth"></span>월 기준 : 
					보유자산 <fmt:formatNumber value="${info_asset}" pattern="#,###"/>억, 
					보유대수 <fmt:formatNumber value="${info_car}" pattern="#,###"/>대)를 유지하고 있습니다.
					창업 이후 ${info_continue_year + 1}년이라는 짧은 기간에 이렇게 빠른 성장세를 보일 수 있었던 이유는 그동안 소비자의 NEEDS에 맞는 상품을 앞서 개발하고,
					원가절감 노력을 통해 저렴한 가격에 상품을 공급해왔기 때문이라고 자부합니다.
				</p>
			
				<p>
					최근 저성장시대의 도래와 산업의 고도화, IT 기술발전 등의 이유로 ‘소유(ownership)’보다는 ‘사용(usage)’을 중시하는
					‘공유경제(Sharing Economy)’의 소비문화가 확산되고 있습니다.
					이러한 흐름에 힘입어 자동차 소비문화도 내 명의의 차를 소유하는 것보다는 <span class="primary">어떤 차를 얼마만큼 저렴하고 편리하게 사용하는지</span>를 더 중요시하는 흐름으로 변화하고 있습니다.
					최근 몇 년 사이에 장기렌터카 시장이 기존 법인과 사업자 중심에서 개인으로 확대되면서 급성장세를 보이고 있는 것도 이 같은 흐름과 무관하지 않습니다.	
				</p>	
				<p>
					이러한 상황에서 정말 중요한 것은 <span class="primary">소비자가 원하는 차를 편리하고 저렴하게 탈 수 있도록 시스템을 제대로 구축</span>하는 일입니다.
					혹자는 자동차 대여사업이 단순하여 연구할게 별로 없다고 이야기할지도 모르겠습니다. 그러나 아마존카는 그렇게 생각하지 않습니다.
					아마존카는 소비자가 자신이 원하는 차를 더욱 편리하고 저렴하게 이용할 수 있도록 시스템 개선을 위해 항상 연구하고 노력하는 기업이기 때문입니다.
					소비자가 <span class="primary">내 차보다 더 내 차같다고</span> 느낄 때까지 노력하겠습니다.	
				</p>
				<img src="/resources/images/img_company02.png" style="float:right;" />
			</div>
	    </div>
	   	<!-- 아마존카 고객 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="customer">
	    	<h2 class="company-title">
	    		<span class="primary-orange">아마존카를 이용하는 고객은 현재 1만6천여 업체에 달하며,</span><br>
				주요 기업과 기관의 이용이 꾸준히 증가하고 있습니다.
	    	</h2>
	    	<div style="position:relative; height:500px; width: 650px; left:24%;" >
	    		<div style="position:absolute;">
	    			<img src="/resources/images/graph_2017.png" width="650px;" >
	    		</div>
				<div style="position:absolute; left:77%; top:14%; background-color:#f60c0c; font-size:20px; color:white; width:80px; font-weight:bold;"> 
					<fmt:formatNumber value="${info_client}" pattern="#,###"/>
				</div>				
				<div style="position:absolute; left:74%; top:20%; background-color:red; font-size:10px; color:white;"> 
					<span class="curYear"></span>년 <span class="curMonth"></span>월 기준 계약업체수 
					<!-- <span >2018</span>년 <span>9</span>월 기준 계약업체수  -->
				</div>
				<div style="position:absolute; left:79%; top:86.5%; font-size:10px; background-color:#f6f6f6; width:50px; "> 
					<span class="curYear"></span>.<span class="curMonth"></span> 
					<!-- <span >2018</span>.<span>09</span>  -->
				</div>				
			</div>
	    	<!-- <img src="/resources/images/graph_2017.png" width="650px;"><br> -->
	    	※ <span class="curYear"></span>년 <span class="curMonth"></span>월 <span class="curDay"></span>일 기준 현재 
	    	<!-- ※ <span >2018</span>년 <span>9</span>월 <span>1</span>일 현재  -->
	    	<fmt:formatNumber value="${info_client}" pattern="#,###"/> 업체에서 아마존카 장기대여를 이용하고 있습니다.  	
	    </div>
	    <!-- 사회공헌 활동 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="social">
	    	<h2 class="company-title">
	    		아마존카의 사회공헌에 대한 기본 철학은<br>
				<span class="primary-orange">'상생의 정신'</span>을 바탕으로 합니다.
	    	</h2>
	    	<div class="company-detail">
	    		<p>
	    			<span class="glyphicon glyphicon-grain"></span>
	    			아마존카의 사회공헌에 대한 기본적인 철학은 인간미와 도덕성을 바탕으로 인류사회 발전에 기여한다는 '상생의 정신'입니다.
	    		</p>
	    		<p>
	    			<span class="glyphicon glyphicon-grain"></span>
	    			 뛰어난 경영실적을 토대로 투명경영, 사회공헌, 서비스 혁신 등의 분야에서 지속적인 노력을 기울이고 있으며,
	    			 기업가치와 함께 사회가치를 소중히 여겨 다양한 후원 및 봉사활동을 통해
	    			 사회 구성원들에게 존경받을 수 있는 기업이 되기 위한 나눔경영을 실천하고 있습니다.
	    		</p>
	    		<p>
	    			<span class="glyphicon glyphicon-grain"></span>
	    			특히, 사회단체 지원활동을 통해 '좋은 기업', '존경받는 기업'이 되기 위한 노력에 힘써
	    			지역사회와 함께 하고 인류사회에 공헌할 것을 다짐합니다.
	    		</p>
	    		<p class="text-center">
	    			<img src="/resources/images/contribute01.png"/>&nbsp;&nbsp;
	    			<img src="/resources/images/contribute02.png"/>&nbsp;&nbsp;
	    			<img src="/resources/images/contribute03.png"/>&nbsp;&nbsp;
	    			<img src="/resources/images/contribute04.png"/>
	    		</p>
	    	</div>
	    </div>
	    <!-- 인재상 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="human">
	    	<h2 class="company-title">
	    		아마존카<span style="font-family:Arial">人</span>은 항상 <span class="primary">"얼마나 바쁜가?"</span>보단 <span class="primary">"무엇에 바쁜가?"</span>에<br> 
				대한 가치있는 질문과 함께 사고하고 행동합니다.<br><small>(오프라 윈프리 인용)</small>
	    	</h2><br>
	    	<img src="/resources/images/img_person.png"/>
	    </div>	    
	    <!-- 윤리경영 -->
	    <div role="tabpanel" class="tab-pane company-tab-panel" id="ethics">
	    	<h2 class="company-title">
	    		<span class="primary">정직과 신뢰의 기업문화를 만들어가고 있는 아마존카는</span><br>
				다음과 같은 부정행위를 하지 않습니다.
	    	</h2><br>
	    	<div class="company-detail"  style="width:500px; height:350px; line-height:40px; font-size:17px;">
	    		<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;거래업체와의 뇌물(금품포함) 및 향응 수수<br>
				<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;거래업체 및 임직원간 금전거래<br>
				<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;회사공금의 횡령 및 절도, 사리도모<br>
				<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;회사정보 및 개인정보 유출에 따른 정보보호 위법행위<br> 
				<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;근무기강 관련 사항(성희롱, 폭언)
	    	</div>
	    </div>	    
   </div>
</t:genericpage>