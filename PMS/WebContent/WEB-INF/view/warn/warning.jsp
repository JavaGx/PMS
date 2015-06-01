<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<html>
<head>
<title>项目管理系统</title>
<link href="${pageContext.request.contextPath}/css/warn.css" rel="stylesheet" type="text/css" />
<%@ include file="/common/meta.jsp"%>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="demo-content">
		<div class="row">
		    <div class="panel" style="width:1000px;margin-left: 20px;margin-top: 20px;">
		      <div class="panel-header" style="height: 70px;">
	     			<div style="float: left;">
				      	<img width="50px;" height="50px;" src="${path}/${warning.applicant.image}">
				    </div>
				    <div style="margin-left: 70px;margin-bottom: 10px;">
				    	<div style="float: left;" class="font-get">${warning.applicant.username}</div>
				    	<div style="text-align: right;" class="font-get">${warning.starttime}</div>
				      	<div>
				      		<h4>
						      	<c:choose>
							     	<c:when test="${warning.state=='已解决'||warning.state=='已关闭'}">
						     			<span class="done">完</span>
						     		</c:when>
						     		<c:otherwise>
						     			<span class="waiting">等</span>
						     		</c:otherwise>
					     		</c:choose>
						        ${warning.title}
					        </h4>
				      	</div>
			       </div>
		      </div>
		      
		      <div class="panel-body">
		       	<div>${warning.description}</div>
		       	<c:if test="${warning.image!=''}">
		       		<div>
			       		<img style="max-width: 800px;max-height: 400px;" src="${pageContext.request.contextPath}/${warning.image}">
					</div>
		       	</c:if>
		      </div>
		      <div>
		      	<label class="font-local">
		      		<img src="${pageContext.request.contextPath}/images/code_ico.png">
		      		紧急程度：
		      	</label>
				<label class="font-get">${warning.urgent}</label>
				<label class="font-local">
					<img src="${pageContext.request.contextPath}/images/code_ico.png">
					报障人：
				</label>
				<label class="font-get">${warning.applicant.username}</label>
		      </div>
		    </div>
		 </div>
		 <div class="row">
		 	<div class="panel panel-info" style="width:1000px;margin-left: 20px;">
	          <div class="panel-header clearfix" style="height: 15px;">
	            <h3 class="pull-left"><img src="${pageContext.request.contextPath}/images/list_ico.png">
	            	所有回答列表</h3>
	          </div>
	          <div class="panel-body">
	          	<c:if test="${replylist==null}">
	          		目前还没有回答!
	          	</c:if>
	            <c:if test="${replylist!=null}">
				     <c:forEach items="${replylist}" var="reply">
				     <!-- 有最佳答案 -->
				     	<c:if test="${warning.bestreply!=null}">
				     		<c:if test="${warning.bestreply.id==reply.id}">
					     		<div style="background-color: #f1fedd;">
					     			<div style="float: left;">
								      	<img width="50px;" height="50px;" src="${path}/${reply.replyPerson.image}">
								    </div>
								    <div style="margin-left: 70px;margin-bottom: 10px;">
								       	<div style="float: left;" class="font-get">${reply.replyPerson.username}</div>
								       	<div style="text-align: right;" class="font-get">${reply.replytime}</div>
								       	<p>
								       		${reply.handle}
								       	</p>
								       	<div style="float: left;" class="font-get">
										    <span onclick="openComment(this);" style="cursor: pointer">评论(${commentNums[reply.id]!=0?commentNums[reply.id]:0})</span>
										 </div>
								       	<div style="text-align: right;" class="font-local">
								       		最佳答案
								       	</div>
								     </div>
						       		<form method="post" action="${path}/reply/addComment.do" class="form-horizontal" data-depends="{'#comment:click':['show']}" style="display: none;">
						       			<input id="p${reply.id}" name="pid" value="${reply.id}" hidden="hidden">
						       			<input name="wid" value="${warning.id}" hidden="hidden">
										  <c:forEach items="${allComments[reply.id]}" var="comment">
										  	<div style="margin-bottom: 10px;margin-left: 70px;">
											    <div style="float: left;white-space:nowrap;width: 200px;margin-right: 5px;">
											      		<a class="font-get">${comment.key.replyPerson.username} </a>回复@${comment.value}:
											     </div>
											     <div style="text-align: left;">
											      <p>${comment.key.handle}</p>
											     </div>
											     <div style="text-align: right;">
										       			<button type="button" onclick="replyAnswer('${reply.id}',${comment.key.id},'${comment.key.replyPerson.username}')" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px">回复</button> 
										       	</div>
											</div>
										  </c:forEach>
										   <div style="float: left;margin-left: 70px;">
											  <textarea id="${reply.id}" style="width:400px;height: 50px;" name="handle"></textarea> 
										   </div>
										   <div style="vertical-align: bottom;">
											  <button type="submit" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="replyinfo">评论</button> 
										   </div>
									</form>
								</div>
					     	</c:if>
					     	<c:if test="${warning.bestreply.id!=reply.id}">
						     	<div style="margin-top: 30px;">
						     		<div style="float: left;">
								      	<img width="50px;" height="50px;" src="${path}/${reply.replyPerson.image}">
								    </div>
								    <div style="margin-left: 70px;margin-bottom: 10px;">
								       	<div style="float: left;" class="font-get">${reply.replyPerson.username}</div>
								       	<div style="text-align: right;" class="font-get">${reply.replytime}</div>
							       	
								       	<p>
								       		${reply.handle}
								       	</p>
								       	<div class="font-get">
										    <span onclick="openComment(this);" style="cursor: pointer">评论(${commentNums[reply.id]!=0?commentNums[reply.id]:0})</span>
										 </div>
						       		</div>
						       		<form method="post" action="${path}/reply/addComment.do" class="form-horizontal" data-depends="{'#comment:click':['show']}" style="display: none;">
						       			<input id="p${reply.id}" name="pid" value="${reply.id}" hidden="hidden">
						       			<input name="wid" value="${warning.id}" hidden="hidden">
										  <c:forEach items="${allComments[reply.id]}" var="comment">
										  	<div style="margin-bottom: 10px;margin-left: 70px;">
											    <div style="float: left;white-space:nowrap;width: 200px;margin-right: 5px;">
											      		<a class="font-get">${comment.key.replyPerson.username} </a>回复@${comment.value}:
											     </div>
											     <div style="text-align: left;">
											      <p>${comment.key.handle}</p>
											     </div>
											     <div style="text-align: right;">
										       			<button type="button" onclick="replyAnswer('${reply.id}',${comment.key.id},'${comment.key.replyPerson.username}')" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px">回复</button> 
										       	</div>
											</div>
										  </c:forEach>
										   <div style="float: left;margin-left: 70px;">
											  <textarea id="${reply.id}" style="width:400px;height: 50px;" name="handle"></textarea> 
										   </div>
										   <div style="vertical-align: bottom;">
											  <button type="submit" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="replyinfo">评论</button> 
										   </div>
									</form>
								</div>
					       	</c:if>
				     	</c:if>
				     	<!-- 没最佳答案 -->
				     	<c:if test="${warning.bestreply==null}">
			     		<div style="margin-top: 30px;">
			     			<div style="float: left;">
						      	<img width="50px;" height="50px;" src="${path}/${reply.replyPerson.image}">
						    </div>
						    <div style="margin-left: 70px;margin-bottom: 10px;">
						       	<div style="float: left;" class="font-get">${reply.replyPerson.username}</div>
						       	<div style="text-align: right;" class="font-get">${reply.replytime}</div>
					       	
						       	<p>
						       		${reply.handle}
						       	</p>
						       	<div style="float: left;" class="font-get">
								    <span onclick="openComment(this);" style="cursor: pointer">评论(${commentNums[reply.id]!=0?commentNums[reply.id]:0})</span>
								 </div>
								<c:if test="${warning.applicant.username==user.username}">
						       	<div style="text-align: right;">
						       		<button type="button" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" onclick="bestanswer(${reply.id},${warning.id});" id="bestreply">采纳答案</button> 
						       	</div>
						       	</c:if>
						       	<c:if test="${warning.applicant.username!=user.username}">
						       		<div style="height: 20px;"></div>
						       	</c:if>
						   </div>
				       	
				       		<form method="post" action="${path}/reply/addComment.do" class="form-horizontal" data-depends="{'#comment:click':['show']}" style="display: none;">
				       			<input id="p${reply.id}" name="pid" value="${reply.id}" hidden="hidden">
					       		<input name="wid" value="${warning.id}" hidden="hidden">
							  <c:forEach items="${allComments[reply.id]}" var="comment">
							  	<div style="margin-bottom: 10px;margin-left: 70px;">
								    <div style="float: left;white-space:nowrap;width: 200px;margin-right: 5px;">
								      		<a class="font-get">${comment.key.replyPerson.username} </a>回复@${comment.value}:
								     </div>
								     <div style="text-align: left;">
								      <p>${comment.key.handle}</p>
								     </div>
								     <div style="text-align: right;">
							       			<button type="button" onclick="replyAnswer('${reply.id}',${comment.key.id},'${comment.key.replyPerson.username}')" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px">回复</button> 
							       	</div>
								</div>
							  </c:forEach>
							   <div style="float: left;margin-left: 70px;">
								  <textarea id="${reply.id}" style="width:400px;height: 50px;" name="handle"></textarea> 
							   </div>
							   <div style="vertical-align: bottom;">
								  <button type="submit" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="replyinfo">评论</button> 
							   </div>
							</form>
							</div>
				       	</c:if>
				     </c:forEach>
			    </c:if>
	          </div>
	          
	        </div>
		 </div>
		 <div style="padding: 20px;width: 1000px;margin-bottom: 30px;">
			 	<form id="reply" action="${path}/reply/addReply.do" method="post">
					<input type="hidden" name="wid" value="${warning.id}"/>
		            <textarea name="handle" id="editor" rows="20"></textarea>
					 <script>
						CKEDITOR.replace('editor',{
							toolbar: [
										['Link', 'Unlink'],
										['Bold', 'Italic','Strike','RemoveFormat'],
										['NumberedList', 'BulletedList','Blockquote'],
										['FontSize', 'TextColor', 'BGColor'],
										['Image','Flash', 'Smiley'],
										['Table'],
										['Syntaxhighlight'],
										['Source'],
										['Maximize']
									]
						});
					</script>
					
		    	</form>
		    	<div style="text-align: right;margin-top: 10px;">
					 <button type="button" onclick="submitForm();" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px">回复</button> 
				</div>
			 </div>
	  </div>
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">  
 $(document.body).css({
   "overflow-x":"auto",
   "overflow-y":"auto"
 });
 
 function replyAnswer(id,pid,replyPerson){
	 $("#"+id).focus();
	 $("#"+id).attr("style","width:400px;height: 50px;box-shadow:0 0 0 #fff;");
	 var handle=$("#"+id).val("回复@"+replyPerson+"说:");
	 $("#p"+id).val(pid);
 }
 
 function submitForm(){
	 $("#reply").submit();
 }
 
 function openComment(obj){
	 var span=$(obj);
	 var form=span.parent().parent().next();
	 var style=form.attr("style");
	 if(style!=null){
		 form.removeAttr("style");
	 }else{
		 form.attr("style","display: none;");
	 }
	 
 }
 
 function bestanswer(replyid,warningid){
		 
	 location.href="${path}/warn/bestreply.do?replyId="+replyid+"&warnId="+warningid;
 
 }
 BUI.use('bui/form',function (Form) {
	  new Form.HForm({
	    srcNode : '#J_Form'
	  }).render();
	});
</script>
</body>
</html>