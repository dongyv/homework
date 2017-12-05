<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ include file="/inc/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>个人资料</title>
	<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

	<link href="<%=contextPath %>/css/personal.css" rel="stylesheet" type="text/css">
	<link href="<%=contextPath %>/css/infstyle.css" rel="stylesheet" type="text/css">
	<script src="<%=contextPath %>/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="<%=contextPath %>/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
	
	<script>
	function bc(){
		var sex =  $("input[name='radio_name'][checked]").val();
		var name = $("#user-name2").val();
		var nickname = $("#user-name1").val();
		var email = $("#user-email").val();
		var phone = $("#user-phone").val();
		$.ajax({
			type : "POST",  //提交方式  
            url : "${path}/user/update.dongyv",//路径  
            dataType:"text",
            data : {  
                "nickname" : nickname,
                "sex" : sex,
                "name" : name,
                "phone" : phone,
                "email" : email,
            },//数据，这里使用的是Json格式进行传输  
            success : function(data) {//返回数据根据结果进行相应的处理 
            	alert(data);
            	window.location.href = "${path}/home/toInformation.dongyv";
            }
		});
	}
	</script>
</head>
<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<jsp:include page="../topmenu.jsp" />

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="<%=contextPath %>/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="<%=contextPath %>/images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i><c:choose>
								<c:when test="${empty user.name|| user.name==null }"> </c:when>
								<c:otherwise>${user.name}</c:otherwise>
								</c:choose></i></b></div>
								<div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span>
								</div>
								<div class="u-safety">
									<a href="safety.jsp">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal">

								<div class="am-form-group">
									<label for="user-name1" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="user-name1" placeholder="nickname" value="${user.nickname }">

									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" id="name" value="${user.name }">

									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="radio_name" value="0" data-am-ucheck <c:out value="${user.demo ==0?'checked':'' }"/> /> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio_name" value="1" data-am-ucheck <c:out value="${user.demo ==1?'checked':'' }"/> /> 女
										</label>
<!-- 										<label class="am-radio-inline"> -->
<!-- 											<input type="radio" name="radio10" value="secret" data-am-ucheck> 保密 -->
<!-- 										</label> -->
									</div>
								</div>

<!-- 								<div class="am-form-group"> -->
<!-- 									<label for="user-birth" class="am-form-label">生日</label> -->
<!-- 									<div class="am-form-content birth"> -->
<!-- 										<div class="birth-select"> -->
<!-- 											<select data-am-selected> -->
<!-- 												<option value="a">2015</option> -->
<!-- 												<option value="b">1987</option> -->
<!-- 											</select> -->
<!-- 											<em>年</em> -->
<!-- 										</div> -->
<!-- 										<div class="birth-select2"> -->
<!-- 											<select data-am-selected> -->
<!-- 												<option value="a">12</option> -->
<!-- 												<option value="b">8</option> -->
<!-- 											</select> -->
<!-- 											<em>月</em></div> -->
<!-- 										<div class="birth-select2"> -->
<!-- 											<select data-am-selected> -->
<!-- 												<option value="a">21</option> -->
<!-- 												<option value="b">23</option> -->
<!-- 											</select> -->
<!-- 											<em>日</em></div> -->
<!-- 									</div> -->
							
<!-- 								</div> -->
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" placeholder="telephonenumber" type="text" value="${user.phone }">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" placeholder="Email" type="text" value="${user.email }">

									</div>
								</div>
								<div class="info-btn">
									<div class="am-btn am-btn-danger" onclick="bc()">保存修改</div>
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

			<jsp:include page="leftmenu.jsp"/>
		</div>

	</body>
</html>