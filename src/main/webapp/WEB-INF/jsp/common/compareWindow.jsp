<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/stylesheets/compare.css"/>
<!-- 비교견적 버튼 -->
<div class="compare-action-btn" style="display:none;position:absolute;">
	<img src="/resources/images/compare_plus_btn2.png"/><br/>
	<span>비교견적담기</span>
</div>    
<!-- 비교견적 창 -->
<div class="compare-window">
	<a href="javascript:toggleCompareWindow();">
		<img name="compareWindowBtn" src="/resources/images/compare_open_btn.png" class="compare-btn" />
		<img name="compareWindowBtn" src="/resources/images/compare_close_btn.png" class="compare-btn open" style="display:none;" />
	</a>
	<div class="container">
		<h3>관심차 비교견적(현재 선택 <span id="compareCnt">0</span>)&nbsp;<small>신차 및 재렌트/재리스 차량 비교 견적이 가능합니다(최대 4대)</small></h3>
		<div class="compare-boxes" style="display:none;">
			<div id="compare-box1" class="compare-box"></div>
			<div id="compare-box2" class="compare-box"></div>
			<div id="compare-box3" class="compare-box"></div>
			<div id="compare-box4" class="compare-box" style="margin-right:0px;"></div>
		</div>
		<button type="button" class="compare-submit" style="display:none;">비교 견적 보기</button>
	</div>
	<!-- 견적 정보  -->
	<div class="detail-container container" style="display:none;">
		<table class="compare-table table-bordered table table-condensed">
			<colgroup>
				<col width="10%"/>
				<col width="14%"/>
				<col width="10%"/>
				<col width="14%"/>	
				<col width="10%"/>
				<col width="14%"/>
				<col width="10%"/>
				<col width="14%"/>
			</colgroup>
			<tr>
				<th>제조사</th>
				<td><span id="compare-box1-comp-name"></span></td>
				<th>제조사</th>
				<td><span id="compare-box2-comp-name"></span></td>
				<th>제조사</th>
				<td><span id="compare-box3-comp-name"></span></td>
				<th>제조사</th>
				<td><span id="compare-box4-comp-name"></span></td>
			</tr>
			<tr>
				<th>모델연도/배기량</th>
				<td><span id="compare-box1-year"></span>&nbsp;/&nbsp;<span id="compare-box1-dpm"></span></td>
				<th>모델연도/배기량</th>
				<td><span id="compare-box2-year"></span>&nbsp;/&nbsp;<span id="compare-box2-dpm"></span></td>
				<th>모델연도/배기량</th>
				<td><span id="compare-box3-year"></span>&nbsp;/&nbsp;<span id="compare-box3-dpm"></span></td>
				<th>모델연도/배기량</th>
				<td><span id="compare-box4-year"></span>&nbsp;/&nbsp;<span id="compare-box4-dpm"></span></td>
			</tr>
			<tr>
				<th>연료/주행거리</th>
				<td><span id="compare-box1-fuel"></span>&nbsp;/&nbsp;<span id="compare-box1-dist"></span></td>
				<th>연료/주행거리</th>
				<td><span id="compare-box2-fuel"></span>&nbsp;/&nbsp;<span id="compare-box2-dist"></span></td>
				<th>연료/주행거리</th>
				<td><span id="compare-box3-fuel"></span>&nbsp;/&nbsp;<span id="compare-box3-dist"></span></td>
				<th>연료/주행거리</th>
				<td><span id="compare-box4-fuel"></span>&nbsp;/&nbsp;<span id="compare-box4-dist"></span></td>
			</tr>
			<tr>
				<th>색상</th>
				<td><span id="compare-box1-color"></span></td>
				<th>색상</th>
				<td><span id="compare-box2-color"></span></td>
				<th>색상</th>
				<td><span id="compare-box3-color"></span></td>
				<th>색상</th>
				<td><span id="compare-box4-color"></span></td>
			</tr>
			<tr>
				<th>신차 가격</th>
				<td><span id="compare-box1-carAmt"></span></td>
				<th>신차 가격</th>
				<td><span id="compare-box2-carAmt"></span></td>
				<th>신차 가격</th>
				<td><span id="compare-box3-carAmt"></span></td>
				<th>신차 가격</th>
				<td><span id="compare-box4-carAmt"></span></td>
			</tr>
			<tr>
				<th>보증금</th>
				<td><span id="compare-box1-deposit"></span></td>
				<th>보증금</th>
				<td><span id="compare-box2-deposit"></span></td>
				<th>보증금</th>
				<td><span id="compare-box3-deposit"></span></td>
				<th>보증금</th>
				<td><span id="compare-box4-deposit"></span></td>
			</tr>
			<tr>
				<th>연간약정운행거리</th>
				<td><span id="compare-box1-agreeDist"></span></td>
				<th>연간약정운행거리</th>
				<td><span id="compare-box2-agreeDist"></span></td>
				<th>연간약정운행거리</th>
				<td><span id="compare-box3-agreeDist"></span></td>
				<th>연간약정운행거리</th>
				<td><span id="compare-box4-agreeDist"></span></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="compare-detail-price-left">
						<h5>렌트 기본식</h5>
						<span id="compare-box1-RB4"></span><br/>
						<span id="compare-box1-RB3"></span><br/>
						<span id="compare-box1-RB2"></span><br/>
						<span id="compare-box1-RB1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 기본식</h5>
						<span id="compare-box1-LB4"></span><br/>
						<span id="compare-box1-LB3"></span><br/>
						<span id="compare-box1-LB2"></span><br/>
						<span id="compare-box1-LB1"></span><br/>	
					</div>
					<div class="compare-detail-price-left">
						<h5>렌트 일반식</h5>
						<span id="compare-box1-RS4"></span><br/>
						<span id="compare-box1-RS3"></span><br/>
						<span id="compare-box1-RS2"></span><br/>
						<span id="compare-box1-RS1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 일반식</h5>
						<span id="compare-box1-LS4"></span><br/>
						<span id="compare-box1-LS3"></span><br/>
						<span id="compare-box1-LS2"></span><br/>
						<span id="compare-box1-LS1"></span><br/>	
					</div>
				</td>
				<td colspan="2">
					<div class="compare-detail-price-left">
						<h5>렌트 기본식</h5>
						<span id="compare-box2-RB4"></span><br/>
						<span id="compare-box2-RB3"></span><br/>
						<span id="compare-box2-RB2"></span><br/>
						<span id="compare-box2-RB1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 기본식</h5>
						<span id="compare-box2-LB4"></span><br/>
						<span id="compare-box2-LB3"></span><br/>
						<span id="compare-box2-LB2"></span><br/>
						<span id="compare-box2-LB1"></span><br/>	
					</div>
					<div class="compare-detail-price-left">
						<h5>렌트 일반식</h5>
						<span id="compare-box2-RS4"></span><br/>
						<span id="compare-box2-RS3"></span><br/>
						<span id="compare-box2-RS2"></span><br/>
						<span id="compare-box2-RS1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 일반식</h5>
						<span id="compare-box2-LS4"></span><br/>
						<span id="compare-box2-LS3"></span><br/>
						<span id="compare-box2-LS2"></span><br/>
						<span id="compare-box2-LS1"></span><br/>	
					</div>
				</td>
				<td colspan="2">
					<div class="compare-detail-price-left">
						<h5>렌트 기본식</h5>
						<span id="compare-box3-RB4"></span><br/>
						<span id="compare-box3-RB3"></span><br/>
						<span id="compare-box3-RB2"></span><br/>
						<span id="compare-box3-RB1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 기본식</h5>
						<span id="compare-box3-LB4"></span><br/>
						<span id="compare-box3-LB3"></span><br/>
						<span id="compare-box3-LB2"></span><br/>
						<span id="compare-box3-LB1"></span><br/>	
					</div>
					<div class="compare-detail-price-left">
						<h5>렌트 일반식</h5>
						<span id="compare-box3-RS4"></span><br/>
						<span id="compare-box3-RS3"></span><br/>
						<span id="compare-box3-RS2"></span><br/>
						<span id="compare-box3-RS1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 일반식</h5>
						<span id="compare-box3-LS4"></span><br/>
						<span id="compare-box3-LS3"></span><br/>
						<span id="compare-box3-LS2"></span><br/>
						<span id="compare-box3-LS1"></span><br/>	
					</div>
				</td>
				<td colspan="2">
					<div class="compare-detail-price-left">
						<h5>렌트 기본식</h5>
						<span id="compare-box4-RB4"></span><br/>
						<span id="compare-box4-RB3"></span><br/>
						<span id="compare-box4-RB2"></span><br/>
						<span id="compare-box4-RB1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 기본식</h5>
						<span id="compare-box4-LB4"></span><br/>
						<span id="compare-box4-LB3"></span><br/>
						<span id="compare-box4-LB2"></span><br/>
						<span id="compare-box4-LB1"></span><br/>	
					</div>
					<div class="compare-detail-price-left">
						<h5>렌트 일반식</h5>
						<span id="compare-box4-RS4"></span><br/>
						<span id="compare-box4-RS3"></span><br/>
						<span id="compare-box4-RS2"></span><br/>
						<span id="compare-box4-RS1"></span><br/>
					</div>
					<div class="compare-detail-price-right">
						<h5>리스 일반식</h5>
						<span id="compare-box4-LS4"></span><br/>
						<span id="compare-box4-LS3"></span><br/>
						<span id="compare-box4-LS2"></span><br/>
						<span id="compare-box4-LS1"></span><br/>	
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
