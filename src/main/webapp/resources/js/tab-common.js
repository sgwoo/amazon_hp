$(document).ready(function(){
	
	/*	공통	*/
	// Javascript to enable link to tab
	var hash = document.location.hash;
	var prefix = "tab_";
	if (hash) {
	    $('.nav-tabs a[href="'+hash.replace(prefix,"")+'"]').tab('show');
	} 

	// Change hash for page-reload
	$('.nav-tabs a').on('shown', function (e) {
	    window.location.hash = e.target.hash.replace("#", "#" + prefix);
	});
	
	/*	장기렌트 효용지수	*/
	$("select[name='yearSelectBox']").change(function(){
		var year = $(this).find("option:selected").val(); 
		var id = $('.nav-tabs li.active > a').attr("href").replace("#","");
		var gubun = $('.amazon-tabs div.active').parent("a").attr("href").split("/")[3];
		window.location.href = "/utility/"+year+"/"+gubun+"#"+prefix+id;		
	})
})