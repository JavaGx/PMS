<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
	 	 <%@ include file="/common/meta.jsp"%>  
	</head>
<body>
 <div class="row">
 	 <div class="span24" style="margin-left: 20px;"> 
 		<h2>需求详情</h2>
	<form id="J_Form" class="form-horizontal" method="post" action="${path}/demand/addDemand.do">
			<input value="${project.id}" name="projectId" hidden="hidden">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>需求标题:
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px" name="title" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label"><s>*</s>所属项目：</label>
              <div class="controls">
              	<input type="text" value="${project.projectName}" class="input-normal control-text" style="width:400px" data-rules="{required:true}"/> 
              
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>提出需求时间：</label>
              <div class="controls">
                <input type="text" name="plandate" class="calendar" data-rules="{required:true}">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>申请人：</label>
              <div class="controls">
              	<input type="text" disabled="disabled" value="${user.username}" class="input-normal control-text" style="width:400px" data-rules="{required:true}"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>指定完成人：</label>
              <div class="controls">
              	<select class="input-normal" name="appointPersonId" id="appointperson"  >
              		<c:if test="${users!=null }">
              			<c:forEach items="${users}" var="user">
	              			<option value="${user.id }">${user.username }</option>
	              		</c:forEach>
              		</c:if>
              	</select>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">详细需求：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" name="content" style="height: 200px;width: 400px" data-valid="{}"></textarea>
              </div>
            </div> 
            <div class="form-actions span5 offset3">
              <button id="btnSearch" type="submit" class="button button-primary">提交</button>
              <button type="reset" class="button">重置</button>
            </div>
        </form>
    </div> 
 </div>
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">
 $(document.body).css({
   "overflow-x":"auto",
   "overflow-y":"auto"
 });
 
 BUI.use('bui/form',function(Form){
     
     
     new Form.Form({
       srcNode : '#J_Form'
     }).render();
     
 });  
</script>
</body>
</html>