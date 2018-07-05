<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<style>
body {
}

#nn {
	width: 800px;
	height: 50px;
}

#w {
	width: 800px;
	height: 250px;
	float: left;
	position: relative;
	text-align: center;
	border: 1px solid white;
	background: #FF88A7;
	color : white;
}

#f {
	width: 400px;
	height: 450px;
	float: left;
	border: 1px solid white;
	color: #FF5675;
}

#m {
	width: 400px;
	height: 450px;
	float: left;
	border: 1px solid white;
}

#heade {
	position: relative;
	color: #13C7A3;
}

#b {
	position: relative;
}

#eee {
	color: #148CFF;
}

#ooo {
	color: #4AB34A;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maps.google.com/maps/api/js?sensor=false"></script>
<script>
	function wdisplay(data) {
		var w = $(data).find('yweather\\:condition,condition');
		var code = w.attr('code');
		var date = w.attr('date');
		var temp = w.attr('temp');
		var text = w.attr('text');
		var result = '';

		result += '<img src="http://l.yimg.com/a/i/us/we/52/'+code+'.gif"/>';
		result += '<h3>' + date + '</h3>';
		result += '<h3>' + temp + '</h3>';
		result += '<h3>' + text + '</h3>';
		result += '<h3>Have A Good Day Darling ;-)</h3>';
		$('#w').html(result);
	};
	function fdisplay(data) {
		var f = $(data).find('yweather\\:forecast,forecast');
		var result = '';
		result += '<table>';
		$(f)
				.each(
						function(index, item) {
							var code = $(item).attr('code');
							var date = $(item).attr('date');
							var high = $(item).attr('high');
							var low = $(item).attr('low');
							var text = $(item).attr('text');
							result += '<tr><td>'
							result += '<img src="http://l.yimg.com/a/i/us/we/52/'+code+'.gif"/>';
							result += '<h3>Date: ' + date + '</h3>';
							result += '<h3>High: ' + high + '</h3>';
							result += '<h3>Low: ' + low + '</h3>';
							result += '<h3>' + text + '</h3>';
							result += '<h3>--------------------------------</h3></td></tr>';
						});
		result += '</table>';
		$('#f').html(result);
	};

	function mdisplay(data) {
		var center = new google.maps.LatLng(37.557121, 126.977379);
		var div = document.querySelector('#m');
		var map = new google.maps.Map(div, {
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			zoom : 18,
			center : center
		});
	};

	function getWeather() {
		var wurl = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22seoul%22)%20%20and%20u%3D%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';

		$.ajax({
			url : wurl,
			success : function(data) {
				wdisplay(data);
				fdisplay(data);
				mdisplay(data);
			},
			error : function() {
				alert('error')
			}
		});
	};

	$(document).ready(function() {
		$('button').click(function() {
			getWeather();
		});
	});
</script>
</head>
<body>
	<h1 id="heade">
		<marquee behavior=alternate>
			<span id="eee">Han</span>'s <span id="ooo">Weather</span> System
		</marquee>
	</h1>
	
	<div class="row">
		<div class="col-xs-4 col-md-4">
		</div>
		
		<div class="col-xs-4 col-md-4">
			<nav id="nn">
			<div id="b" >
				<button type="button" class="btn btn-danger">가져라 너의 날씨 여기에
					지금!</button>
			</div>
			</nav>
		</div>
		
		<div class="col-xs-4 col-md-4">
		</div>
			
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-md-12" id="w"></div>
	</div>
	<div class="row">
		<div class="col-xs-6 col-md-6" id="f" style="overflow: auto;"></div>
		<div class="col-xs-6 col-md-6"id="m"></div>
	</div>
	
</body>
</html>