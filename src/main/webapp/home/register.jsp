<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp"%>
<%
	response.setHeader("Access-Control-Allow-Origin","*");
	response.setHeader("Access-Control-Allow-Methods","POST");
	response.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="<%=contextPath%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="<%=contextPath%>/css/dlstyle.css" rel="stylesheet"
	type="text/css">
<script src="<%=contextPath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=contextPath%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<script>
	function submit() {
		$("#form1").submit();
	}
	
	function login(){
		var email = $("#email").val();
		var password = $("#password").val();
		var passwordRepeat = $("#passwordRepeat").val();
		if (email == null || email == "") {
			alert("输入的邮箱不能为空!");

			return false;
		}
		if(password!=passwordRepeat){
			alert("俩次的账号密码不一致");
			
			return false;
		}
		$.ajax({
			 type : "POST",  //提交方式  
             url : "${path}/user/register.dongyv",//路径  
             dataType:"text",
             data : {  
                 "email" : email,
                 "password" : password,
             },//数据，这里使用的是Json格式进行传输  
             success : function(result) {//返回数据根据结果进行相应的处理 
            	 	alert(result);
            	 	window.location.href = "${path }/home/login.jsp";
             }
		});
	}
	
	function submit1() {
		$("#form2").submit();
	}
	
	function login1(){
		var phone = $("#phone").val();
		var code = $("#code").val();
		var password = $("#password1").val();
		var passwordRepeat = $("#passwordRepeat1").val();
		if (phone == null || phone == "") {
			alert("手机号码不能为空!");
	
			return false;
		}
		if(password!=passwordRepeat){
			alert("俩次的账号密码不一致");
			
			return false;
		}
		if(code==null||code==""){
			alert("验证码不能为空!");
			
			return false;
		}
		
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user/register1.dongyv",//路径
            dataType:"json",
            data : {
                "phone" : phone,
                "code" : code,
                "password" : password,
            },//数据，这里使用的是Json格式进行传输  
            success : function(data) {//返回数据根据结果进行相应的处理  
            	if(data.code==200){
            		alert(data.msg);
            		window.location.href="${path }/home/login.jsp";
            	}else{
            		alert(data.msg);
            	}
            } ,error:function(data){
            	alert(result.code);
            	
            }
		});
	}
	
	function sendMobileCode(){
		var phone = $("#phone").val();
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user/getCode.dongyv",//路径  
            data : {  
                "phone" : phone,
            },//数据，这里使用的是Json格式进行传输  
            success : function(result) {//返回数据根据结果进行相应的处理  
            	alert(result);
            }
		});
	}
</script>
</head>
<body>

	<div class="login-boxtitle">
		<a href="home.jsp"><img alt=""
			src="<%=contextPath%>/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=contextPath%>/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a></li>
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form action="" method="post" id="form1" onsubmit="login()">

								<div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i></label> <input
										type="email" name="" id="email" placeholder="请输入邮箱账号">
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="" id="password" placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="" id="passwordRepeat"
										placeholder="确认密码">
								</div>

							</form>

							<div class="am-cf">
								<input type="button" onclick="submit()" name="" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>

						</div>

						<div class="am-tab-panel">
							<form action="" method="post" onsubmit="login1()" id="form2">
								<div class="user-phone">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i></label> <input type="tel"
										name="" id="phone" placeholder="请输入手机号">
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i></label> <input
										type="tel" name="" id="code" placeholder="请输入验证码"> <a
										class="btn" href="javascript:void(0);"
										onclick="sendMobileCode();" id="sendMobileCode"> <span
										id="dyMobileButton">获取</span></a>
								</div>
								<div class="user-pass">
									<label for="password1"><i class="am-icon-lock"></i></label> <input
										type="password" name="" id="password1" placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat1"><i class="am-icon-lock"></i></label>
									<input type="password" name="" id="passwordRepeat1"
										placeholder="确认密码">
								</div>
							</form>
							<div class="am-cf">
								<input type="button" onclick="submit1()" name="" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>

							<hr>
						</div>

						<script>
							 $(function() {
								$('#doc-my-tabs').tabs();
							}) 
						</script>

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