<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
		<%@ include file="/common/meta.jsp"%>
		<link href="${pageContext.request.contextPath}/css/define.css" rel="stylesheet" type="text/css" />
	</head>	
	<body>
		<div class="row">
			<div class="panel panel-small span12"
				style="margin-left: 20px; margin-top: 20px; width: 1000px;">
				<div class="panel-header clearfix">
					<h3 class="pull-left">
						评论列表
					</h3>
				
				</div>
				<div class="panel-body">
					<c:if test="${commentInfo!=null}">
							<div id="content" class="hidden">
								<c:forEach items="${commentInfo}" var="reply">
								<c:if test="${reply.warning!=null}">
									<div style="margin-bottom: 50px;"> 
							     	<div style="float: left;">
								      	<img width="60px;" height="60px;" src="${path}/${reply.replyPerson.image}">
								    </div>
									<div style="margin-left: 70px;"> 
									     <div>
									     	<div style="color: #9F9F9F"> 
										      ${reply.replyPerson.username}回答问题
										     </div>
									     </div>
									     <div style="border: 1px solid;border-color: #9F9F9F">
									     	<div>
									     	<a class="page-action" href="#" data-href="${path}/warn/selectone.do?id=${reply.warning.id}" title="报障信息" data-id="detailedWarn">
									     		<span style="color: #08c;font-weight: bold;">${reply.warning.title}</span>
									     	</a>
									     </div>
									     <div style="text-align: left;color: #9F9F9F">
											<c:if test="${warning.description.length()>200}">${warning.description.substring(0,200)}...</c:if>
											<c:if test="${warning.description.length()<=200}">${warning.description}</c:if>
										 </div>
										 <div>
										 	<div style="text-align: left;width: 100px;color: #9F9F9F">
										 		浏览${reply.warning.browseNumber}
											 </div>
										 </div>
									     </div>
										 <div style="text-align: left;color: #9F9F9F;margin-left: 20px;">
										 	<c:if test="${reply.handle.length()>200}">${reply.handle.substring(0,200)}...</c:if>
											<c:if test="${reply.handle.length()<=200}">${reply.handle}</c:if>
										 </div>
								     </div>
								    
								</div>
								</c:if>
								<c:if test="${reply.parentReply!=null}">
									<div style="margin-bottom: 50px;"> 
							     	<div style="float: left;">
								      	<img width="60px;" height="60px;" src="${path}/${reply.replyPerson.image}">
								    </div>
									<div style="margin-left: 70px;"> 
									     <div>
									     	<div style="color: #9F9F9F"> 
										      ${reply.replyPerson.username}评论回答
										     </div>
									     </div>
									     <div>
									     	<span style="color: #08c;font-weight: bold;">${reply.parentReply.handle}</span>
									     </div>
										 <div style="text-align: left;color: #9F9F9F;margin-left: 20px;">${reply.handle}</div>
								     </div>
								    
								</div>
								</c:if>
								</c:forEach>
							</div>
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
    	totalPages:1,
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