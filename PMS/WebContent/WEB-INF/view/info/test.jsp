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
			<!-- 弹出窗增加================================================== -->

			<div id="content" class="hidden" style="display: none">
				<form id="addform" class="form-horizontal">
					<div class="row">
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								用户姓名：
							</label>
							<div class="controls">
								<input type="text" class="input-normal control-text"
									data-rules="{required : true}" name="personName" id="personName">
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								登录用户名：
							</label>
							<div class="controls">
								<input type="text" class="input-normal control-text"
									data-rules="{required : true}" name="userName" id="userName">
								<input type="hidden" id="busiExt2" name="busiExt2"/>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								分机号码：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}"
									name="phoneNum" id="phoneNum">
									<option value="">
										请选择
									</option>
									<c:forEach items="${phoneList}" var="phone">
											<option value="${phone[0]}">${phone[0]}</option>
											</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								模式：
							</label>
							<div class="controls">
								<select class="input-normal" name="busiExt1" id="busiExt1">
									<option value="0"
										<c:if test="${event == 0}">selected='selected'</c:if>>
										控件模式
									</option>
									<option value="1"
										<c:if test="${event == 1}">selected='selected'</c:if>>
										直线模式
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px;display: none" id="newline">
							<label class="control-label">
								直线号码:
							</label>
							<div class="controls">
					       <input type="text" class="input-normal control-text"
									 name="linePhone" id="linePhone" >
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								职位：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}"
									name="busiRole" id="busiRole">
									<option value="">
										请选择
									</option>
									<option value="0"
										<c:if test="${event == 0}">selected='selected'</c:if>>
										管理员
									</option>
									<option value="1"
										<c:if test="${event == 1}">selected='selected'</c:if>>
										坐席
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								业务分组：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}"
									name="busiGroup" id="busiGroup">
									<option value="">
										请选择
									</option>
									<option value="0"
										<c:if test="${event == 0}">selected='selected'</c:if>>
										a组
									</option>
									<option value="1"
										<c:if test="${event == 1}">selected='selected'</c:if>>
										b组
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								是否启用：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}"
									name="active" id="active">
									<option value="0"
										<c:if test="${event == 0}">selected='selected'</c:if>>
										是
									</option>
									<option value="1"
										<c:if test="${event == 1}">selected='selected'</c:if>>
										否
									</option>
								</select>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 弹出窗修改================================================== -->

			<div id="content1" class="hidden" style="display: none">
				<form id="formme" class="form-horizontal">
					<div class="row">
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								用户姓名：
							</label>
							<div class="controls">
								<input type="text" class="input-normal control-text"
									data-rules="{required : true}" name="newpersonname"
									id="oldpersonName">
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								登录用户名：
							</label>
							<div class="controls">
								<input type="text" class="input-normal control-text"
									data-rules="{required : true}" name="newusername"
									id="olduserName">
								<input type="hidden" name="userId" id="oldid">
								<input type="hidden" id="oldlinePhone" name="linePhone"/>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								分机号码：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}" name="phoneNum" id="oldphoneNum">
									<option  id="op1">
										
									</option>
										<c:forEach items="${phoneList}" var="phone">
											<option value="${phone[0]}">${phone[0]}</option>
											</c:forEach>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								模式：
							</label>
							<div class="controls">
								<select class="input-normal" name="busiExt1" id="oldbusiExt1">
									<option value="0">
										控件模式
									</option>
									<option value="1">
										直线模式
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px;display: none" id="oldline">
							<label class="control-label">
								直线号码:
							</label>
							<div class="controls">
					       <input type="text" class="input-normal control-text"
									 name="linePhone" id="oldlinePhone" >
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								职位：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}" name="busiRole" id="oldbusiRole">
									<option value="">
										请选择
									</option>
                                    <option value="0"
										<c:if test="${event == 0}">selected='selected'</c:if>>
										管理员
									</option>
									<option value="1"
										<c:if test="${event == 1}">selected='selected'</c:if>>
										坐席
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								业务分组：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}" name="busiGroup" id="oldbusiGroup">
									<option value="">
										请选择
									</option>
									<option value="ace">
										。。。
									</option>
									<option value="yyf">
										ddd
									</option>
								</select>
							</div>
						</div>
						<div class="control-group span8" style="width: 380px">
							<label class="control-label">
								是否启用：
							</label>
							<div class="controls">
								<select class="input-normal" data-rules="{required:true}"name="active" id="oldactive">
									<option value="yes">
										是
									</option>
									<option value="no">
										否
									</option>
								</select>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- 搜索页 ================================================== -->
			<div class="row">
				<div class="span24">
					<form action="${path}/userManage/list" id="searchme"
						class="form-horizontal" tabindex="0" style="outline: none;"
						method="post">
						<div class="row">
							<div class="control-group span8">
								<label class="control-label">
									坐席姓名：
								</label>
								<div class="controls">
									<input type="text" name="uname" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}">
								</div>
							</div>
							<div class="control-group span8" style="margin-left: -50px">
								<label class="control-label">
									用户名：
								</label>
								<div class="controls">
									<input type="text" name="pname" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}">
								</div>
							</div>
							<div class="control-group span8" style="margin-left: -40px">
								<label class="control-label">
									分机号码：
								</label>
								<div class="controls">
									<input type="text" name="pnum" class="control-text"
										data-tip="{text:'请填写内容！',iconCls:'icon-ok'}">

								</div>
							</div>
							<div class="form-actions span5">
								<button id="btnSearch" type="submit"
									class="button button-primary"
									style="margin-left: 20px; height: 27px; padding-top: 0px"
									onclick="selectuser()">
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
				<div style="margin-top: 20px;">
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="adduser">
						新增
					</button>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="deluser" onclick="deluser()">
						删除
					</button>
					<button type="submit" class="button button-primary"
						style="margin-left: 20px; height: 27px; padding-top: 0px"
						id="changeuser">
						修改
					</button>
				</div>

			</div>
	</body>
	<%@ include file="/common/footer.jsp"%>
	<script type="text/javascript">
    
    BUI.use(['bui/grid','bui/data'],function(Grid,Data){
   
    var Grid = BUI.Grid,
    Store = BUI.Data.Store,
    columns = [
    { title: '坐席姓名', width: 80, sortable: true, dataIndex: 'userName', selectable: true },
    { title: '模式', width: 80, sortable: false, dataIndex: 'busiExt1', selectable: true,
      renderer:function(busiExt1){
      if(busiExt1=='1'){return '直线模式'}
       else{return '控件模式'}}},
    { title: '用户名',width: 80, sortable: true, dataIndex: 'personName', showTip: true },
    { title: '分机号码', width: 80,sortable: true, dataIndex: 'phoneNum'},
    { title: '所在分组',width: 80, sortable: true, dataIndex: 'busiGroup',renderer:function(busiGroup){  if(busiGroup == '0'){
    return 'a组'}
    else{return 'b组'}}},
    { title: '状态', width: 80,sortable: false, dataIndex: 'active',renderer:function(active){  if(active == '0'){
    return '正常'}
    else{return '关闭'}}}
    ];
       
     data1 =${userlist} 
    
     

     store = new Data.Store({
        data:data1,
        pageSize:7
      }),
      /* var store = new Store({
          url : 'data.php',
		 autoLoad:true,
         pageSize:1
}),*/
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
   BUI.use('bui/form',function (Form) {
    new Form.Form({
      srcNode : '#searchme'
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
	<!-- 删除数据 -->
	<script type="text/javascript">
   //  BUI.use('bui/overlay',function(overlay){
      function deluser() {
      var selections = grid.getSelection();
    // var qqq= JSON.stringify(selections);
    var myArray = new Array();
    for(var i=0;i<selections.length;i++){
     myArray.push(selections[i].id);    
     }
     
      if(selections==''){
          BUI.Message.Alert('请先选择你要删除的记录','info');
      }
      else{
   BUI.Message.Confirm('确认要删除吗？',function(){
	       $.ajax(
				 	{
				 			type : "post",
				 			url  : "userManage/del",
				 			data : "myArray="+myArray,
				 			success:callBack	 	
				 	}
				 	
				 	);
		function callBack(data){	
			window.location.href='${path}/userManage/list'		
		}
},'question');}
}
    </script>

	<!-- 新增用户 -->
	<script type="text/javascript">
    BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
    var form = new Form.Form({
    srcNode : '#addform'
    }).render();
     
    var dialog = new Overlay.Dialog({
    title:'新增用户 ',
    width:550,
    height:520,
    //配置DOM容器的编号
    contentId:'content',
    success:function () {
    alert('确认');
    $("#addform").attr("action","${path}/userManage/save");
	$("#addform").submit();
    //this.close();
    }
    });
    //dialog.show();
     
    $('#adduser').on('click',function () {
 
    dialog.show();
    form.clearErrors()
    });
    });
    </script>


	<!-- 修改-->
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
          BUI.Message.Alert('请先选择你要修改的记录','info');
      }
      if(selections.length>1){
         BUI.Message.Alert('只能选择1条数据','info');
      }
     if(selections.length==1){
    
     
     var myid = new Array();
       myid.push(selections[0].id);
      // alert(myid); 
      	       $.ajax(
				 	{
				 			type : "post",
				 			url  : "userManage/selectone",
				 			data : "myid="+myid,
				 			success:callBack	 	
				 	}
				 	
				 	);  
     function callBack(data){
     
     var sysuser = $.parseJSON( data )
     $('#oldpersonName').val(sysuser.personName);
     $('#olduserName').val(sysuser.userName);
     $('#oldid').val(sysuser.id);
     $('#op1').text(sysuser.phoneNum);
     $('#opl').val(sysuser.phoneNum);
    BUI.use(['bui/overlay','bui/form'],function(Overlay,Form){
    var dialog = new Overlay.Dialog({
    title:'修改用户  ',
    width:550,
    height:520,
    closeAction : 'destroy',
    //配置DOM容器的编号
    contentId:'content1',
    success:function () {
   $("#formme").attr("action","userManage/update");
   $("#formme").submit();
    //this.close();
    }
    });
  
    dialog.show();  
    form.clearErrors()
    });
			
		}		
     }
}

    $('#changeuser').on('click',function () {
    show();
   });
    });

    </script>
<script type="text/javascript">
/*增加控制直线模式和控件模式tr显示和隐藏*/
	$("#busiExt1").bind("change",function(){
		var model = $("#busiExt1 option:selected").val();
		if(model=="1"){
			$("#newline").show();
		}else{
			$("#newline").hide();
		}
	});
</script>
<script type="text/javascript">
/*修改控制直线模式和控件模式tr显示和隐藏*/
	$("#oldbusiExt1").bind("change",function(){
		var model = $("#oldbusiExt1 option:selected").val();
		if(model=="1"){
			$("#oldline").show();
		}else{
			$("#oldline").hide();
		}
	});
</script>
</html>