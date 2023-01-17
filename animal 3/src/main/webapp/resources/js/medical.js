function enter() {
	if(window.event.keyCode == 13){
		var medicalNameValue = $.trim($("#medicalName").val());
		var myLocation = sessionStorage.getItem('myLocation');
		if(medicalNameValue != ""){
			$.ajax({
				url:'medicalSearchResult',
				data: {
					medicalName:medicalNameValue,
					medicalLocation:myLocation
				},
				success: function(x){
					$('#medicalSearchResult').html(x)
					$('#medicalSection').css("height", "170%")
				}
			}) // AJAX
		} // if - medicalNameValue	
	} // if - keyCode 13
} // enter()

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
				$('#medicalSection').addClass('medical-info-dim')
			}
		}) // AJAX
	})
}

function scrollDown() {
	var location = document.documentElement.querySelector(".count-list").offsetTop;
	window.scrollTo({top:location, behavior:'smooth'})
}