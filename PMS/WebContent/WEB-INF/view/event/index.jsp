<%@page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String viewMode = (String)request.getAttribute("cur2");
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
	<meta name="description" content="工作日志"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/event/css/fullcalendar.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/event/css/fancybox.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/event/css/main.css"/>
	<script src='${pageContext.request.contextPath}/event/scripts/jquery-1.9.1.min.js'></script>
	<script src='${pageContext.request.contextPath}/event/scripts/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/event/scripts/jquery.fancybox-1.3.1.pack.js'></script>
	<script type="text/javascript">
	$(function() {
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'agendaDay,agendaWeek,month'
			},
			firstDay:1,
			editable: false,
			timeFormat: 'H:mm',
			axisFormat: 'H:mm',
			minTime:9,
			events: <%=request.getAttribute("events")%>
			<%if(viewMode == null){%>
				,dayClick: function(date, allDay, jsEvent, view) {
					var date =$.fullCalendar.formatDate(date,'yyyy-MM-dd');
					$.fancybox({
						'width':500,
						'height':250,
						'autoDimensions':false,
						'type':'ajax',
						'href':'<%=path%>/event/addLogUI.do?eventDate='+date
					});
		    	}
	    	<%}%>
		});
	});
	</script>
</head>
<body>
<div id='calendar'></div>
</body>
</html>
