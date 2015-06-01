<%@page language="java" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/clock.js"></script>
<script type="text/javascript">
$("document").ready(function(){
	var jmenu = <%=request.getSession().getAttribute("menuMap")%>;
	var cur1 = '<%=request.getAttribute("cur1")%>';
	var cur2 = '<%=request.getAttribute("cur2")%>';
	menu.initial(jmenu,cur1,cur2);
});
</script>
<div id="sidebar-wrapper">
	<a href="#"><img id="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Simpla Admin logo" /></a>
	<div id="profile-links">
		Hello, <a href="<%=request.getContextPath()%>/password.do" title="Edit your profile">${username}</a>, 欢迎使用<br/><br/>
		<span class="clock"></span> | <a href="<%=request.getContextPath()%>/logout.do" title="Sign Out">注销</a><br/><br/>
		<span><%=request.getAttribute("cur2")==null?"我":"'"+request.getAttribute("cur2")+"'"%>的记事</span>
	</div>
	<ul id="main-nav"></ul>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/simpla.jquery.configuration.js"></script>