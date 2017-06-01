<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>大数据分析系统驻店时长</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<!-- 引入 ECharts 文件 -->
    <script src="echarts.min.js"></script>
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.jsp"><img src="logo.png" alt="Klorofil Logo" class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				
				<form class="navbar-form navbar-left">
					<h4>基于WIFI探针的商业大数据分析系统</h4>
				</form>
				<div class="navbar-btn navbar-btn-right">
					<a class="btn btn-success update-pro" href="${pageContext.request.contextPath }/refreshFirst" title="Upgrade to Pro" ><i class="fa fa-rocket"></i> <span>数据更新</span></a>
				</div>
			
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.jsp" class=""><i class="lnr lnr-home"></i> <span>商场基本信息</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="active"><i class="lnr lnr-file-empty"></i> <span>数据指标</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse in">
								<ul class="nav">
									<li><a href="chart1.jsp" class="">客流量</a></li>
									<li><a href="${pageContext.request.contextPath }/chart2Deal" class="">入店量</a></li>
									<li><a href="chart3.jsp" class="">入店率</a></li>
									<li><a href="${pageContext.request.contextPath }/chart4Deal" class="">来访周期</a></li>
									<li><a href="chart5.jsp" class="">新老顾客</a></li>
									<li><a href="chart6.jsp" class="">顾客活跃度</a></li>
									<li><a href="chart7.jsp" class="active">驻店时长</a></li>
									<li><a href="chart8.jsp" class="">跳出率、跳出率</a></li>
									
								</ul>
							</div>
						</li>
						<li><a href="tables.jsp" class=""><i class="lnr lnr-dice"></i> <span>数据报表</span></a></li>
						<li><a href="icons.jsp" class=""><i class="lnr lnr-linearicons"></i> <span>数据浏览</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">Charts</h3>
					<div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">驻店时长</h4>
                                <p class="category">24 Hours performance</p>
                            </div>
                            <div class="content">
                                 <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script>
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    function randomData() {
	now = new Date(+now + oneDay);
	value = value + Math.random() * 21 - 10;
	return {
	    name: now.toString(),
	    value: [
	        [now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'),
	        Math.round(value)
	    ]
	}
	}
	
	var data = [];
	var now = +new Date(1997, 9, 3);
	var oneDay = 24 * 3600 * 1000;
	var value = Math.random() * 1000;
	for (var i = 0; i < 1000; i++) {
	data.push(randomData());
	}
	
	var dataAll = [
	               [
	                   [10.0, 8.04],
	                   [8.0, 6.95],
	                   [13.0, 7.58],
	                   [9.0, 8.81],
	                   [11.0, 8.33],
	                   [14.0, 9.96],
	                   [6.0, 7.24],
	                   [4.0, 4.26],
	                   [12.0, 10.84],
	                   [7.0, 4.82],
	                   [5.0, 5.68]
	               ]
	              
	           ];

	           var markLineOpt = {
	               animation: false,
	               label: {
	                   normal: {
	                       formatter: 'y = 0.5 * x + 3',
	                       textStyle: {
	                           align: 'right'
	                       }
	                   }
	               },
	               lineStyle: {
	                   normal: {
	                       type: 'solid'
	                   }
	               },
	               tooltip: {
	                   formatter: 'y = 0.5 * x + 3'
	               },
	               data: [[{
	                   coord: [0, 3],
	                   symbol: 'none'
	               }, {
	                   coord: [20, 13],
	                   symbol: 'none'
	               }]]
	           };

	           option = {
	               title: {
	                   text: '顾客在店内的停留时长',
	                   x: 'center',
	                   y: 0
	               },
	               grid: [
	                   {x: '7%', y: '7%', width: '80%', height: '80%'}
	                 
	               ],
	               tooltip: {
	                   formatter: 'Group {a}: ({c})'
	               },
	               xAxis: [
	                   {gridIndex: 0, min: 0, max: 20}
	                 
	               ],
	               yAxis: [
	                   {gridIndex: 0, min: 0, max: 15}
	                   
	               ],
	               series: [
	                   {
	                       name: 'I',
	                       type: 'scatter',
	                       xAxisIndex: 0,
	                       yAxisIndex: 0,
	                       data: dataAll[0],
	                       markLine: markLineOpt
	                   }
	                   
	               ]
	           };
	    
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);

 </script>
    </div><!-- passengerflow -->
                                <div class="footer">
                                    
                                    <hr>
                                    <div class="stats">
                                        <i class="ti-reload"></i> Updated 3 seconds ago
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                </div>
                </div>
		<!-- END MAIN -->         
		<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
