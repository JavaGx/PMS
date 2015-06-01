<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>项目管理系统</title>
<%@ include file="/common/meta.jsp"%>
</head>
<body>
	
   <div class="content">
	   <!-- 头部导航 开始 -->
	   <div class="header_softcall">
	        <div class="logo" style="margin-top: 20px;margin-left: 20px;"><a href="${path}/"><font size="16" style="font-family: 宋体">PMS</font></a></div>	       
<%-- 	        <div class="logo"><a href="${path}/"><img src="${pageContext.request.contextPath}/images/logo.png"/></a></div>	        --%>
	      	<div class="user">
		       <div class="user_title">
		       		<div><img src="${pageContext.request.contextPath}/${user.image}"/></div>
		             <ul>
		              <li><a href="${path}/user/logout.do">退出系统</a></li>
		             </ul>	
		       </div>      
	        </div>
	  	</div>
	  	<div class="dl-main-nav">
	      <ul id="J_Nav"  class="nav-list ks-clear">
	        <li class="nav-item dl-selected"><div class="nav-item-inner nav-storage">首页</div></li>
	        <li class="nav-item"><div class="nav-item-inner nav-inventory">个人主页</div></li>
	        <li class="nav-item"><div class="nav-item-inner nav-inventory">日历</div></li>
	        <c:if test="${user.role.name=='总经理'}">
	        	<li class="nav-item"><div class="nav-item-inner nav-inventory">后台管理</div></li>
	        </c:if>
	        <li style="text-align: right;height: 20px;margin-top: 20px;">
	        	<font color="white" style="margin-right: 20px;"> 当前用户为：${user.role.name}</font>
	        </li>
	      </ul>
    	</div>	  	 
	<!-- 头部导航结束 -->	
	<!-- 消息提示开始 --> 
	<div id="myMessage" class="messageBox" style="display: none;">
		<div class="message_Title">
			<span style="float:left;">系统提醒</span>
			<a onclick="javascript:closeMessageBox();">关闭</a>
		</div>
		<div class="message_body">
			<a id="comment" style="cursor: pointer;">
			您有<span id="mecount"></span>条新消息，请查看.</a>
		</div>
	</div>
  	<!-- 消息提示结束 -->
    <!-- 选项卡 -->
    <ul id="J_NavContent" class="dl-tab-conten"></ul>
    <ul id="J_NavContent1" class="dl-tab-conten"></ul>
    
   </div>
</body> 
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">

$(function(){
	query();//首次立即加载
	window.setInterval(query,5000);
});

	function query(){
		var userId=${user.id};
		if(userId!=null){
			$.ajax({
				url:'${path}/comment/getCommentsCount.do',
				type:'post',
				success:function(data){
					if(data!=0){
						$("#mecount").text(data);
						$("#myMessage").removeAttr("style");
					}
				},
				error:function(msg){
					alert(msg);
				}
			});
		}
	}
	
	

</script>

<script type="text/javascript">
	  BUI.use('common/page');
</script>

<script>


    BUI.use('common/main',function(){
      var tab = [{
          id:'menu1',
          homePage:'index',
          menu:[{
              text:'首页',
              items:[
                {id:'index',text:'首页',href:'${path}/data/showChart.do'}                        
              ]
            },{
                text:'项目管理',
                items:[
                 {id:'projectList',text:'项目列表',href:'${path}/project/projectList.do'},
                 {id:'addProjectUI',text:'新建项目',href:'${path}/project/addProjectUI.do'},
                ]
              },{
              text:'报障管理',
              items:[
                {id:'warnlist',text:'报障列表',href:'${path}/warn/warnList.do?num=1'},                
                {id:'lookWarn',text:'初略列表',href:'${path}/warn/lookWarn.do'},                
                {id:'warnUI',text:'报障申请',href:'${path}/warn/addUI.do'}            
              ]
            },{
                text:'解决方案',
                items:[
                  {id:'replylist',text:'经典方案',href:'${path}/reply/replylist.do'}    
                ]
              }]
      },{
          id:'menu2',
          homePage:'info',
          menu:[{
              text:'个人信息',
              items:[               
                {id:'info',text:'个人信息',href:'${path}/user/info.do'},                  
                {id:'updateInfo',text:'完善信息',href:'${path}/user/updateUserUI.do'},                       
                {id:'image',text:'设置头像',href:'${path}/user/settingImageUI.do'} ,                       
                {id:'modifyPassword',text:'修改密码',href:'${path}/user/modifyPasswordUI.do'}                        
              ]
            },{
                text:'动态',
                items:[
                  {id:'warn',text:'报障',href:'${path}/user/ownWarn.do?num=1'},
                  {id:'ownReply',text:'回答',href:'${path}/user/ownReply.do?num=1'},
                  {id:'comment',text:'评论',href:'${path}/comment/getAllComments.do?num=1'}
                ]
              }]
      },{
          id:'menu3',
          homePage:'log',
          menu:[{
              text:'日历',
              items:[
                {id:'log',text:'日历',href:'${path}/event/index.do'},                   
                {id:'edit',text:'我的记事',href:'${path}/event/logList.do'}
              ]
            }]
      },{
          id:'menu4',
          menu:[{
                text:'用户管理',
                items:[
                  {id:'userList',text:'用户列表',href:'${path}/user/userList.do'},                   
                ]
             },{
                  text:'岗位管理',
                  items:[            
                    {id:'roleList',text:'岗位列表',href:'${path}/role/roleList.do'},                   
                    {id:'addRole',text:'添加岗位',href:'${path}/role/addRoleUI.do'},                       
                  ]
               },{
                    text:'部门管理',
                    items:[
                      {id:'deplartList',text:'部门列表',href:'${path}/department/departmentList.do'}, 
                      {id:'addDepart',text:'添加部门',href:'${path}/department/addDepartmentUI.do'},   
                    ]
                },{
                    text:'权限管理',
                    items:[
                      {id:'privilegeList',text:'权限列表',href:'${path}/privilege/privilegeList.do'}, 
                      {id:'addPrivilege',text:'添加权限',href:'${path}/privilege/addPrivilegeUI.do'},   
                    ]
                }]
      }];
      
     
          
     var pageUtil = new PageUtil.MainPage({
        modulesConfig : tab
      });
     
     
     $('#comment').on('click',function(){
       	var  config = {id:'owncomment',title:'评论',href:'${path}/comment/getComments.do',closeable:true};  
          pageUtil.openPage(config);
         // closeMessageBox();
          $("#myMessage").attr("style","display: none;"); 
       });
    });
</script>
</html>