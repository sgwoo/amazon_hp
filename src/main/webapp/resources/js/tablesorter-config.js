//차명 필터
$.tablesorter.filter.bindSelect=function(table,el,col){
    var vals=table.find("tbody tr td:nth-child("+(col+1)+")").map(function(){
    	var obj = $(this).text().replace("친환경차","").trim(); //친환경차 라벨은 제거하고 수집한다
    	var comp = $(this).find(".list-comp-nm").val();
    	if(typeof comp !== 'undefined'){
    		var compName = "[" + $(this).find(".list-comp-nm").val() + "]"; //회사명을 앞에 붙인다
        	obj = compName + obj;
    	}
        return obj;
    }).get().sort().reverse()
    vals = $.grep(vals, function(v, k){
        return $.inArray(v ,vals) === k;
    });
    el.append($.map(vals,function(v){
        return new Option(v)
    }))
    el.change(function(){
        var cols=[]
        if($(this).val().indexOf("]") >= 0){
        	cols[col] = $(this).val().split("]")[1].trim();	
        }else{
        	cols[col] = $(this).val().trim();
        }
        table.trigger('search', [cols]);
    })
}

$(document).ready(function(){

	// 돈 관련 custom Parser
	$.tablesorter.addParser({ 
	    id: 'price',
	    is: function(s) { 
	        return false; 
	    }, 
	    format: function(s) {
	        return s.replace(/,/g,'').replace(/-/g,'');
	    }, 
	    type: 'numeric' 
	}); 

	// 주행거리 관련 custom Parser
	$.tablesorter.addParser({ 
	    id: 'dist',
	    is: function(s) { 
	        return false; 
	    }, 
	    format: function(s) {
	    	return s.replace('km','').replace(/,/g,'');
	    }, 
	    type: 'numeric' 
	}); 

	// 신차등록일 관련 custom Parser
	$.tablesorter.addParser({ 
	    id: 'date',
	    is: function(s) { 
	        return false; 
	    }, 
	    format: function(s) {
	    	return s.replace('년','').replace('월','');
	    }, 
	    type: 'numeric' 
	}); 

	// 최대계약개월수 관련 custom Parser
	$.tablesorter.addParser({ 
	    id: 'maxMon',
	    is: function(s) { 
	        return false; 
	    }, 
	    format: function(s) {
	    	var price = s.split("(")[0].replace(/,/g,'');
	    	return price;
	    }, 
	    type: 'numeric' 
	}); 
	
	

})


