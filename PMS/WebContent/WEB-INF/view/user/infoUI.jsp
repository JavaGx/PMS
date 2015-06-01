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
			<div class="panel panel-small span12"
				style="margin-left: 200px; margin-top: 20px; width: 800px;">
				<div class="panel-header clearfix">
					<h3 class="pull-left">
						修改个人资料
					</h3>
				
				</div>
				<div class="panel-body">
					<div id="content" class="hidden">
						<form id="form" action="${path}/user/updateUser.do" method="post" class="form-horizontal">
							<input value="${user.id}" name="id" hidden="hidden">
							<div class="control-group"> 
							     <label class="control-label">
							      <s>*</s>姓名：
							     </label> 
							     <div class="controls"> 
							      <input type="text" value="${user.username}" disabled="disabled" class="input-normal control-text" style="width:100px" data-rules="{required:true}"/> 
							     </div>
							</div>
							<div class="control-group">
				              <label class="control-label"><s>*</s>性别：</label>
				              <div class="controls">
				              	<input type="text" value="${user.sex}" class="input-normal control-text" style="width:100px" name="sex" data-rules="{required:true}"/> 
				              </div>
				            </div>
				            <div class="control-group">
				              <label class="control-label"><s>*</s>电话：</label>
				              <div class="controls">
				               <input type="text" value="${user.phone}" class="input-normal control-text" style="width:100px" name="phone" data-rules="{required:true}"/> 
				              </div>
				            </div>
				            <div class="control-group">
				              <label class="control-label"><s>*</s>邮箱：</label>
				              <div class="controls">
				               <input type="text" value="${user.email}" class="input-normal control-text" style="width:200px" name="email" data-rules="{required:true}"/> 
				              </div>
				            </div>
				            <div class="control-group">
				              <label class="control-label">个人留言：</label>
				              <div class="controls" style="height: 180px;">
				                <textarea type="text" value="${user.description}" name="description" style="height: 100px;width: 500px" data-valid="{}"></textarea>
				              </div>
				            </div>
				            <div class="control-group">
				              <label class="control-label">&nbsp;</label>
				              <div class="controls" style="height: 100px;">
				                <button class="button button-small" type="submit">
						      	<i class="icon-cog" type="submit" ></i>保存</button>
						      	<button type="reset" class="button button-small">&nbsp;重置</button>
						      	 ${msg}
				              </div>
				            </div>
							</div>
						</form>
					</div>
				</div>
			</div>

	</body>
	<%@ include file="/common/footer.jsp"%>
	<!-- 表单验证 -->
	<script type="text/javascript">
    BUI.use(['bui/form'],function(Form){
	    //创建表单
	    var form = new BUI.Form.HForm({
	    srcNode : '#form'
	    }).render();
	  });
  
		
         
    </script>

    </html>