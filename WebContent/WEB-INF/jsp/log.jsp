<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户管理系统</title>
	<!-- 引入css样式文件 -->
	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>user/list">用户管理系统 v6.0</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
		<!-- 用户信息和系统设置 start -->
		<li>
			<a href="#"> 
				<i class="fa fa-user fa-fw"></i>当前账户：${Admin_SESSION.admin}
			</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/logout"> 
				<i class="fa  fa-sign-out  fa-fw"></i>退出登录
			</a>
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/user/list">
				      <i class="fa fa-edit fa-fw"></i> 用户管理
				    </a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath }/log/list">
				      <i class="fa fa-edit fa-fw" ></i>  系统日志
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 用户列表查询部分  start-->
		<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">系统日志</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">系统日志列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>时间</th>
								<th>描述</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${logList.lists}" var="row">
								<tr align="center">
									<td>${row.id}</td>
									<td>${row.time}</td>
									<td>${row.bewrite}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
					<span>当前第${logList.currPage}页，共${logList.totalPage}页，共${logList.totalCount}条记录</span>
					</div>
					<span>
					    <c:if test="${logList.currPage != 1}">
							<a href="${pageContext.request.contextPath}/log/list?currPage=1">[首页]</a>&nbsp;&nbsp;  
							<a href="${pageContext.request.contextPath}/log/list?currPage=${logList.currPage-1}">[上一页]</a>&nbsp;&nbsp;      
						</c:if>
						<c:if test="${userList.currPage != logList.totalPage}">
							<a href="${pageContext.request.contextPath}/log/list?currPage=${logList.currPage+1}">[下一页]</a>&nbsp;&nbsp; 
							<a href="${pageContext.request.contextPath}/log/list?currPage=${logList.totalPage}">[尾页]</a>&nbsp;&nbsp;      
						</c:if>
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>