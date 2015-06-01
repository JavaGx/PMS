<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
		<%@ include file="/common/meta.jsp"%>
	</head>
<script type="text/javascript">
	function check(){
		var oldPassword=$("oldPassword").val();
		var password=$("password").val();
		var modifyPassword=$("modifyPassword").val();
		if(oldPassword==null||password==null||modifyPassword==null){
			$("errorInfo").text("请输入密码！");
			return false;
		}else{
			
			if(password==modifyPassword){
				$("errorInfo").text("验证密码不一样！");
				return true;
			}else{
				return false;
			}
		}
	}
</script>	
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
						<form id="form" action="${path}/user/modifyPassword.do" onsubmit="return check()"  method="post" class="form-horizontal">
							<input value="${user.id}" name="id" hidden="hidden">
							<div class="control-group"> 
							     <label class="control-label">
							      <s>*</s>旧密码：
							     </label> 
							     <div class="controls"> 
							      <input id="oldPassword" type="text" class="input-normal control-text" style="width:200px" name="oldPassword" data-rules="{required:true}"/> 
							     </div>
							</div>
							<div class="control-group">
				              <label class="control-label"><s>*</s>新密码：</label>
				              <div class="controls">
				              	<input id="password" type="text" class="input-normal control-text" style="width:200px" name="password" data-rules="{required:true}"/> 
				              	${errorInfo}
				              </div>
				            </div>
				            <div class="control-group">
				              <label class="control-label"><s>*</s>确认密码：</label>
				              <div class="controls">
				               <input type="text" id="modifyPassword" class="input-normal control-text" style="width:200px" name="modifyPassword" data-rules="{required:true}"/> 
				              </div>
				              <div id="errorInfo"></div>
				            </div>
				            <div class="control-group">
				              <label class="control-label">&nbsp;</label>
				              <div class="controls" style="height: 100px;">
				                <button class="button button-small" type="submit">
						      	<i class="icon-cog" type="submit" ></i>提交</button>
						      	<button type="reset" class="button button-small">&nbsp;重置</button>
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