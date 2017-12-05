<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/inc/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>我的消息</title>

		<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=contextPath %>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=contextPath %>/css/newstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=contextPath %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=contextPath %>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

					<div class="user-news">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的消息</strong> / <small>News</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">商城活动</a></li>
								<li><a href="#tab2">物流助手</a></li>
								<li><a href="#tab3">交易信息</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="news-day">
										<div class="goods-date" data-date="2015-12-21">
											<span><i class="month-lite">12</i>.<i class="day-lite">21</i>	<i class="date-desc">今天</i></span>
										</div>

										<!--消息 -->
										<div class="s-msg-item s-msg-temp i-msg-downup">
											<h6 class="s-msg-bar"><span class="s-name">每日新鲜事</span></h6>
											<div class="s-msg-content i-msg-downup-wrap">
												<div class="i-msg-downup-con">
													<a class="i-markRead" target="_blank" href="blog.jsp">
														<img src="<%=contextPath %>/images/TB102.jpg">
														<p class="s-main-content">
															最特色的湖北年货都在这儿 ~快来囤年货啦！
														</p>
														<p class="s-row s-main-content">
															<a href="blog.jsp">
															阅读全文 <i class="am-icon-angle-right"></i>
															</a>
														</p>
													</a>
												</div>
											</div>
											<a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab2">
									<!--消息 -->
										<div class="s-msg-item s-msg-temp i-msg-downup">
											<h6 class="s-msg-bar"><span class="s-name">订单已签收</span></h6>
											<div class="s-msg-content i-msg-downup-wrap">
												<div class="i-msg-downup-con">
													<a class="i-markRead" target="_blank" href="logistics.jsp">
													<div class="m-item">	
														<div class="item-pic">															
																	<img src="<%=contextPath %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
														</div>
														<div class="item-info">
															您购买的美康粉黛醉美唇膏已签收，
															快递单号:373269427868
														</div>
																											
                                                    </div>	

													<p class="s-row s-main-content">
															查看详情 <i class="am-icon-angle-right"></i>
													</p>
													</a>
												</div>
											</div>
											<a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
										</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab3">
									<!--消息 -->
										<div class="s-msg-item s-msg-temp i-msg-downup">
											<h6 class="s-msg-bar"><span class="s-name">卖家已退款&nbsp;¥12.90元</span></h6>
											<div class="s-msg-content i-msg-downup-wrap">
												<div class="i-msg-downup-con">
													<a class="i-markRead" target="_blank" href="record.jsp">
													<div class="m-item">	
														<div class="item-pic">															
																	<img src="<%=contextPath %>/images/kouhong.jpg_80x80.jpg" class="itempic J_ItemImg">
														</div>
														<div class="item-info">
															<p class="item-comment">您购买的美康粉黛醉美唇膏卖家已退款</p>
															<p class="item-time">2015-12-21&nbsp;17:38:29</p>
														</div>
																											
                                                    </div>	

													<p class="s-row s-main-content">
															<a href="record.jsp">钱款去向</a> <i class="am-icon-angle-right"></i>
													</p>
													</a>
												</div>
											</div>
											<a class="i-btn-forkout" href="#"><i class="am-icon-close am-icon-fw"></i></a>
										</div>
								</div>
							</div>
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