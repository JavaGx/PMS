<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目管理系统</title>
	<%@ include file="/common/meta.jsp"%>
<link href="${pageContext.request.contextPath}/css/log.css" rel="stylesheet" type="text/css" />
</head>
<body>
<style>
    /**内容超出 出现滚动条 **/
    .bui-stdmod-body{
      overflow-x : hidden;
      overflow-y : auto;
    }
</style>
 <div class="container">
    <div class="detail-page" style="margin-bottom: 80px;">
      <h2></h2>
			<c:if test="${fn:length(events)!=0}">
				<c:forEach items="${events}" var="eventList">
				<div class="detail-section">  
			        <h3>${eventList.key}记事</h3>
					<c:forEach items="${eventList.value}" var="event">
						<div class="row detail-row" style="margin-left: 10px;margin-bottom: 40px;">
				          <div class="log" style="width: 600px;border-bottom: 1px dotted #e0e0e0;">
				          	<div>
					          	<div style="float: left;text-align: left;">
						            <span class="detail-text">
						            	事件日期：${event.eventDate}
						            </span>
					            </div>
					            <div style="text-align: right;">
					            	创建时间：${event.startdate}
					            </div>
				            </div>
				            <div style="margin-top: 10px;">
					            <span class="detail-text">
					            	${event.content}
					            </span>
					          </div>
				          </div>
				          
			        	</div>
					</c:forEach>			        
			     </div>
			</c:forEach>     
			</c:if> 
			<c:if test="${fn:length(events)==0}">
				您还没记事！
			</c:if>
    </div>
  </div>
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">
$(document.body).css({
	   "overflow-x":"hidden",
	   "overflow-y":"auto"
});
</script>
<script type="text/javascript">
    BUI.use('common/page');
</script>
</body>
</html>