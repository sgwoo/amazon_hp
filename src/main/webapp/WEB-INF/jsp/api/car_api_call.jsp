<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<t:genericpage>
<script src="/resources/libs/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/webjars/jquery-validation/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="/resources/stylesheets/module.css" />
<style>
.errClass {
	padding-left: 10px;
}
label#agree-error {
	width: 350px !important;
	max-width: 350px !important;
}
</style>
<script>
$(function() {
	
	$('#submitBtn').on('click', function() {
		
		var data = {}
		var result;
		
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			async: false,
			data:JSON.stringify(data),
			url:'/carApi/carNumberCallback',
			type:'POST',
			success:function(response){
				result = response.data;
				alert(result);
			},
			error:function(request, status, error){
				result = response.message;
				alert(result);
			}
		});
	})

});
</script>
	<form class="feedback" id="fdbFrm" method="post">
		<div class="text-center">
			<input type="button" name="submitBtn" id="submitBtn" class="btn btn-success btn-lg" value="요청"/>
		</div>
	</form>	
</t:genericpage>