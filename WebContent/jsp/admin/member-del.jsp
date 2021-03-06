﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
%> 
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>删除的用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<input type="text" class="input-text" style="width:250px" placeholder="用户名/电话/邮箱" id="search" name="search">
		<button type="submit" class="btn btn-success radius" id="searchBtn" name="searchBtn" onclick="search()"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="40">性别</th>
				<th width="40">年龄</th>
				<th width="90">电话</th>
				<th width="150">邮箱</th>
				<th width="300">地址</th>
				<th width="70">状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<c:forEach var="user" items="${userList}" varStatus="i" step="1">
						<tr class="text-c">
							<td>${user.userId }</td>
							<td>${user.userName }</td>
							<td>${user.sex }</td>
							<td>${user.age }</td>
							<td>${user.phone }</td>
							<td>${user.mail }</td>
							<td class="text-l">${user.address }</td>
				<td class="td-status"><span class="label label-danger radius">已删除</span></td>
				<td class="td-manage"><a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,${user.userId })" title="还原"><i class="Hui-iconfont">&#xe66b;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,${user.userId })" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
			<div class="dataTables_paginate paging_full_numbers" id="tablePage">
				<a class="paginate_button first disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="firstPage" href="delUserList.action?pageStart=1">第一页</a>
				<a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" id="previousPage" href="delUserList.action?pageStart=${pageStart-1 }">上一页</a>
				<span><a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0">${pageStart }/${totalPage }</a></span>
				<a class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" id="nextPage" href="delUserList.action?pageStart=${pageStart+1 }">下一页</a>
				<a class="paginate_button last disabled" aria-controls="DataTables_Table_0" data-dt-idx="4" tabindex="0" id="lastPage" href="delUserList.action?pageStart=${pageStart=totalPage }">最后一页</a>
			</div>
		</div>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.15/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript">
/* $(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
}); */
/*用户-模糊查找*/
function  search(){
	var str=$('#search').val();
	location.href='fuzzyFindDelUser.action?str='+str;
}
/*用户-还原*/
function member_huanyuan(obj,id){
	layer.confirm('确认要还原吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'restoreUser.action?userId='+id,
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已还原!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要永久删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'wipeUser.action?userId='+id,
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script> 
</body>
</html>