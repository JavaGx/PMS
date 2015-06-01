<%@page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>项目管理系统</title>
<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div id="body-wrapper">
	<div id="sidebar">
    	<%@include file="../event/menu.jsp"%>
  	</div>
   	<div id="main-content">
    	<div class="clear"></div>
    	<div class="content-box">
      		<div class="content-box-header">
      			<h3>添加代理商</h3>
				<div class="bulk-actions align-right">
					<a href="<%=basePath%>/logger.do"><img src="resources/images/bak.gif" alt="add" style="margin-top:10px;margin-right:10px;cursor:pointer;width:24px;"/></a>
				</div>
        		<div class="clear"></div>
      		</div>
      		<!-- End .content-box-header -->
     		<div class="content-box-content">
      			<div class="default-tab" id="tab0">
          			<form action="modifyPassword.do" method="post">
            		<fieldset>
						<p><span style="font-size: 10.5pt; font-family: 宋体;">代理商名称</span>:<input class="text-input small-input" type="text" id="small-input" name="username" value="${account.username}"/></p>
						<p><span style="font-size: 10.5pt; font-family: 宋体;">代理商区域</span>:<input class="text-input small-input" type="text" id="small-input" name="password" value="${account.passwd}"/></p>
						<p><span style="font-size: 10.5pt; font-family: 宋体;">代理商地址</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
						<p><span style="font-size: 10.5pt; font-family: 宋体;">代理商联系人姓名</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                		<p><span style="font-size: 10.5pt; font-family: 宋体;">代理商联系电话</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">代理商类型</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">代理商所属行业</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">代理商盒子数量</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">代理商坐席数量</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">代理商创建时间</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                        <p><span style="font-size: 10.5pt; font-family: 宋体;">备注信息</span>:<input class="text-input small-input" type="text" id="small-input" name="accname" value="${account.accname}"/></p>
                                               
                		<p><input class="button" type="submit" value="确定"/></p>
           			 </fieldset>
            		<div class="clear"></div>
            		<!-- End .clear -->
          			</form>
        		</div>
       			 <!-- End #tab2 -->
     	 	</div>
      		<!-- End .content-box-content -->
    	</div>
    <!-- End .content-box -->
  	</div>
</div> 
</body>
<!-- Download From www.exet.tk-->
</html>

