<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
		<%@ include file="/common/meta.jsp"%>
		<link href="${pageContext.request.contextPath}/css/define.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/warn.css" rel="stylesheet" type="text/css" />
	</head>	
	<body>
		<div class="row">
			<div class="panel panel-small span12"
				style="margin-left: 20px; margin-top: 20px; width: 1000px;">
				<div class="panel-header clearfix">
					<h3 class="pull-left">
						报障列表
					</h3>
				
				</div>
				<div class="panel-body">
					<c:if test="${fn:length(warnings)!=0}">
							<div id="content" class="hidden">
								<c:forEach items="${warnings}" var="warning">
								<div style="margin-bottom: 50px;"> 
							     	<div style="float: left;">
								      	<img width="60px;" height="60px;" src="${path}/${user.image}">
								    </div>
									<div style="margin-left: 70px;margin-top: 10px;"> 
									     <div>
									     	<div style="float: left;color: #9F9F9F"> 
										      ${user.username}
										     </div>
										     <div style="color: #08c;text-align: right;">
										     	${warning.starttime}
										     </div>
									     </div>
									     <div style="margin-top: 10px;">
									     	<c:choose>
										     	<c:when test="${warning.state=='已解决'||warning.state=='已关闭'}">
									     			<span class="done">完</span>
									     		</c:when>
									     		<c:otherwise>
									     			<span class="waiting">等</span>
									     		</c:otherwise>
								     		</c:choose>
									     	<a class="page-action" href="#" data-href="${path}/warn/selectone.do?id=${warning.id}" title="报障信息" data-id="detailedWarn">
									     		<span style="color: #08c;font-weight: bold;">${warning.title}</span>
									     	</a>
									     </div>
									     <div style="text-align: left;color: #9F9F9F;margin-top: 10px;">
											<c:if test="${warning.description.length()>200}">${warning.description.substring(0,200)}...</c:if>
											<c:if test="${warning.description.length()<=200}">${warning.description}</c:if>
										 </div>
										 <div style="margin-top: 10px;">
										 	<div style="text-align: left;float: left;width: 100px;color: #9F9F9F">
										 		浏览${warning.browseNumber}
											 </div>
											 <div style="text-align: left;color: #9F9F9F">
											 	评论${replyNum[warning.id]}
											 </div>
										 </div>
								     </div>
								    
								</div>
								
								</c:forEach>
							</div>
					</c:if>
					<c:if test="${fn:length(warnings)==0}">
						还没有报障信息!
					</c:if>
				</div>
			</div>
			<div style="margin-bottom: 100px;margin-left: 100px;">
   			 	<ul class="pagination" id="pagination1"></ul>
   			 </div>
		</div>
	</body>
	<%@ include file="/common/footer.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	
	
	<script type="text/javascript">
	  BUI.use('common/page');
	</script>
	
<script type="text/javascript">
	
	
    $.jqPaginator('#pagination1', {
    	totalPages:2,
        visiblePages: 5,
        currentPage: 1,
        onPageChange: function (num, type) {
        	if(type!='init'){
        		location.href="${path}/user/ownWarn.do?num="+num;
        	}
        }
    });
    
    $('#pagination1').jqPaginator('option', {
    	totalPages: ${totalPages},
    	currentPage:${num}
	});
    
</script>
	
	<!-- 表单验证 -->
	<script type="text/javascript">
	
	$(document.body).css({
  	  "overflow-x":"hidden",
		   "overflow-y":"auto"
    });
	
    BUI.use(['bui/form'],function(Form){
	    //创建表单
	    var form = new BUI.Form.HForm({
	    srcNode : '#form'
	    }).render();
	  });
    </script>
    

    </html>