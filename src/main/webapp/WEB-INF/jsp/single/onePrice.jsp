<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<t:genericpage>
<link rel="stylesheet" href="/resources/stylesheets/module.css"/>
<div class="oneprice-module">
	<h2 class="primary">합리적인 가격정책</h2>
	
	<h3>
		<span class="primary-orange">정직</span>하고 <span class="primary-orange">신뢰</span>받는 아마존카<br/>
		<small>다양한 상품구성, 간편한 신용심사, 최상의 정비서비스로 고객님께 어울리는 최적의 상품을 제공하겠습니다.</small>
	</h3>
	<br/>
	<br/>
	<h2 class="primary">내게 맞는 상품은?</h2>
	<div class="row">
		<div class="col-md-6 oneprice-sub-desc">
			<h4>장기렌트</h4>
			<p>
				고객이 원하는 차량을 아마존카가 구매하고, 고객은 해당 차량을 저렴한 비용에 내 차처럼 이용하는 서비스입니다.
			</p>
			<br>
			<p>
				<a href="/rent/desc" target="_self"><span class="label label-default">상세 페이지 가기</span></a>
				<a href="/rent/domestic" target="_self"><span class="label label-success">가격 알아보기</span></a>
			</p>
		</div>
		<div class="col-md-6 oneprice-sub-desc">
			<h4>리스</h4>
			<p>
				장기렌트와 마찬가지로 차량은 아마존카가 구매하고 고객은 저렴하게 내 차처럼 이용하는 서비스로, '허', '하', '호'가 아닌 일반 자가용 번호를 이용할 수 있다는 차이가 있습니다.
				아마존카는 렌터카 겸업 업체로서 일반 캐피탈사의 리스에 비해 우수한 품질의 정비 및 대차서비스를 제공하고 있습니다.
			</p>
			<p>
				<a href="/lease/desc" target="_self"><span class="label label-default">상세 페이지 가기</span></a>
				<a href="/lease/domestic" target="_self"><span class="label label-success">가격 알아보기</span></a>
			</p>
		</div>
	</div>
	<hr/>
	<div class="row">
		<div class="col-md-6 oneprice-sub-desc">
			<h4>재렌트/재리스</h4>
			<p>
				아마존카의 기존 보유차량을 저렴한비용에 내차처럼 이용하는 서비스로서, 같은 비용으로 한 등급 이상 높은 차량의 이용이 가능해집니다.
			</p>
			<p>
				<a href="/rent/secondhand/desc" target="_self"><span class="label label-default">상세 페이지 가기</span></a>
				<a href="/rent/secondhand" target="_self"><span class="label label-success">가격 알아보기</span></a>
			</p>
		</div>
		<div class="col-md-6 oneprice-sub-desc">
			<h4>월렌트</h4>
			<p>
				1개월 단위로 이용할 수 있는 렌트 상품입니다.
				<!-- 아마존카의 기존 보유차량을 최소 1개월 이상의 기간 동안 내 차처럼 이용 하는 서비스입니다. --> 
				<!-- 최초 계약기간이 끝나기 전에 월 단위로 연장계약을 하는 경우 최초 월 대여료에서 3%의 할인혜택을 드립니다. -->
			</p>
			<br>
			<br>
			<p>
				<a href="/rent/month/desc" target="_self"><span class="label label-default">상세 페이지 가기</span></a>
				<a href="/rent/month" target="_self"><span class="label label-success">가격 알아보기</span></a>
			</p>
		</div>
	</div>
</div>
</t:genericpage>