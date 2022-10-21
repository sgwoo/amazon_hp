<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Modal -->
<div class="modal fade" id="info-modal" tabindex="-1" role="dialog" aria-labelledby="info-modal" aria-hidden="true">
	<div class="modal-dialog">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title" id="myModalLabel">상품 개요</h4>
	     	</div>
	     	<div class="modal-body">
		        <table class="table table-bordered modal-table">
		        	<colgroup>
		        		<col width="15%"/>
		        		<col width="15%"/>
		        		<col width="70%"/>
		        	</colgroup>
		        	<tr>
		        		<th rowspan="2">장기렌트</th>
		        		<td class="text-center" name="1">일반식</td>
		        		<td name="1">
		        			<ul>
		        				<li>정비를 포함한 일체의 유지관리 Full Service 제공</li>
								<li>별도의 추가비용 없이 유류비만 납입</li>
								<li>'허', '하', '호' 번호 사용</li>
								<li>LPG차량 이용가능</li>
		        			</ul>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td class="text-center" name="2">기본식</td>
		        		<td name="2">
		        			<ul>
		        				<li>
		        					정비서비스를 제외한 등록, 자동차세, 보험료 납부,<br/>
									사고처리 및 대차서비스 등 제공
								</li>
								<li>저렴한 대여료, 계약 종료 후 매입옵션 제공</li>
								<li>'허', '하', '호' 번호 사용</li>
								<li>LPG차량 이용가능</li>
		        			</ul>
		        		</td>
		        	</tr>
		        </table>
		        <br/>
		        <table class="table table-bordered modal-table">
		        	<colgroup>
		        		<col width="15%"/>
		        		<col width="15%"/>
		        		<col width="70%"/>
		        	</colgroup>
		        	<tr>
		        		<th rowspan="2">자동차리스</th>
		        		<td name="3" class="text-center">일반식</td>
		        		<td name="3">
		        			<ul>
		        				<li>정비를 포함한 일체의 유지관리 Full Service 제공</li>
								<li>별도의 추가비용 없이 유류비만 납입</li>
								<li>일반 차량번호 사용</li>
		        			</ul>
		        		</td>
		        	</tr>
		        	<tr>
		        		<td name="4" class="text-center">기본식</td>
		        		<td name="4">
		        			<ul>
		        				<li>
		        					정비서비스를 제외한 등록, 자동차세, 보험료 납부,<br/>
									사고처리 및 대차서비스 등 제공
								</li>
								<li>저렴한 대여료, 계약 종료 후 매입옵션 제공</li>
								<li>일반 차량번호 사용</li>
		        			</ul>
		        		</td>
		        	</tr>
		        </table>
	   		</div>
	    	<div class="modal-footer">
	       		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	    	</div>
		 </div>
	</div>
</div>