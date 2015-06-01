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
 		<h2>权限岗位</h2>
	<form id="J_Form" class="form-horizontal" method="post" action="${path}/privilege/addPrivilege.do">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>权限名称:
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px" name="name" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      url:
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px" name="url"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label">上级权限：</label>
              <div class="controls">
                <select name="parentId">
                  <option value="">-请选择-</option>
                  <c:if test="${privileges!=null}">
                  	<c:forEach items="${privileges}" var="privilege">
                  		<option value="${privilege.id}">${privilege.name}</option>
                  	</c:forEach>
                  </c:if>
                </select>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">详细描述：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" name="description" style="height: 150px;width: 350px" data-valid="{}"></textarea>
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