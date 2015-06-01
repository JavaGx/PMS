<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目管理系统</title>
	<%@ include file="/common/meta.jsp"%>
</head>
<body>
 <div class="container">
    <div class="detail-page">
      <h2>个人信息</h2>
      <div class="detail-section">  
        <h3>基本信息</h3>
       
        <div class="row detail-row" style="margin-left: 10px;">
          <div class="span8">
            <label>姓名：</label><span class="detail-text">${pointUser.username}</span>
          </div>
          <div class="span8">
            <label>编号：</label><span class="detail-text">${pointUser.id}</span>
          </div>
          <div class="span8">
            <label>性别：</label><span class="detail-text">${pointUser.sex}</span>
          </div>
        </div>
        <div class="row detail-row">
          <div class="span8" style="margin-left: 10px;">
            <label>电话：</label><span class="detail-text">${pointUser.phone}</span>
          </div>
           <div class="span8">
            <label>邮箱：</label><span class="detail-text">${pointUser.email}</span>
          </div>
        </div>
      </div>
      <div class="detail-section"> 
       	<h3> 身份信息</h3>
       	<div class="row detail-row"  style="margin-left: 10px;">
       		
	          <div class="span8">
	            <label>岗位：</label><span class="detail-text">
	            	<c:choose>
       					<c:when test="${pointUser.role!=null}">
	            			${pointUser.role.name}
	            		</c:when>
	          			<c:otherwise>
			          		目前还没分配！
			          	</c:otherwise>
		          	</c:choose>
	            </span>
	          </div>
          	
          		
          <div class="span8">
            <label>所属部门：</label><span class="detail-text">
            	<c:choose>
       				<c:when test="${pointUser.department!=null}">
            			${pointUser.department.name}
            		</c:when>
	          		<c:otherwise>
			          	目前还没分配！
		          	</c:otherwise>
	          	</c:choose>
            </span>
          </div>
         </div>
       </div> 
    </div>
  </div>
<%@ include file="/common/footer.jsp"%>
<script type="text/javascript">
    BUI.use('common/page');
</script>
</body>
</html>