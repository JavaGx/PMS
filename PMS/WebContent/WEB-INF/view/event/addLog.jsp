<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<title>Insert title here</title>
<style type="text/css">
#startdate,#enddate{
	background-color:buttonface;
	font-weight:900;
	color:threeddarkshadow;
}
.current_img{
	border:2px solid gray;
}
</style>
<script type="text/javascript">

var addLog={
        event:{},
		init : function(event){
			this.event = event;
			this.editEvent();
			this.checkform();
		},
		editEvent : function(){
			$("#title").html("新建事件");
			$("#add_form").attr("action","addLog.do");
		},
		checkform : function(){
			$("#add_form").submit(function(){
				if($("input[name='content']").val() == ""){
					alert("请填写'日程内容'");
					return false;
				}
			});
		}
};
$(document).ready(function(){
	addLog.init('<%=request.getAttribute("event")%>');
});

</script>
</head>
<body>

<div class="fancy">
	<h3 id="title"></h3>
    <form id="add_form" method="post">
    <input type="hidden" name="eventDate" value="${eventDate}"/>
   	<div>
   		 日程内容：<textarea name="content" rows="6" id="event" style="width:320px" placeholder="记录你将要做的一件事..."></textarea>
   	</div>
    <div class="sub_btn" style="text-align: left;margin-left: 80px;">
	    <input type="submit" class="btn btn_ok" value="确定"> 
	    <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()">
    </div>
    </form>
</div>

</body>
</html>