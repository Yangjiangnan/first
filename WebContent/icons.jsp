<%@page import="java.sql.PreparedStatement" import="java.util.*"%>
<%@page import="java.sql.Connection" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<title>Icons | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<body>
<%
	//response.setHeader("refresh", "1");
	Connection conn = null;  
	String sql="select * from tanzhen";
	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://localhost:3306/test"; 
	String user = "root"; 
	String password = "admin";
	conn = DriverManager.getConnection(url, user, password);
	Statement sta = conn.createStatement();  
	ResultSet rs = sta.executeQuery(sql);
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
									<li><a href="chart2.jsp" class="active">入店量</a></li>
									<li><a href="chart3.jsp" class="">入店率</a></li>
									<li><a href="chart4.jsp" class="">来访周期</a></li>
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
					<h3 class="page-title">Icons</h3>
					<marquee scrollamount='40' scrolldelay='100' direction= 'up' width='1200' height='780' id=xiaoqing onmouseover=xiaoqing.stop() onmouseout=xiaoqing.start()>
        <div class="content" " style="overflow:hidden;">
          
		<table   align="center" width="1200">
		<tr>
		<%while (rs.next()){ %>
		 <tr>  
            <td>  
   
               <%  
               out.println(rs.getString("id"));%> 
               </td>
             <td><%  out.println(rs.getString("mmac"));  %> </td>
              <td><%  out.println(rs.getString("time"));  %> </td>  
              <td><%  out.println(rs.getString("mac"));  %> </td>
              <td><%  out.println(rs.getString("rssi"));  %> </td>
              <td><%  out.println(rs.getString("mmac"));  %> </td>
              <td><%  out.println(rs.getString("rang"));  %> </td>
		<%} %>

	</table>
	<%  
        rs.close();  
	sta.close();  
        conn.close();  
    %>  
          
        </div>
</marquee>
        
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
