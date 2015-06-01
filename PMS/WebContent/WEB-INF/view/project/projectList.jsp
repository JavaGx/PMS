<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>项目管理系统</title>
		<%@ include file="/common/meta.jsp"%>
	</head>
	<body >
		<div class="demo-content">
<style>
    /**内容超出 出现滚动条 **/
    .bui-stdmod-body{
      overflow-x : hidden;
      overflow-y : auto;
    }
</style>
<!-- 弹出窗修改================================================== -->
<div id="projectcontent" class="hidden" style="display: none">
<form id="J_Form" class="form-horizontal" method="post">
	<input id="id" name="id" hidden="hidden">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目名称：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:100px" id="projectName" name="projectName" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目版本：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:50px" id="versionNo" name="versionNo" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>项目主题：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px;" id="title" name="title" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>申请人：
			     </label> 
			     <div class="controls"> 
			      <input type="text" disabled="disabled" class="input-normal control-text" style="width:400px" id="applicantId" name="applicantId" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label"><s>*</s>项目负责组：</label>
              <div class="controls">
                 <input type="text" disabled="disabled" class="input-normal control-text" style="width:400px" id="departmentId" name="departmentId" data-rules="{required:true}"/> 
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>开始时间：</label>
              <div class="controls">
                <input type="text" disabled="disabled" id="startdate" name="startdate" class="calendar" data-rules="{required:true}">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label"><s>*</s>预计完成时间：</label>
              <div class="controls">
                <input type="text" id="plandate" name="plandate" class="calendar" data-rules="{required:true}">
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">项目描述：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" id="description" name="description" style="height: 200px;width: 400px" data-valid="{}"></textarea>
              </div>
            </div> 
 </form>
</div>
	<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
					<form id="searchForm" action="${path}/project/searchProject.do" method="post" class="form-horizontal" tabindex="0"style="outline: none;" >
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">
									项目名称：
								</label>
								<div class="controls">
									<input type="text" name="projectName" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />
								</div>
							</div>
						    <div class="control-group span8" >
                                 	<label class="control-label">项目版本：</label>
                                	<div class="controls" >
                               	<input type="text" name="versionNo" class="control-text"
									data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />                    
                                 	</div>
                               </div>
							<div class="form-actions span5">
								<button id="btnSearch" type="submit"
									class="button button-primary"
									style="margin-left: 20px; height: 27px; padding-top: 0px">
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
					<button type="button" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changme">
						修改
					</button>
					<a class="page-action" data-type="reload" href="#">
						<button type="button" class="button button-primary"
							style="margin-left: 20px; height: 27px; padding-top: 0px">
							刷新
						</button>
					</a>
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
      
    BUI.use(['bui/grid','bui/data'],function(Grid,Data){
	    var Grid = BUI.Grid,
	    Store = BUI.Data.Store,
	    columns = [
		    { title: '编号',width: 30, sortable: true, dataIndex: 'id'},
		    { title: '项目名称', width: 50, sortable: false, dataIndex: 'projectName', selectable: true },
		    { title: '版本', width: 30, sortable: false, dataIndex: 'versionNo', selectable: true },
		    { title: '标题', width: 120, sortable: false, dataIndex: 'title', selectable: true },
		    { title: '开始日期', width: 50, sortable: true, dataIndex: 'startdate', selectable: true },
		    { title: '计划完成日期', width: 50, sortable: true, dataIndex: 'plandate', selectable: true },
		    { title: '所属项目组', width: 50,sortable: true, dataIndex: 'department',renderer:function(value){return value.name}},
		    { title: '策划人', width: 50,sortable: true, dataIndex: 'applicant',renderer:function(value){return value.username}},
		    { title: '操作', width: 100,sortable: true, dataIndex: 'id',renderer:function(value){ 
		    		return '<a class="page-action" href="#" data-href="${path}/project/detailedProject.do?projectId='+value+'" title="项目信息" data-id="detailedProject"><span class="grid-command">详细信息</span></a>' 
		    		+'<a class="page-action" href="#" data-href="${path}/demand/demandList.do?projectId='+value+'" title="需求列表" data-id="demandList"><span class="grid-command">需求列表</span></a>'
		    		
		    		}
		    }
	    ];
	    data = ${projects} 
	
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
/*     
    grid.on('cellclick',function  (ev) {
        var record = ev.record, //点击行的记录
          field = ev.field, //点击对应列的dataIndex
          target = $(ev.domTarget); //点击的元素
        if(target.hasClass('btn1')){
        	location.href="${path}/project/detailedProject.do?projectId="+record.id;
        }

        if(target.hasClass('btn2')){
        	location.href="${path}/demand/demandList.do?projectId="+record.id;
        }
        
        if(target.hasClass('btn3')){
        	location.href="${path}/demand/addDemandUI.do?projectId="+record.id;
        }

      });
 */    
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
       <!--修改--> 
	<script type="text/javascript">
     BUI.use(['bui/overlay','bui/form'],function(overlay,Form){
        var form = new Form.Form({
         srcNode : '#J_Form'
         
         }).render(); 
                  
    function show () {
      var selections = grid.getSelection();
      var aaa=JSON.stringify(selections);
      
      if(selections==''){
          BUI.Message.Alert('请先选择你要修改的记录','info');
      }
      
      if(selections.length>1){
         BUI.Message.Alert('只能选择1条数据','info');
      }
     
      if(selections.length==1){
         if(selections[0].applicant.username=='${user.username}'){
        	 BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
     		    var dialog = new Overlay.Dialog({
     			    title:'修改 ',
     			    width:600,
     			    height:500,
     			    closeAction : 'destroy',
     			    //配置DOM容器的编号
     			    contentId:'projectcontent',
     			    success:function () {
     			    $("#J_Form").attr("action","${path}/project/updateProject.do");
     				$("#J_Form").submit();
     			    }
     		    });
       
     	    dialog.show();  
     	   	form.clearErrors();
     	    });

     	    $('#id').val(selections[0].id);
     	    $('#projectName').val(selections[0].projectName);
     	    $('#versionNo').val(selections[0].versionNo);
     	    $('#title').val(selections[0].title);
     	    $('#startdate').val(selections[0].startdate);
     	    $('#plandate').val(selections[0].plandate);
     	    $('#applicantId').val(selections[0].applicant.username);
     	    $('#departmentId').val(selections[0].department.name);
     	    $('#description').val(selections[0].description);
         }else{
        	 BUI.Message.Alert('你没有权限！','info');
         }
      }
	 }

     $('#changme').on('click',function () {
    	show();
   	 });
   });

    </script>
   
</html>