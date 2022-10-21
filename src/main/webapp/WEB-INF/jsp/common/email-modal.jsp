<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$('#email-btn').click(function(){
		var email = $('#email-input').val();
		var flag = emailValidation(email);
		if(flag){

			var data = {};
			data["email"] = email;
			data["estimateId"] =  $('#estimateId').val();
			data["url"] =  window.location.href;
			/* data["title"] = encodeURIComponent($('#mailTitle').val()); */
			data["title"] = $('#mailTitle').val();
			
			$.ajax({
				contentType:'application/json',
				data:JSON.stringify(data),
				url:'/print/send/email',
				type:'POST',
				success:function(data){
					alert(data);
					$('#email-modal').modal('hide');
				}
			});
			
		}else{
			return false;
		}
		printAnalytics();
		ga('send', 'event', '버튼', '클릭', ''); //구글 광고 전환 분석 함수 호출
		if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
			DaumConversionDctSv="type=W,orderID=,amount=";
			DaumConversionAccountID="G_OpAIi6S5wwBMv36T9bhQ00";
			var DaumConversionScriptLoaded=true;
			(function(){var d=document.createElement('script');d.type='text/javas'+'cript';d.src=(location.protocol=='https:'?'https':'http')+'://s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(d,s);})();
		}
	})
	
})

</script>
<div class="modal fade" id="email-modal" tabindex="-1" role="dialog" aria-labelledby="email-modal" aria-hidden="true">
	<div class="modal-dialog">
	   	<div class="modal-content">
	       	<div class="modal-header">
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	       		<h4 class="modal-title" id="myModalLabel">견적서 이메일 보내기</h4>
	     	</div>
	     	<div class="modal-body">
	     		<span>견적서를 받으실 이메일 주소를 입력해주세요</span><br/><br/>
	     		<div class="input-group">
			    	<input type="text" id="email-input" class="form-control" placeholder="ex) dev@amazoncar.com">
		    		<span class="input-group-btn">
		        		<button id="email-btn" class="btn btn-default-reverse" type="button">메일발송</button>
		      		</span>
		      		<br/>
			    </div>
	     	</div>
	     </div>
	 </div>
</div>