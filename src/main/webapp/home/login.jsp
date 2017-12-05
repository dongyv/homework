<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<link rel="stylesheet"
	href="<%=contextPath%>/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%=contextPath%>/css/dlstyle.css" rel="stylesheet"
	type="text/css">
<script src="<%=contextPath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	
<script>
// 	function getXMLHttpRequest() { 
// 		var xmlHttpReq; 
// 		try { // Firefox, Opera 8.0+, Safari 
// 			xmlHttpReq = new XMLHttpRequest(); 
// 		} catch (e) { 
// 		try {// Internet Explorer 
// 			xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP"); 
// 		} catch (e) { 
// 		try { 
// 		xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP"); 
// 		} catch (e) { 
// 		} 
// 		} 
// 		} 
// 		return xmlHttpReq; 
// 		} 
	function login(){
		var username = document.getElementById("user").value;
		var password = document.getElementById("password").value;
		
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user/login.dongyv",//路径  
            dataType:"text",
            data : {  
                "username" : username,
                "password" : password,
            },//数据，这里使用的是Json格式进行传输  
            success : function(data) {//返回数据根据结果进行相应的处理 
            	var result = jQuery.parseJSON(data);
            	if(result.code==0){
            		alert(result.msg);
	            	window.location.href="${path}/home/toIndex.dongyv";
            	}else{
            		alert(result.msg);
            		window.location.reload();
            	}
            	
            }
		});
	}
</script>
</head>
<div class="login-boxtitle">
	<a href="home.jsp"><img alt="logo"
		src="<%=contextPath%>/images/logobig.png" /></a>
</div>
<div class="login-banner">
	<div class="login-main">
		<div class="login-banner-bg">
			<span></span><img src="<%=contextPath%>/images/big.jpg" />
		</div>
		<div class="login-box">

			<h3 class="title">登录商城</h3>

			<div class="clear"></div>

			<div class="login-form">
				<form>
					<div class="user-name">
						<label for="user"><i class="am-icon-user"></i></label> <input
							type="text" name="username" id="user" placeholder="邮箱/手机/用户名">
					</div>
					<div class="user-pass">
						<label for="password"><i class="am-icon-lock"></i></label> <input
							type="password" name="password" id="password" placeholder="请输入密码">
					</div>
				</form>
			</div>

			<div class="login-links">
				<label for="remember-me"><input id="remember-me"
					type="checkbox">记住密码</label> <a href="javascript:forget()"
					class="am-fr">忘记密码</a> <a href="register.jsp"
					class="zcnext am-fr am-btn-default">注册</a> <br />
			</div>
			<div class="am-cf">
				<input type="button" onclick="login()" name="" value="登 录"
					class="am-btn am-btn-primary am-btn-sm">
			</div>
			<div class="partner">
				<h3>合作账号</h3>
				<div class="am-btn-group">
					<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
					<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
					</a></li>
					<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
					</a></li>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="footer ">
	<div class="footer-hd ">
		<p>
			<a href="# ">恒望科技</a> <b>|</b> <a href="# ">商城首页</a> <b>|</b> <a
				href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
		</p>
	</div>
	<div class="footer-bd ">
		<p>
			<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
				href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
				href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
				- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
				target="_blank">网页模板</a></em>
		</p>
	</div>
</div>
</body>
</html>