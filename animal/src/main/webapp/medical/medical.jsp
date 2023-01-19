<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>병원</title>

<link rel="stylesheet" href="../resources/css/medical.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="../resources/js/medical.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mcn4h7vwlk"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mcn4h7vwlk&submodules=geocoder"></script>
</head>

<body>
	<%-- <jsp:include page="../animal_header.jsp"></jsp:include> --%>

	<div id="medicalSearchResultInfo"></div>

	<div id="medicalSection">
		<div class="location-map-wrap">
			<div>
				<label> <input id="medicalName" onkeyup="enter()"
					class="medical-search" placeholder="진료소 이름을 검색해주세요.">
				</label>
			</div>

			<div class="location-wrap">
				<span id="myLocation">위치정보 수집에 동의해주세요.</span>
			</div>

			<div id="map"></div>
			<script>
				$(window).on('load', function() {
					sessionStorage.removeItem("myLocation")
					sessionStorage.setItem("myLocation", '')
				})
				
				var map = new naver.maps.Map('map', {
					center : new naver.maps.LatLng(37.5666805, 126.9784147),
					zoom : 16,
					mapTypeId : naver.maps.MapTypeId.NORMAL
				});
				
				map.setCursor('pointer');
				
				function onSuccessGeolocation(position) {
					var location = new naver.maps.LatLng(
							position.coords.latitude, position.coords.longitude);
					map.setCenter(location);
					
					var marker = new naver.maps.Marker({
						position : new naver.maps.LatLng(
								position.coords.latitude,
								position.coords.longitude),
						map : map
					});
					
					naver.maps.Service.reverseGeocode({
				        coords: new naver.maps.LatLng(position.coords.latitude, position.coords.longitude),
				    }, function(status, response) {
				        if (status !== naver.maps.Service.Status.OK) {
				            return alert('Something wrong!');
				        }

				        var result = response.v2,
				            items = result.results,
				            address = result.address; 
				       
				        $('#myLocation').html("현재 위치 : " + address.jibunAddress)
				        sessionStorage.removeItem("myLocation")
				        sessionStorage.setItem("myLocation", result.results[0].region.area1.alias)
				    });

					naver.maps.Event.addListener(map, 'click', function(e) {
					    marker.setPosition(e.coord);
					    naver.maps.Service.reverseGeocode({
					        coords: new naver.maps.LatLng(e.coord._lat, e.coord._lng),
					    }, function(status, response) {
					        if (status !== naver.maps.Service.Status.OK) {
					            return alert('Something wrong!');
					        }

					        var result = response.v2,
					            items = result.results,
					            address = result.address; 
					        $('#myLocation').html("현재 위치 : " + address.jibunAddress)
					        sessionStorage.removeItem("myLocation")
				       	 	sessionStorage.setItem("myLocation", result.results[0].region.area1.alias)
					    });
					});
				}

				function onErrorGeolocation() {
					var center = map.getCenter();
				}

				$(window).on(
						"load",
						function() {
							if (navigator.geolocation) {
								navigator.geolocation.getCurrentPosition(
										onSuccessGeolocation,
										onErrorGeolocation);
							} else {
								var center = map.getCenter();
							}
						});
				
				function searchCoordinateToAddress(latlng) {
				    naver.maps.Service.reverseGeocode({
				        coords: latlng,
				        orders: [
				            naver.maps.Service.OrderType.ADDR,
				            naver.maps.Service.OrderType.ROAD_ADDR
				        ].join(',')
				    }, function(status, response) {
				        if (status === naver.maps.Service.Status.ERROR) {
				            return alert('Something Wrong!');
				        }

				        var items = response.v2.results,
				            address = '',
				            htmlAddresses = [];

				        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
				            item = items[i];
				            address = makeAddress(item) || '';
				            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

				            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
				        }

				    });
				}
				
				function makeAddress(item) {
				    if (!item) {
				        return;
				    }

				    var name = item.name,
				        region = item.region,
				        land = item.land,
				        isRoadAddress = name === 'roadaddr';

				    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

				    if (hasArea(region.area1)) {
				        sido = region.area1.name;
				    }

				    if (hasArea(region.area2)) {
				        sigugun = region.area2.name;
				    }

				    if (hasArea(region.area3)) {
				        dongmyun = region.area3.name;
				    }

				    if (hasArea(region.area4)) {
				        ri = region.area4.name;
				    }

				    if (land) {
				        if (hasData(land.number1)) {
				            if (hasData(land.type) && land.type === '2') {
				                rest += '산';
				            }

				            rest += land.number1;

				            if (hasData(land.number2)) {
				                rest += ('-' + land.number2);
				            }
				        }

				        if (isRoadAddress === true) {
				            if (checkLastString(dongmyun, '면')) {
				                ri = land.name;
				            } else {
				                dongmyun = land.name;
				                ri = '';
				            }

				            if (hasAddition(land.addition0)) {
				                rest += ' ' + land.addition0.value;
				            }
				        }
				    }

				    return [sido, sigugun, dongmyun, ri, rest].join(' ');
				}
				
				function hasArea(area) {
				    return !!(area && area.name && area.name !== '');
				}

				function hasData(data) {
				    return !!(data && data !== '');
				}

				function checkLastString (word, lastString) {
				    return new RegExp(lastString + '$').test(word);
				}

				function hasAddition (addition) {
				    return !!(addition && addition.value);
				}
				
			</script>
		
		</div>
		<div id="medicalSearchResult"></div>
	</div>

	<jsp:include page="medicalFooter.jsp"></jsp:include>

	<script type="text/javascript" src="../resources/js/medical.js"></script>
</body>
</html>