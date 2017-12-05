<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!--顶部导航条 -->
	<div class="am-container header">
		<c:choose>
			<c:when test="${user==null||empty user}">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<a href="${path }/home/login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="${path }/home/register.jsp" target="_top">免费注册</a>
						</div>
					</div>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd">
							<a href="${path }/home/toIndex.dongyv" target="_top" class="h">商城首页</a>
						</div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng">
							<a href="${path}/home/toPersonCenter.dongyv" target="_top"><i
								class="am-icon-user am-icon-fw"></i>个人中心</a>
						</div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd">
							<a id="mc-menu-hd" href="${path }/home/toShopCart1.dongyv"
								target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
								id="J_MiniCartNum" class="h">0</strong></a>
						</div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd">
							<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
						</div>
				</ul>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>