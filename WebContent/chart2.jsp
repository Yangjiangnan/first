<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*,java.sql.DriverManager,java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>Charts | Klorofil - Free Bootstrap Dashboard Template</title>
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
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://127.0.0.1:3306/test?useSSL=true";
	Connection conn = DriverManager.getConnection(url, "root", "admin");
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rs ;
	Calendar calendar=Calendar.getInstance();
	calendar.add(Calendar.DAY_OF_MONTH,-1);
	int year=calendar.get(Calendar.YEAR);
	int month=calendar.get(Calendar.MONTH)+1;
	int day=calendar.get(Calendar.DAY_OF_MONTH);
	int t=9;
	int data[]=new int[7];
	int i=0;
	while (t <= 21) {
		rs = stmt.executeQuery("select count(*) from tanzhen where  time BETWEEN '"+year+"-"+month+"-"+day+" " + t
				+ ":00:00' and '"+year+"-"+month+"-"+day+" "+ (t + 1) + ":59:59' and rang<100;");
		rs.next();
		data[i]=rs.getInt(1);
		t+=2;i++;
	}
	request.setAttribute("data", data);
%>
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
					<a class="btn btn-success update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>数据更新</span></a>
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
									<li><a href="${pageContext.request.contextPath }/chart2Deal" class="active">入店量</a></li>
									<li><a href="chart3.jsp" class="">入店率</a></li>
									<li><a href="${pageContext.request.contextPath }/chart4Deal" class="">来访周期</a></li>
									<li><a href="chart5.jsp" class="">新老顾客</a></li>
									<li><a href="chart6.jsp" class="">顾客活跃度</a></li>
									<li><a href="chart7.jsp" class="">驻店时长</a></li>
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
									<h4 class="title">入店量</h4>
									<p class="category">24 Hours performance</p>
								</div>
								<div class="content">
									<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
									<div id="main" style="width: 600px; height: 400px;"></div>
									<script>
										var d1 = ${data[0]};
										var d2 = ${data[1]};
										var d3 = ${data[2]};
										var d4 = ${data[3]};
										var d5 = ${data[4]};
										var d6 = ${data[5]};
										var d7 = ${data[6]};
										var myChart = echarts.init(document
												.getElementById('main'));
										myChart.title = '坐标轴刻度与标签对齐';
										option = {
											color : [ '#3398DB' ],
											tooltip : {
												trigger : 'axis',
												axisPointer : { // 坐标轴指示器，坐标轴触发有效
													type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
												}
											},
											grid : {
												left : '3%',
												right : '4%',
												bottom : '3%',
												containLabel : true
											},
											xAxis : [ {
												type : 'category',
												data : [ '9-11', '11-13',
														'13-15', '15-17',
														'17-19', '19-21',
														'21-23' ],
												axisTick : {
													alignWithLabel : true
												}
											} ],
											yAxis : [ {
												type : 'value'
											} ],
											series : [ {
												name : '直接访问',
												type : 'bar',
												barWidth : '60%',
												data : [ d1, d2, d3, d4, d5,
														d6,d7 ]
											} ]
										};
										myChart.setOption(option);
									</script>
								</div>
								<!-- passengerflow -->
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
		<!-- END MAIN -->    
		</div>     
		</div>
		</div>
		<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
