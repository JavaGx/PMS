<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
var pageScript = {
	page : 0,
	pageCount : 0,
	init : function(page,pageCount){
		this.page = page;
		this.pageCount = pageCount;
	},
	next : function(){
		var nextPage = this.page+1;
		if(nextPage<=this.pageCount){
			window.location.href = "setting/"+nextPage+".do";
		}
	},
	prev : function(){
		var prevPage = this.page-1;
		if(prevPage>=1){
			window.location.href = "setting/"+prevPage+".do";
		}
	},
	first : function(){
		window.location.href = "setting/1.do";
	},
	last : function(){
		window.location.href = "setting/"+this.pageCount+".do";
	}
}

var accountManage ={
	edit : function(username){
		alert(username);
		window.location.href = "account/edit.do?username="+username;
	},
	del : function(username,page){
		alert(username);
		window.location.href = "account/del.do?username="+username;
	}			
}

$("document").ready(function(){
	var page = <%=request.getAttribute("page")%> ;
	var pageCount = <%=request.getAttribute("pageCount")%> ;
	pageScript.init(page,pageCount);
});
</script>
</head>
<body>
<div id="body-wrapper">
	<div id="sidebar">
    	<%@include file="menu.jsp"%>
  	</div>
   	<div id="main-content">
		<div class="clear"></div>
		<div class="content-box">
			<div class="content-box-header">
        		<h3>系统设置</h3>
				<ul class="content-box-tabs">
					<li><a href="#tab1" class="default-tab">用户</a></li>
        		</ul>
        		<div class="clear"></div>
      		</div>
			<div class="content-box-content">
        		<div class="tab-content default-tab" id="tab0">
					<table>
		            <thead>
		              <tr>
		                <th>用户名</th>
		                <th>密码</th>
		                <th>部门</th>
		                <th>操作</th>
		              </tr>
		            </thead>
		            <tbody>
		              <c:forEach items="${users}" var="user">
		              <tr>
		                <td>${user.username}</td>
		                <td>${user.password}</td>
		                <td>
		                	<a href="javascript:accountManage.edit('${user.id }');" title="Edit Meta"><img src="resources/images/hammer_screwdriver.png" alt="Edit Meta" /></a> 
		                	&nbsp;&nbsp;&nbsp;&nbsp;
		                	<a href="javascript:accountManage.del('${user.id }',${page});" title="Delete"><img src="resources/images/cross.png" alt="Delete" /></a>
		                </td>
					  </tr>
					 </c:forEach>
		            </tbody>
		              <tfoot>
		              <tr>
			                <td colspan="3">
			                	<div class="bulk-actions align-left">
			                    	<a class="button" href="account/add.do">增加新用户</a>
			                    </div>
			                  	<div class="pagination">
			                  		<a href="javascript:pageScript.first()" title="First Page">&laquo; First</a>
			                  		<a href="javascript:pageScript.prev()" title="Previous Page">&laquo; Previous</a>
									<a href="javascript:void(0)" class="number current" title="3">${page}</a>
									<a href="javascript:pageScript.next()" title="Next Page">Next &raquo;</a>
									<a href="javascript:pageScript.last()" title="Last Page">Last &raquo;</a>
								</div>
			                  	<div class="clear"></div>
			                </td>
		              </tr>
		            </tfoot>
					</table>
        		</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div> 
</body>
<!-- Download From www.exet.tk-->
</html>

