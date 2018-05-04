<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>



<link rel="stylesheet" type="text/css"
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="${APP_PATH}/static/jquery.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Joker's SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>姓名</th>
						<th>性别</th>
						<th>e-mail</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${ pageInfo.list}" var="emp">


						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName}</th>
							<th>${emp.sex=="M"?"男":"女" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-primary btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									删除
								</button>
							</th>


						</tr>


					</c:forEach>


				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">当前为${pageInfo.pageNum}页,总共${pageInfo.pages}页，共${pageInfo.total }条记录</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">

					<li><a href="${APP_PATH}/empsd?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${APP_PATH}/empsd?pn=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach items="${ pageInfo.navigatepageNums}" var="pagenums">

						<c:if test="${pagenums==pageInfo.pageNum}">
							<li class="active"><a href="#">${	pagenums }</a></li>
						</c:if>
						<c:if test="${pagenums!=pageInfo.pageNum}">
							<li><a href="${APP_PATH}/empsd?pn=${pagenums}">${pagenums }</a></li>
						</c:if>


					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${APP_PATH}/empsd?pn=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>  
					<li><a href="${APP_PATH}/empsd?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav>
			</div>

		</div>
	</div>
</body>
</html>