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
<div id="usercontent" class="hidden" style="display: none">
	<form id="J_Form" class="form-horizontal" method="post" action="">
		<input id="id" name="id" hidden="hidden">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>用户名：
			     </label> 
			     <div class="controls"> 
			      <input type="text" name="username" disabled="disabled" class="input-normal control-text" style="width:100px" id="username" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>性别：
			     </label> 
			     <div class="controls"> 
			      <input type="text" name="sex" disabled="disabled" class="input-normal control-text" style="width:100px" id="sex" data-rules="{required:true}"/> 
			     </div>
			</div>
			 <div class="control-group">
              <label class="control-label"><s>*</s>岗位：</label>
              <div class="controls">
              	<select class="input-normal" name="roleId" id="roleId"  >
              		<option value="">-请选择-</option>
              		<c:if test="${roles!=null }">
              			<c:forEach items="${roles}" var="role">
	              			<option value="${role.id }">${role.name }</option>
	              		</c:forEach>
              		</c:if>
              	</select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>所属部门：</label>
              <div class="controls">
              	<select class="input-normal" name="departmentId" id="departmentId"  >
              		<option value="">-请选择-</option>
              		<c:if test="${departments!=null }">
              			<c:forEach items="${departments}" var="department">
	              			<option value="${department.id }">${department.name }</option>
	              		</c:forEach>
              		</c:if>
              	</select>
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">个人留言：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" disabled="disabled" id="description" name="description" style="height: 200px;width: 400px" data-valid="{}"></textarea>
              </div>
            </div> 
 </form>
</div>
	<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
					<form id="searchForm" action="${path}/project/search.do" method="post" class="form-horizontal" tabindex="0"style="outline: none;" >
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">
									用户名：
								</label>
								<div class="controls">
									<input type="text" name="username" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />
								</div>
							</div>
						    <div class="control-group span8" >
                                 	<label class="control-label">性别：</label>
                                	<div class="controls" >
                               	<input type="text" name="sex" class="control-text"
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
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changme">
						修改
					</button>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="delete">
						删除
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
		    { title: '用户名', width: 50, sortable: false, dataIndex: 'username', selectable: true },
		    { title: '性别', width: 50, sortable: false, dataIndex: 'sex', selectable: true},
		    { title: '电话', width: 30, sortable: false, dataIndex: 'phone', selectable: true },
		    { title: '邮箱', width: 50, sortable: true, dataIndex: 'email', selectable: true },
		    { title: '岗位', width: 50, sortable: true, dataIndex: 'role',renderer:function(value){
		    		if(value!=null){
		    			return value.name;
		    		}else{
		    			return '还没有分配角色';
		    		}
		    		}},
		    { title: '所属部门', width: 30,sortable: true, dataIndex: 'department',renderer:function(value){
		    	if(value!=null){
	    			return value.name;
	    		}else{
	    			return '还没有分配部门';
	    		}
		    		
		    }},
		    { title: '操作', width: 50,sortable: true, dataIndex: 'id',renderer:function(value){ 
	    		return '<a class="page-action" href="#" data-href="${path}/user/detailedUser.do?id='+value+'" title="用户信息" data-id="detailedUser"><span class="grid-command">查看</span></a>';
	    			}
		    }
	    ];
	    data = ${users} 
	
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
       <!--修改--> 
	<script type="text/javascript">
     BUI.use(['bui/overlay','bui/form'],function(overlay,Form){
        var form = new Form.Form({
         srcNode : '#J_Form'
         
         }).render(); 
        
       function deleteUser(){
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
    	    	  location.href="${path}/user/deleteUser?userId="+selections[0].id;
    	      }
       }
                  
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
			    height:450,
			    closeAction : 'destroy',
			    //配置DOM容器的编号
			    contentId:'usercontent',
			    success:function () {
			    $("#J_Form").attr("action","${path}/user/assignUser.do");
				$("#J_Form").submit();
			    }
		    });
  
	    dialog.show();  
	    	form.clearErrors();
	    });

	    $('#id').val(selections[0].id);
	    $('#username').val(selections[0].username);
	    $('#sex').val(selections[0].sex);
	    $('#description').val(selections[0].description);
	    var role=selections[0].role;
	    if(role!=null){
	    	$('#roleId').val(role.id);
	    }
	    var department=selections[0].department;
	    if(department!=null){
	    	 $('#departmentId').val(department.id);
	    }
	    
	   
      }
	 }

     $('#changme').on('click',function () {
    	show();
   	 });
     
     $('#delete').on('click',function () {
    	deleteUser();
   	 });
   });

    </script>
   
</html>