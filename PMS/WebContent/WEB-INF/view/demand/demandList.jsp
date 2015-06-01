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
		<input id="projectId" name="projectId" hidden="hidden">
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>所属项目：
			     </label> 
			     <div class="controls"> 
			      <input type="text" disabled="disabled" class="input-normal control-text" style="width:100px" id="projectname" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group"> 
			     <label class="control-label">
			      <s>*</s>需求主题：
			     </label> 
			     <div class="controls"> 
			      <input type="text" class="input-normal control-text" style="width:400px" id="title" name="title" data-rules="{required:true}"/> 
			     </div>
			</div>
			<div class="control-group">
              <label class="control-label"><s>*</s>申请人：</label>
              <div class="controls">
                 <input type="text" disabled="disabled" class="input-normal control-text" style="width:400px" id="applicant" data-rules="{required:true}"/> 
              </div>
            </div>
			 <div class="control-group">
              <label class="control-label"><s>*</s>指定完成人：</label>
              <div class="controls">
              	<select class="input-normal" name="appointPersonId" id="appointperson"  >
              		<c:if test="${users!=null }">
              			<c:forEach items="${users}" var="user">
	              			<option value="${user.id }">${user.username }</option>
	              		</c:forEach>
              		</c:if>
              	</select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label"><s>*</s>提出需求时间：</label>
              <div class="controls">
                <input type="text" disabled="disabled" id="starttime" name="starttime" class="calendar" data-rules="{required:true}">
              </div>
            </div>
            
            <div class="control-group">
              <label class="control-label"><s>*</s>更新时间时间：</label>
              <div class="controls">
                <input type="text" id="updatetime" name="updatetime" class="calendar" data-rules="{required:true}">
              </div>
            </div>
			<div class="control-group">
              <label class="control-label">需求内容：</label>
              <div class="controls" style="height: 200px;">
                <textarea type="text" id="content" name="content" style="height: 200px;width: 400px" data-valid="{}"></textarea>
              </div>
            </div> 
 </form>
</div>
	
			<div class="search-grid-container">
				<div id="grid">
				</div>

			</div>
			   <div style="margin-top: 20px;">
			   	<c:if test="${project.applicant.username==user.username}">
			   		<a class="page-action" href="#" data-href="${path}/demand/addDemandUI.do?projectId=${project.id}" title="添加需求" data-id="addDemand">
					<button type="button" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="addDemand">
						添加
					</button>
					</a>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changme">
						修改
					</button>
				</c:if>
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
  
 // $("#addDemand").click(function(){
//	  location.href="";
 // });
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
		    { title: '标题', width: 100, sortable: false, dataIndex: 'title', selectable: true },
		    { title: '所属项目', width: 50, sortable: false, dataIndex: 'project', selectable: true ,renderer:function(value){return value.projectName}},
		    { title: '项目版本', width: 30, sortable: false, dataIndex: 'project', selectable: true ,renderer:function(value){return value.versionNo}},
		    { title: '开始日期', width: 50, sortable: true, dataIndex: 'starttime', selectable: true },
		    { title: '更新日期', width: 50, sortable: true, dataIndex: 'updatetime', selectable: true },
		    { title: '申请人', width: 30,sortable: true, dataIndex: 'applicant',renderer:function(value){return value.username}},
		    { title: '制定完成人', width: 30,sortable: true, dataIndex: 'appointPerson',renderer:function(value){return value.username}},
		    { title: '操作', width: 50,sortable: true, dataIndex: 'project',renderer:function(value){ 
	    		return '<a class="page-action" href="#" data-href="${path}/project/detailedProject.do?projectId='+value.id+'" title="报障信息" data-id="detailedDemand"><span class="grid-command">查看</span></a>';
	    			}
		    }
	    ];
	    data = ${demands} 
	
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
     
      if(selections.length==1&&selections[0].applicant.username=='${user.username}'){
         BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
		    var dialog = new Overlay.Dialog({
			    title:'修改 ',
			    width:600,
			    height:500,
			    closeAction : 'destroy',
			    //配置DOM容器的编号
			    contentId:'demandcontent',
			    success:function () {
			    $("#J_Form").attr("action","${path}/demand/updateDemand.do");
				$("#J_Form").submit();
			    }
		    });
  
	    dialog.show();  
	    	form.clearErrors();
	    });

	    $('#id').val(selections[0].id);
	    $('#projectId').val(selections[0].project.id);
	    $('#projectname').val(selections[0].project.projectName);
	    $('#title').val(selections[0].title);
	    $('#starttime').val(selections[0].starttime);
	    $('#updatetime').val(selections[0].updatetime);
	    $('#applicant').val(selections[0].applicant.username);
	    $('#appointperson').val(selections[0].appointPerson.username);
	    $('#content').val(selections[0].content);
      }
	 }

     $('#changme').on('click',function () {
    	show();
   	 });
   });

    </script>
   
</html>