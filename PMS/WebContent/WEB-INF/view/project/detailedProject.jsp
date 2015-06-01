<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目管理系统</title>
<link href="${pageContext.request.contextPath}/css/table.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/bs3/dpl.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/bs3/bui.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <script type="text/javascript">
 $(document.body).css({
	  "overflow-x":"hidden",
	  "overflow-y":"auto"
 });
 </script>
	<div class="span24" style="margin-left: 20px;">
 		<h2>项目详情</h2>
 		<table border="1" cellpadding="0" cellspacing="0" width="1000px" style="border-collapse: collapse;border: #9F9F9F;">
 			<tr height="50px;">
 				<td class="td1" width="200px;">项目名称</td>
 				<td class="td2">${project.projectName}</td>
 			</tr>
 			<tr height="50px;">
 				<td class="td1" width="200px;">项目主题</td>
 				<td class="td2">${project.title}</td>
 			</tr>
 		</table>
 		<table class="tableClass" cellpadding="0" border="1" cellspacing="0" width="1000px" style="border-collapse: collapse;border: #9F9F9F;">
 			<tr height="50px;">
 				<td class="td1" width="150px;">项目版本</td>
 				<td class="td2">${project.versionNo}</td>
 				<td class="td1" width="150px;">项目负责组</td>
 				<td class="td2">${project.department.name}</td>
 			</tr>
 			<tr height="50px;">
 				<td class="td1" width="150px;">开始时间</td>
 				<td class="td2">${project.startdate}</td>
 				<td class="td1" width="150px;">预计完成时间</td>
 				<td class="td2">${project.plandate}</td>
 			</tr>
 		</table>
 		<table class="tableClass" cellpadding="0" border="1" cellspacing="0" width="1000px" style="border-collapse: collapse;border-spacing: 0px;border: #9F9F9F;">
 			<tr height="250px;">
 				<td class="td1" width="30px;">项目描述</td>
 				<td class="td2">
 					<div style="text-indent:2em;height: 240px;">${project.description}</div>
 				</td>
 			</tr>
 		</table>
 		<c:if test="${demands!=null}">
 			<div style="margin-bottom: 30px;">
 				<h2>项目需求</h2>
	 			<c:forEach items="${demands}" var="demand">
	 				<table class="tableClass" cellpadding="0" border="1" cellspacing="0" width="1000px" style="border-collapse: collapse;border-spacing: 0px;border: #9F9F9F;">
			 			<tr height="50px;">
			 				<td class="td1" width="200px;">需求标题</td>
			 				<td class="td2">${demand.title}</td>
			 				<td class="td1" width="200px;">指定完成人</td>
			 				<td class="td2">${demand.appointPerson.username}</td>
			 			</tr>
			 			<tr height="50px;">
			 				<td class="td1" width="200px;">提出时间</td>
			 				<td class="td2">${demand.starttime}</td>
			 				<td class="td1" width="200px;">更新时间</td>
			 				<td class="td2">${demand.updatetime}</td>
			 			</tr>
			 			<tr height="50px;">
			 				<td class="td1" width="200px;">具体要求</td>
			 				<td class="td2" colspan="3">${demand.content}</td>
			 			</tr>
	 				</table>
	 			</c:forEach>
 			</div>
 		</c:if>
 		<c:if test="${project.file!=null}">
	 		<div style="height: 20px;margin-bottom: 20px;margin-top: 20px;">
	 			附件：${fn:split(project.file, '_')[1]}
	 		</div>
	 		<div style="margin-top: 10px;margin-bottom: 50px;">
	 			<button type="button" class="button button-primary" 
							style="margin-left:20px;height:27px;padding-top:0px" 
							id="down">
							下载
				</button> 
	 		</div>
 		</c:if>
 	</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$("#down").click(function(){
		location.href="${pageContext.request.contextPath}/project/downFile.do?projectId="+${project.id};
	});

</script>
</body>
</html>