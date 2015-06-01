<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理系统</title>
<script language="javascript" src="${pageContext.request.contextPath}/script/jquery.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/script/pageCommon.js" charset="utf-8"></script>
<script language="javascript" src="${pageContext.request.contextPath}/script/PageUtils.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/pageCommon.css" />
<script language="javascript" src="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/blue/file.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.css" />

<script type="text/javascript">
	$(function(){
		
		//$("[name=privilegeIds]").attr("checked","checked");
		
		
			// 指定事件处理函数
			$("[name=privilegeIds]").click(function(){
				
				// 当选中或取消一个权限时，也同时选中或取消所有的下级权限
				$(this).siblings("ul").find("input").attr("checked", this.checked);
				
				// 当选中一个权限时，也要选中所有的直接上级权限
				if(this.checked == true){
					$(this).parents("li").children("input").attr("checked", true);
				}
				
			});
	$("#tree").treeview();
		});
	

</script>
</head>

<body>
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 配置权限
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea style="margin-top: 20px;">
    <form action="${pageContext.request.contextPath}/role/setPrivilege.do" method="post">
    	<input name="roleId" hidden="hidden" value="${role.id}"/>
        <div class="ItemBlock_Title1"><!-- 信息说明 --><div class="ItemBlock_Title1">
        	<img border="0" width="4" height="7" src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 正在为${role.name}配置权限</div> 
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
					<!--表头-->
					<thead>
						<tr align="left" valign="middle" id="TableTitle">
							<td width="300px" style="padding-left: 7px;">
								<!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
								<input type="checkbox" id="cbSelectAll" onclick="$('[name=privilegeIds]').attr('checked', this.checked)"/>
								<label for="cbSelectAll">全选</label>
							</td>
						</tr>
					</thead>
                   
			   		<!--显示数据列表-->
					<tbody id="TableData">
						<tr class="TableDetail1">
							<!-- 显示权限树 -->
							<td>
<ul id="tree">
	<c:forEach items="${topMenu}" var="parent">
		<li>
			<c:choose>
				<c:when test="${fn:indexOf(privilegeIds,parent.id)!=-1}">
					<input type="checkbox" name="privilegeIds" checked="checked" value="${parent.id}" id="cb_${parent.id}" />
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="privilegeIds" value="${parent.id}" id="cb_${parent.id}" />
				</c:otherwise> 
			</c:choose>
			
			<label for="cb_${parent.id}"><span class="folder">${parent.name}</span></label>
			<ul>
				<c:forEach items="${parent.children}" var="child">
					<li>
						<c:choose>
							<c:when test="${fn:indexOf(privilegeIds,child.id)!=-1}">
								<input type="checkbox" checked="checked" value="${child.id}" name="privilegeIds" id="cb_${child.id}" />
							</c:when>
							<c:otherwise>
								<input type="checkbox" value="${child.id}" name="privilegeIds" id="cb_${child.id}" />
							</c:otherwise> 
						</c:choose>
						
						<label for="cb_${child.id}"><span class="folder">${child.name}</span></label>
						<ul>
							<c:forEach items="${child.children}" var="p">
								<li>
									<c:choose>
										<c:when test="${fn:indexOf(privilegeIds,child.id)!=-1}">
											<input type="checkbox" checked="checked" name="privilegeIds" value="${p.id}" id="cb_${p.id}" />
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="privilegeIds" value="${p.id}" id="cb_${p.id}" />
										</c:otherwise> 
									</c:choose>
									
									<label for="cb_${p.id}"><span class="folder">${p.name}</span></label>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>

</td>
						</tr>
					</tbody>
                </table>
            </div>
        </div>
        
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <input type="image" src="${pageContext.request.contextPath}/style/images/save.png"/>
            <a href="javascript:history.go(-1);"><img src="${pageContext.request.contextPath}/style/images/goBack.png"/></a>
        </div>
    </form>
</div>
<div class="Description">
	说明：<br />
	1，选中一个权限时：<br />
	&nbsp;&nbsp;&nbsp;&nbsp; a，应该选中 他的所有直系上级。<br />
	&nbsp;&nbsp;&nbsp;&nbsp; b，应该选中他的所有直系下级。<br />
	2，取消选择一个权限时：<br />
	&nbsp;&nbsp;&nbsp;&nbsp; a，应该取消选择 他的所有直系下级。<br />
	&nbsp;&nbsp;&nbsp;&nbsp; b，如果同级的权限都是未选择状态，就应该取消选中他的直接上级，并递归向上做这个操作。<br />

	3，全选/取消全选。<br />
	4，默认选中当前岗位已有的权限。<br />
</div>
</body>
</html>