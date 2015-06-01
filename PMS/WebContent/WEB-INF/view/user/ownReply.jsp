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
						回答问题列表
					</h3>
				</div>
				<div class="panel-body">
					<c:if test="${fn:length(replies)!=0}">
							<div id="content" class="hidden">
								<c:forEach items="${replies}" var="reply">
								<div style="margin-bottom: 50px;border-bottom: 1px dotted #e0e0e0;"> 
									<div style="margin-left: 70px;"> 
									     <div>
									     	<c:choose>
										     	<c:when test="${reply.warning.state=='已解决'||reply.warning.state=='已关闭'}">
									     			<span class="done">完</span>
									     		</c:when>
									     		<c:otherwise>
									     			<span class="waiting">等</span>
									     		</c:otherwise>
								     		</c:choose>
									     	<a class="page-action" href="#" data-href="${path}/warn/selectone.do?id=${reply.warning.id}" title="报障信息" data-id="${reply.warning.id}">
									     		<span style="color: #000;font-size:14px;max-width: 800px;font-family:Microsoft YaHei;">${reply.warning.title}</span>
									     	</a>
									     </div>
									     <div style="margin-left: 20px;color: #9F9F9F;margin-top: 20px;">
									     	<c:if test="${reply.handle.length()>200}">${reply.handle.substring(0,200)}...</c:if>
											<c:if test="${reply.handle.length()<=200}">${reply.handle}</c:if>
									     </div>
										 <div style="margin-top: 20px;">
										 	<div style="text-align: left;float: left;width: 200px;color: #9F9F9F">
										 		${reply.warning.starttime}
											 </div>
											 <div style="text-align: left;color: #9F9F9F">
											 	提问人：${reply.warning.applicant.username}
											 </div>
										 </div>
								     </div>
								    
								</div>
								
								</c:forEach>
							</div>
					</c:if>
					<c:if test="${fn:length(replies)==0}">
						还没有回复信息!
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
        		location.href="${path}/user/ownReply.do?num="+num;
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