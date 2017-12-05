<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%=contextPath%>/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="<%=contextPath%>/css/sustyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=contextPath%>/basic/js/jquery-1.7.min.js"></script>
</head>
<body>
	<!--顶部导航条 -->
	<jsp:include page="../topmenu.jsp" />

	<!--悬浮搜索框-->
	<div class="nav white">
		<div class="logo">
			<img src="<%=contextPath%>/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img src="<%=contextPath%>/images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form>
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit" value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>¥ ${money}</em></li>
					<div class="user-info">
						<p>收货人：${name_demo }</p>
						<p>联系电话：${phone_demo }</p>
						<p>收货地址：${address_demo }</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服
				</ul>
				<!--      <div class="option"> -->
				<!--        <span class="info">您可以</span> -->
				<%--         <a href="<%=contextPath %>/person/order.jsp" class="J_MakePoint">查看<span>已买到的宝贝</span></a> --%>
				<%--         <a href="<%=contextPath %>/person/orderinfo.jsp" class="J_MakePoint">查看<span>交易详情</span></a> --%>
				<!--      </div> -->
			</div>
		</div>
	</div>


	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p>
				<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
					href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
					href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
					- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
					target="_blank">网页模板</a></em>
			</p>
		</div>
	</div>
</body>
</html>