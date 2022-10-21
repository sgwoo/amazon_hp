<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!----------------------------------- Modal Area ------------------------------------------->

<!-- Car History  -->
<div class="modal fade" id="utility-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h3 class="modal-title" id="myModalLabel">장기렌트 효용지수란?</h3>
			</div>
			<div class="modal-body">
				<h4 style="line-height:27px;">
					<span>장기렌트 <b class="primary-orange">효용지수는 수치가 높을수록 소비자에게 득</b>이 되고,<br/> 
					낮으면 소비자에게 다소 손해라는 것을 소비자가 쉽게 알 수 있도록  하는 지표입니다.</span>
				</h4><br>
				<h4>효용지수의 의미</h4>
				<p class="desc-paragraph">
					· <b>효용지수가 높으면</b> 동급차량중에서 차량가격대비 월대여료가 낮은 차종이라는 의미로 <b>소비자에게 유리한 차종입니다.</b><br/>
					· 중고차 <b>잔가율이 높은 차종이</b> 월대여료가 낮기 때문에 <b>효용지수가 높습니다.</b><Br/>
					<small>
						※ 중고차 잔가율이 장기렌트 효용지수에 가장 많은 영향을 주지만, 보험료 / 취득세 / 자동차세 / 관리비용 / 이자율 등도<br/> 
						&nbsp;월대여료에 영향을 주므로 중고차 잔가율이 장기렌트 효용지수의 유일한 변수는 아닙니다
					</small><br/>
					·<b> 장기렌트 효용지수가 10점이 높으면, 동일한 차량가격일 때 월대여료가 10% 정도 저렴하다는 의미입니다.</b>
				</p><br/>
				<h4>효용지수 산출 과정</h4>
				<p class="desc-paragraph">
				· 차량가격을 아마존카 장기렌트 3년 대여료로 나눈 수치를 바탕으로 장기렌트 효용지수를 산출합니다.<br>
				· 이렇게 계산한 값의 차급별 평균을 100으로 보았을 때 해당 차종의 값이 어느 정도 수준인지를 산출한 값을 장기렌트 효용지수라 합니다.<br><br>
				</p>
				<h5><br><small><span class="glyphicon glyphicon-ok"></span></small> <span><b>장기렌트 효용지수(아마존카 Index) 산출식</b></span></h5>
				① 각 차종의 차가(할인후 차가)를 월대여료로 나눕니다. [ C = 차량가격 ÷ 월대여료 ]<br/>
				② 위 값(C)의 차급 평균을 100이라고 하였을 때 각 차종의 상대적인 값을 장기렌트 효용지수라고 합니다.
				<div class="panel panel-default">
					<div class="panel-body text-center">
						<span> 장기렌트 효용지수(아마존카 Index) = ( 각 차종 C값 ÷ C값의 차급 평균 ) × 100</span>
					</div>
				</div>
				※ 구체적인 계산과정 및 결과는 각 차급별 효용지수 테이블에 자세히 나와 있습니다.<br><br>
				
				<h4>기타</h4>
				<p class="desc-paragraph">
					· 반기별로 발표하므로 차종별 효용지수 추이를 비교해보는 것도 차종 선택에 도움이 될 수 있습니다.<br>
					· 장기렌트 효용지수는 자동차리스나 신차구입시에도 유용하게 이용할 수 있습니다.<br>
					- 장기렌트 월대여료에 영향을 미치는 중고차 잔가율/보험료/취득세/자동차세 등은 자동차리스나 신차구입 이용시에도 비슷하게<br>
					&nbsp;&nbsp;적용되는 것들이므로, 장기렌트 효용지수가 높은 차종이 자동차리스나 신차구입시에도 비용상 유리합니다.<br>
				</p>
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>