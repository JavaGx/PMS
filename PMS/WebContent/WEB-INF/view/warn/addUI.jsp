<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>报障管理系统</title>
		<%@ include file="/common/meta.jsp"%>
	</head>
<body>
      <div id="content" class="hidden"> 
   <form id="form" class="form-horizontal" action="${pageContext.request.contextPath}/warn/saveWarning.do" method="post"> 
    <div class="control-group span8" style="width:100%;margin-top:0px;margin-left: 10px;"> 
     <label class="control-label"><h2>报障事件单：</h2></label> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>故障标题：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" name="title" data-rules="{required:true}"/> 
     </div> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:-55px"> 
     <label class="control-label">
      <s>
       *
      </s>报障人：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" value="${user.username}" disabled="disabled"/> 
     </div> 
    </div>
    <div style="clear:both"></div>
    <div class="control-group span8" style="margin-left:15px">
						        <label class="control-label">
									紧急程度：
								</label>
								<select class="input-normal" name="urgent" id="urgent"  >
									<option value="一般">
										一般
									</option>
									<option value="紧急">
										紧急
									</option>
								</select>
	</div> 
    <div class="control-group span8" style="width: 300px;margin-left:-55px">
		<label class="control-label">
		说明截图：
		</label>								
		<div class="controls" >
			<input type="text" class="input_1" name="image" id="carcoverpicture" readonly="readonly" placeholder="点击上传图片" style="width:100px"/>
		<div style="display: none;" id="cover"><textarea name="content" id="content" rows="17"></textarea></div>
	   </div>															
	</div>
    <div class="control-group span8" style="margin-left:-550px;margin-top:50px">
    <label class="control-label"><s>*</s>问题说明</label>
    <textarea id="content7" name="description" style="width:500px;height:150px;" data-rules="{required:true}" ></textarea>
    </div>
     <div style="clear:both"></div> 
     <div style="margin-top:20px"> 
      <button type="submit" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="see">提交</button> 
      <button type="reset" class="button">重置</button>
     </div>  
 
   </form>
   </div>  

</body>

<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">    
 var editorpic;
	KindEditor.ready(function(K){
		editorpic = K.create('textarea[name="content"]', {
			uploadJson : '${path}/warn/uploadImage.do',
			allowFileManager : true
		});
		
		// 单个上传图片
		K('#carcoverpicture').click(function() {
			editorpic.loadPlugin('image', function() {
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
    BUI.use(['bui/form'],function(Form){
    
    //创建表单
    var form = new BUI.Form.HForm({
    srcNode : '#form'
    }).render();
  });
    </script> 

</html>
