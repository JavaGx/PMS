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
		<div class="demo-content">
			<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
				<div style="margin-top: 10px;margin-left: 30px"><font size="4">当前有</font><span class="grid-command" style="font-size:27px;color: red">${bestNum}</span><font size="3">个最佳回复</font></div>
					<form id="searchForm" action="${path}/back.do"class="form-horizontal" method="post" tabindex="0"
						style="outline: none;" >
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">
									回复人：
								</label>
								<div class="controls">
									<input type="text" name="replyPerson" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />
								</div>
							</div>
							<div class="control-group span8">
								<label class="control-label">
									标题：
								</label>
								<div class="controls">
									<input type="text" name="title" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />
								</div>
							</div>
							<div class="form-actions span5">
								<button id="btnSearch" type="submit"
									class="button button-primary"
									style="margin-left: 20px; height: 27px; padding-top: 0px"
									onclick="select()">
									查询
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="search-grid-container">
				<div id="grid">
				</div>

			</div>
				<div style="margin-top: 20px;">
					<a class="page-action" data-type="reload" href="#">
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px">
						刷新
					</button>
					</a>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="delitem">
						删除
					</button>
				</div>
		</div>
	</body>
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">
  BUI.use('common/page');
</script>
<script type="text/javascript">
	$(document.body).css({
  	  "overflow-x":"hidden",
		   "overflow-y":"auto"
    });
</script>
<script type="text/javascript">
    BUI.use(['bui/grid','bui/data'],function(Grid,Data){
    var Grid = BUI.Grid,
    Store = BUI.Data.Store,
    columns = [
	    { title: '编号',width: 100, sortable: true, dataIndex: 'id'},
	    { title: '标题',width: 100, sortable: false, dataIndex: 'warning', selectable: true,renderer:function(value){ return value.title} },
	    { title: '时间',width: 100, sortable: true, dataIndex: 'replytime', selectable: true },
	    { title: '处理方案',width: 100,sortable: false, dataIndex: 'handle'},
	    { title: '回复人', width: 100,sortable: true, dataIndex: 'replyPerson',renderer:function(value){ return value.username}},
	    { title: '操作', width: 50,sortable: true, dataIndex: 'warning',renderer:function(value){ 
			return '<a class="page-action" href="#" data-href="${path}/warn/selectone.do?id='+value.id+'" title="报障信息" data-id="detailedDemand"><span class="grid-command">查看</span></a>';
				}
	    }
    ];
     data = ${replylist} 

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
	      }else{
			   BUI.Message.Confirm('确认要删除吗？',function(){
				   setTimeout(function(){
				   		store.remove(selections);
				   
				   });
			   },'question');}
		  }
	
	     $('#delitem').on('click',function () {
	    	 $.ajax({
	     		url:'${path}/reply/deleteReply?id='+selections[0].id,
	     		type:'post',
	     		success:function(){
	     			alert("删除成功！");
	     		},
	     		error:function(){
	     			alert("出错！");
	     		}
	     	});
	    	show();
	     });
     });

    </script> 
 
</html>