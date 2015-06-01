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
				style="margin-left: 20px; margin-top: 20px; width: 800px;">
				<div class="panel-header clearfix">
					<h3 class="pull-left">
						设置头像
					</h3>
				
				</div>
				<div class="panel-body">
					<div id="content" class="hidden">
						<div style="margin-bottom: 20px;">
							<img style="width: 100px;height: 100px;" src="${path}/${user.image}"/>
						</div>
						<div> 
							<input type="button" name="image" id="carcoverpicture" value="上传" style="width:100px"/>
							<div style="display: none;" id="cover"><textarea name="content" id="content" rows="17"></textarea></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript">    
 	var editorpic;
	KindEditor.ready(function(K){
		editorpic = K.create('textarea[name="content"]', {
			uploadJson : '${path}/user/settingImage.do',
			allowFileManager : true,
			afterUpload:function(message){
				parent.location.reload(); 
            }
		});
		
		// 单个上传图片
		K('#carcoverpicture').click(function() {
			editorpic.loadPlugin('image', function() {
				editorpic.plugin.imageDialog({
					showRemote : false,
					clickFn : function(url, title, width, height, border, align) {
						editorpic.hideDialog();
					}
				});
			});
			
			
		});
	});	
</script> 

    </html>