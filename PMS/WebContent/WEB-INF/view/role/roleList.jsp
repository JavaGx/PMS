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
<div id="demandcontent" class="hidden" style="display: none">
<form id="J_Form" class="form-horizontal" method="post" action="">
		<input id="id" name="id" hidden="hidden">
		<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>岗位名称:
			     </label> 
			     <div class="controls"> 
			      <input id="name" type="text" class="input-normal control-text" style="width:400px" name="name" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label"><s>*</s>所属部门：</label>
              <div class="controls">
                <select id="departmentId" name="departmentId" data-rules="{required:true}">
                  <option value="">-请选择-</option>
                  <c:if test="${departments!=null}">
                  	<c:forEach items="${departments}" var="department">
                  		<option id="${department.id}" value="${department.id}">${department.name}</option>
                  	</c:forEach>
                  </c:if>
                </select>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">详细描述：</label>
              <div class="controls" style="height: 200px;">
                <textarea id="description" type="text" name="description" style="height: 150px;width: 350px" data-valid="{}"></textarea>
              </div>
            </div> 
 </form>
</div>
			<div class="search-grid-container">
				<div style="margin-left: 30px;margin-top: 10px;"><h3>岗位列表</h3></div>
				<div id="grid" style="margin-top: 20px;">
				</div>

			</div>
			   <div style="margin-top: 20px;">
					<button type="button" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changme">
						修改
					</button>
					<a class="page-action" data-type="reload" href="#">
						<button type="submit" class="button button-primary"
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
		    { title: '编号',width: 20, sortable: true, dataIndex: 'id'},
		    { title: '岗位名称', width: 50, sortable: false, dataIndex: 'name', selectable: true },
		    { title: '所属部门', width: 50, sortable: false, dataIndex: 'department', selectable: true ,renderer:function(value){
		    	if(value!=null){
		    		return value.name
		    	}else{
		    		return '';
		    	}
		    	}},
		    { title: '描述', width: 200, sortable: false, dataIndex: 'description', selectable: true},
		    { title: '操作', width: 50,sortable: true, dataIndex: 'id',renderer:function(value){ 
	    		return '<a class="page-action" href="#" data-href="${path}/role/setPrivilegeUI.do?roleId='+value+'" title="设置权限" data-id="setPrivilegeUI"><span class="grid-command">设置权限</span></a>';
	    			}
		    }
	    ];
	    data = ${roles} 
	
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
	   var form = new Form.Form({
	      srcNode : '#searchForm'
	    }).render();
	   
	   form.on('beforesubmit',function(ev) {
		    //序列化成对象
		    var obj = form.serializeToObject();
		    obj.start = 0; //返回第一页
		    store.load(obj);
		    return false;
	    });
	   
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
      // alert(aaa);
      if(selections==''){
          BUI.Message.Alert('请先选择你要修改的记录','info');
      }
      
      if(selections.length>1){
         BUI.Message.Alert('只能选择1条数据','info');
      }
     
      if(selections.length==1){
         BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
		    var dialog = new Overlay.Dialog({
			    title:'修改 ',
			    width:600,
			    height:400,
			    closeAction : 'destroy',
			    //配置DOM容器的编号
			    contentId:'demandcontent',
			    success:function () {
			    $("#J_Form").attr("action","${path}/role/updateRole.do");
				$("#J_Form").submit();
			    }
		    });
  
	    dialog.show();  
	    	form.clearErrors();
	    });

	    $('#id').val(selections[0].id);
	    $('#name').val(selections[0].name);
	    $('#description').val(selections[0].description);
	    var department=selections[0].department;
	    if(department!=null){
	    	$("#departmentId").val(department.id);
	    }
	    
      }
	 }

     $('#changme').on('click',function () {
    	show();
   	 });
   });

    </script>
   
</html>