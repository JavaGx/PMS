<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<title>登录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/iconfont.css">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		<%
	    	Integer errcode = (Integer)request.getAttribute("errcode");
	    	if(errcode!=null){
		       	if(errcode == 1){
		       	%>
		       	 $(".notification div").html("账号不存在");
		         $(".notification").show();
		       	<%
		       	}else if(errcode == 2){
		       	%>
		       	 $(".notification div").html("密码错误");
		         $(".notification").show();
		        <%
		       	}
	       	}
	   %>
	});
	
	if (window != top){
		top.location.href = location.href; 
	}
	</script>
</head>
<body>
	<div class="login-banner"></div>
	<div class="login-box">
		<div class="box-con tran">
			<!-- 登录 -->
			<div class="login-con f-l">
			 <form action="${pageContext.request.contextPath}/user/login.do" method="post">
			 	 <div class="notification information png_bg" style="display:none;">
			        <div>无消息. </div>
			      </div>
				<div class="form-group">
					<input type="text" name="username" placeholder="用户名"/>
					<span class="error-notic">用户名不正确</span>
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="密码">
					<span class="error-notic">密码不正确</span>
				</div>
				<div class="form-group">
					<button type="submit" class="tran pr">
						<a href="javascript:;" class="tran">登录</a>
						<img class="loading" src="${pageContext.request.contextPath}/images/loading.gif" style="display:block">
					</button>
				</div>
				</form>
				<div class="from-line"></div>
				<div class="form-group">
					<a href="javascript:;" class="move-signup a-tag tran blue-border">还没有帐号？免费注册<i class="iconfont tran">&#xe606;</i></a>
				</div>
			</div>
			
			<!-- 邮箱注册 -->
			 <form action="${pageContext.request.contextPath}/user/register.do" method="post">
			<div class="signup f-l">
				<div class="form-group">
					<div class="signup-form">
						<input type="text" name="email" placeholder="邮箱" class="email-mobile" onBlur="verify.verifyEmail(this)">
					</div>
					<span class="error-notic">邮箱格式不正确</span>
				</div>
				<div class="signup-email">
					<div class="form-group">
						<input type="text" name="username" placeholder="您的名字">
					</div>
					<div class="form-group">
						<input type="password" name="password" placeholder="密码（字母、数字，至少6位）" onBlur="verify.PasswordLenght(this)">
						<span class="error-notic">密码长度不够</span>
					</div>
					<div class="form-group">
						<button type="submit" class="tran pr">
							<a href="javascript:;" class="tran">注册</a>
							<img class="loading" src="${pageContext.request.contextPath}/images/loading.gif">
						</button>
					</div>
				</div>
				</form>
			<!-- 注册 -->

			<div class="other-way f-l">
				<div class="from-line"></div>
				<div class="form-group">
					<a href="javascript:;" class="move-login a-tag tran">已有帐号？登录<i class="iconfont tran">&#xe606;</i></a>
				</div>
			</div>
		</div>
	</div>
	
	<div style="height:80px;"></div>
	
	<div class="login-footer">
		<p>项目管理系统</p>
	</div>
	<script>
		var _handle='';
		$(function(){
			$(".signup-form input").on("focus",function(){
				$(this).parent().addClass("border");
			});
			$(".signup-form input").on("blur",function(){
				$(this).parent().removeClass("border");
			})
			//注册方式切换
			$(".signup-select").on("click",function(){
				var _text=$(this).text();
				var $_input=$(this).prev();
				$_input.val('');
				if(_text=="邮箱注册"){
					$(".signup-tel").fadeOut(180);
					$(".signup-email").fadeIn(200);
					$_input.attr("placeholder","邮箱");
					$_input.attr("onblur","verify.verifyEmail(this)");
					$(this).parents(".form-group").find(".error-notic").text("邮箱格式不正确")
				}
			});
			//步骤切换
			var _boxCon=$(".box-con");
			$(".move-login").on("click",function(){
				$(_boxCon).css({
					'marginLeft':0
				})
			});
			$(".move-signup").on("click",function(){
				$(_boxCon).css({
					'marginLeft':-320
				})
			});
			$(".move-other").on("click",function(){
				$(_boxCon).css({
					'marginLeft':-640
				})
			});
			$(".move-reset").on("click",function(){
				$(_boxCon).css({
					'marginLeft':-960
				})
			});
			$("body").on("click",".move-addinf",function(){
				$(_boxCon).css({
					'marginLeft':-1280
				})
			});
		});
		
		//表单验证
		function showNotic(_this){
			$(_this).parents(".form-group").find(".error-notic").fadeIn(100);
            $(_this).focus();
		}//错误提示显示
		function hideNotic(_this){
			$(_this).parents(".form-group").find(".error-notic").fadeOut(100);
		}//错误提示隐藏
		var verify={
			verifyEmail:function(_this){
				var validateReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				var _value=$(_this).val();
            	if(!validateReg.test(_value)){
            		showNotic(_this)
            	}else{
            		hideNotic(_this)
            	}
			},//验证邮箱
			verifyMobile:function(_this){
				var validateReg = /^((\+?86)|(\(\+86\)))?1\d{10}$/;
				var _value=$(_this).val();
            	if(!validateReg.test(_value)){
            		showNotic(_this);
            		_handle=false;
            	}else{
            		hideNotic(_this);
            		_handle=true;
            	}
            	return _handle
			},//验证设置密码长度
			VerifyCount:function(_this){
				var _count="123456";
				var _value=$(_this).val();
				console.log(_value)
				if(_value!=_count){
					showNotic(_this)
				}else{
					hideNotic(_this)
				}
			}//验证验证码
		}
	</script>
	
</body>
</html>