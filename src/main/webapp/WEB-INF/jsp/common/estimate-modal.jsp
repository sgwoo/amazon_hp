<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="detail-modal" tabindex="-1" role="dialog" aria-labelledby="detail-modal" aria-hidden="true">
	<div class="modal-dialog  modal-lg">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title" id="myModalLabel">차종 선택</h4>
	     	</div>
	     	<div class="modal-body">
		    	<table class="table modal-table" id="detailInfo">
		    		<colgroup>
		    			<col width="30%"/>
		    			<col width="25%"/>
		    			<col width=""/>
		    			<col width="20%"/>
		    		</colgroup>
		    		<tr class="header">
		    			<th>차종</th>
		    			<th>차량가격</th>
		    			<th id="duty_free_opt_count" style="display: none;">개별소비세 면세차가</th>
		    			<th>사양보기</th>
		    		</tr>
		    	</table>		    		    	
	   		</div>
	    	<div class="modal-footer">
	    		<div id="duty_free_opt_text" style="text-align: left; display: none;">
		    		※ 차량가격 : 제조사 가격표와 동일하게 표기<br>
					&nbsp;-  렌터카용/장애인용 LPG 차량가격: 개별소비세 면세차가로 표기,&nbsp;&nbsp;&nbsp;일반인용 LPG 차량가격: 개별소비세 과세차가로 표기<br><br>
					
					※ 개별소비세 면세차가 : 실제 렌터카사에서 구입하는 가격으로 장기렌트 견적시 견적 기준이 되는 가격<br>
					&nbsp;- 렌터카용, 장애인용, 일반인용 LPG 차량가격이 혼재되어 있을 경우 개별소비세 면세차가로 가격을 비교해야 정확한 비교가 됩니다. 
		    	</div>
	       		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	    	</div>
		 </div>
	</div>
</div>