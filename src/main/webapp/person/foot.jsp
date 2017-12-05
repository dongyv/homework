<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ include file="/inc/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>我的足迹</title>

		<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=contextPath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=contextPath %>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=contextPath %>/css/footstyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
		<!--头 -->
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

					<div class="user-foot">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small></div>
						</div>
						<hr/>

						<!--足迹列表 -->

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<span><i class="month-lite">12</i>.<i class="day-lite">21</i><i class="date-desc">今天</i></span>
								<del class="am-icon-trash"></del>
								<s class="line"></s>
							</div>

							<div class="goods-box first-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						

						<div class="goods">
							<div class="goods-date" data-date="2015-12-21">
								<s class="line"></s>
							</div>

							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
									</div>
								</div>
							</div>
						</div>						
						<div class="clear"></div>
						<div class="goods">
							<div class="goods-date" data-date="2015-12-17">
								<span><i class="month-lite"></i><i class="day-lite"></i>	<i class="date-desc">一周内</i></span>
								<del class="am-icon-trash"></del>
								<s class="line"></s>
							</div>
							<div class="goods-box">
								<div class="goods-pic">
									<div class="goods-pic-box">
										<a class="goods-pic-link" target="_blank" href="#" title="意大利费列罗进口食品巧克力零食24粒  进口巧克力食品">
											<img src="<%=contextPath %>/images/TB1_pic.jpg_200x200.jpg" class="goods-img"></a>
									</div>
									<a class="goods-delete" href="javascript:void(0);"><i class="am-icon-trash"></i></a>
									<div class="goods-status goods-status-show"><span class="desc">宝贝已下架</span></div>
								</div>

								<div class="goods-attr">
									<div class="good-title">
										<a class="title" href="#" target="_blank">意大利费列罗进口食品巧克力零食24粒  进口巧克力食品</a>
									</div>
									<div class="goods-price">
										<span class="g_price">                                    
                                        <span>¥</span><strong>71</strong>
										</span>
										<span class="g_price g_price-original">                                    
                                        <span>¥</span><strong>142</strong>
										</span>
									</div>
									<div class="clear"></div>
									<div class="goods-num">
										<div class="match-recom">
											<a href="#" class="match-recom-item">找相似</a>
											<a href="#" class="match-recom-item">找搭配</a>
											<i><em></em><span></span></i>
										</div>
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