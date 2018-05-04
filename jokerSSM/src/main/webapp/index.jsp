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

	<!-- 修改 -->
	<div class="modal fade" id="empUpdateModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empN" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="eMail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email"
									id="UpdateeMail" placeholder="输入Email,如123456@qq.com">
								<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="Updatesex1" class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="sex" id="Updatesex1" value="M" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="Updatesex2" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId"></select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="empEdit">更新</button>
				</div>
			</div>
		</div>
	</div>






	<!-- 新增 -->
	<div class="modal fade" id="empAddModel" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empN" class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName" id="empN"
									placeholder="输入员工姓名"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="eMail" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email" id="eMail"
									placeholder="输入Email,如123456@qq.com"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="sex1" class="col-sm-2 control-label">员工性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="sex" id="sex1" value="M" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="sex2" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">所属部门</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="deptselect"></select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="empsave">保存</button>
				</div>
			</div>
		</div>
	</div>




	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>Joker's SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="empadd">新增</button>
				<button class="btn btn-danger" id="deleteallhaha">删除</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="empst">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkall"/></th>
							<th>ID</th>
							<th>姓名</th>
							<th>性别</th>
							<th>e-mail</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="infopage"></div>
			<div class="col-md-6" id="navigatepages"></div>

		</div>
	</div>
	<script type="text/javascript">
	
	
	var TotolRecord;
	var currentPage;
		//页面加载完成后直接要分页的数据！！！！
		$(function() {
			topage(1);
		});

		function buildtable(result) {
			$("#empst tbody").empty();
			var emps = result.extend.pageInfo.list
			$.each(emps, function(index, item) {
				var cc=$("<input type='checkbox' class='checkitem' />");
				var checkbo=$("<td></td>").append(cc);
				
				
				var empID = $("<td></td>").append(item.empId);
				var eN = $("<td></td>").append(item.empName);
				var ess = $("<td></td>").append
				(item.sex == "M" ? "男" : "女");
				var emm = $("<td></td>").append(item.email);
				var dn = $("<td></td>").append(item.department.deptName);

				var edb = $("<button></button").addClass(
						"btn btn-primary btn btn-primary btn-sm").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil edit_bt")).append("编辑");
			
				edb.attr("edit_id",item.empId);
				
				
				
				var dbt = $("<button></button").addClass(
						"btn btn-danger btn btn-primary btn-sm").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash delete_bt")).append(
						"删除");
				
				dbt.attr("delete_id",item.empId);

				var edt = $("<td></td>").append(edb).append("&nbsp;&nbsp;")
						.append(dbt);

				$("<tr></tr>").append(checkbo).append(empID).append(eN).append(ess).append(emm)
						.append(dn).append(edt).appendTo("#empst tbody");
			
				
				
				edb.click(editjs);
				dbt.click(dejs);
				cc.click(checkverify);
		
			
			});
		}

		function buildpageinfo(result) {
			$("#infopage").empty();
			$("#infopage").append(
					"当前为" + result.extend.pageInfo.pageNum + "页,总共"
							+ result.extend.pageInfo.pages + "页，共"
							+ result.extend.pageInfo.total + "条记录");
			TotolRecord=result.extend.pageInfo.pages;
			currentPage=result.extend.pageInfo.pageNum;
		}
		

		function buildPagenav(result) {
			$("#navigatepages").empty();
			//alert("joker!");
			var ul = $("<ul></ul>").addClass("pagination");

			var firstp = $("<li></li>").append($("<a></a>").append("首页")).attr(
					"href", "#");
			var prebt = $("<li></li>").append($("<a></a>").append("&laquo;"));

			if (!result.extend.pageInfo.hasPreviousPage) {
				firstp.addClass("disabled");
				prebt.addClass("disabled");
			} else {
				firstp.click(function() {
					topage(1);
				});

				prebt.click(function() {
					topage(result.extend.pageInfo.pageNum - 1);
				});
			}

			var lastp = $("<li></li>").append($("<a></a>").append("末页")).attr(
					"href", "#");

			var nexbt = $("<li></li>").append($("<a></a>").append("&raquo;"));
			if (!result.extend.pageInfo.hasNextPage) {
				lastp.addClass("disabled");
				nexbt.addClass("disabled");
			} else {
				nexbt.click(function() {
					topage(result.extend.pageInfo.pageNum + 1);
				});
				lastp.click(function() {
					topage(result.extend.pageInfo.pages);
				});
			}

			ul.append(firstp).append(prebt);

			var pnum = result.extend.pageInfo.navigatepageNums;
			$.each(pnum, function(index, item) {
				$("#deptselect").empty();
				var pli = $("<li></li>").append($("<a></a>").append(item));

				if (item == result.extend.pageInfo.pageNum)
					pli.addClass("active");
				pli.click(function() {
					topage(item);
				});

				ul.append(pli);
			});
			ul.append(nexbt).append(lastp);
			var navp = $("<nav></nav>").append(ul);
			navp.appendTo("#navigatepages");

		}

		function topage(pn) {
			$.ajax({
				url : "${APP_PATH}/empsd",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					buildtable(result);
					buildpageinfo(result);
					buildPagenav(result)
				}
			});
		}

		$("#empadd").click(function() {
			
			$("#empAddModel form")[0].reset();
			 $("#empN").parent().removeClass("has-success has-error");
	 		 $("#empN").next("span").text("");
	 		 $("#eMail").parent().removeClass("has-success has-error");
	 		 $("#eMail").next("span").text("");
			 getDept("#deptselect"); 
			$("#empAddModel").modal({
					
					backdrop:"static"
			});
		});
		
				
		/* extend
		
		{depts: [{deptId: 1, deptName: "开发部"}, {deptId: 2, deptName: "测试部"}, {deptId: 3, deptName: "运营部"}]}
 */
				
		function getDept(ele){
	 		$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					console.log(result);
					var departs=result.extend.depts;
					
					$.each(departs,function(){
						var opE=$("<option></option>").append(this.deptName).attr("value",this.deptId);
						
						opE.appendTo(ele);
						//$("deptselect").append(op);
					});
				}
			});
		}
 
 
 
 		 $("#empN").change(function(){
 			var empnn=this.value;
 			//alert(empnn);
 			 $.ajax({
 				url:"${APP_PATH}/checkuser",
 				data:"empName="+empnn,
 				type:"POST",
 				success:function(result){
 					if(result.code==100){
 						showverify("#empN","success","用户名可用");
 						$("#empsave").attr("ajaxcheck","success");
 					}else{
 						showverify("#empN","error",result.extend.vaMSG);
 						$("#empsave").attr("ajaxcheck","error");
 					}
 				}
 			}); 
 		});
  
 
 
 
 
 	$("#empsave").click(function(){
 		
 	//	alert($(this).attr("ajaxcheck"));
 	  
 	if($(this).attr("ajaxcheck")=="error"){return false;}
 	if(!verifyadd()){return false;}
 		//alert($("#empAddModel form").serialize());
 		  $.ajax({
 			url:"${APP_PATH}/empsd",
 			type:"POST",
 			data:$("#empAddModel form").serialize(),
 			success:function(result){
 				if(result.code==100){
 					$("#empAddModel").modal('hide');
 	 				topage(TotolRecord+1);
 				}else{
 					//console.log(result);
 					if(result.extend.err.email!=undefined){
 						
 						showverify("#eMail","error",result.extend.err.email);
 						
 						//showverify("",status,msg);
 					}
 					if(result.extend.err.empName!=undefined){
 						showverify("#empN","error",result.extend.err.empName);
 					}
 				}
 				
 				
 				
 				//alert(result.msg);
 				//$('#myModal').modal('hide')
 				
 			//	console.log("ok");
 			}
 		});  
 	});
 	
 	function verifyadd(){
 		var empNa=$("#empN").val();
 		var regN=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u4E00-\u9FA5]{2,6}$)/;//这个正则表达式的“|”一定要紧挨着！
 		var Emmail=$("#eMail").val();
 		var reg=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
 		
 		if(empNa==""){
 			//alert("姓名不能为空！");
 			$("#empN").parent().addClass("has-error");
 			$("#empN").next("span").text("姓名不能为空！");
 			return false;
 		};
 		if(Emmail==""){
 			$("#eMail").parent().addClass("has-error");
 			$("#eMail").next("span").text("邮箱不能为空！");
 			return false;
 		};
 			
 		
 		if(!regN.test(empNa)){
 			//alert("用户名可以是2-5位的中文或者是6-16的英文和数字的组合");
 			// $("#empN").parent().addClass("has-error");
 		//	$("#empN").next("span").text("用户名可以是2-5位的中文或者是6-16的英文和数字的组合"); 
 			showverify("#empN","error","用户名可以是2-5位的中文或者是6-16的英文和数字的组合");
 			return false;
 		}else{
 			//$("#empN").parent().addClass("has-success");
 		//	$("#empN").next("span").text("用户名填写成功！"); 
 			showverify("#empN","success","用户名填写成功！");
 			
 		}
 		
 		
 		if(!reg.test(Emmail)){
 			//alert("邮箱格式不正确！");
 		//	$("#eMail").parent().addClass("has-error");
 			//$("#eMail").next("span").text("邮箱格式不正确！");
 			showverify("#eMail","error","邮箱格式不正确！");
 			return false; 
 		}else{
 		//	$("#eMail").parent().addClass("has-success");
 			//$("#eMail").next("span").text("邮箱填写正确！");
 			showverify("#eMail","success","邮箱填写成功！");
 		}
 		
 		return true;
 	}
 	
 	 function showverify(ele,status,msg){
 		 $(ele).parent().removeClass("has-success has-error");
 		 $(ele).next("span").text("");
 		if("success" == status){
 			$(ele).parent().addClass("has-success");
 			$(ele).next("span").text(msg);
 		}else if("error" == status){
 			$(ele).parent().addClass("has-error");
 			$(ele).next("span").text(msg);
 		}
 	} 
 	 
 	 
 	 //$(document).on("click",".edit_bt",function(){alert(123);});这个方法在eclipse里用不了是几个意思？
 	
 	 
 	 
 	 function dejs(){
 	 		// alert($(this).parents("tr").find("td:eq(1)").text());
 		var deleteInfo="确定要删除"+$(this).parents("tr").find("td:eq(2)").text()+"的相关记录么？";
 		 var confirmInfo=confirm(deleteInfo);
 		 if(confirmInfo){
 			 
 			
 			  $.ajax({
 				 url:"${APP_PATH}/empsd/"+$(this).attr("delete_id"),
 				 type:"DELETE",
 				 success:function(result){
 					// alert(result.msg);
 					topage(currentPage);
 				 }				 
 			 }); 
 		 }
 	 }
 	 
 	 
 	 
 	 
 	 
 	 function editjs(){
 		 	//alert(123);
 		 	 getDept("#empUpdateModel select"); 
 		 	// getEmpI($(".edit_bt").attr("edit_id"));
 		 	//alert($(this).attr("edit_id"));
 		 getEmp($(this).attr("edit_id"));
 		 
 		$("#empEdit").attr("edit_id",$(this).attr("edit_id"));
 		 
 		 	$("#empUpdateModel").modal({
 		 		
				backdrop:"static"
		});
 	 }
 	//$(".edit_bt").live(function(){alert(123);});
		/* $(document).on("click",".edit_bt",function(){
			alert("edit");
		}); */
		
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/empsd/"+id,
				type:"GET",
				success:function(result){
					var empdata=result.extend.empI;
					$("#empName_update").text(empdata.empName);
					$("#UpdateeMail").val(empdata.email);
					$("#empUpdateModel input[name=sex]").val([empdata.sex]);
					$("#empUpdateModel select").val([empdata.dId]);
					
					//alert(result);
					//console.log(result);
				}
			});
		}
		
 		$("#empEdit").click(function(){
			 var Emmail=$("#UpdateeMail").val();
	 		var reg=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
	 		if(!reg.test(Emmail)){	 		
	 			showverify("#UpdateeMail","error","邮箱格式不正确！");
	 			return false; 
	 		}else{	 		
	 			showverify("#UpdateeMail","success","邮箱填写成功！");
	 		} 
	 		$.ajax({
	 			url:"${APP_PATH}/empsd/"+$(this).attr("edit_id"),
	 			type:"PUT",
	 			data:$("#empUpdateModel form").serialize(),
	 			success:function(result){
	 				//alert(result.msg);
	 				$("#empUpdateModel").modal("hide");
	 				topage(currentPage);
	 			}
	 			
	 		});
	 		
		}); 
		 
 		
 		$("#checkall").click(function(){
 			//alert($(this).prop("checked"));
 			$(".checkitem").prop("checked",$(this).prop("checked"));
 		});
 		
		function checkverify(){
			//alert($(".checkitem:checked").length);
			if($(".checkitem:checked").length==5)
				$("#checkall").prop("checked",true);
			else
				$("#checkall").prop("checked",false);
		}
		
		$("#deleteallhaha").click(function(){
			//alert(123);
			
			var informationemp="";
			var DEL_ID="";
			$.each($(".checkitem:checked"),function(index,item){
				informationemp +=$(this).parents("tr").find("td:eq(2)").text()+",";
				DEL_ID +=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			var infoemp=informationemp.substring(0,informationemp.length-1);
			DEL_ID=DEL_ID.substring(0,DEL_ID.length-1);
			var k=confirm("确认删除"+infoemp+"的信息么？");
			
			if(k){
				//alert(123);
				 $.ajax({
					url:"${APP_PATH}/empsd/"+DEL_ID,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						topage(currentPage);
					}
				}); 
			}
			
			
		});
	</script>





</body>
</html>