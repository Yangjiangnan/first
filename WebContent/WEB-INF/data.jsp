<%@page import="java.sql.PreparedStatement" import="java.util.*"%>
<%@page import="java.sql.Connection" import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<script language=javascript>
 function stopInterval(){
 clearInterval(myInterval)
 }
</script> 
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>WIFI probe</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />
    <!-- 自适应屏幕大小 -->
	<meta name="viewport" content="width=device-width,initial-scale=1" />

    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">

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

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo"> <!-- logo -->
                <a href="#" class="simple-text">
                   	  <h4>基于WIFI探针的商业大数据分析平台</h4>
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="Frontpage.jsp">
                        <i class="ti-panel"></i>
                        <p>数据分析指标</p>
                    </a>
                </li>
                <li>
                    <a href="userinformation.jsp">
                        <i class="ti-user"></i>
                        <p>用户信息</p>
                    </a>
                </li>
                <li>
                   <a href="everyday_info.jsp">
                        <i class="ti-view-list-alt"></i>
                        <p>每日数据报表</p>
                    </a>
                </li>
                <li>
                   <a href="suggestion.jsp">
                        <i class="ti-text"></i>
                        <p>给用户的建议</p>
                    </a>
                </li>
                <li>
                    <a href="feedback.jsp">
                        <i class="ti-pencil-alt2"></i>
                        <p>用户反馈</p>
                    </a>
                </li>
                
				<li class="active-pro">
                   <a href="data.jsp">
                        <i class="ti-export"></i>
                        <p1>数据实时采集</p1>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel" style="width:200 ;height:200;border:0

solid navy;overflow:auto;">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                         <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="data.jsp">数据实时采集系统</a>
                </div>
                <div class="collapse navbar-collapse" style="width:200 ;height:200;border:0

solid navy;overflow:auto;">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="ti-panel"></i>
								<p>Stats</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
						<li>
                            <a href="#">
								<i class="ti-settings"></i>
								<p>Settings</p>
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
<marquee scrollamount='50' scrolldelay='100' direction= 'up' width='1200' height='91%' id=xiaoqing onmouseover=xiaoqing.stop() onmouseout=xiaoqing.start()>
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


</body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <!---<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>--->

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</html>
