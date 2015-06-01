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
      <div id="content" class="hidden"> 
   <form id="form" class="form-horizontal" action="${path}/saveback.do" method="post"> 
    <div class="control-group span8" style="margin-left:-20px;width:100%;margin-top:0px;height:20px"> 
     <label class="control-label">回复事件单：</label> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>故障标题：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" value="${title}" name="title1" disabled="disabled"/> 
      <input type="hidden"  name="title" value="${title}" />
      <input type="hidden" id="showid" name="showid" value="${showid}" />
     </div> 
    </div> 
        <div class="control-group span8" style="height:35px;margin-left:-35px"> 
     <label class="control-label">
      <s>
       *
      </s>回复人：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" value="${user.username}" name="backperson1" disabled="disabled"/> 
      <input type="hidden" id="" name="backperson" value="${user.username}" />
     </div> 
    </div> 
    <div style="clear:both"></div>
    <div class="control-group span8" style="margin-left:0px">
    <label class="control-label"><s>*</s>原因说明</label>
    <textarea id="content7" name="reason" style="width:500px;height:150px;"data-rules="{required:true}" ></textarea>
    </div>
     <div style="clear:both"></div> 
     <div class="control-group span8" style="margin-left:0px">
    <label class="control-label"><s>*</s>处理方案</label>
    <textarea id="content7" name="handle" style="width:500px;height:150px;"data-rules="{required:true}"></textarea>
    </div>
     <div style="margin-top:230px"> 
      <button type="submit" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="see">提交</button> 
      <button type="button" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="iteminfo"  onclick="javascript:history.back(-1)">返回列表</button> 
     </div>  
 
   </form>
   </div>  

</body>

<%@ include file="/common/footer.jsp"%>

   <script type="text/javascript">
    BUI.use(['bui/form'],function(Form){
    
    //创建表单
    var form = new BUI.Form.HForm({
    srcNode : '#form'
    }).render();
  });
    </script> 

  
<script type="text/javascript">


</script>

</html>
