function enter(event) {	
		var key = event.key || event.keyCode;
		
		if(key == 'Enter' || key == 13){
			var medicalNameValue = $.trim($("#medicalName").val());
			var area1 = sessionStorage.getItem('myLocationArea1');
			var area2 = sessionStorage.getItem('myLocationArea2');
			
			if(medicalNameValue != ""){
				$.ajax({
					url:'medicalSearchResult',
					data: {
						medicalName:medicalNameValue,
						medicalLocationArea1 : area1,
						medicalLocationArea2 : area2
					},
					success: function(x){
						$('#medicalSearchResult').html(x)
					}
				}) // AJAX
			} // if - medicalNameValue
		}		
} // enter()

$(function() {
	$('#medicalName').on('keyup', event => enter(event));
	$('#searchBtn').on('click', function() {
		var medicalNameValue = $.trim($("#medicalName").val());
		var area1 = sessionStorage.getItem('myLocationArea1');
		var area2 = sessionStorage.getItem('myLocationArea2');
		
		if(medicalNameValue != ""){
			$.ajax({
				url:'medicalSearchResult',
				data: {
					medicalName:medicalNameValue,
					medicalLocationArea1 : area1,
					medicalLocationArea2 : area2
				},
				success: function(x){
					$('#medicalSearchResult').html(x)
				}
			}) // AJAX
		} else{
			$.ajax({
				url:'medicalSearchResult',
				success: function(x){
					$('#medicalSearchResult').html(x)
				}
			}) // AJAX
		}
	})
})

function info(value) {
	$(function() {
		$.ajax({
			url:'medicalInfo',
			data: {
				medicalId:value
			},
			success: function(x){
				$('#medicalSearchResultInfo').html(x)
				$('#medicalSearchResultInfo').toggle('#medicalSearchInfo')
				$('#medicalSearchResultInfo').css({"display":"flex", "flex-direction":"column", "justify-content":"center"})
			}
		}) // AJAX
	})
}

function scrollDown() {
	var location = document.documentElement.querySelector(".count-list").offsetTop;
	window.scrollTo({top:location, behavior:'smooth'})
}

