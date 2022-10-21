<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="monthrent-modal" tabindex="-1" role="dialog" aria-labelledby="monthrent-modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title" id="myModalLabel">월렌트 구비 서류</h4>
	     	</div>
	     	<div class="modal-body" id="document-body">
	     		<h4>계약 준비 시 필요한 서류와 계약서 작성 시 필요한 준비물은 아래와 같습니다.</h4>
		        <h4 style="padding-top: 15px;">일반 개인</h4>
		        <table class="modal-table table table-bordered">	
		        	<colgroup>
		        		<col width="15%"/>
		        		<col width="15%"/>
		        		<col width="*"/>
		        	</colgroup>
		        	<tr>
		        		<th rowspan="2">본인 방문</th>
		        		<th>본인만 운전</th>
		        		<td>본인명의 신용카드(체크카드 불가), 운전면허증<!-- , 자동이체 계좌번호 --></td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자(배우자)<br/>있는 경우</th>
		        		<td>본인명의 신용카드(체크카드 불가), 운전면허증<!-- , 자동이체 계좌번호 -->, 추가운전자(배우자) 면허증 사본<!-- , 가족관계 증명서류 --></td>
		        	</tr>
		        </table>
		        <h4 style="padding-top: 15px;">개인 사업자</h4>
		        <table class="modal-table table table-bordered">
		        	<colgroup>
		        		<col width="15%"/>
		        		<col width="15%"/>
		        		<col width="*"/>
		        	</colgroup>
		        	<tr>
		        		<th rowspan="2">본인 방문</th>
		        		<th>본인만 운전</th>
		        		<td>본인명의 신용카드(체크카드 불가), 운전면허증, 사업자 사본<!-- , 자동이체 통장사본 --></td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자<br/>있는 경우</th>
		        		<td>본인명의 신용카드(체크카드 불가), 운전면허증, 사업자 사본<!-- , 자동이체 통장사본 -->, 추가 운전자 [건강보험 자격확인서], 추가 운전자 면허증 사본</td>
		        	</tr>
		        	<tr>
		        		<th>직원 방문</th>
		        		<th>계약자 운전자 여부<br/>상관 없이</th>
		        		<td>개인사업자 명의 신용카드(체크카드는 불가), 계약자(개인사업자)운전면허증 사본, 사업자 사본<!-- , 자동이체 통장사본 -->, 운전자 [건강보험 자격확인서], 운전자 면허증</td>
		        	</tr>
		        </table>
		        <h4 style="padding-top: 15px;">법인</h4>
		        <table class="modal-table table table-bordered">
		        	<colgroup>
		        		<col width="15%"/>
		        		<col width="15%"/>
		        		<col width="*"/>
		        	</colgroup>
		        	<!-- <tr>
		        		<th rowspan="2">대표자 방문</th>
		        		<th>본인만 운전</th>
		        		<td>법인명의 신용카드(체크카드 불가), 대표이사 운전면허증, 사업자 사본, 자동이체 통장사본</td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자<br/>있는 경우</th>
		        		<td>법인명의 신용카드(체크카드 불가), 대표이사 운전면허증, 사업자 사본, 자동이체 통장사본, 추가 운전자 [건강보험 자격확인서], 추가 운전자 면허증 사본</td>
		        	</tr>
		        	<tr>
		        		<th rowspan="2">직원 방문</th>
		        		<th>방문자만 운전</th>
		        		<td>법인명의 신용카드(체크카드 불가), 사업자 사본, 자동이체 통장사본, 방문자 [건강보험 자격확인서], 방문자 운전자 면허증</td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자<br/>있는 경우</th>
		        		<td>법인명의 신용카드(체크카드 불가), 사업자 사본, 자동이체 통장사본, 방문자 [건강보험 자격확인서], 방문자 운전면허증, 추가 운전자 [건강보험 자격확인서], 추가운전자 운전면허증 사본
		        	</tr> -->
		        	<tr>
		        		<th rowspan="2">대표자 방문</th>
		        		<th>본인만 운전</th>
		        		<!-- <td>기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) [체크카드 불가], 대표이사 운전면허증, 사업자 사본</td> -->
		        		<td>기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 대표자 개인카드 [체크카드 불가], 대표이사 운전면허증, 사업자 사본</td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자<br/>있는 경우</th>
		        		<td>기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 대표자 개인카드 [체크카드 불가], 대표이사 운전면허증, 사업자 사본, 추가운전자 [건강보험 자격확인서], 추가운전자 면허증 사본</td>
		        	</tr>
		        	<tr>
		        		<th rowspan="2">직원 방문</th>
		        		<th>방문자만 운전</th>
		        		<td>기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드 [체크카드 불가], 사업자 사본, 방문자 [건강보험 자격확인서], 방문자 운전면허증</td>
		        	</tr>
		        	<tr>
		        		<th>추가 운전자<br/>있는 경우</th>
		        		<td>기명식 법인카드(카드에 이용자 개인 이름이 찍혀있는 법인카드) 또는 법인 임직원 개인카드 [체크카드 불가], 사업자 사본, 방문자 [건강보험 자격확인서], 방문자 운전면허증, 추가운전자 [건강보험 자격확인서], 추가운전자 면허증 사본
		        	</tr>
		        </table>
		        <small>※ [건강보험 자격확인서]는 개인 공동인증서만 있으면 국민건강보험공단사이트에서 손쉽게 출력이 가능합니다.</small>
		        <h4 style="padding-top: 15px;">직원이 차를 가지러 올 경우 계약서 작성방법</h4>
				<div class="panel panel-default">
					<div class="panel-body">
						<ul style="padding-left: 20px;">
							<li>계약자란에 "회사 상호" + 대리인의 싸인</li>
							<li>대리인란에 직위, 생년월일, 이름 + 싸인</li>
						</ul>
						※ 법인의 경우에도 법인인감증명서 / 법인등기부등본 / 위임장 / 법인도장날인을 받지 않고, 차를 가지러 온 대리인의 신분증과 자필서명으로 대신합니다.
					</div>
				</div>		        
	   		</div>
	    	<div class="modal-footer">
		    	<button type="button" class="btn btn-default-reverse print-btn">인쇄하기</button>
	       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	    	</div>
		 </div>
	</div>
</div>