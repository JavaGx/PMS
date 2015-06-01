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
<!-- 弹出窗详情================================================== -->

			<div id="contentme" class="hidden" style="display: none">
				<form id="formme" class="form-horizontal" method="post">
					    <div class="control-group span8" style="margin-left:-20px;width:100%;margin-top:0px;height:20px"> 
     <label class="control-label">回复单：</label> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>故障标题：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" disabled="disabled" id="title"/> 
      <input type="hidden" id="id" name="id"/>
     </div> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:-40px"> 
     <label class="control-label">
      <s>
       *
      </s>提交时间：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:120px" disabled="disabled" id="backtime"/> 
     </div> 
    </div> 
          <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>回复人：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px" disabled="disabled" id="backperson"/> 
     </div> 
    </div> 
     <div style="clear:both"></div> 
     <div class="control-group span8" style="margin-left:0px">
    <label class="control-label"><s>*</s>处理方案</label>
    <textarea id="handle" name="handle" style="width:500px;height:150px;"data-rules="{required:true}" disabled="disabled"></textarea>
    </div>
				</form>
			</div>
		<div class="demo-content">
			<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
				<div style="margin-top: 10px;margin-left: 30px"><font size="4">当前有</font><span class="grid-command" style="font-size:27px;color: red">${count4}</span><font size="3">个回复单</font></div>
				</div>
			</div>
			<div class="search-grid-container">
				<div id="grid">
				</div>

			</div>
				<div style="margin-top: 20px;">
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="see">
						查看
					</button>
					<button type="button" class="button button-primary" style="margin-left:20px;height:27px;padding-top:0px" id="iteminfo"  onclick="javascript:history.back(-1)">返回列表</button>
				</div>
		</div>
	</body>
	<%@ include file="/common/footer.jsp"%>
       <script type="text/javascript">
    BUI.use(['bui/grid','bui/data'],function(Grid,Data){
    var Grid = BUI.Grid,
    Store = BUI.Data.Store,
    columns = [
    { title: '编号',width: 100, sortable: true, dataIndex: 'id'},
    { title: '标题',width: 100, sortable: false, dataIndex: 'warning', selectable: true,renderer:function(value){ return value.warning.title} },
    { title: '时间',width: 100, sortable: true, dataIndex: 'replytime', selectable: true },
    { title: '处理方案',width: 100,sortable: false, dataIndex: 'handle'},
    { title: '回复人', width: 100,sortable: true, dataIndex: 'replyperson'},
    ];
     data = ${playlist} 

     store = new Data.Store({
        data:data,
        pageSize:6
      }),
    grid = new Grid.Grid({
    render:'#grid',
    loadMask: true,
    forceFit:true,
    columns : columns,
    store: store,
    plugins : [Grid.Plugins.CheckSelection,Grid.Plugins.AutoFit], //勾选插件、自适应宽度插件
    // 底部工具栏
   
    // 顶部工具栏
    bbar : {
    //items 也可以在此配置
    // pagingBar:表明包含分页栏
    pagingBar:true
    }
    });
    grid.render();
    //创建表单，表单中的日历，不需要单独初始化
   BUI.use('bui/form',function (Form) {
    new Form.Form({
      srcNode : '#searchForm'
    }).render();
  });
     
    form.on('beforesubmit',function(ev) {
    //序列化成对象
    var obj = form.serializeToObject();
    obj.start = 0; //返回第一页
    store.load(obj);
    return false;
    });
    
  });
    </script> 
    <!-- script end --> 
   <!-- 删除数据 --> 
   <script type="text/javascript">
     BUI.use('bui/overlay',function(overlay){
      function show () {
      var selections = grid.getSelection();
      if(selections==''){
          BUI.Message.Alert('请先选择你要删除的记录','info');
      }
      else{
		   BUI.Message.Confirm('确认要删除吗？',function(){
		   setTimeout(function(){
		   store.remove(selections);
		});
		},'question');}
		}

    $('#delitem').on('click',function () {
    show();
   });
    });

    </script> 
   <!-- 查看详情--> 
	<script type="text/javascript">
     BUI.use(['bui/overlay','bui/form'],function(overlay,Form){
        var form = new Form.Form({
         srcNode : '#formme'
         
         }).render(); 
                  
      function show () {
      var selections = grid.getSelection();
      var aaa=JSON.stringify(selections);
     // alert(aaa);
      if(selections==''){
          BUI.Message.Alert('请先选择你要查看的记录','info');
      }
      if(selections.length>1){
         BUI.Message.Alert('只能选择1条数据','info');
      }
       //   if('${logUser.state}'==0){
       // BUI.Message.Alert('您没有查看权限','info');
       //}
     if(selections.length==1){
    
        BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
    var dialog = new Overlay.Dialog({
    title:'详情 ',
    width:800,
    height:650,
    closeAction : 'destroy',
    //配置DOM容器的编号
    contentId:'contentme',
    success:function () {
      // window.location.href='${path}/cue.do'
    //$("#formme").attr("action","${path}/playreply.do");
	//$("#formme").submit();
	this.close();
    }
    });
  
    dialog.show();  
    form.clearErrors()
    });   
    $('#title').val(selections[0].title);
    $('#backtime').val(selections[0].backtime);
    $('#backperson').val(selections[0].backperson);
    $('#reason').val(selections[0].reason);
    $('#handle').val(selections[0].handle);

				
     }
}

    $('#see').on('click',function () {
    show();
   });
    });

    </script>
 
</html>