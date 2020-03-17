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
				<h1 class="page-header">用户管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/user/list">
					<div class="form-group">
						<label for="userName">姓名</label> 
						<input type="text" class="form-control" id="userName" 
						                   value="${userName }" name="userName" />
					</div>
					<div class="form-group">
						<label for="userGender">性别</label> 
						<select	class="form-control" id="gender" name="gender">
							<option value="">--请选择--</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</select>
					</div>
					<div class="form-group">
						<label for="userJob">职业</label> 
						<select	class="form-control" id="job"  name="job">
							<option value="">--请选择--</option>
							<option value="工人">工人</option>
							<option value="农民">农民</option>
							<option value="个体商人">个体商人</option>
							<option value="公共服务">公共服务</option>
							<option value="知识分子">知识分子</option>
							<option value="管理">管理</option>
							<option value="军人">军人</option>
						</select>
					</div>
					<div class="form-group">
						<label for="userLevel">用户级别</label>
						<select	class="form-control" id="userLevel" name="userLevel">
								<option value="">--请选择--</option>
								<option value="坚韧黑铁">坚韧黑铁</option>
								<option value="不屈白银">不屈白银</option>
								<option value="荣耀黄金">荣耀黄金</option>
								<option value="璀璨钻石">璀璨钻石</option>
								<option value="最强王者">最强王者</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
					<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newUserDialog" onclick="clearUser()">新建用户</a>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>职业</th>
								<th>手机号码</th>
								<th>家庭住址</th>
								<th>用户级别</th>
								<th>更新时间</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList.lists}" var="row">
								<tr align="center">
									<td>${row.id}</td>
									<td>${row.userName}</td>
									<td>${row.gender}</td>
									<td>${row.job}</td>
									<td>${row.phone}</td>
									<td>${row.address}</td>
									<td>${row.userLevel}</td>
								    <td>${row.updateTime}</td>
								    <td>${row.remark}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick= "editUser(${row.id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${row.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
					<span>当前第${userList.currPage}页，共${userList.totalPage}页，共${userList.totalCount}条记录</span>
					</div>
					<span>
					    <c:if test="${userList.currPage != 1}">
							<a href="${pageContext.request.contextPath}/user/list?currPage=1">[首页]</a>&nbsp;&nbsp;  
							<a href="${pageContext.request.contextPath}/user/list?currPage=${userList.currPage-1}">[上一页]</a>&nbsp;&nbsp;      
						</c:if>
						<c:if test="${userList.currPage != userList.totalPage}">
							<a href="${pageContext.request.contextPath}/user/list?currPage=${userList.currPage+1}">[下一页]</a>&nbsp;&nbsp; 
							<a href="${pageContext.request.contextPath}/user/list?currPage=${userList.totalPage}">[尾页]</a>&nbsp;&nbsp;      
						</c:if>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 用户列表查询部分  end-->
</div>
<!-- 创建用户模态框 -->
<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_user_form">
					<div class="form-group">
						<label for="new_userName" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_userName" placeholder="用户名称" name="userName" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_gender" class="col-sm-2 control-label" style="float:left;padding:7px 15px 0 27px;">性别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_gender" name="gender">
								<option value="">--请选择--</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_job" class="col-sm-2 control-label" style="float:left;padding:7px 15px 0 27px;">职业</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_job" name="job">
								<option value="">--请选择--</option>
								<option value="工人">工人</option>
								<option value="农民">农民</option>
								<option value="个体商人">个体商人</option>
								<option value="公共服务">公共服务</option>
								<option value="知识分子">知识分子</option>
								<option value="管理">管理</option>
								<option value="军人">军人</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_address" class="col-sm-2 control-label">家庭住址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_address" placeholder="家庭住址" name="address" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">手机号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="手机号码" name="phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_userLevel" style="float:left;padding:7px 15px 0 27px;">用户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="new_userLevel" name="userLevel">
								<option value="">--请选择--</option>
								<option value="坚韧黑铁">坚韧黑铁</option>
								<option value="不屈白银">不屈白银</option>
								<option value="荣耀黄金">荣耀黄金</option>
								<option value="璀璨钻石">璀璨钻石</option>
								<option value="最强王者">最强王者</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_remark" placeholder="备注" name="remark" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createUser()">创建用户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改用户模态框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_user_form">
					<input type="hidden" id="edit_user_id" name="id"/>
					<div class="form-group">
						<label for="edit_userName" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_userName" placeholder="用户名称" name="userName" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_gender" class="col-sm-2 control-label" style="float:left;padding:7px 15px 0 27px;">性别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_gender" name="gender">
								<option value="">--请选择--</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_job" class="col-sm-2 control-label" style="float:left;padding:7px 15px 0 27px;">职业</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_job" name="job">
								<option value="">--请选择--</option>
								<option value="工人">工人</option>
								<option value="农民">农民</option>
								<option value="个体商人">个体商人</option>
								<option value="公共服务">公共服务</option>
								<option value="知识分子">知识分子</option>
								<option value="管理">管理</option>
								<option value="军人">军人</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_address" class="col-sm-2 control-label">家庭住址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_address" placeholder="家庭住址" name="address" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_phone" class="col-sm-2 control-label">手机号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_phone" placeholder="手机号码" name="phone" />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_userLevel" style="float:left;padding:7px 15px 0 27px;">用户级别</label>
						<div class="col-sm-10">
							<select	class="form-control" id="edit_userLevel" name="userLevel">
								<option value="">--请选择--</option>
								<option value="坚韧黑铁">坚韧黑铁</option>
								<option value="不屈白银">不屈白银</option>
								<option value="荣耀黄金">荣耀黄金</option>
								<option value="璀璨钻石">璀璨钻石</option>
								<option value="最强王者">最强王者</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_remark" class="col-sm-2 control-label">备注</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_remark" placeholder="备注" name="remark" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建用户窗口中的数据
	function clearUser() {
	    $("#new_userName").val("");
	    $("#new_gender").val("")
	    $("#new_job").val("")
	    $("#new_address").val("")
	    $("#new_phone").val("");
	    $("#new_userLevel").val("");
	    $("#new_remark").val("");
	}
	// 创建用户
	function createUser() {
	$.post("<%=basePath%>user/create",
	$("#new_user_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("用户创建成功！");
	            window.location.reload();
	        }else{
	            alert("用户创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的用户信息
	function editUser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>user/getUserById",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_user_id").val(data.id);
	    	    $("#edit_userName").val(data.userName);
	    	    $("#edit_gender").val(data.gender)
	    	    $("#edit_job").val(data.job)
	    	    $("#edit_address").val(data.address)
	    	    $("#edit_phone").val(data.phone);
	    	    $("#edit_userLevel").val(data.userLevel);
	    	    $("#edit_remark").val(data.remark);
	            
	        }
	    });
	}
    // 执行修改用户操作
	function updateUser() {
		$.post("<%=basePath%>user/update",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("用户信息更新成功！");
				window.location.reload();
			}else{
				alert("用户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除用户
	function deleteUser(id) {
	    if(confirm('确实要删除该用户吗?')) {
	$.post("<%=basePath%>user/delete",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("用户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除用户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>