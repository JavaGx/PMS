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

<div id="contentme1" class="hidden" style="display: none">
	<form id="formme1" class="form-horizontal" method="post">
	<input id="id" name="id" hidden="hidden">
	    <div class="control-group span8" style="margin-left:-20px;width:100%;margin-top:0px;height:20px"> 
     <label class="control-label">报障事件单：</label> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>故障标题：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px"  id="title1" name="title"/> 
      <input type="hidden" id="id1" name="id1"/>
     </div> 
    </div> 
    <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>提交时间：</label> 
     <div class="controls"> 
      <input type="text" name="starttime" class="input-normal control-text" style="width:100px" disabled="disabled" id="starttime1"/> 
     </div> 
    </div> 
      <div class="control-group span8" style="margin-left:15px">
        <label class="control-label">
			紧急程度：
		</label>
		<select class="input-normal" name="urgent" id="urgent1"  >
			<option value="一般">
				一般
			</option>
			<option value="紧急">
				紧急
			</option>
		</select>
	</div> 
      <div class="control-group span8" style="height:35px;margin-left:15px"> 
     <label class="control-label">
      <s>
       *
      </s>发布人：</label> 
     <div class="controls"> 
      <input type="text" class="input-normal control-text" style="width:100px;" disabled="disabled" id="applicantId"/> 
     </div> 
    </div> 
     <div style="clear:both"></div>
    <div class="control-group span8" style="margin-left:0px">
    <label class="control-label"><s>*</s>问题描述</label>
    <textarea id="desc1" name="description" style="width:550px;height:150px;"data-rules="{required:true}" ></textarea>	       		
    </div> 
    <div style="clear:both"></div>
    <div class="control-group span8" style="width: 300px;margin-left:-55px">
		<label class="control-label">
		说明截图：
		</label>								
		<div class="controls" >
			<input type="text" class="input_1" name="image" id="carcoverpicture" readonly="readonly" placeholder="点击上传图片" style="width:100px"/>
		<div style="display: none;" id="cover"><textarea name="content" id="content" rows="17"></textarea></div>
	   </div>															
	</div>

				</form>
			</div>
	<!-- 弹出窗修改结束================================================== -->
	<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
				<div style="margin-top: 10px;margin-left: 30px"><font size="4">当前有</font><span class="grid-command" style="font-size:27px;color: red">${warnNum!=0?warnNum:0}</span><font size="3">个未解决报障单</font></div>
					<form id="searchForm" action="${path}/warn/search.do" method="post" class="form-horizontal" tabindex="0"style="outline: none;" >
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">
									报障人：
								</label>
								<div class="controls">
									<input type="text" name="applicantId" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}" />
								</div>
							</div>
							    <div class="control-group span8" >
                                  <label class="control-label">报障时间：</label>
                                 <div class="controls" >
                                <input name="starttime" data-tip="{text : '日期'}"  class="input-small calendar" type="text" >                     
                                  </div>
                                </div>
						    <div class="control-group span8" style="margin-left:-80px">
						        <label class="control-label">
									紧急程度：
								</label>
								<select class="input-normal" name="urgent" id="urgent">
									<option value="">
										请选择
									</option>
									<option value="一般">
										一般
									</option>
									<option value="紧急">
										紧急
									</option>
								</select>
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
			   <div style="margin-top: 20px;margin-bottom: 60px;">
			   		<a class="page-action" data-type="reload" href="#">
						<button type="submit" class="button button-primary"
							style="margin-left: 20px; height: 27px; padding-top: 0px">
							刷新
						</button>
					</a>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changme">
						修改
					</button>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="closeinfo" onclick="closeinfo()">
						关闭
					</button>
				</div>
		</div>
	</body>
	<%@ include file="/common/footer.jsp"%>
	
	<script type="text/javascript">
	  BUI.use('common/page');
	</script>
	
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
      $(document.body).css({
    	  "overflow-x":"hidden",
		   "overflow-y":"auto"
      });
    BUI.use(['bui/grid','bui/data'],function(Grid,Data){
	    var Grid = BUI.Grid,
	    Store = BUI.Data.Store,
	    columns = [
		    { title: '编号',width: 100, sortable: true, dataIndex: 'id'},
		    { title: '标题', width: 100, sortable: false, dataIndex: 'title', selectable: true },
		    { title: '时间', width: 100, sortable: true, dataIndex: 'starttime', selectable: true },
		    { title: '紧急程度',width: 100, sortable: true, dataIndex: 'urgent', showTip: true },
		    { title: '当前状态', width: 100,sortable: true, dataIndex: 'state'},
		    { title: '申报人', width: 100,sortable: true, dataIndex: 'applicant',renderer:function(value){return value.username}},
		    { title: '操作', width: 100,sortable: true, dataIndex: 'id',renderer:function(value){ 
	    		return '<a class="page-action" href="#" data-href="${path}/warn/selectone.do?id='+value+'" title="报障信息" data-id="detailedWarn"><span class="grid-command">查看</span></a>';
	    			}
	    	}
	    ];
	    data = ${warnlist} 
	
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
	    var form=new Form.Form({
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
    <!-- script end --> 
   <!-- 关闭数据 --> 
   <script type="text/javascript">
     BUI.use('bui/overlay',function(overlay){
	      function show () {
		      var selections = grid.getSelection();
		      if(selections==''){
		          BUI.Message.Alert('请先选择你要关闭的报障单','info');
		      }
		      if(selections.length>1){
		
		         BUI.Message.Alert('只能选择1条数据','info');
		      }
		      
		      if(selections.length==1){
		    	  if(selections[0].applicant.username!='${user.username}'){
				         BUI.Message.Alert('您没有关闭权限','info');
		    	  }else{
		    		  BUI.Message.Confirm('确认要关闭吗？',function(){
					       var closeid = new Array();
					       closeid.push(selections[0].id);
					       //alert(showid);
					       window.location.href='${path}/warn/closeWarning.do?id='+closeid;
					},'question');
		    	  }
				     
		  }
	}

    $('#closeinfo').on('click',function () {
    	show();
    });
    });

    </script> 
       <!--修改--> 
	<script type="text/javascript">
     BUI.use(['bui/overlay','bui/form'],function(overlay,Form){
        var form = new Form.Form({
         srcNode : '#formme1'
         
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
    	 if(selections[0].applicant.username=='${user.username}'){
    		 BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
    			    var dialog = new Overlay.Dialog({
    				    title:'修改 ',
    				    width:600,
    				    height:500,
    				    closeAction : 'destroy',
    				    //配置DOM容器的编号
    				    contentId:'contentme1',
    				    success:function () {
    				    $("#formme1").attr("action","${path}/warn/updateWarn.do");
    					$("#formme1").submit();
    				    }
    			    });
    	  
    		    dialog.show();  
    		    	form.clearErrors()
    		    });

    	        
    		    $('#id').val(selections[0].id);
    		    $('#title1').val(selections[0].title);
    		    $('#starttime1').val(selections[0].starttime);
    		    $('#urgent1').val(selections[0].urgent);
    		    $('#desc1').val(selections[0].description);
    		    $('#applicantId').val(selections[0].applicant.username);
    	 }else{
    		 BUI.Message.Alert('您没有修改权限','info');
    	 }
       
     }
	}

    $('#changme').on('click',function () {
    	show();
   	});
   });

    </script>
   
</html>