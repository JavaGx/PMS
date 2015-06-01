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
 	 <div class="span24" style="margin-left: 20px;margin-bottom: 30px;"> 
 		<h2>项目详情</h2>
	<form id="J_Form" class="form-horizontal" method="post" action="${path}/project/addProject.do">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目名称：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:100px" name="projectName" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目版本：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:50px" name="versionNo" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目主题：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px" name="title" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label"><s>*</s>项目负责组：</label>
              <div class="controls">
                <select name="departmentId" data-rules="{required:true}">
                  <option value="">-请选择-</option>
                  <c:if test="${departments!=null}">
                  	<c:forEach items="${departments}" var="department">
                  		<option value="${department.id}">${department.name}</option>
                  	</c:forEach>
                  </c:if>
                </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>开始时间：</label>
              <div class="controls">
                <input type="text" name="startdate" class="calendar" data-rules="{required:true}">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label"><s>*</s>预计完成时间：</label>
              <div class="controls">
                <input type="text" name="plandate" class="calendar" data-rules="{required:true}">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">上传附件：</label>
              <div class="controls">
                <input type="text" class="input_1" name="file" id="carcoverpicture" readonly="readonly" placeholder="点击上传文件" style="width:100px"/>
				<div style="display: none;" id="cover"><textarea name="content" id="content" rows="17"></textarea></div>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">项目描述：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" name="description" style="height: 200px;width: 400px" data-valid="{}"></textarea>
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
 var editorpic;
	KindEditor.ready(function(K){
		editorpic = K.create('textarea[name="content"]', {
			uploadJson : '${path}/project/uploadFile.do',
			allowFileManager : true,
            success:function(msg){
            	alert(msg.message);
            }
		});
		
		// 单个上传图片
		K('#carcoverpicture').click(function() {
			editorpic.loadPlugin('insertfile', function() {
				editorpic.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#carcoverpicture').val(),
					clickFn : function(url, title, width, height, border, align) {
						K('#carcoverpicture').val(url);
						editorpic.hideDialog();
					}
				});
			});
		});
	});	
</script> 
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