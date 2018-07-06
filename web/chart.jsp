<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var hdata=[];

function clickfunction(idx){
	var i = parseInt(idx);
	drawChart2(i);
};

function drawChart2(i){
    var myregion = hdata[i].region;
    var people  = hdata[i].people;
    var gym     = hdata[i].gym;
    var bicycle = hdata[i].bicycle;
    var et      = hdata[i].event;
    var park    = hdata[i].park;
    var total   = hdata[i].total;

    Highcharts.chart('container2', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: '2017 '+myregion+'지구 한강 방문 현황(상세)'
  },
  tooltip: {
    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
  },
  plotOptions: {
    pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels: {
        enabled: true,
        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
        style: {
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        }
      }
    }
  },
  series: [{
    name: '비율',
    colorByPoint: true,
    data: [{
      name: '일반방문',
      y: people*100/total,
      sliced: true,
      selected: true
    }, {
      name: '체육시설이용',
      y: gym*100/total
    }, {
      name: '자전거이용',
      y: bicycle*100/total
    }, {
      name: '문화행사참여',
      y: et*100/total
    }, {
      name: '공원이용',
      y: park*100/total
    }]
  }]
});

  };

$(document).ready(function(){
	
	
	
	function drawList(mydata){
    var result='';
    for(var i in mydata){
      result+='<a class="dropdown-item" onclick="clickfunction('+i+')">'+mydata[i].region+'</a>';
    }
    $('.dropdown-menu').html(result);
	};
	
	
	
	

	function drawChart1(mydata){
    var regions = [];
    var people  = [];
    var gym     = [];
    var bicycle = [];
    var et      = [];
    var park    = [];
    for(var i in mydata){
      regions.push(mydata[i].region);
      people.push(mydata[i].people);
      gym.push(mydata[i].gym);
      bicycle.push(mydata[i].bicycle);
      et.push(mydata[i].event);
      park.push(mydata[i].park);
    }

		Highcharts.chart('container', {
  chart: {
    type: 'column'
  },
  title: {
    text: '2017 지역별 한강 방문 현황'
  },
  xAxis: {
    categories: regions
  },
  yAxis: {
    min: 0,
    title: {
      text: '총 한강 방문자 수'
    },
    stackLabels: {
      enabled: true,
      style: {
        fontWeight: 'bold',
        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
      }
    }
  },
  legend: {
    align: 'right',
    x: -30,
    verticalAlign: 'top',
    y: 25,
    floating: true,
    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
    borderColor: '#CCC',
    borderWidth: 1,
    shadow: false
  },
  tooltip: {
    headerFormat: '<b>{point.x}</b><br/>',
    pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
  },
  plotOptions: {
    column: {
      stacking: 'normal',
      dataLabels: {
        enabled: true,
        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
      }
    }
  },
  series: [{
    name: '일반방문',
    data: people
  }, {
    name: '체육시설이용',
    data: gym
  }, {
    name: '자전거이용',
    data: bicycle
  }, {
    name: '문화행사참여',
    data: et
  }, {
    name: '공원이용',
    data: park
  }]
});

	};
	


	$.ajax({
		url:'chart.kakao',

		success:function(data){
			hdata = data;
			drawChart1(data);
			drawList(data);
      		drawChart2(0);

		},

		error:function(){
			alert('ajax error');
		}
	});

});



</script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
</div>
<div class="dropdown float-right">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    지역 선택하기!
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

  </div>
</div>
<div id="container2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto">

</div>
