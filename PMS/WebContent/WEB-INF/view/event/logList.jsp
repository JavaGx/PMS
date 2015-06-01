<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/navigation/css/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/navigation/css/style.css"> <!-- Resource style -->
<script src="${pageContext.request.contextPath}/navigation/js/modernizr.js"></script> <!-- Modernizr -->
<%@ include file="/common/meta.jsp"%>
<title>项目管理系统</title>
</head>
<body>
<nav id="cd-vertical-nav">
		<ul>
			<li>
				<a href="#section1" data-number="1">
					<span class="cd-dot"></span>
					<span class="cd-label">顶部</span>
				</a>
			</li>
			<c:if test="${fn:length(events)!=0}">
				<c:forEach items="${events}" var="eventList" varStatus="status">
					<li>
						<a href="#section${status.count+1}" data-number="${status.count+1}">
							<span class="cd-dot"></span>
							<span class="cd-label">${eventList.key}记事</span>
						</a>
					</li>
				</c:forEach>     
			</c:if> 
		</ul>
	</nav>
	<a class="cd-nav-trigger cd-img-replace">Open navigation<span></span></a>

	<section id="section1" class="cd-section" style="height:150px;">
		<h1>我的记事</h1>
		<a href="#section2" class="cd-scroll-down cd-img-replace">顶部</a>
	</section> 
	
	<c:if test="${fn:length(events)!=0}">
				<c:forEach items="${events}" var="eventList" varStatus="status">
				<section id="section${status.count+1}" class="cd-section">
				<div class="detail-section" style="margin-left: 50px;">  
			        <h3>${eventList.key}记事</h3>
					<c:forEach items="${eventList.value}" var="event">
						<div class="row detail-row" style="margin-left: 10px;margin-top: 30px;">
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
			     </section>
			</c:forEach>     
			</c:if> 
			<c:if test="${fn:length(events)==0}">
				您还没记事！
			</c:if>

	
<script src="${pageContext.request.contextPath}/navigation/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/navigation/js/main.js"></script>
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